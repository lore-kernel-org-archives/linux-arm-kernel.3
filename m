Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA32AC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNLeyaN/VfsXa6EWrpRnIGiGgw/Go0nBJ51KG7aT4qU=; b=Pts1HjknsR9LwQPEGgagIS/4mj
	sHStun0G5JKR+MdDmWDK7TxKKfR4/g/k6jmeDNyUl960fdqCSjDYOz80JBXCJYLCbuoJwNW47oxxP
	mdEfjkrfcXc0Wf9CxI6//Dmcv5vh3qBweCoE0SUoknpEy/r9GGGzx6YrFeuVyN+p/Nrxk+PIDkLoP
	Dt/fn+pUSQKVCZUDbZoX0h/Q3BczD4BvDRHwqRcc7NmF+k/VcyMKBND5kwl008Nt8Bkt4x2xh8Rj+
	MtGyrrvbF3Ct+Mpare5KKcVLqjeXdBL0jzWd4IozUVCNksLeXYfgxLUfv/svirHPuoSoqHlLOFr8P
	EUv3Y2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZnL-0000000BFFF-45OF;
	Thu, 13 Feb 2025 14:02:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZkG-0000000BENr-2t5e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:59:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A12AFA42593;
	Thu, 13 Feb 2025 13:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F22FC4CEE2;
	Thu, 13 Feb 2025 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739455151;
	bh=0VaVSZ3UJsiKIWWiUS2W95oJuWLkTjylWVmIEpR7Qzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sLNnxG+kJLjxC9frWJNXBoDNBmDPIi+MFrypungWEHk0c10WPWpiOzi5tvjkA2OyT
	 XVNhAHhqE1y3OoOI3m4QtuX631nDsbWm8MLNwjT4/wsCCEC8+t/Dt3IJSfq5KKPj+4
	 /g1Dxab5wRtugDfxmGIKcKtONMwQAmSA17RBfhvv7c2npNpxU3g5WaaNmNTEsvc022
	 1xcBEdGRAeI7dBcJyzgTNj5lQScPKD/AZQBw6k+W0yKt13/FiAC6o6Ln0iQvd93BVc
	 G09NGJFDPyl2fJ0YZLnDLiyKpjvZhrFGNDrsLJVEMgUZ1DeOvvbb//7zMsieUJDqad
	 8dVzjqQCLX+Hw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Add missing registrations of hwcaps
Date: Thu, 13 Feb 2025 13:59:02 +0000
Message-Id: <173944518997.2607340.9811586493482464841.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250212-arm64-fix-2024-dpisa-v2-1-67a1c11d6001@kernel.org>
References: <20250212-arm64-fix-2024-dpisa-v2-1-67a1c11d6001@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_055912_800084_E3E86996 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

On Wed, 12 Feb 2025 00:30:42 +0000, Mark Brown wrote:
> Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
> userspace") added definitions for HWCAP_FPRCVT, HWCAP_F8MM8 and
> HWCAP_F8MM4 but did not include the crucial registration in
> arm64_elf_hwcaps.  Add it.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Add missing registrations of hwcaps
      https://git.kernel.org/arm64/c/a4cc8494f1d8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

