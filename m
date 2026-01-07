Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B0DCFD658
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fXML/dALDTSSCEBUpE6tWTFQcKKDTeMrff70+8h2hc=; b=sZ/39MjTK+FT9NX6Zi1ovx6uig
	CDxwts9n0dOqBL4Xtnu4QnlilkA0HmQvD3VK8BT25yMQHA7OPND/CydLgfNP7zwlaBJ7RV1PwuUJQ
	d5a760RMrgqoh08oAU7ZH6fxsNwjr+Qp2OECoRvX5nNY4gaME0EpmQH7dP8AP4V51XPAv98PaWbUr
	xbl9K73PsleOLIzVGzpMzhQFkCdCzbEjWjdekqfh33Ez1aR3MFOc7ZQoHAG0fJAJS7zsfiE5U8B9i
	Cp+vbB4xZr5hxTzEQcNjyLjNYnU2Y6Q+N5k0z5bK1QRA8eOiuvEkUqGog/j39Kue8jUbLvWyMl377
	+igjHUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW6s-0000000FEd5-3RTe;
	Wed, 07 Jan 2026 16:10:10 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW6p-0000000FEcR-2X2I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:10:09 +0000
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 65CB31AAD5F;
	Wed,  7 Jan 2026 16:10:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id DA1A12002D;
	Wed,  7 Jan 2026 16:10:02 +0000 (UTC)
Date: Wed, 7 Jan 2026 11:10:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Breno Leitao <leitao@debian.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Laura Abbott
 <labbott@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, kernel-team@meta.com, puranjay@kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Disable branch profiling for all arm64 code
Message-ID: <20260107111029.28e0c52b@gandalf.local.home>
In-Reply-To: <frfmxk2ifpf5shcws42q3eeykb3xyflxocbic6junm7mzvmqik@vktwefe2zmw7>
References: <20260106-annotated-v2-1-fb7600ebd47f@debian.org>
	<aVz-NHMG7rSJ9u1N@J2N7QTR9R3>
	<aVz-6WozGIxGiTUR@J2N7QTR9R3>
	<20260106111142.1c123f12@gandalf.local.home>
	<frfmxk2ifpf5shcws42q3eeykb3xyflxocbic6junm7mzvmqik@vktwefe2zmw7>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: khippqaiyx8cd5m1dse5kww4arzqhpxh
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: DA1A12002D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX186ZkSD32iPpRx5ow4Xmjt+UAgCjzMt04s=
X-HE-Tag: 1767802202-773670
X-HE-Meta: U2FsdGVkX19vKCXb5K+qpusqOqSjw8DJI3OWGz/LwzFg+F+VEV1dTBh8MA6eTmVsqAqy8P1lCIp7g8VSiwdNyXJjA4k+cwHYlU7CJMArTtnVhzZ3IS59JSgTxf/pcV2CD9mQ1DrzxMjnApWld23yV0xKpCfnvlZXe0bAskSnFshPdP05mS3lJ9ddA2RDCsU5Wx7+v/t84oEnQkGzpG1lAZ+yxThfxovX52OJgA6WTBBWjWgtq698VQxEcteo9G7Az+M19vhLRRv2bZvYgTPGqs1UPWdTP4oQGu2IXrCgTeWgUgCiQv4sevX86v+/U2CLaAKbrKzqDAaYwrGGd7UCLgp4R2muFF2gJuFDYEwHtDtmgQ/2a1TTbw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_081007_701592_90751759 
X-CRM114-Status: GOOD (  13.80  )
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

On Wed, 7 Jan 2026 01:37:36 -0800
Breno Leitao <leitao@debian.org> wrote:

> I am starting to look and remove some of these likely/unlikely hint that
> are 100% wrong on some very sane configuration (arm64 baremetal hosts
> running a webserver).
> 
> So far, these are the fixes I have in flight now.
> 
>  * https://lore.kernel.org/all/20260105-dcache-v1-1-f0d904b4a7c2@debian.org/
>  * https://lore.kernel.org/all/20260106-blk_unlikely-v1-1-90fb556a6776@debian.org/
>  * https://lore.kernel.org/all/20260105-annotated_idle-v1-1-10ddf0771b58@debian.org/

Nice. Thanks for letting me know. I'm happy to see that someone besides me
is using the annotated branch profiler to fix real issues in the kernel.

I would love it if more people did the same. Anyway, please advertise this
as much as possible. If it shows that it is helping to fix real bugs, maybe
it would attract the interest of more developers, and more importantly, it
keeps the tooling in place. I'm constantly fighting to keep it from being
removed from the kernel :-p

-- Steve

