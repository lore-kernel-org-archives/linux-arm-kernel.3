Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDDEC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adCVBrgCh9OTG2beEK1CjZOLEhKnwDCiaJsQo7XYgxk=; b=MHGvt5yIezv9ogCMMoIyYsqgLO
	EFQwvWF0P8dEBdrO1tGDMXGl05GlCCbpRpluct79q4kRq/XRbPIwkC2TrrwNJRDNQk12Vj/mHNmjJ
	hbOhuRhdIQtdFF0t33xQ794E9PkUk5CzloEj1awxC1TCED9zVgd/Tli8ikKtxRyK40YzimXEPxqqM
	d/6xqKmbmkbbMzHgpaElrY0XZqshSHehu6oY2GiL2tgeHjgtrOvK+G9/aTd5T75sGjHUpiGjbUS4W
	xDeAM5CiUbYLMcdS1RJuv8rnORDlVPhqHw732klZ77P6O1TUZeXqGKPls8cxpN7kSrjyQArhMTpmf
	e+i7w8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAL1-00000002AWr-1Evu;
	Tue, 22 Jul 2025 10:35:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9xz-000000027kT-0o6c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:11:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73F3A601D2;
	Tue, 22 Jul 2025 10:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2F5C4CEEB;
	Tue, 22 Jul 2025 10:11:20 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>
Subject: Re: (subset) [PATCH 0/2] Improve POE handling for uaccess
Date: Tue, 22 Jul 2025 11:11:18 +0100
Message-Id: <175317907573.3058594.12056270289383660598.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619160042.2499290-1-kevin.brodsky@arm.com>
References: <20250619160042.2499290-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 19 Jun 2025 17:00:40 +0100, Kevin Brodsky wrote:
> This short series attempts to approach POE (Overlay) faults consistently
> w.r.t. uaccess. We currently assume that spurious Overlay faults are
> handled by retrying the access [1], but this isn't the case.
> 
> Patch 1 ensures that spurious Overlay faults are indeed ignored. This
> being done, it typically isn't worth using an ISB when writing to
> POR_EL0. Patch 2 removes the remaining ISB in the signal handling code.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[2/2] arm64: signal: Remove ISB when resetting POR_EL0
      https://git.kernel.org/arm64/c/1a665a71ef0f

-- 
Catalin


