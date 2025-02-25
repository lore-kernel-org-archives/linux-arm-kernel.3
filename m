Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89BDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JKIIrvyYA+gZm83nHFuNxA39LsjVxEX31VPSiey1bdc=; b=ZaNzXG6AW7CU1Fl7+F0UcFiE2r
	8qBYLT13ONRlKgE6F3RBHpwlv2JM277NnC078U56XXLLPj4Gr2lsGl5aONQt4u086xhHd3vywmYl2
	8wtmP1x95NfVRYCIIh5Xk6QYnJVREikdx5PyoJfSb/bHiSm0aGYa86Ovyjb5cHhJ3rqVNCx4e2CV0
	KNR+rsLwbeZ+gmyS2kUYIA5TVOPWhAoXC34CXYx7/aXgUH3XJb0kps8f8wus4KNZsRW+naf54tRAa
	PsCAqtsAlWrGQYBsyfJ3MUSA1lmRDSaTOnpv41YOqwQZ3D+6+qCkhDwI9svn/mmXb+s7D7r+OsJ4i
	m7dVayQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsky-0000000GxIq-2JqF;
	Tue, 25 Feb 2025 11:05:44 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsAC-0000000GpCY-2Qm7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740479264; x=1772015264;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JKIIrvyYA+gZm83nHFuNxA39LsjVxEX31VPSiey1bdc=;
  b=i9+zTQdOIaMgVW+xVaDT5EYLJsJj4j2B7oV+INeGK0ohp7G3wsClFsgz
   WBJT0Lh3e3A39AJGP8eJhGGWJZD7n8IoIIMHcdXv4H0QnjCJqBh5eDKlU
   gHJCoJWV4UdztA4K4rSFApk5+xpIWbWMI3U47xxbSKA/CT/9peX47WIQl
   JkxFFgBw7EvjsDgvwZYYYTcEwup15FF+/790MYf6+/NbojwLjgWkIuoRd
   0EbXB4SCdPpajBXPeqsgj7LoylnwYIvxAgt4/q3tWgnXtaMyk1GQO3Nl4
   0gDYxxPMfV+eHeIL00dpHi+zXymtMS1ydHzjhboBz4Y6f0TrDOluAEvjF
   Q==;
X-CSE-ConnectionGUID: AZdDBfoURgeNHgJKSZLLGw==
X-CSE-MsgGUID: Za8JJxYISpCkzurMnjrrLQ==
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; 
   d="scan'208";a="42067825"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Feb 2025 11:27:42 +0100
X-CheckPoint: {67BD9B1E-B-6E0A4539-DBC44C3A}
X-MAIL-CPID: 187A32B327A701531B4B47B9AD6D0F89_1
X-Control-Analysis: str=0001.0A00211A.67BD9B1D.0054,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 300FF168561;
	Tue, 25 Feb 2025 11:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740479257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JKIIrvyYA+gZm83nHFuNxA39LsjVxEX31VPSiey1bdc=;
	b=ECM6yOcoQiugNIAhZWqDx1+0pPmHt8AANO568tWe2SIhwTRieaBOrjBjV7ABLZWCJQ++i6
	v0OFfCtOas6+4iAhTaUb9tvU4ejks9tClTbMoOqw26TDG1wm3LqrKY7BlWd4TY2mho27NO
	5ieBUKQh8Mn1ekyr7i42t/kINZz6oJFWv0EBgzsXZTjLNbadpG8aP+hKY8OcuzNMsPAjQM
	0OdsvPIiytlqWP0jV81qvr/EMFGuwcYyHLbEokoYUEE+yQUuiEyS0h1L13a0xIKxATsvWu
	zFFt9qHklfbSM738aE6kc6DK2ApvVOJ41HQGlSxTIbQgj672iF1SvqqFzoNn6A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/3] imx8qxp: PCIe fixes
Date: Tue, 25 Feb 2025 11:27:20 +0100
Message-ID: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022744_912833_A608AE31 
X-CRM114-Status: GOOD (  10.51  )
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

Hi all,

my series at [1] introduced some dtbs_check warnings for imx8qm based platforms,
highlighted by Frank [2]. This series fixes the problem by updating the schema
for allowing an optional DMA interrupt and adding the DMA interrupt for imx8qm.
Also a non-upstream property is removed as well.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250107140110.982215-1-alexander.stein@ew.tq-group.com/
[2] https://lore.kernel.org/all/Z7yxDRO+ICPCu0I2@lizhi-Precision-Tower-5810/

Alexander Stein (3):
  dt-bindings: PCI: fsl,imx6q-pcie: Add optional DMA interrupt
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  arm64: dts: mba8xx: Remove invalid propert

 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 4 ++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi         | 5 +++--
 arch/arm64/boot/dts/freescale/mba8xx.dtsi                 | 1 -
 3 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.43.0


