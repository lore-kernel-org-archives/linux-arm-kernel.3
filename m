Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7C3D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hs7n9rE/ZSXIZh7D66Dmmhb3yV46UGbZb/DO4yw0PEU=; b=mCq8DKoc8ok6Io
	l7/wZr8exoIogfLWIlRRZ6UXL3Y0npIbjT5a5NmMvZuzw8gEyu8YQ3SvuQN28hBYOKI0TAHg6RvyA
	ZxyGSYA3RCbfAJ+ahh4R7DUyFoMetrBsEsuvbUL7mSvF0Q/WNgFgVC1/HTeUeXhET+w4CnI6iHuGl
	zOfIZzUn0xCaX+iYM16ftdqKPYCzHlgRIHzg56qtFl1HH3rKwV4DaT5hQ5OaOCXqx6Val/2deYJYc
	kr3EJpaMe4AR4Dv94eP1BnM8Mv0QJqyIiYw0+FRCVU9B9priNWu+UpU2cargS8i/q1H5elDFlLPDZ
	FnCKCxTUXAmvirYUzh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4YS-00000003KsQ-3vtd;
	Mon, 15 Dec 2025 09:07:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4YP-00000003Krg-3SgS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1765789661; x=1797325661;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uJLQFJraqizUE67dqXdm91xUJsTZgel7BQijceu5F8A=;
  b=sKD3U3fbnbVV+Sz/+rxAhFmpgJAG9NEt/piLNA8EA6dXHrBRcRaWivcL
   Pcph2WdiBGEBVIkgzIZsj70Z3akYCk183tmVfWffZGxBfZBZjAx+OqaRt
   bDb7BqNxQZ/NFbbR3fYEp6p5a/iFAA6iSYeNytX3mOi4EamWJJrNubvA1
   y7Y7WB1O929sPA65Pwrc6sp2AjKzkMAmln6ag+Xq0TKVfo1yAv7lzKqO8
   dW2SZQ9lRdcIUsT3kmx63Ro3yjdxIuV5KdekNldZ7ZMc3mrmbq87D/yiR
   kJhf+XyeeBabhYN6Mn4PfohDmyLzDlZuxAfJyAZcXPSeuembhw4KIo9PP
   A==;
X-CSE-ConnectionGUID: PcTJoc4CSZSXBJPpFg6KMg==
X-CSE-MsgGUID: MAb+FIXPRJKeJQCgXrPXHw==
X-IronPort-AV: E=Sophos;i="6.21,150,1763449200"; 
   d="scan'208";a="217865848"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Dec 2025 02:07:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Dec 2025 02:07:06 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Dec 2025 02:06:59 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<manikandan.m@microchip.com>, <dharma.b@microchip.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] dt-bindings: mfd: atmel,hlcdc: Add sama7d65 compatible string
Date: Mon, 15 Dec 2025 14:36:38 +0530
Message-ID: <20251215090639.346288-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_010741_978968_26EEAC46 
X-CRM114-Status: UNSURE (   7.03  )
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

Add LCD compatible string for sama7d65.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
index 4aa36903e755..dfee8707bac2 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
@@ -25,6 +25,7 @@ properties:
       - atmel,sama5d4-hlcdc
       - microchip,sam9x60-hlcdc
       - microchip,sam9x75-xlcdc
+      - microchip,sama7d65-xlcdc
 
   reg:
     maxItems: 1

base-commit: 7f790dd21a931c61167f7bdc327aecf2cebad327
-- 
2.25.1


