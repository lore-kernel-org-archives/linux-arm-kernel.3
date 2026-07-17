Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD1CC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GM8XgJPuC0Ev5/1OuEMW/A2d9miobDTO2o5BWv8n0IY=; b=gHKLAOjO6u9tGJ1zM3W1TZnXO8
	X8wFKMMGNpCI/uOW0PC7btLuGsxwzPU51yw9bxHLddlYAFJ2PHGY7k6oYmSqkaARLdnVfPZApO4Yo
	wcfznCYX2zLVly2LUtTsgLLX6BE6u4WeCzLrID8cxj9Y1Z4xOPy/oyGu6CTt2DQSSGfT9nR7aXdwA
	lvL2+RfwQGB19kmPPsJ54E8CdMMadT1RHVxzXEsaC37rxqG+c68Lv4v5rkfjnrNOCMEiaX2JKRxY0
	6J7d3GB6as54X3/YFPOarj5QuMiBYfv0AtXt0eFGrDzWjT6IbnHWCsDz4EvgI7fEgeDfqGHdkT4Zw
	0H0o2YVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmtL-00000002wEg-1c6M;
	Fri, 17 Jul 2026 18:02:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmtK-00000002wEW-0fEI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 18:02:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9502643372;
	Fri, 17 Jul 2026 18:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCA81F000E9;
	Fri, 17 Jul 2026 18:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784311349;
	bh=GM8XgJPuC0Ev5/1OuEMW/A2d9miobDTO2o5BWv8n0IY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DpsVp0/B7CvDOm/EczaR3ECpnGc3wPmRScJQJZ4ykPQvne2i4AhxNf/lUvc23c2zC
	 ekcwFAvgnzwNNs07L64QKu38SZJTYpgcjkwjo2UuKJ53vKPbUVxGOS/1u1w/vgULJE
	 73O43ZoP2jDdYt2NJCGwgf+h5uJX9KSadA3TtLTdT8BlQ1k45YiT+Vqe2TIFArG+KR
	 L2smxsrMbqeUyRGu4GG1BnKJg0EY3AvbysDKIMNH4pSl4KEC8qVZvDZItOUUmSNagH
	 0z0h/tTX0HR9uO0kjh5ArcyZBGRnX6hxGD1wI3SPOloJb32bTOsP5QSNl63TRUDStC
	 GIkNwPhM8k4EA==
Date: Fri, 17 Jul 2026 19:02:23 +0100
From: Will Deacon <will@kernel.org>
To: Hongyan Xia <hongyan.xia@transsion.com>
Subject: Re: [RFC v3 2/2] arm64: kprobes: Allow reentering kprobes while
 single-stepping
Message-ID: <alpuL10h7-OK2hFb@willie-the-truck>
References: <20260710063242.228714-1-hupu@transsion.com>
 <20260710063242.228714-3-hupu@transsion.com>
 <aljbf_RmOd9U2KDT@willie-the-truck>
 <0f049d38-b7f6-47f0-a410-95ad2aee7fd4@transsion.com>
 <alj2uxE1M8mcMBhA@willie-the-truck>
 <e0e800f5-a6f8-48ae-b55c-5c3d928bf234@transsion.com>
 <aloLb0j8sg0usmAF@willie-the-truck>
 <be182a18-4cea-445d-a319-1ed3a6c17598@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be182a18-4cea-445d-a319-1ed3a6c17598@transsion.com>
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
Cc: Pu Hu <hupu@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen@kernel.org" <naveen@kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2026 at 11:31:31AM +0000, Hongyan Xia wrote:
> On 7/17/2026 7:01 PM, Will Deacon wrote:
> > Thanks. So perf is run synchronously from the debug exception entry path,
> 
> Yes, exactly.
> 
> > rather than because of a second exception taking place. Got it. But then
> > it sounds like we should really make the debug exception handling path (at
> > least, the part that runs for handling the kprobe step) noinstr to avoid
> > getting into this state to begin with. Is that practical?
> 
> Not sure about making the whole path noinstr (@Masami might have a 
> better opinion on this than me). Personally I don't mind either 
> disallowing it or making it correct.
> 
> But it might be a good idea not to diverge too much between ISAs. This 
> patch is pretty much mirroring what the x86 side handles this situation.

Ok, so how about this. I'll take these fixes for now, but let's try to
make these paths noinstr in the future? That's a much bigger job, but I
do worry that we're going to otherwise end up adding special logic every
time we run into an unexpected re-entrant case.

Will

