Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD20DD6261F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIcbVnj3waROYb5DR8qb9eF/AvAmo/ZNkBO/tKnnrh0=; b=P0toy30NT4xECBxPHEUQlh2qbK
	Ri0u5w8xhmI+rt7mHDzp1jPq6VlFXqSya83sK205SRcbUH1F9DTflyEg+sMBRq11egfaeB23lmgxW
	3SPq7ctovCvMGxNABgJr14knMSFD4Wne88w/ajnRY0GVsgOiNHuZS95EcYUjfgKdAxkgHUHezsWj/
	cvez/DYC2yR9lXwmGozK+bFHQL9y4Dx9g036N6dRTqpJVWC1tnaIoaHOTis6Ov6WTsfM8C03YUjQx
	ocmV5rc5kjkuwI0L9P1hXhHM1RCXgZ2TXDFgWH47kEf34gbEpPll0RnQLn0TbEtF2E+Iyml93/F1O
	iirboQpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuAP-000000075NQ-056B;
	Thu, 22 Jan 2026 12:52:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuAN-000000075MQ-0ihp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 12:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jIcbVnj3waROYb5DR8qb9eF/AvAmo/ZNkBO/tKnnrh0=; b=dm6wvKDawyE0Zhlb+KZY+PEo89
	ZHFlIm7AHmU9924UkPbZ4OhdmpimGmoWhoNr5py2pvKCdE9yGY5UQi9+77LdhmWnxVxZPqTP0ZCff
	vmmavigEGQW9i4fNahlYd0LOdrOm4Wctpzh3NaYV3WrfFZSHSBv/qmMNFS46Mbyk1cUem+X4lKNgI
	8m/S1u5SSF1H1gqF/+9TSC7s3cIX/N/q56b59c/yNwGTaI6jJJy2QiD35x9uT4NbQSEvTKkLGLwAl
	0bo0a485Z2Mv3LNn+BPjING4SnDc1MwPug79MbTDodU311QMGyl46LpKMpOrFDKSfGKtYM7PYtVNV
	2qX/i7Eg==;
Received: from mailout4.samsung.com ([203.254.224.34])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuA8-00000000N8k-2wqa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:51:52 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260122125138epoutp04941a9a5699bd46b4aed70303ae5769a9~NDp2lxiEA2518725187epoutp04l
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 12:51:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260122125138epoutp04941a9a5699bd46b4aed70303ae5769a9~NDp2lxiEA2518725187epoutp04l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769086298;
	bh=jIcbVnj3waROYb5DR8qb9eF/AvAmo/ZNkBO/tKnnrh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dATG2pNrNR6UFza9FZLPb11R2MAq68CszXYbV/KyYnzQRqUHAV0uzlot/mh+RAx9p
	 bfgBuvY7AdGF3x58MrVCZbTcbAuucr/b/45i5dCNw68QTKrRzpYocf19ey4b71LeHZ
	 ZtDLWe5Gx2OTL7iLBTn6poLzUftEydus8iAG45F8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260122125138epcas5p4be5e677084de1243a64086923eff6f6a~NDp2DQwmp1800418004epcas5p4J;
	Thu, 22 Jan 2026 12:51:38 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dxgtK27dpz6B9m7; Thu, 22 Jan
	2026 12:51:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98~NDp0o_hqk2554025540epcas5p2G;
	Thu, 22 Jan 2026 12:51:36 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260122125134epsmtip1de6ed596648cd4ab20e3f219ec3fb5b6~NDpy2xoNO0683506835epsmtip1h;
	Thu, 22 Jan 2026 12:51:34 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 3/3] arm64: dts: exynos: ExynosAutov920: Enable USB nodes
Date: Thu, 22 Jan 2026 18:37:21 +0530
Message-Id: <20260122130721.205664-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122130721.205664-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_125150_050627_E7EB9B4B 
X-CRM114-Status: GOOD (  11.32  )
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

Enable USB PHY and DWC3 USB controllers' nodes.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-sadk.dts   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index f90f7704597c..5896dd69334a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -160,15 +160,20 @@ &xtcxo {
 &usbdrd31_ssphy {
 	dvdd-supply = <&dummy_regulator>;
 	vdd18-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd31_hsphy {
 	dvdd-supply = <&dummy_regulator>;
 	vdd18-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd31_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
 	maximum-speed = "super-speed-plus";
 	usb-phy = <&usb_phy0>;
 };
@@ -176,15 +181,20 @@ &usbdrd31_dwc3 {
 &usbdrd31 {
 	vdd10-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_phy0 {
 	dvdd-supply = <&dummy_regulator>;
 	vdd18-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_dwc3_0 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
 	maximum-speed = "high-speed";
 	usb-phy = <&usb_phy1>;
 };
@@ -192,15 +202,20 @@ &usbdrd20_dwc3_0 {
 &usbdrd20_0 {
 	vdd10-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_phy1 {
 	dvdd-supply = <&dummy_regulator>;
 	vdd18-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_dwc3_1 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
 	maximum-speed = "high-speed";
 	usb-phy = <&usb_phy2>;
 };
@@ -208,15 +223,20 @@ &usbdrd20_dwc3_1 {
 &usbdrd20_1 {
 	vdd10-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_phy2 {
 	dvdd-supply = <&dummy_regulator>;
 	vdd18-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
 
 &usbdrd20_dwc3_2 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
 	maximum-speed = "high-speed";
 	usb-phy = <&usb_phy3>;
 };
@@ -224,4 +244,5 @@ &usbdrd20_dwc3_2 {
 &usbdrd20_2 {
 	vdd10-supply = <&dummy_regulator>;
 	vdd33-supply = <&dummy_regulator>;
+	status = "okay";
 };
-- 
2.34.1


