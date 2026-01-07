Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA67D0D171
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 21:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEq3eoJFjUljkKJGjcb41gP5QSegiR/2h7As4v/kLKc=; b=tzDPEo4NNNpUe9viqPr3eU8h3i
	2QmrBBucMc9LgztMYi3TFU2rJUv8YSJtr3JbS5b847Qb0D3q/izXcilwswl9SZSJVuKUeiXdgoeSS
	SNS/Bes20SQF5Cnai2iH7ChuDs0Ce3BR0Ejbksj3fWlnJJ0Pe2EGTins7E23ULFXU1mIwIBOB0DEN
	ZqHMCTrDygR49EpnZEV7qnwqOt+0EmcNpRwrfQ2vGcRrTVS2suxTXMZX9d8vL7AtGoHePkE6CKhlY
	/PBgBzrvG9S1XcvPS3PtUQvzr9RrhXIzgNhpmdlH+nIeiYfItGPrEFek+1HJlTOiBFxF8GAyDUlpe
	2Jo6Jtew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbYt-0000000Fgn7-37rv;
	Wed, 07 Jan 2026 21:59:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbYs-0000000Fgmv-3OiL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 21:59:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C30B460007;
	Wed,  7 Jan 2026 21:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601BBC4CEF1;
	Wed,  7 Jan 2026 21:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767823165;
	bh=jkRGEmXj8A9PUTqs9joDQ6ARfY3aQfH/gvw8Rj5b87o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dIEI2AFtMwtI1cxjEEelpcoqlQ4KJ9tYoFvYue/duTtQRU3jq2cXtmPiVjB4Dgalq
	 KsgZCwLQf6shBUYv1lhpC6u1o/t9rfL4Hr8t+vtocTliGHxg61MnxdDNUx8g6lzHZM
	 d3nxaUtpcTEJ7Ej50ib6pFP1wBm2LWFOFMUfHV0GzFG60B65Yppkg0UxOpZq/ZxxqY
	 DF0PT6RA5XbSTFIpcOcgp4XmpCTctt2+IeawTozG2etcEZEz8XXQMG69WnhUrNvHck
	 PnsRKxnvSoSo+HTn8XLprDDYa6rXGvG/8UX4rC++M05sKj+vlIztH684iJIeDy/5NR
	 AMM9FFFQWDKcw==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	Tomasz Nowicki <tnowicki@google.com>
Subject: Re: [PATCH RESEND] iommu/arm-smmu-v3: Remove IAS
Date: Wed,  7 Jan 2026 21:59:11 +0000
Message-ID: <176782095435.3284849.16107001420143134229.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102205353.2725509-1-smostafa@google.com>
References: <20260102205353.2725509-1-smostafa@google.com>
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

On Fri, 02 Jan 2026 20:53:52 +0000, Mostafa Saleh wrote:
> The driver only supports AArch64 page tables where OAS == IAS.
> 
> Remove the extra IAS tracking for AArch32 as this feature was
> never implemented and that was creating BAD_STEs for SMMUv3
> with stage-2 and OAS < 40.
> 
> Further discussion on this in:
> https://lore.kernel.org/linux-iommu/20251130194506.593700-1-smostafa@google.com/
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Remove IAS
      https://git.kernel.org/iommu/c/5ac66ed8417f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

