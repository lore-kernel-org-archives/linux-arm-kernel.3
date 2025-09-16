Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3E6CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkMl8wwL4pC+LsYQ5A4zOMNBrFJOPdqLdsaI9ZVib78=; b=APyTTh+ypr3udhe/PvXspLkCYe
	cIdx4CZOCnsXUupLzEkhRjYI5D+/L2a7eFIydu0dyUW8aqWG0g7+HplNEzrk+lBc9q2cAFVf8u/g6
	fSDYjTMsSnCQf3zIasb1mUUebRgJ+qaoFgY2eje6GcBV1n/SXABoNxosipyrxhYJmmxsIX89TpRyR
	gnAOjJwEVwcKurUFLgiZ6CjAvudwHMk6AnV0oLYUcQ63EypJxpsRpQULCu5wDYv8F9+e7qWl36yrM
	grX0iWQrY4hqf6+YJpMH5LUOkn3RQZ+fVs9jhXZNAuGS694aMn3UpACVgHmtGcySSV2r4bQvPgLqm
	B8FysHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyczy-0000000990J-279k;
	Tue, 16 Sep 2025 21:14:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyczx-0000000990A-0j6I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DB7D601B3;
	Tue, 16 Sep 2025 21:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C004C4CEEB;
	Tue, 16 Sep 2025 21:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758057240;
	bh=jInJWqCSD2tE4OmrvXDiyUixVS6RwmIj9RFok/Nmy5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZImTrAYKUJQRO/o8tLpQjVUwBA+8cF+Vax3PQvKoQOhfsvMkIyvR9n1Ytu2GTvHu7
	 Zux8k/Pzb61qlNms5ou8CaHFR32E6y2DIMr6UpWy/EegfFFt7bBm7BSQaXAH9LdjtC
	 K5DBTGk3A7rpgA9OUSeEc8mjdHPolwgo6CH8ckSAf/txOOqTpqFPbKfNRrfxaiAfOe
	 SXwc5stvlg+kjtrcioai6x97S12wiX52RkEmsfDP1MRPr5OM+Ikkkw33WgzQw57O3H
	 yEPqltEWWL+tIZKEdMM3tgubPVPapbC0EIrS45xlzIN/gRQCXR0JiYgSU4lGHiSdER
	 3B9HGygntElug==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/3] arm64: Support FEAT_LSFE (Large System Float Extension)
Date: Tue, 16 Sep 2025 22:13:47 +0100
Message-Id: <175804891321.3098971.7036072968418097022.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
References: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
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

On Mon, 18 Aug 2025 20:21:17 +0100, Mark Brown wrote:
> FEAT_LSFE is optional from v9.5, it adds new instructions for atomic
> memory operations with floating point values.  We have no immediate use
> for it in kernel, provide a hwcap so userspace can discover it and allow
> the ID register field to be exposed to KVM guests.
> 
> 

Applied first patch to arm64 (for-next/cpufeature), thanks!

[1/3] arm64/hwcap: Add hwcap for FEAT_LSFE
      https://git.kernel.org/arm64/c/220928e52cb0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

