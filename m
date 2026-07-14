Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B726C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bn7zqv7BhhO4u2hyqtDUkagNf7vxIqH4Kedjj5Ao8gg=; b=2HarkkfwJQGos4y0etXP9AMTpi
	tLdxjElogpLuB7SRBglVaLOnctbL7O6ysmHe7TuqRTpl2sDCvrOtyEmfaqUbd15a4qJxy72DuVOG3
	e1Eyl4yuMlQfzYmrGtrebFwzLoFPmcTehdB6GtraLGqD5o/IDRLFU0dXmnKs8/hhmqfGSqVSsK1sY
	pD4sSzixR2+IySn99OT3Gm8EmlxGvuWVTthfnfRuOaLMVb1beJU6E1OPP0RT3HViFmKlptV2OeaIH
	l2iEQzWr9lllEOY5OpfkeZwIqpagj4iJbbbDG3TgYgLmuoF3IrPGs7A0kvsixTABZeRUfEqb+Kpz0
	hnGhjkdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWLX-0000000B0TV-3Dk3;
	Tue, 14 Jul 2026 06:10:23 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWLQ-0000000B0Qa-3tgi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bn
	7zqv7BhhO4u2hyqtDUkagNf7vxIqH4Kedjj5Ao8gg=; b=OwtK6mD4hKcXDiM1hO
	qPwRv5qhI/mzDULJimzH9Y9IxR/J8+QkKfrm5IWPi6H8Yy+INj2zjIAD1hDcdNPT
	0CUv6LutuOvjYBSSUq0bsOiXWHGMpH61vh4m5CUSXe7TpFdXwXQsKVr+/fP0zDbW
	M8LHhjuo2Nw4aSpm+Gt/o4u8w=
Received: from xwm-TianYi510Pro-14IMB.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnwyab0lVqrG_HHA--.5129S2;
	Tue, 14 Jul 2026 14:09:47 +0800 (CST)
From: weimin xiong <xiongwm2026@163.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	weimin xiong <xiongwm2026@163.com>
Subject: [PATCH v1 0/4] iommu: Fix device lookup lifetime and probe cleanup
Date: Tue, 14 Jul 2026 14:09:26 +0800
Message-ID: <20260714060930.220277-1-xiongwm2026@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnwyab0lVqrG_HHA--.5129S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4kGryxKF15JFW8Kr4DJwb_yoWDGFX_ur
	yrZ3srXw1rZFWxZa42qF47ZrZYkr4IvF97GrWjg3s3Jr17XrWkGa1qvFn5Ja1xWw1jyFn7
	tw4Ykr1xG342gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUuHq3UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: x0lr0wdzpsijqw6rljoofrz/xtbCzgvOXmpV0qudxAAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_231017_812148_8DA5E6F2 
X-CRM114-Status: UNSURE (   8.85  )
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

Fix a few IOMMU driver lifetime and error-path issues found while
auditing fwnode-based device lookup and probe cleanup paths.

The first three patches avoid deriving driver private data after
dropping the device reference returned by bus_find_device_by_fwnode().
They also make the ARM SMMU v2 and VSI probe paths fail cleanly when the
IOMMU lookup fails.

The last patch unwinds msm_iommu_probe() state if sysfs setup or
iommu_device_register() fails.

weimin xiong (4):
  iommu/arm-smmu: Fix fwnode lookup lifetime handling
  iommu/arm-smmu-v3: Fix fwnode lookup lifetime handling
  iommu/vsi: Fix fwnode lookup lifetime handling
  iommu/msm: Clean up probe state on registration failure

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  8 +++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 12 +++++++++++-
 drivers/iommu/msm_iommu.c                   | 10 ++++++++--
 drivers/iommu/vsi-iommu.c                   | 10 +++++++++-
 4 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.43.0


