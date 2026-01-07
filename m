Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778A0D0D144
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuglz8S+pA8sy4GWfmZBnELNc4Pq6WJZTM15q05Jzo4=; b=QJDqJbNWeSzbXTBfJAVq2Z4+A6
	GqdjsGlmbt5hvXidoee4oUPDftgbem3lOIhKGoA1IsocHSLQENlm/uivWTx7wgPM2CF9HChajBCxf
	No4DZKf2hqHC//WwWRXDfL2D7lH/qZ/+B6x2McM688Jr9ly1l9MwALxOpGOM/yyJD7RBHbayh1rVS
	1FEykqhbHj211iHG4VhJyPnVJxhd8f0lqzfMUX0VQgzU1VRgE6Nz3lG6h34QZyV5Lfwhz1niSvR+d
	zrb8MJhrpo7A16AiL6u+n74Bgqahqll4g72ZoltWbWVEDD3XDf8+QdgzQ7je/RVW9zCzmMLVLy36C
	YJrWRiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWsQ-0000000FLR4-2S4K;
	Wed, 07 Jan 2026 16:59:18 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWsO-0000000FLQh-1npO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:59:17 +0000
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id D6C631A0474;
	Wed,  7 Jan 2026 16:59:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 790192002C;
	Wed,  7 Jan 2026 16:59:09 +0000 (UTC)
Date: Wed, 7 Jan 2026 11:59:36 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, jstultz@google.com,
 qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/30] Tracefs support for pKVM
Message-ID: <20260107115936.4f4a8965@gandalf.local.home>
In-Reply-To: <867bttmmzw.wl-maz@kernel.org>
References: <20251202093623.2337860-1-vdonnefort@google.com>
	<867bttmmzw.wl-maz@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 44shsiadfkcuojskzj7atpzqz4f1uwqm
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 790192002C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19LQ9MFuL2LaCgUQAtwlkXmJZlyiYnSKhM=
X-HE-Tag: 1767805149-424335
X-HE-Meta: U2FsdGVkX18MLNG4uKP17KPandcrOvhgFIeJTSOG5VxsbSslz/R9wG2Hsx0QalMvyVcXnpgQTOoOScyZerqNlskwc42IA1hV0ImsJbTcdkGJofwc5uG1wlHcJIORHfl5vYLAL/FXL/tWm0jGSydjqQc+fRan7we14dHrIVnHBVZCS8WmVhNEQ6GZ0m8zDamLgi5cAJcIZU608Qg3QVo5sT2LS20XQ2MTA335YRO0jTXzAx/cFk7OcVSNFcY2jwRU2v6XUh3vKC2P6jk2IIGwNFfOvwxzBhYnOVtLslkmOw7QNfW2rAGcItsSp4JdPW0ETvSfxDfcErPvz1emNfCoBmKyuO8R+p+f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_085916_547983_AF6CB372 
X-CRM114-Status: GOOD (  10.25  )
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

On Wed, 07 Jan 2026 16:00:19 +0000
Marc Zyngier <maz@kernel.org> wrote:

> I quite like the shape of this now, at least for the KVM side of
> things. The comments I have can be addressed down the line, and don't
> impact the actual functionality.
> 
> Now, the first 18 patches definitely need acks from the relevant
> maintainers before I can queue this.
> 
> Steven?

Yeah, it's on my todo list to finish my review.

Thanks,

-- Steve

