Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946DCC531C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oakyfwRPUlUhIuYXETLwbO8Sp1BJjGX0KU4hVjSlLFg=; b=M50IgEZkrtQ64cokm/s7HtaUbP
	o6tpPHFRniqVglrg4A5giHZlAfZ1U4T6wArE3muQKIKjyIwC1HJOEqSgo5PlNV/p4gaJBk8g2tju0
	cMlkUhepa2jHSdwu9g75h/XA8TgTggQn4b7yxTdkUvZG7kWOdHN98cx38xzUxvzZQAZ1SPZfVpJ8b
	qDU1VeEqE+y0f29hOqYXArXYQ9A0qS6Wm8UHtYkndlitFMfz188KE02FG/WwnbQDQ73A50hFgxTdA
	yq4+sYY0qQiHXFNnh8DFlWvO+34x9TP5ciefv+5sGSjBUZm1nXQZGNECpoMNKUHN6aFTcimEO0iBL
	g5Q/jrAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeg1-0000000CpYy-1tG2;
	Wed, 22 Jul 2026 21:40:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefy-0000000CpWK-1Z1O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC270600E1;
	Wed, 22 Jul 2026 21:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C73F1F00A3D;
	Wed, 22 Jul 2026 21:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756425;
	bh=oakyfwRPUlUhIuYXETLwbO8Sp1BJjGX0KU4hVjSlLFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PJ5CUgjYAwDgRiGGS3h7AtnZtmjG3+vrAiye1YPjWil6HDwtkq825XgIjTEqphk2E
	 Npqq9t/eNT1XXJpiooKqUla6glq0mGSSgjWJWckpQ4PZfKQZ1uBzjWGPBZM6FE8JD4
	 5aAfrknKKwFdBffjtwy8mLzfKcizqX4crEWeZIIxaxGA04q08nez7HNfb53DLA2rCu
	 VZW1BmrV87VZmYDHmr9KtkuMztFfCBa7MceKfLFSU7Hr7ewQez65Mug6c+uSwhBCMW
	 r7/DdMT0yQJqaLmPSjHK8uXsbVk/DhiEFKhBLwrmBFfDq/T6XhlE7SlH6MXDiTP1AQ
	 P0PMk341I2ADQ==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu: arm: Remove redundant dev_err()/dev_err_probe()
Date: Wed, 22 Jul 2026 22:39:29 +0100
Message-ID: <178472595619.2878707.2602583908071504457.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714133246.575556-1-panchuang@vivo.com>
References: <20260714133246.575556-1-panchuang@vivo.com>
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

On Tue, 14 Jul 2026 21:32:43 +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove
> the now-redundant driver-specific dev_err() and dev_err_probe() calls.
> 
> 

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu: arm: Remove redundant dev_err()/dev_err_probe()
      https://git.kernel.org/iommu/c/13a86292681d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

