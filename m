Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D65E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnebCcvpPWpB99FLfLgxldGVUVeM8i5P2ktrW32JqXg=; b=gEmRizbmVM1JmEMIMtLS0OBU1k
	2bMGp3d4q1KWNxRmqRSCIMjAIt2AtDDR3vw4aPGsz+cDW9/6jxXx76FEbzajwUMuzhwmcb+ZEDpjQ
	42GNR18C9VmsI3tSc85HRVOmBm5JAmXuIIB1CIQ4+CBtmsbu82gnvgVn/d5Q+9Ff2sGmpXMFaJCxD
	Pp+NuXRAvwAwhyWgQx3LHmt4BpgrmcIIFcQALlff3zjWaInGKdlQM4yV4b/CiGmcaahoVxKTu6EXc
	H6s1/PrJk2E36Ns6TS2DT1FgjsY5NYjqiZ+zbNFD4H7hTLA/ZRh19tpcMR4E2KfBv07MRt9P1yU2d
	CSULqyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKo2g-00000009hD6-3355;
	Tue, 10 Dec 2024 00:23:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnwo-00000009g5n-0abK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 00:17:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6581A419FD;
	Tue, 10 Dec 2024 00:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453F9C4CEE0;
	Tue, 10 Dec 2024 00:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733789873;
	bh=lHNoDuFE4BbrRmLOpkIFrKSiLXZ6f2Hc2Ut7zyg9UtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6UtlgPIxaWo/ZGTtJPcceN+J/l43TW5cZzV9b30cGzrC/rjk2NWg1Kd0u2BpF+Jn
	 Z7CnVT+uKwbIdPeDNKEQf9YedUvQMf7bcT+36axwlROwWqIcYmBMF/Cv/wUWpbG1Np
	 796e49XyclpypUFpHIAvKkMlKyuE5x1wZnBgSpYpZRJqTtpFrg3zaRZd0XDY3DnWIp
	 3cq1JJ7PgJfbbLAVczN6d2wEu41P5ec5xBx0le/lVjpz5XIaCYg0Qx7F47RF9d0abO
	 /nHaibAPFP4dIqMIEM0k6Bmda++dDaQdpDv30rqyEQtDboRjJGSXv7eraOSob7M3x8
	 pUggVbXUPvrvw==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	Daniel Mentz <danielmentz@google.com>
Subject: Re: [PATCH v2 0/2] Fix missing case for concatenation
Date: Tue, 10 Dec 2024 00:17:32 +0000
Message-Id: <173378764988.2164600.15198070609246396646.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241202140604.422235-1-smostafa@google.com>
References: <20241202140604.422235-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161754_241830_074F375A 
X-CRM114-Status: UNSURE (   9.01  )
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

On Mon, 02 Dec 2024 14:06:02 +0000, Mostafa Saleh wrote:
> First patch fixes a missing case for 16K granule and 40 bits SMMUs
> where concatenation is mandatory but ignored.
> 
> Second patch, imporves coverage of OAS in selftests to make it
> possible to test all concatenation cases.
> 
> Cc: Daniel Mentz <danielmentz@google.com>
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] iommu/io-pgtable-arm: Fix stage-2 concatenation with 16K
      https://git.kernel.org/will/c/4dcac8407fe1
[2/2] iommu/io-pgtable-arm: Add coverage for different OAS in selftest
      https://git.kernel.org/will/c/376ce8b35ed1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

