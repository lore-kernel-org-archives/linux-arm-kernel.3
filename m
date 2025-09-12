Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6D3CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 16:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/dToF1ybIC73PSFKvtpxb4k1/FWQgFwDCu4r7vW0mY=; b=uyVgKQcMX/LFmwLzYZCaAiQ06h
	Z5yaWOGkrYvwdJIpAxKB/RpSkLbCwRmNkZX96v4qtBT540YNJlC9vf6BlKivzczShRq9ICZfjAgVB
	1W5lf+1GV0mvQtZwy+CNqm7oCAiKfof8Y3GT/6U55oni2LkSs6TJ6ie0Zi/FSDfHmOJ9bb9hzFrDI
	28JGcVz0qgTl9ASOpvsVHp43nTK5uuhnWMrKRUUPtMa8b6xbI39e/zaY9H3l4EgKLrsaaiB6/k5ue
	yVKbOYQT5B45LSmdI9jY4ulxaKi4LO8ceZtd7oxYpXPTLoljHZ37jc1Ga3SRRZ4oHkCuefrQh1g6I
	gPLCTXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6OX-0000000ATg7-01Ag;
	Fri, 12 Sep 2025 16:13:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6OW-0000000ATfh-1L5C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 16:13:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19EB8601E8;
	Fri, 12 Sep 2025 16:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8BDC4CEF1;
	Fri, 12 Sep 2025 16:12:59 +0000 (UTC)
Date: Fri, 12 Sep 2025 17:12:56 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 1/6] arm64: cpufeature: add FEAT_LSUI
Message-ID: <aMRGiF9Ez18tc4u9@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816151929.197589-2-yeoreum.yun@arm.com>
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

On Sat, Aug 16, 2025 at 04:19:24PM +0100, Yeoreum Yun wrote:
> Since Armv9.6, FEAT_LSUI supplies load/store instructions
> for privileged level to access user memory without clearing PSTATE.PAN bit.
> 
> Add LSUI feature so that the unprevilieged load/store instructions
> could be used when kernel accesses user memory without clearing PSTATE.PAN bit.

These two paragraphs are pretty much saying the same thing. Just replace
the second with something like "Add CPU feature detection for
FEAT_LSUI". No need to explain the PSTATE.PAN again.

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

