Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81648C98304
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 20:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=; b=znmHM/7nbuAGEslt/EGQR1mG83
	BRXpZ1tKX3Xv0h3iiOEDiKmd/PAdGVEEcUoK78+dM8bX0pnaMLyDtzhxGfjOzKCS71anpA31hjyGh
	+Dej38EaIbMf+uajojD1I4lcFXdU1d4J1rnW4NgWsLG/qg7kyhYOaG734uclJH+rbqaek1FsvbJvJ
	8liODsEoMqyeUJ1ymVCPDKnWs5IJrCEJlrK+e4dmnF6kw5vJv4ZDdBkd81cuMMbQcvN7okGaPbvG5
	jHqeBoZpFFxtwk10IA5b6HxJzK/adgOJCUQTxAlvuUZgnYRZRmRaKfHoPwuQ+oWQljEwUHvmopKbu
	8OMO10Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96k6-00000006V78-04dJ;
	Tue, 22 Sep 2026 20:05:30 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96jp-00000006UsX-0tnx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 20:05:16 +0000
Received: by mail-pj2-x07.google.com with SMTP id d9443c01a7336-2d903e972efso1031775ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107512; x=1790712312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=E6Uvf3yX1SFo0em446D744Rl436hbZ7ja8t1CqitlxotxKhD345MfXa5XIAbPDy8I5
         D/UI/Qmiw0HTel1IPuz5PS7DM0RBXUlG1dSZZHyvUT9hwgJdPN0Db049pNfip094zGUM
         W06YT+MosNdo2cpSupb1nsrlCkCcAISC67v9SBEyUjw0pmZv64Oy+dWGd5LtanTggaMw
         scUq39loCkAmbXbWrdQYLZSW6AcYpKAtsgC6fq9rB8cDDCSPDA3NasOutUuMa0DY66lK
         tmQe8Y93rdXrqvu44E1jg1DVbWmpCIIr74JaVsN5nIUuxMCGI82PLCdtXgzshtAcopD3
         bSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107512; x=1790712312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=fpdihN6NZGqvVzO/kt4JsKN9q5zPZF0G6VDOdNFrRB95YVZp0jG5uAHxeNstlSOly2
         +/QgFvoGMQD8vFbZU0kinas6TaZllzuBq13zqGnztOLw7U3RireUCI/z8dxYj9LkKVo8
         IdrLiOCnxtRp10OXRkfJbpKXn7M2GZQoe96Pl72i/p7z+S6BlJtZP8GfZxWkckW+/3aB
         pnFKE3BfGbNTVYiBnte/RdxrYU3iuRVXrte82tTDU5GlIIMKgBV5tXZsmPE3XpUuD+U/
         TrpECEPKsdz/6oAvX2cQb6FdM2aiBOuZn2pZQ29Kn2cR3/cuDCDvTZoqwQM5gnIVMXc5
         Zb/Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/v/35aK7qBmxo1lk575+C5fpLdZo4k0nlCo9bp2e8oPCoxvLlLdbJXted336bXu9KIOHDqrdsVK9GJdnAA3J6@lists.infradead.org
X-Gm-Message-State: AFuF++lW4e3FGgIYiE7L3cBMWNSqM7z7XECNerrwWSzAcvHLOPCOcgiE
	KsypeIGy28y6Btuxksz0UGg1y3kyJyH3nMAunArR78lxvPNG2nyyudVO
X-Gm-Gg: AYBFou1hRm6NhpopRU736qTN0nE5tLbE1HtkgcsdTFx/1o0LJsR0q/OGDaSd7AKyhOQ
	QYw1Bjksv7VCctsGN4H9tzgWwqQVFLNRVZFjaso2aesjG2jq5TghabeI0EwHQO91BVencCOF/1l
	vUVsg7wPXbiMiquJyiKxoZ9fRBW+nnJSocMx9ugzA7bIS1/ZJ+4sNduUKbHaBJs2skRWP0jIB0F
	FwyRjpXdTwOWkByyIKa0tRr2ffyL5b6IyzL7eUfpYd94G9yz8Dc83oqGfXARFVMrjHBNWRoRhfv
	/g2N4FG6keMHXqcn4+e/cpPfHto68T2e0i1kZWDiT9PHRyAWb+0jBJEKK1RNanUSN+flFh45Zvy
	NXnqH0ULO6hCSiX+PESbkbJNjBCA+ykrGUgVT5e+3av/YDtqqOE3Pd00RJ/IdgzszbXHt+Ce8L3
	8KLPeDOV+BwIky82j9fre2uxMoPqBrbxboZowVcOJW/iIE9wnZaBklBlFILUs3cXVq5eNl
X-Received: by 2002:a17:903:234e:b0:2dc:fcfc:bdeb with SMTP id d9443c01a7336-2df69d3649amr4211185ad.22.1790107512560;
        Tue, 22 Sep 2026 13:05:12 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:05:11 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Wed, 23 Sep 2026 04:03:35 +0800
Message-ID: <20260922200336.2201212-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_130513_366777_11646195 
X-CRM114-Status: GOOD (  11.97  )
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

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b3..085589b8ba65e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23740,6 +23740,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3


