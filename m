Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DE7CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 19:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw2pzj3LN/8W/1BNy3JG1ipvipEm3RrqE4OlOOT6ROA=; b=cm0l9RUInaVdrnFrE5VdirF9vj
	WhfbGVkeZbQt429Cm/U8ceozhLOBnDvNaD2LpXvtAAj5vmTmXbv368jKLxRvhXkK3Xhdhb2JD6DVH
	XFAO+kiDZJ9ExBo3V5ScCh+04nUFgMgYZozdANHTlFvcCFbalHLufcem/FmwSH/+2BhiGAP8Sb7cz
	3IMMqn3ELca7DDuku81YAdRbD9FtPSPM28I6xEVJBCiQCk3tGUR83oAxXaAvJA98x8yLSM4oaGC9L
	AiAE4PJ6JgTYtbqAG3JMABEYPQ/hS+EVSx98Ligjob9SB3KPjwTh7D96qtUOHkMowST4hOqP/Sefq
	hsL0fBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCk42-0000000BgFs-2y74;
	Sat, 25 Oct 2025 19:36:34 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCk40-0000000BgFU-0Iln
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 19:36:33 +0000
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id EDABD8466D;
	Sat, 25 Oct 2025 19:36:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id A710B20030;
	Sat, 25 Oct 2025 19:36:25 +0000 (UTC)
Date: Sat, 25 Oct 2025 15:36:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 13/21] trace: don't use GENMASK()
Message-ID: <20251025153624.4b049170@batman.local.home>
In-Reply-To: <20251025152954.25807ec7@batman.local.home>
References: <20251025162858.305236-1-yury.norov@gmail.com>
	<20251025163305.306787-6-yury.norov@gmail.com>
	<20251025152954.25807ec7@batman.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A710B20030
X-Stat-Signature: sc4uzjb54t9mesd3dnyn9615188bnt6d
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+IMKydI74GI/yMv7u5bcYC1/vHU0zkFk0=
X-HE-Tag: 1761420985-556311
X-HE-Meta: U2FsdGVkX19Vq3BJKjcVgHUuXYHdvXZBoFQhRmvRHh5ZPxSNYTTvFoFxb4vgukWEwFCVY3//nmQkWclDwtAJG/WUqoG4JEPSliE5QMtS4lAjbTAkEMxOjFSgYib1+qy0Fg9jSbACapUwIh/7KuSuJFzKXK7jjcWS7mIV7myuU8in9LM1d9Wk8CilhmYubovjWbqnL8S7vZLicum2+l9yBYgBHQZA0wiBMnSZ3j0uS9TNYviB2ktp1lBms2l357htl6lOOQyqpMhcHULROAsUchtyQCacHso1zjT4b1z7t4P7zvsdfPFuL/gWhIrZ01lxAwkDLdRna01NSCXiKZ4gqPRQTyIHouS5vhvuE1qSArmvsR8ubvcpnDUehiKR24AFnMoFW1I3HxCJyTVxMx+WGQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_123632_178724_E1F20768 
X-CRM114-Status: GOOD (  14.20  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, 25 Oct 2025 15:29:54 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Sat, 25 Oct 2025 12:32:55 -0400
> "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> 
> > GENMASK(high, low) notation is confusing. FIRST_BITS() is more
> > appropriate.
> >   
> 
> I'm fine with this change as a clean up, but...
> 
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > ---
> >  kernel/trace/fgraph.c      | 10 +++++-----
> >  kernel/trace/trace_probe.h |  2 +-  
> 
> Make this two different patches. trace_probe and fgraph go through
> different topic branches.

OK, I see this is part of a patch series that adds FIRST_BITS().

Please add that first, and the rest of the patches can go though their
individual trees. Something like this change I would like to make sure
doesn't accidentally cause a regression. That means it must go through
my tests before it gets applied.

-- Steve

