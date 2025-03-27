Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867D3C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nggONBo+Nu5Xu61zP6mZqv33pLi6z3i+lgbMAD7phts=; b=hHxGVhwmY10KSD06Yua0fUbRjN
	xyZhYQhI9mfxFpZ7ibhEEwl7suSAzxiDvzM1rpLDP1K92gPAbJZkqqITgRqb29YUaAHyaT60+jQLE
	Bl0nC/TOpGmHjSvQx7ddjEW+5wjNk+lGCBudJbZnGnB0jsueR/cOgXsddzwqVn8l5bZ8OB5mAAjwy
	ZAeA6W7I3/MGtdgy0TprO3C/QBmBK872hzIbLFrFievOonxuvf8VsUVoyFM3DNWhyXuouH1H7r0ox
	ce/Lo7XHbjn5KBWpRHhyF03pIqQQcNtnkreNXFMBzuuG3QSs8/a2kxVjFhcgnVSNyDDmnaIqigmfK
	BiMj2jjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoX2-0000000BFwb-2FPW;
	Thu, 27 Mar 2025 14:48:32 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoQX-0000000BEll-1Gpx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086509; x=1774622509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nggONBo+Nu5Xu61zP6mZqv33pLi6z3i+lgbMAD7phts=;
  b=kvVjyZn7MF3J/7ft0ihcqzSrTFUdLNsLREKp9Av57gXYH2RFB0dAeIsS
   S0R5w/inKb2SYpyah5gFYfVs3dXWOLmV1qcctYE8Hz5OkhhGRO5Ga79hR
   mXH/7Vza04Evba8++JR0Pbc4HLG7lLQhHPVqPX8o8P0tVRpeEaDTLPY+3
   dpwnm2Y+iLmrwhMl+VrWTIlQ5d6EVBWLFxBkO3hUXbuiUuRywRVNlWGH8
   1BOTHylGRYLbCXyMfK2g1xIjUgWDDW/yaIgBvaBKCVKzC31WbFGjxz3+F
   t+cXg9D1AeBd7RU5vBfxqEy6K7VlNvrgvirtPBfBjKEE7XiOL1EYbgXz8
   g==;
X-CSE-ConnectionGUID: dhs2rlBjRTaogcfyJDEnKQ==
X-CSE-MsgGUID: ZjLvP4viR1GPA7xH7QeG4A==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199512"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:41:47 +0100
X-CheckPoint: {67E563AB-1D-F35B2447-E1635CDE}
X-MAIL-CPID: 7DA52DD0322B0439F5AA4E8A260EBC7A_1
X-Control-Analysis: str=0001.0A006375.67E563A3.003D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35E7516C181;
	Thu, 27 Mar 2025 15:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nggONBo+Nu5Xu61zP6mZqv33pLi6z3i+lgbMAD7phts=;
	b=R0LhL3U6QHWSBt9GtlhB2EG6LSTR55m/uDAU9doP1Cl1+0uKCIYbD+J4hR365hScLIzDCm
	DU+PLGCHJ7+r0NPHqQxQH93qFiaUuWJeZGzmHGSauVj6B2wFuljGuwllzTLI4VrfQe/GDb
	b9Pm9w6oBBMsfLw6C3DpB06tNw0aVPKUf/3gzHEvX2c/iahorq+bl+VQdKE0TTC3k5Yi0Y
	BCsCr4n7pIJkcHv6z1aSLz1e882hZahb0678ZyOEMLUzMnpvoDm/8sxeo7qak+tBUn6pnW
	Po/xaN3n+Xx90oVAmbnog1qsoDfaXLMF9epU4/5awONigVpldx5nR/AYkD1kBA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
Date: Thu, 27 Mar 2025 15:41:08 +0100
Message-ID: <20250327144118.504260-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_074149_636923_8ED5A30E 
X-CRM114-Status: UNSURE (   9.49  )
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


