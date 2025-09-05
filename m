Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E9ECA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 07:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jMAXIdnYVxleMChf2/qG6/ru4xaGe53QynIZ8eE+vyo=; b=FaKo0z3qM8EXMC/kVoSXZ2Drx5
	2HvND9gMRn/00sopU3hwRHfkotUnixNewxs8dj+ozXZCyqfk0dfAQ3AXH5UUcU6FMtn2Emafclpj5
	M5L04u5o7Ae06nYlnNwITHFcTdSBk28N2O/dqSnZ2i8q6voBZx5OQ85RZkjCC2IzT0PLKU5/lLLjO
	EpTswDphLZvk1EWonnYZuS43Xk7d45v7SQT61oqLmbXWjPXca+CNr8p8tPWxf6LIWbbHYThCVYKcz
	S7rI15/l3wu7bKdR6+hcvnEO3qEIUcuwQWSxc4rTtXVNtHXQqNBbcrmV6C5NoxjXjZrA56D/lqMgh
	I9wiibrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRI3-00000000Amw-1dNm;
	Fri, 05 Sep 2025 07:55:23 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQMV-0000000HPer-0JG1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 06:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jMAXIdnYVxleMChf2/qG6/ru4xaGe53QynIZ8eE+vyo=; b=QeTu9MFvsp0wse4ccpInF920ov
	HAPbTbEojWg+k2RpXVWEIAIetG9bJsFU+0D8c0wH+M+IwGYpNlbzUPQehpXL43zRWiXJ4+mLWCljj
	Fl9QzUiPIU3zNYMNC4nb3pJuZ+nEGz9SSAl5RJnJfk3lvDfUg31O84pSo/TSr2Q+Z2BxFCYBHOIq1
	7jxUo5GKEQHa9+fkpCWtPLxngLZ+UuIYTy64s2nH/Tne8Lds3AkIM5RpU6COYWm0qEqTz3DcmQhGN
	MV3VbqXSdCkVasAVtoE1fvVPR7qCDH1MdIcLtWr0SVBcW0YXWhowGGlSE7YJ9lGizwIYQcfZBj4to
	l4jEPMtg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37248 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uuQLi-00000004eMg-1RMD;
	Fri, 05 Sep 2025 08:55:05 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 1/2] dt-bindings: iio: afe: current-sense-amplifier: Add io-channel-cells
Date: Fri,  5 Sep 2025 08:55:02 +0200
Message-Id: <20250905065503.3022107-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_235555_261921_4C387A93 
X-CRM114-Status: UNSURE (   5.38  )
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

The current-sense-amplifier is an IIO provider thus can be referenced by
IIO consumers (via "io-channels" property in consumer device node). Such
provider is required to describe number of cells used in phandle lookup
with "io-channel-cells" property.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- refactor commit msg drop warnings introduced by commit #2
- drop Fixes: tag

Link to v1: https://lore.kernel.org/all/20250903113700.3079626-1-primoz.fiser@norik.com/

 .../devicetree/bindings/iio/afe/current-sense-amplifier.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml b/Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml
index 527501c1d695..bcf4ddcfd13b 100644
--- a/Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml
+++ b/Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml
@@ -24,6 +24,9 @@ properties:
     description: |
       Channel node of a voltage io-channel.
 
+  "#io-channel-cells":
+    const: 0
+
   sense-resistor-micro-ohms:
     description: The sense resistance.
 
@@ -46,6 +49,7 @@ examples:
   - |
     sysi {
         compatible = "current-sense-amplifier";
+        #io-channel-cells = <0>;
         io-channels = <&tiadc 0>;
 
         sense-resistor-micro-ohms = <20000>;
-- 
2.34.1


