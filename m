Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6995EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 06:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=ArMuUjUjfuaCEhQVg7xbi9LyS0T9hCbQPYjtmfTWZJs=; b=pq60jiBrK4gwqE7cD5SFM5htMx
	cciwHv+cjBZXG0F9x1BELq5FvaHEuI91AXdj9P8eUWfyDwavl321nUzPddhTd+TeBE8yk9dIvT8nF
	fl9SdcJYN03KOsS7Dc4pcpWWLA3kHT7yEPWAzGsbuF3nfeaaav1LiIBF2AD5iqNYFS/2yJIqCMSW4
	yYZx/cTcZKmGFsKKQPdqJLiGF+VuRkm/qv2CUL9PnovFcofTjnFUPjA5RBWBcA1OMmxnmOsz2Oyji
	VQIfO8s8iEI8EsGLhtopzUdq0VxTgl2Dmfa4bDoDKEk49FTvhrQQLag2UpCm3qzNdgK4XFwZkNHwm
	p+yvFutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7Og-0000000Ds5m-3TpQ;
	Fri, 11 Jul 2025 06:38:14 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7MI-0000000DrX3-44Qj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 06:35:49 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250711063539epoutp025d02833e92d5488996ab673d19cc7c92~RHu5-lcHv1886318863epoutp02G
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 06:35:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250711063539epoutp025d02833e92d5488996ab673d19cc7c92~RHu5-lcHv1886318863epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752215739;
	bh=ArMuUjUjfuaCEhQVg7xbi9LyS0T9hCbQPYjtmfTWZJs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=O0iOs1dVDNI1zMe79WFeXMG2qN92E08vjdqSAZY4d6BLGCGfxBTBS4BJKHg1OkH3+
	 /YBdSKK4Lg6uPK9ajYl6vIc4WWLXfYVAVv7y8NUXq/5K517ZKjY9T6p5jCZyqHsezi
	 fWtty6C0vG6J5mCe0lDF5NeAeVKI8udZKCWxoxQE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250711063539epcas5p26f35b218af46423626481ec75f82db1e~RHu5nraKp3228232282epcas5p23;
	Fri, 11 Jul 2025 06:35:39 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.182]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bdhmR4vCgz2SSKw; Fri, 11 Jul
	2025 06:35:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf~Q1lkNxKgj2321423214epcas5p1T;
	Thu, 10 Jul 2025 08:25:33 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710082531epsmtip157b0106af49bac387934c44e814c6078~Q1litj7Re0693006930epsmtip1w;
	Thu, 10 Jul 2025 08:25:31 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
Date: Thu, 10 Jul 2025 14:04:31 +0530
Message-Id: <20250710083434.1821671-1-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf
References: <CGME20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_233547_663716_72D0928F 
X-CRM114-Status: GOOD (  11.85  )
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

Enable on-chip RTC support. The on-chip RTC of this SoC is similar
to the previous versions of Samsung SoC. So re-use the existing
RTC driver with applicable call-backs for initialization and IRQ handling.
Add a separate call-back for disabling RTC since existing '.disable'
call-backs updates additional bit not valid for RTC of ExynosAutov9.

Setting and getting hardware clock has been tested using 'hwclock'
and 'date' utilities.

Alarm interrupt has been checked with incrementing interrupt
count via "cat /proc/interrupts | grep rtc" for 10sec
wakeup time via "echo +10 > /sys/class/rtc/rtc0/wakealarm"

changelog
---
Changes in v2:
- Fixed the review comment of v1 for mis-aligmnent & asymmetry bit logic.
- link for v1 : https://lore.kernel.org/linux-rtc/20250702052426.2404256-1-dev.tailor@samsung.com/


Devang Tailor (3):
  dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
  rtc: s3c: support for exynosautov9 on-chip RTC
  arm64: dts: exynosautov9: add RTC DT node

 .../devicetree/bindings/rtc/s3c-rtc.yaml       |  1 +
 .../boot/dts/exynos/exynosautov9-sadk.dts      |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi   | 10 ++++++++++
 drivers/rtc/rtc-s3c.c                          | 18 ++++++++++++++++++
 4 files changed, 33 insertions(+)


base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
-- 
2.34.1


