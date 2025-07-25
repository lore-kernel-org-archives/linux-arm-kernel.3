Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE86C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XM9iXBp8IqXzGuZRucgzJovFOCvW94kDLWRDrJTUflo=; b=NlGgRN4L6xkim7/1ExN7VkmA0p
	eKPLZoEAd3TcTBdilygM/DboBdeG9x7wSw5kt4xfe+kthfEGitTPK0iJHYgIHoU9Yh/G9iGxSINuF
	sE++EZqgpMPPHec8FM6O7tXHoBVdxFP48diZscMxMshRt+kq6QIyTQ3KfgPnDoARyJytCqMs73zBY
	tt+r5557EEWnaKLNQK0ASWwcplagRuMC6tpJI0s9fS6RJNfesc5EF2eayqglGT9tdE3cskSHFREzv
	6qoF2AsnuOBnMeyg14H0OdvgLq+fQJeifMykGFDE/H0b7t9AHGcNQ6Sj1F2FU/AFlC7i71SP/P33p
	UisldvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufC9v-00000009BNu-2WSF;
	Fri, 25 Jul 2025 06:43:59 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBjW-0000000998D-39Me
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424202; x=1784960202;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XM9iXBp8IqXzGuZRucgzJovFOCvW94kDLWRDrJTUflo=;
  b=a/XyJ5ZEWfW89WLHTa3huiNPcUEfwerj8xpmzY5GCappJAdCywEgtGi0
   pkfdIbQ+Oxj/wxcoX/aWRkhc7J6Jt0da+l6cREIMhNNZzx77OGY7c7zUr
   8mioQOA5DNEuSSCTyzEFGcmBojnQ8XbnPC1z9H6JdWIHdaKCStGm68GiD
   Tm+uVRb1O3sLh2jxsqawx2o/4ajog70+pTMFNVTyR1K4OPv36w6MI5Fzq
   /uSF7Q5qV+j8F96veOT11QX2vB5+r1B8E1fC047Q+/58d6hJ3CcqrvW+B
   VfRZsB3J3mT+uDKo9206blds9vmPANiRNhv2tpNUkxovBAhAQq7PFhcP6
   Q==;
X-CSE-ConnectionGUID: W9UZgxk6Tm6SRkqx9pYAOQ==
X-CSE-MsgGUID: FVqbObs7Sc2VCHCIJs/FcA==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413149"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:16:40 +0200
X-CheckPoint: {68832148-19-943DFC15-D71A48EE}
X-MAIL-CPID: 2331C9402F859EDB0778B4294738099F_5
X-Control-Analysis: str=0001.0A002111.68832144.00B0,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1201173655;
	Fri, 25 Jul 2025 08:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XM9iXBp8IqXzGuZRucgzJovFOCvW94kDLWRDrJTUflo=;
	b=EXcgreaCubRwd2R3HaVwbNxUdzvj8RJM5l+/rjZ9LKz2tE5RwO6R4V2ZQn+d7oYt+i0FPb
	a5+7HXQBpGthjRgVkvcvmxiHQlSOD/4FhXsgtJTA6KUo6Ug5+oLtWEGQC/JC9XCY4AkIBt
	BegzVl38hWRXJGM4LVp7QfveDtRnk28fohwY3174c4oK9IXakTuyiXn8gQFyP2eTFpqpdo
	Fbd7o4IBIRSbPJmda3B743sRiav+VkDagGUuffrH8LefE/zsZVGEMZKP42upXi7pANIeho
	4QeQuqoGme4WvM2spv/Snbnxyn7cCwGpYZOdWowJPIqa/fuLQu6uUcMuBsaz2Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: ls1021a-tqmals1021a: Remove superfluous address and size cells for qflash
Date: Fri, 25 Jul 2025 08:16:31 +0200
Message-ID: <20250725061633.267174-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231643_090107_2F57C521 
X-CRM114-Status: UNSURE (   7.56  )
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

The jedec SPI-NOR flash node itself has no partitions, but the partitions
subnode.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
index 271001eb5ad7f..167559521ae10 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
@@ -66,8 +66,6 @@ &qspi {
 
 	qflash0: flash@0 {
 		compatible = "jedec,spi-nor";
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <20000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0


