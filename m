Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E291C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRswDAiOD+LBGvXy93dQk2897CsfhogQ6IW+astVOLo=; b=KcplbCpYFxeH2Sei8ct4VCX04K
	Y5280PCsAkOR+BZtsDQpcWU3NgiX6G3Om49roN8QP8hndiU81yjGw6ak1zpvpJB79SCufpDR8vzIQ
	85N54IvpzKntdpTPZsnzPM0pxpDiEgzaKAkI7HI691GiCyIlTGyrtFD4iMw8H0GlY7OH0HBD/ZOPl
	7MoQhe4do3gxfetT/n4scyIrX95cph1XjWQIsbUzUn+Lb32Jcz3i4DZddOJvi/O5ZfYyWfzciYT9B
	aDxBpJ1gHmE/e/K5AB+sUHCkJPitKaA6Wbx071Yr7JCkr6KCmiKmsbd8Nf/9q7chmAS/DgKNIP/iM
	dPRUp/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Qu-00000003TlK-1iPX;
	Tue, 08 Apr 2025 09:39:52 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Im-00000003SBw-3zZY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104689; x=1775640689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WRswDAiOD+LBGvXy93dQk2897CsfhogQ6IW+astVOLo=;
  b=eyEk7L4EgNUGVl5cPXiP0XdjQtNJFhFD724KBpiTXn/41AEXIXIW6gkt
   tlVEHKdYkZENwTsXS3FmXZHtDu8/mO2Ox7mEUWGm2X1nIuviDwvUx/mFb
   O67YBGf0yeGo7KjZuk0NCSYxVh+esbQ4Aj5pfglI5KO9lGlxre5Hri85j
   4m7cuICoL25q6Ln+QZsX0ehZ0catQLRkIfPS+NrKUGqFz8PULzdBQCXM7
   BbVlYulr1z4cs+qp/eXOo2mxBzIG+ySf92csVhMe9ukxA0AQzEWBTaJ7D
   bcl1czv+GhtgWq853sWkBOHrPNR2+3ekDl6YLUwjOBOpHwEr/axvPc0b/
   A==;
X-CSE-ConnectionGUID: 6CML3dGcQrOTskgWc0I4dw==
X-CSE-MsgGUID: JGW0LmgeQh+wLi8tP2y6MA==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397365"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:26 +0200
X-CheckPoint: {67F4ECEE-26-2417938-F0170C2B}
X-MAIL-CPID: FE639B333D6B3657B3650F6C5D3D3014_2
X-Control-Analysis: str=0001.0A006368.67F4ECF8.009F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 581B31697D4;
	Tue,  8 Apr 2025 11:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRswDAiOD+LBGvXy93dQk2897CsfhogQ6IW+astVOLo=;
	b=thSt+zHqDTS08DWUmgk51gxrYeIs0Sk2vyToNFp/iulsY0RdR7xZggG5l85BNzNfEqdcOR
	VjQwx6OaJe6OjaRwbK9KTdWq8IR4d8c+IHubSZ1CpjTrHnielorFYW0DQR+QcA5nLVNBKm
	c3X/dmTQvf7jk6LhI1r1fsEaeonZf2OJ3pEnBALUTC7OSvZwpl3DPOIIo0xI25I3uyV3xz
	Wfg0aOMBgirvS+FJmeTJrINrVWkKe4mQRW3lE2v21oER5/bFq7YWoXXITFtPZb1RI9mlQr
	5sZdGE7vw+HizCxZ0haVBRNFnQCQXJjfZcd5STwKsZcBzir5eLUI9bwuzyfxUw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 2/7] ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
Date: Tue,  8 Apr 2025 11:30:49 +0200
Message-ID: <20250408093059.551700-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_023129_287086_82C69FB2 
X-CRM114-Status: UNSURE (   8.43  )
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

(Q)SPI NOR flash is supplied by 3.3V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
index f7fe8581a23fa..271001eb5ad7f 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
@@ -72,6 +72,7 @@ qflash0: flash@0 {
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		reg = <0>;
+		vcc-supply = <&reg_3p3v_som>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.43.0


