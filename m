Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5FDCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=jgD4FE835KaeZjVVwGrOvcS2NoefLZfY/9wEtmAm6Z0=; b=eMKiRd94sYCpHsl3sfkBRKGXU6
	QwOenqB0o+y9hRw829oJxn4dADYQP36O4OGHtE4m2pfeuwflW1ZoY2SzZWfSNJcocYTcT4VQ6L48Y
	0omsnF7E5qz82jD3YDZPegQHfKkSx0NiTf+JW9t+X2Zcr/u8kFF9gOKsPsFOIvDJnDrKoz3rqKNmW
	Ddz2aE2tPJgv67bQwrwd0wNp3G1qJMdDCxIE2pxYqpcmcpglgpAOceI6BH4nRS+UQk8Os/MAWAC7e
	Vear6Zg+uLirhgz7Mef9YWlw/NNHCikEaw05PdLpPoSN0INrE2iUFWylkiMABoKSEMicS/V0G79n1
	1XqbazbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCG9o-00000009Em8-00GS;
	Fri, 24 Oct 2025 11:40:32 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCG9j-00000009Ekp-0nZ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 11:40:29 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251024114019epoutp0175c15621957d5f6aa5f0fb78bf98420d~xan48QaKr0408704087epoutp014
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 11:40:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251024114019epoutp0175c15621957d5f6aa5f0fb78bf98420d~xan48QaKr0408704087epoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761306019;
	bh=jgD4FE835KaeZjVVwGrOvcS2NoefLZfY/9wEtmAm6Z0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Soy+HB/6fzz11glCO37ATJv7u0hjoZKmpqiTxjQQm4pI6bDaskxEUBgbPcnQjPIpL
	 TSuQU6g4eb4VywHVZ+mCMuzBj+fKe8w9I8Mn9pATI/MkUDgJa0yaU1qON/g1Vtbv1Y
	 GUCSguONvfkf47s8hJWPw27z4ANdAvRYPGX0/ub8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251024114019epcas5p4d53ff7d6db9e242ee2c83851b6dcc4ff~xan4ZNeMk0125301253epcas5p4y;
	Fri, 24 Oct 2025 11:40:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ctLYZ4w0Fz2SSKZ; Fri, 24 Oct
	2025 11:40:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284~xan3aYEnJ0616806168epcas5p4R;
	Fri, 24 Oct 2025 11:40:18 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251024114009epsmtip1e974e301bfbcf3d88e036be7c602a0c4~xanvadepJ0283702837epsmtip1B;
	Fri, 24 Oct 2025 11:40:08 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH 0/3] Add and enable USB nodes for ExynosAutov920 SoC
Date: Fri, 24 Oct 2025 17:18:42 +0530
Message-Id: <20251024114845.2395166-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284
References: <CGME20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_044027_552042_D3E7325F 
X-CRM114-Status: GOOD (  13.52  )
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
controllers and amoung them, one is USB3.1 DRD combo phy and three
USB2.0 phy controllers. This patchset adds and enables USB and
USB-PHY nodes in dts.

PMIC driver is not implmented yet, we rely on USB LDOs being enabled 
by the bootloader and used dummy regulators for now.

To drive vbus for host mode, it needs GPIO pin to enable vbus regulator.
GPIO expander is present in the dts, we used it to enable the vbus 
regulator using GPIO.

USB ports are configured as OTG, and default mode is configured as
peripheral. These configurations might be changed based on requirements.

This patchset has dependancy on schema and driver implementation[1]
and role switch control from userspace[2] patches.
[1]: https://lore.kernel.org/linux-phy/20251010070912.3758334-1-pritam.sutar@samsung.com/
[2]: https://lore.kernel.org/linux-usb/20251024085455.789555-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (3):
  arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
  arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
  arm64: dts: exynos: ExynosAutov920: Enable USB nodes

 .../boot/dts/exynos/exynosautov920-sadk.dts   | 160 +++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 162 ++++++++++++++++++
 2 files changed, 322 insertions(+)

-- 
2.34.1


