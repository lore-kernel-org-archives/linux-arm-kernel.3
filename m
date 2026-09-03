Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FE8C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=O+Oa9E6Qny0/U97J+PnwQI9eiS4VMGRYOtNKxkWoERk=; b=aeF7atZJmFc15j
	ReAWwzWphVMC+h2CBGOdQaTiVgJaTyPb3XRNmllAEcKm0EpPYZTsESiqeAOfnKjjXol+dwDwsbouC
	01p18mIKHKebmXgUNRlT3Aq1n1HM+lxWGf3JF+o8pEZGRcelW1ODclhciOpmTQxIn+/BnQS4RMspI
	wCBD1TOkxmZnBB5n7cNZ4pXIcbmJpbVNkeUk0cFVHn/q/7a9hIBARQ9iWXvnKFV89htjfMESADyRl
	ds1eFVusM9vPQnRGDHye7vYvaewI4+xDBAvCdKjbQZEc4U9FubG5wTq2QYuQiyw7m23o2EIVkVCHx
	C5sAVRDThbABAyyizyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21dU-0000000GXsQ-2Au0;
	Thu, 03 Sep 2026 07:13:24 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21dQ-0000000GXrN-2aQ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:13:23 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260903071313epoutp025a2270d330304ec66ea98dcb5804fb06~RviUJIC7p0267902679epoutp02N
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 07:13:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260903071313epoutp025a2270d330304ec66ea98dcb5804fb06~RviUJIC7p0267902679epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788419593;
	bh=O+Oa9E6Qny0/U97J+PnwQI9eiS4VMGRYOtNKxkWoERk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=p9TJ+0F/Tbz6dm5Opj5PQnWxwUoXyIX9H19JD5b8YePGKlXpkBQ3czou2JMu4coub
	 zbQmltxlk76PBhjPuRXZU0gOz41D5Gyp9nB/m6O7GvHaqXSrrbj+/B8UBgbGSTMXEX
	 dlN3hpKHUkZhQO37gUM4bTfaKUhYkygQS3+fnbiI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260903071312epcas5p4d1005b5ac362f142932be092f36724e7~RviTlTlDQ0465204652epcas5p4w;
	Thu,  3 Sep 2026 07:13:12 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hb9mS032fz3hhT3; Thu,  3 Sep
	2026 07:13:12 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260903071311epcas5p24c547d69b769818834ae2b7285cb541b~RviSbxOkT2559925599epcas5p2V;
	Thu,  3 Sep 2026 07:13:11 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260903071308epsmtip1dfebd129056ef4e6573b6bc6036f1c46~RviPvk0wn2578325783epsmtip1H;
	Thu,  3 Sep 2026 07:13:08 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH 0/3] Add USB DWC3 support for Samsung Exynos8855
Date: Thu,  3 Sep 2026 12:42:47 +0530
Message-Id: <20260903071250.3421499-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20260903071311epcas5p24c547d69b769818834ae2b7285cb541b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071311epcas5p24c547d69b769818834ae2b7285cb541b
References: <CGME20260903071311epcas5p24c547d69b769818834ae2b7285cb541b@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_001321_165813_AD073DB7 
X-CRM114-Status: GOOD (  13.07  )
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

The Samsung Exynos8855 SoC implements a Synopsys DesignWare USB3 DRD
controller. The DWC3 core on the Exynos8855 is instantiated with the
generic dwc3 platform driver using a flattened model, where the
controller is directly addressable without a separate glue layer.

This series adds the device tree binding and platform driver support
for this configuration. The binding follows qcom,snps-dwc3 pattern:
a single node referencing snps,dwc3-common.yaml for shared DWC3
properties, with per-SoC constraints enforced via if-then conditionals.

The MAINTAINERS entry is updated first so that the new binding falls
under the existing ARM/Samsung SoC maintainership.

Selvarasu Ganesan (3):
  MAINTAINERS: add Samsung USB DT binding to ARM/SAMSUNG entry
  dt-bindings: usb: Introduce samsung,snps-dwc3
  usb: dwc3: Add Exynos8855 to the generic platform driver

 .../bindings/usb/samsung,snps-dwc3.yaml       | 98 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 drivers/usb/dwc3/dwc3-generic-plat.c          |  1 +
 3 files changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml

-- 
2.17.1


