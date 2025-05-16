Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA957C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=NjSkcG8Ba/+tj528MW2v7RcxXouxjFYRzu2bxrG2VTY=; b=DNSIxccdp5q7L0pmm1QHDbaze3
	UsVQllw/hj9+9ejWcmp+UHpjQZfqyL6uL7eAw/1sZ7WQoYsoRqCHLaoFvppz7svYHxaQi1uVpuKL+
	GCMKJuNB/4rZ+f3Y6ZI+nt7FnKxFPq/7IKJ7EBzNMs1Isdt8EAKNNDxiUqvvJi0B/YRdWwelHQUCt
	dm9qDhRpTuTuKHSjiDPK6KFPqb+uPOOUzuR3FCbxKpgzTdt5PKd+2bz8+BbGx4Wslqkzl3ReoZI+q
	LZq3lg4ilFKDaZzK8sNZIrytw75OdpWwdleNjsdRMugBuAOJDoXLXYcAlkWeworXRk9KeHGlKe5Ru
	O7qM93uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3CK-00000009mJU-1mi6;
	Mon, 19 May 2025 16:18:40 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2EN-00000009a8Z-11oW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:16:47 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250519151635epoutp04cf69df6727025959ce764a92411c342e~A9pmkwDW42517625176epoutp043
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 15:16:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250519151635epoutp04cf69df6727025959ce764a92411c342e~A9pmkwDW42517625176epoutp043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747667795;
	bh=NjSkcG8Ba/+tj528MW2v7RcxXouxjFYRzu2bxrG2VTY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=cAGdWTsmBTvkJZG4Rh2DK0TdJyhfL2xVFApt7LQTUtNpuQer0CMUAv1iOtsz2W6Lz
	 sfYawBTRqBcCjbkaQZ2a55kidC+tjQebeLBy0bw+7IOE5Z5QVZRuIROxpKdA6mRKcd
	 hCY53q/ZdmecxSfJi4PXa5NdEgY/Mto4lZHPD4m4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250519151634epcas5p3a0e08112510553d5309c072da7dd2c71~A9pmKlQ4x1584715847epcas5p3D;
	Mon, 19 May 2025 15:16:34 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4b1Lr06k48z3hhT7; Mon, 19 May
	2025 15:16:32 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250516101757epcas5p368f98b909ff50c91700358f65228e066~-_pAvExL71920919209epcas5p3O;
	Fri, 16 May 2025 10:17:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250516101757epsmtrp22c1f07f88793cc19be819e06f3b2827b~-_pAt9LXe1867418674epsmtrp21;
	Fri, 16 May 2025 10:17:57 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-37-682710d51bb8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	33.2F.08766.5D017286; Fri, 16 May 2025 19:17:57 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516101754epsmtip21f528a17cdd4b1f7f3d12e2cedac85fa~-_o91PBMW2836328363epsmtip2c;
	Fri, 16 May 2025 10:17:54 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 0/2] initial usbdrd phy support for Exynosautov920 soc
Date: Fri, 16 May 2025 15:56:48 +0530
Message-Id: <20250516102650.2144487-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSvO5VAfUMg9evpSwezNvGZrHl1WYW
	izV7zzFZ3NuxjN1i/pFzrBbXbixkt/jz7zybxdHW/8wWL2fdY7PY9Pgaq8XlXXPYLCas+sZi
	MeP8PiaLtUfuslucf9HFarFhxj8Wi2f3VrBZ/N+zg93iy88HzBaH37SzWhxZ/pHJYuedE8wO
	Yh4n121m8ti0qpPN4861PWwem5fUe/RtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfG2id2BUfZ
	K6YsvcnawDiJrYuRk0NCwERi0rMPTF2MXBxCArsZJWa3zGWBSMhIPJq2kRXCFpZY+e85O0TR
	W0aJ72/PAiU4ONgETCUm7kkAiYsI9DBJPL36gw3EYRY4zSSx4eMMdpBuYQFPiZ0X5jCC2CwC
	qhI3+1qYQGxeAXuJN6fmQW2Ql9h/8CwzRFxQ4uTMJ2BXMAPFm7fOZp7AyDcLSWoWktQCRqZV
	jJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBUaSluYNx+6oPeocYmTgYDzFKcDArifBe
	z1LOEOJNSaysSi3Kjy8qzUktPsQozcGiJM4r/qI3RUggPbEkNTs1tSC1CCbLxMEp1cC0o9rK
	/UOg2+ZsnbwXdjsNGmpDBd6lHt0+scnmW96aT0u2xl1hWi1kutD9R/W1vVMYeA8uudmyepWI
	pVXqtTkbZUOuzf9jKrTadXqS+LsA0+zJdv332ZYsSf+v9szrxw/5ixcsp/nwF98uWX5C1ci9
	8+LU98+OM4eIaxVd0Pj3SoC/dlqvclVAZUD2nmOLVNzPTjgvu8W38sCO5cEdvUJ3X95eOevY
	wq2/ZH8827zm7/5LT3OjzDlyeRfHh04JkmI0q05n9jR7LpeVJMUXGN2af1S7W8qrYV3lmWUB
	T/3++OsqVEgmLGVgXLJt+fyJiazHeJNUWmVuCnPMdHSYOlPx4XW5O8t7j61okV3QYLRFiaU4
	I9FQi7moOBEAVMSI6hEDAAA=
X-CMS-MailID: 20250516101757epcas5p368f98b909ff50c91700358f65228e066
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516101757epcas5p368f98b909ff50c91700358f65228e066
References: <CGME20250516101757epcas5p368f98b909ff50c91700358f65228e066@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_081645_517752_903EFB28 
X-CRM114-Status: GOOD (  12.87  )
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

This SoC has a single USB 3.1 DRD combo phy and three USB2.0
DRD phy controllers that only support the UTMI+ interface. 
This SoC is very similar to the existing Exynos850 support
in this driver. We have supported only UTMI+ in this patchset.

The difference is that combo phy supports both UTMI+(HS) and 
PIPE3(SS) and is out of scope in this patchset.

changelog
----------
Changes in v2:
- Used standard GENMASK() and FIELD_GET() to get the major version 
  from controller version register.
  link for v1: https://lore.kernel.org/linux-phy/20250514134813.380807-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (2):
  dt-bindings: phy: samsung,usb3-drd-phy: add dt-schema for
    ExynosAutov920
  phy: exyons5-usbdrd: support HS phy for ExynosAutov920

 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 27 ++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 85 +++++++++++++++++++
 2 files changed, 112 insertions(+)

-- 
2.34.1


