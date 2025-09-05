Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB56ACA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=eaEYsu1XFh1bBRI84CgBEoTw4JVROEnMh3Hmue1+h3o=; b=wm+HbEOcn+3y+otlkcfpRVszKJ
	KYVpPbnIWzljvu4TNmKHa3hzlfALji61h25coHrZgyY48dCfAKwOoJ0wgM2y9+vbt5fmUxHz6pgxe
	wN76gznWQs54++5LNhGGBuVk3p97qeqKnFTnbl/lhRLziqoSMC4DG9osyS1uGxq0RqJRO8xmqRBkb
	hla2j70X3UkmoXRvJw7ucB3GKnV090Ki3vk5++c9EKmmwNROdJBEhunqZzkJFaDaRHxc4AYyXQOuY
	Pggg0p3maCUG/ybdJdbH9OXS1C6eBUXyx8gejJYwvwxbpctFxdl27Sg9LWt8nXplHbZesdyH5bg/S
	4m1ID3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXYg-00000002Omz-1gMV;
	Fri, 05 Sep 2025 14:36:58 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuU87-00000001DHi-2hQ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 10:57:24 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250905105710epoutp03a164d372e42d741475de589f2a4d77a5~iXbOVGYDl2303223032epoutp03W
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 10:57:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250905105710epoutp03a164d372e42d741475de589f2a4d77a5~iXbOVGYDl2303223032epoutp03W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757069830;
	bh=eaEYsu1XFh1bBRI84CgBEoTw4JVROEnMh3Hmue1+h3o=;
	h=From:To:Cc:Subject:Date:References:From;
	b=daWxA7clxY7gasOel4hVJxRQy0xVB60sTTTaHn/W/LKexrdG/dyhpneUIXd6P+yWo
	 fPJjvjhpL7Fh8L+HP+dSAnYvTdjZ6voqA5LimH087kt5fhhCngVDLqMCrQjtUro7iS
	 kJa7yU4zMrerzyAg2h5gCF4H1l8Ce20iZI7VIJVU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250905105709epcas5p2be42816c576a97cc611cbb0c4fe810c9~iXbNurTu73082030820epcas5p21;
	Fri,  5 Sep 2025 10:57:09 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cJCwN6db6z3hhT3; Fri,  5 Sep
	2025 10:57:08 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250905105708epcas5p159281b73f87fae88e824b97889908649~iXbMFh6xr2168021680epcas5p1g;
	Fri,  5 Sep 2025 10:57:08 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250905105706epsmtip2d75bdbdc4f6d0085b8096f616afb39c0~iXbKeyat70714207142epsmtip2-;
	Fri,  5 Sep 2025 10:57:06 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	henrik@grimler.se, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v3 0/3] On-chip RTC support for ExynosAutov9
Date: Fri,  5 Sep 2025 16:35:51 +0530
Message-Id: <20250905110554.2212304-1-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250905105708epcas5p159281b73f87fae88e824b97889908649
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250905105708epcas5p159281b73f87fae88e824b97889908649
References: <CGME20250905105708epcas5p159281b73f87fae88e824b97889908649@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_035721_749478_D17F1AA0 
X-CRM114-Status: GOOD (  13.98  )
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
to the previous version of Samsung SoCs except for TICNT tick time
counter. So re-use the existing RTC driver with applicable call-backs
for initialization and IRQ handling without accessing TICNT counter.

As suggested in review comment, instead of adding separate disable()
call-back, re-used the existing s3c24xx_rtc_disable() by adding a new
bool 'use_s3c2410_ticnt' in rtc_data to avoid accessing TICNT counter
which is not valid for RTC of ExynosAutov9.

Setting and getting hardware clock has been tested using 'hwclock'
and 'date' utilities.

Alarm interrupt has been checked with incrementing interrupt
count via "cat /proc/interrupts | grep rtc" for 10sec
wakeup time via "echo +10 > /sys/class/rtc/rtc0/wakealarm"

changelog
---
Changes in v3:
- 1/3 : Added Tag 'Reviewed-by'
- 2/3 : Fixed the review comment of v2 to re-use the existing disable()
	instead of adding new one.
      : Not adding Tag 'Reviewed-by' from V2 since the patch has been
	changed
- 3/3 : Added Tag 'Reviewed-by'
link for v2 : https://lore.kernel.org/linux-rtc/20250710083434.1821671-1-dev.tailor@samsung.com/


Changes in v2:
- Fixed the review comment of v1 for mis-aligmnent & asymmetry bit logic.
- link for v1 : https://lore.kernel.org/linux-rtc/20250702052426.2404256-1-dev.tailor@samsung.com/


Devang Tailor (3):
  dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
  rtc: s3c: support for exynosautov9 on-chip RTC
  arm64: dts: exynosautov9: add RTC DT node

 .../devicetree/bindings/rtc/s3c-rtc.yaml      |  1 +
 .../boot/dts/exynos/exynosautov9-sadk.dts     |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 10 +++++++++
 drivers/rtc/rtc-s3c.c                         | 21 ++++++++++++++++---
 4 files changed, 33 insertions(+), 3 deletions(-)


base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
-- 
2.34.1


