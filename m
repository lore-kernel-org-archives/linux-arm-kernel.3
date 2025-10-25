Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B333ACCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 19:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fH9PSjf5uGBVjV5us/cgmep0YOO/I5i91jwEU8nBNCY=; b=VmmCM+pyyech4g4J6cByuSFzRs
	7H/m06gTPN2Y+3af7VPf0R5xA/Pux32vg/S+j2t6PGiMVmhX2Gvr2SwQdomCRdvowi05UjayoFtMk
	F4z2P0vK6whQBK64jlk34YGO1VDq0JKsAz8aJxkHdkxrx8UTDJdLy5u6qYLOhpTJbwwdj26DKbRRF
	wrwzXrmDSZpqgVnh4iH7QGUKy+D30QOZxBSTuR5oJnxXytSsO0OS27iGdhEIemOVQJ7x1JRfyBXbo
	PHdloLqhVb9ZJDG2GudMmaBtNYJewdigu2c/BooKpAJ+5VOZJqkHPUQRL6n8TbkK4Qv29R50NQxTw
	vBX/N+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCjxl-0000000Bfz1-3kw2;
	Sat, 25 Oct 2025 19:30:05 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCjxj-0000000BfyX-057d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 19:30:04 +0000
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 0869C55EA7;
	Sat, 25 Oct 2025 19:29:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id C28B72002B;
	Sat, 25 Oct 2025 19:29:55 +0000 (UTC)
Date: Sat, 25 Oct 2025 15:29:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 13/21] trace: don't use GENMASK()
Message-ID: <20251025152954.25807ec7@batman.local.home>
In-Reply-To: <20251025163305.306787-6-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
	<20251025163305.306787-6-yury.norov@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C28B72002B
X-Stat-Signature: 7zzn91j7x648w9ms1fi99hpmtm7pcm6c
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/44D9yuHz9dVfvnBemYhEMxeRme8K4ZN8=
X-HE-Tag: 1761420595-616211
X-HE-Meta: U2FsdGVkX1+yPZXRQ7X8+V6Krgz8HOasdEpKO8wFjzn3Zvntb5fTNPZ2ZMx5ZcU8MevMlQ1P4y/SlhEF0Y+1iqWMcFwFXrVqo34BY1uoYfagq4CkrAxS7jLn6OFmM4K6lh9ZWCl/lkAjSuShL9ZhZc0h7RaOcS+nwwzQ1//n2sD/9zG30jTCQRUW/eUe675lCIcupxcJFnPDmgYyuICE4nnbPSEnHV8/8Z6UKATLL/6MAiYKVxCdyC6DIERgF2RnW4paQE3BWhw/ECzppRcZZHG0Z0h9FSSAroHcqxcJaTfh7a8kPQEDGQgF0XKasQWgO6riBOnhHj/BSsD//RdpJGGDhA8RJz8U
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_123003_121347_B294DEF3 
X-CRM114-Status: GOOD (  11.68  )
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

On Sat, 25 Oct 2025 12:32:55 -0400
"Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:

> GENMASK(high, low) notation is confusing. FIRST_BITS() is more
> appropriate.
> 

I'm fine with this change as a clean up, but...

> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>  kernel/trace/fgraph.c      | 10 +++++-----
>  kernel/trace/trace_probe.h |  2 +-

Make this two different patches. trace_probe and fgraph go through
different topic branches.

Thanks,

-- Steve


>  2 files changed, 6 insertions(+), 6 deletions(-)

