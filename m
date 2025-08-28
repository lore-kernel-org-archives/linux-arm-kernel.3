Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DC5C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J1QSK2ULqq2r1vYO2KfcbQsiEjNnS0EBsknMN+1oquE=; b=A9IkcRINFSQyWdkZGW75K0pqMY
	Jes2kvX4YofP9mUzeQzHhwlUozmNHqNq8BiWKzasp1euxZLtgECDy2RYkTaK3RhrZcR0L8Kk0EU/+
	RTnbrKxsEGawTAip8bs3JCbOlXFTdB+QCGNiWuI5h5HtaxjHPaZsHYjyRISafO7NLQ+JztosSgGS9
	kxyKNKUH+mdBvavcn+SkfybXetvY51T8hn7cXCiPtt3Qg45ZuysHouI14khS0R2Gk38shzUT/Jx9H
	T0fUVEyJajZbveNb+5n6nhfh5p2qC5acv0untuVlLDE6YcQu6TmoEEQnCF8O70nXvx/sj10PnIDXT
	J78FlWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ura4b-00000001Cbi-42bP;
	Thu, 28 Aug 2025 10:41:42 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZEa-000000011tJ-38Hu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756374476; x=1787910476;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J1QSK2ULqq2r1vYO2KfcbQsiEjNnS0EBsknMN+1oquE=;
  b=XDPavLl1LyCrWrNiKh5OFDtsa5/nP9vS8l9PM1cnCm6emHYBqXKV0wUo
   BbjLPLgnDP5RCTSHw5QBA2CKQiRNbNyPr65bJiaBj9upPIAhk49nVr4M4
   Atmaj+L5CX45SR8YRKZROmDUM0VchABxRvJGUXZ9RhQEnvVHXrZt8wcTn
   xqfkZ7AmfUHVDuFUAqPaD+j82mtU6IQNi2SOld1hi5EnLJN7UNIULeINt
   B1+AqJzTR+G20TgwJQvfAYhW0WFiKuFbLd3C7pfNz7QDiYva3IWry0OOW
   Um6EYiv3GSmRz0pC1l0qOdMFALBGEtoAp6g4QyiIqikjET0fh+qyJRaaj
   g==;
X-CSE-ConnectionGUID: 7lUzfuzXTAqqlHLic1NFYw==
X-CSE-MsgGUID: 2AtPNRG6QMy7snIQECxo9Q==
X-IronPort-AV: E=Sophos;i="6.18,217,1751234400"; 
   d="scan'208";a="45953046"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Aug 2025 11:47:53 +0200
X-CheckPoint: {68B025C9-1-410E8DD8-CEA8F0F8}
X-MAIL-CPID: 97701C9BF41BDC5479A47DE668FBFA7D_3
X-Control-Analysis: str=0001.0A00210F.68B02518.0003,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10058164884;
	Thu, 28 Aug 2025 11:47:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756374468; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=J1QSK2ULqq2r1vYO2KfcbQsiEjNnS0EBsknMN+1oquE=;
	b=WJnDbO2Zhu5hbOSQwvLbPAiAxSOrRUXiMz7VEcxfmq4mAmM99j2Z5nTBsUre6gxiGGyhAp
	pkPTfXrmY+r+f7Z3oOy4wslbQy3r2s96gcjKgVb+8ZPDnnih85ivYz2NiLpyy1vYoW0vrL
	lrUVm+kryWrYUxlglZkw1rKS8PXN/gmCBd0ZTkJvAT8/j0EtJU06MW2eptPWNvZZIMkMmW
	bUdE0KfSbv5V3xQOh0cSAudasDvbQL99YOVzxprU8Do/uBhfZ+RV2i2RSAQffxCE6WNyut
	pCzVCROF99egK/x750QcETbxsqM61KcpfUEaf9MlrF3nNmiO9Jh6d+zFQXtlrA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/2] TQMa91xx support
Date: Thu, 28 Aug 2025 11:47:41 +0200
Message-ID: <20250828094745.3733533-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_024757_272326_AC215D13 
X-CRM114-Status: UNSURE (   9.09  )
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

Hi,

this series supports i.MX91 based module series TQMa91xx. It is available
in a socketable variant (CA [1]) and as an LGA variant (LA [2]). Both
are covered by the same device tree file.
The hardware is identical to their TQMa93xx counterparts, just a different SoC.

This series depends on the i.MX91 SoC support [3].

Best regards
Alexander Stein

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma91xxca/
[2] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma91xxla/
[3] https://lore.kernel.org/all/20250825091223.1378137-1-joy.zou@nxp.com/

Alexander Stein (2):
  dt-bindings: arm: fsl: add TQMa91xxLA SOM
  arm64: dts: freescale: add initial device tree for
    TQMa91xxCA/MBa91xxCA

 .../devicetree/bindings/arm/fsl.yaml          |  18 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx91-tqma9131-mba91xxca.dts    | 737 ++++++++++++++++++
 .../boot/dts/freescale/imx91-tqma9131.dtsi    | 295 +++++++
 4 files changed, 1051 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi

-- 
2.43.0


