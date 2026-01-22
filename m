Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687E1D262BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=1YEdIuy+mVK4BJTKeVyMQ8ipqgyiyzWXJoHQTOrtzcA=; b=qphL9Us19lO5vt8VClqZbhMtS+
	t3jMBE5aFgAPLb4rjGYB4JloRAnd+omemY03D2lC2aGxf1HDthHgYmZAbBQwbohtKb3B3uzz/cK9T
	SunzNf27MmKtPehKoPMnM1V+sOh2lP7zXCvhTb36gNzLyRWuyJOyvtaGWPmN/3sR/bWkJ8VAB28kJ
	nQfcFImQH4myfhl3VyP8I3SUykabMOLT24cBmi7E8rf6w1APOGNXmTLOYkEpxatr9mhFLlo6pniW5
	N/VYFMPaExHmZFYlv+Ff/wNba/d14oWG09ZtgpygmALgRa2t7606chPeFEcqsyL4+qF88+g/7NXtL
	aRnbVhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuAA-000000075KC-1g5c;
	Thu, 22 Jan 2026 12:51:50 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuA1-000000075Gl-1sSy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:51:44 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260122125132epoutp03c99959d10600f9eca19988685d9b2a26~NDpwhN_N61177011770epoutp03h
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 12:51:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260122125132epoutp03c99959d10600f9eca19988685d9b2a26~NDpwhN_N61177011770epoutp03h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769086292;
	bh=1YEdIuy+mVK4BJTKeVyMQ8ipqgyiyzWXJoHQTOrtzcA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XsD2TwKOve6Ati77Wwp+/RvQEfcOw+eTOzWSbk+crGiOixRiSjmryWmQrJTqnyNJn
	 RGLbmKuP5akum2YfUsisN/opU0gjC1NRR68FV/cKsJT+KMwyrrOmjpOL7Ofu3/DOYG
	 jYbJM6KXI59XWw4fRgSch8NAFRP3GJS4TF3F8Dvg=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260122125131epcas5p4f312c87b94c2c65a742b0199a077c0d7~NDpv4ZN_q1352113521epcas5p4S;
	Thu, 22 Jan 2026 12:51:31 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dxgtB55j9z2SSKY; Thu, 22 Jan
	2026 12:51:30 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2~NDpuh5Hhf1109211092epcas5p4b;
	Thu, 22 Jan 2026 12:51:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260122125128epsmtip1fdc3cb93ecb73e4058921f2ecf8443a7~NDpsvxkan0713007130epsmtip1R;
	Thu, 22 Jan 2026 12:51:28 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 0/3] Add and enable USB nodes for ExynosAutov920 SoC
Date: Thu, 22 Jan 2026 18:37:18 +0530
Message-Id: <20260122130721.205664-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2
References: <CGME20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_045142_929901_BD3D7BAC 
X-CRM114-Status: GOOD (  11.80  )
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

This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD
controllers and among them, one single USB3.1 DRD combo phy and three
USB2.0 only phy controllers. This patchset adds and enables USB and
USB-PHY nodes in dts.

PMIC is not implemented yet, we rely on USB LDOs being enabled by the
bootloader and used dummy regulators for now.

To drive vbus for host mode, it needs GPIO pin to enable vbus regulator.
GPIO expander is present in the dts, we used it to enable the regulator
using GPIO.

USB ports are configured as OTG, and default mode is configured as
peripheral. It will be changed based on requirements.

changelog
----------
Changes in v2:
- As v1 was pushed 3 months back, resending this patchset.
- Since dependencies are merged, removed links from coverletter.
  link for v1: https://lore.kernel.org/linux-devicetree/20251024114845.2395166-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (3):
  arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
  arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
  arm64: dts: exynos: ExynosAutov920: Enable USB nodes

 .../boot/dts/exynos/exynosautov920-sadk.dts   | 160 +++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 162 ++++++++++++++++++
 2 files changed, 322 insertions(+)

-- 
2.34.1


