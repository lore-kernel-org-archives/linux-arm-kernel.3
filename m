Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E695CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24VgVItwjd8qNvXarrPIUuT0qI+K54QfkUF+ZEkB0o0=; b=lQZy8gPsQaELiq6kbbH7ccvYEg
	8Z+OC2HvsfDD9OkwcAVOt9c5HaehDoku61PvbI33t/BBGCJqspGYZyT2emMLL7+8PVUtoX2g5vawn
	TbTp77hTqBMix+KhRtrosYTxInCmON4i5J+kbDgMSBk/OAkDEnos7S7LxOpv/oagHXyvUmb0gMnLh
	oHab8yeEosqxec2aa5UrM70RRiR3H1w4yrc1BGaYwVSkLe7hIdPFCFeGS5lgnipoEumPKdT4YQlzA
	YUtuLSEZX/ybnzlXg27YO6VDDz9aDAcHTZz1DR4o0ZWj7bq0MWqxAqc0dp2S9CnWEnkgduiCXlQqM
	1Z5mn5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkgR-0000000FA6o-0RtP;
	Fri, 04 Jul 2025 17:58:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkSe-0000000F8Ac-0qW4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADED65C5A9C;
	Fri,  4 Jul 2025 17:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C00C4CEE3;
	Fri,  4 Jul 2025 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651071;
	bh=iQPCag/CMmrdNN8jXkXcdi2pgaLZRiU1dC347/6lGyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KiOO0OYDfD/dMXIc9qXQXmd9E49UqynbdXyiwZpN6JIZW9Y6TCi2xZtoinpXAkEu7
	 i57ljCLpi0Z5d7grd73b+sBnzu8IQ3GrUROu8nxThQnAvQdEt5jYd4UJDfmRDMmfG5
	 UVIeXIQi5TbJjhdCoiJDEJsWJEAeeCjO8u9zHCVx4EMzO7S9jM+C3EUv4Yz10hmUqU
	 b1KVXxC+CyjrpxuMQFRcdqM0ed+MaHdqiQUiZgZWin6pi/DKmQbDJ7zWlw+/M/pgno
	 74FAsH0+nCIgCHQBfU+2Xlb6ihVj/NizjbkrfL0adDtMvebLZ0zPr8B25RV0/7qOUx
	 3NDwxPCoPj8XA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Filter out SME hwcaps when FEAT_SME isn't implemented
Date: Fri,  4 Jul 2025 18:44:10 +0100
Message-Id: <175164333073.1188085.16117765198083829346.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620-arm64-sme-filter-hwcaps-v1-1-02b9d3c2d8ef@kernel.org>
References: <20250620-arm64-sme-filter-hwcaps-v1-1-02b9d3c2d8ef@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_104432_286100_2D6EE828 
X-CRM114-Status: GOOD (  11.16  )
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

On Fri, 20 Jun 2025 12:28:48 +0100, Mark Brown wrote:
> We have a number of hwcaps for various SME subfeatures enumerated via
> ID_AA64SMFR0_EL1. Currently we advertise these without cross checking
> against the main SME feature, advertised in ID_AA64PFR1_EL1.SME which
> means that if the two are out of sync userspace can see a confusing
> situation where SME subfeatures are advertised without the base SME
> hwcap. This can be readily triggered by using the arm64.nosme override
> which only masks out ID_AA64PFR1_EL1.SME, and there have also been
> reports of VMMs which do the same thing.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Filter out SME hwcaps when FEAT_SME isn't implemented
      https://git.kernel.org/arm64/c/a75ad2fc76a2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

