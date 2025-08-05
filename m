Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05641C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8EafCVUwqhrlw+H4cY7Zgjr8E2tMajz3iJ1Uuzn/og=; b=sixNS8I0ETyWbNndczNZQ58Uid
	/HtQcH2eSvqXy6U3hvNwDI+mJ2/sVN+ZwSvdSD3cRM01WjCroBkBKjlBfdPQb+J1BBOwluuLW1yzW
	gWjvFG7iQNgbH76LWmLyitjg8dbxayuANCyjTZPbN0GA3GtLgH9KoybzmF6MRr4w/kvzM5MRlSmKP
	T4K4Vxw9mOBD7MP4pj7EaoOrvUJv5C23ZQ+0ylm95nu68V47C4bwI86rfXx6oeSpKiAXFlM6n7BIc
	s4Bg0ReHuMU7Oj+k2zCGBd9tsrGJk6p3DWeZHRAJuBpQqC7zxG+xYIPOSHNB+ED3vpvyy1F1jZXTE
	3P9zeiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJv2-0000000DCUe-0P3q;
	Tue, 05 Aug 2025 15:49:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIp4-0000000D2cq-1J2X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 14:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69F785C55C1;
	Tue,  5 Aug 2025 14:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED10C4CEF0;
	Tue,  5 Aug 2025 14:39:23 +0000 (UTC)
Date: Tue, 5 Aug 2025 15:39:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
	akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
	dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 0/4] arm64: support FEAT_BBM level 2 and large
 block mapping when rodata=full
Message-ID: <aJIXmIgCGlWlHDNK@arm.com>
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
 <985f9d53-ea5e-4da0-9427-106a58be7f26@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <985f9d53-ea5e-4da0-9427-106a58be7f26@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_073926_396440_A1D51DB6 
X-CRM114-Status: GOOD (  18.34  )
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

On Tue, Aug 05, 2025 at 09:16:31AM +0100, Ryan Roberts wrote:
> On 05/08/2025 09:13, Ryan Roberts wrote:
> > This is a new version built on top of Yang Shi's work at [1]. Yang and I have
> > been discussing (disagreeing?) about the best way to implement the last 2
> > patches. So I've reworked them and am posting as RFC to illustrate how I think
> > this feature should be implemented, but I've retained Yang as primary author
> > since it is all based on his work. I'd appreciate feedback from Catalin and/or
> > Will on whether this is the right approach, so that hopefully we can get this
> > into shape for 6.18.
> 
> I forgot to mention that it applies on Linus's current master (it depends upon
> mm and arm64 changes that will first appear in v6.17-rc1 and are already merged
> in master). I'm using 89748acdf226 as the base.

It's fine as an RFC but, for upstream, please rebase on top of -rc1
rather than a random commit in the middle of the merging window. Also
note that many maintainers ignore new series posted during the merging
window.

-- 
Catalin

