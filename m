Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1ECC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=; b=i8GIgV4NwVon0MdS0BeG/067ch
	XFz5SRLDF6/uX5jOfRt6fQbAQxRH5akUsolVWh2AdamfOtF6WVhTrSc53ZEK1mD958ZSK9LQlm/xV
	liUmPgFm1qXIoXGO5v9TpAtfePd5wDGLX0u2OpRMWXu/Al9w7KT3vW2H3vvxHQbi5M8Nr29nHtHuP
	jFI6Z3Lw7tz3CLFDdrVOJkHlgnt4CRSVOzpDBLsNMnSszCVge8OY/cPtHkLNM81cFOeYv3yNNOUdx
	9jKFNmQmNawgDu0Xcfwxvr+1QSetzB9LtFLzRTI2EzCS6h309l2e3ebRs1HgnRpknBUzj5ajufH8D
	G+3wq4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bQv-00000007C22-1KFG;
	Mon, 07 Sep 2026 15:38:57 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bQp-00000007ByW-34IP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:38:56 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-399213ef56cso1810107a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795531; x=1789400331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=WU/u0l3vc2QRtnmU1V/aB+hVYikvU3xoX6hMlZ4/89YeVTjNj5R3S6IgUWPcIDpQxH
         D4ZEd471HMP3fSTCR+JXwv3xeuf9xYoxSf6z/yiMzxJI0qF3DfKmt2TN7IIGjnyR7Tyv
         irbTVlWLmIlCaVbGpOFK9vXEtlmda02TH9RtBhiNwWcaeII6syItYE9stfF40LmQr2c1
         be7QVghQJLOFPvQ/HTtsH8x9fPXJqVVdpoHR8w+Id1/otzYZ8EptM0djC8q9+Obca7It
         6fojA1a0XsqqdU6QKdlJ9bU9GAJLHcSCbuUBQkJsUw52fZp3c30LC8yq5uou1bu0525W
         zN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795531; x=1789400331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=aevwysC1XuE9Rjsgvduu8a2QSYq5XWuGaUzt2LF3cFI1KQfsibEMHkGdp98i+2qCPL
         BOj3Q/eDMjAAB5HwO/sBW0w4jH6YUQHP74SuZ9b53fwr2vI7NBRpOJo0JhDQQpdzlv3m
         0eAYgIKu1/NpbbwyjnKUGo/KpQIc2A0P8ykXcKiuTnBID84HxNDbygwekmUWCMJxFiQo
         0UTttqF7FDRE+p2dFoB8pEKVz9kVZaNT6PwWeDWHp7kNujTFsE23sptLrEVIkb4ZvDyk
         DoVwc9LUjcUlI8dWX5NCHQef3dOGpQoqHCGT3Tvef9jnNwZPu02RyxUsIWv47XKvTI2t
         p5ww==
X-Forwarded-Encrypted: i=1; AKwUvBwRINIApJgTuACzB0QzuU8qmwJ2xJGBcB3PFq131Fr22YCBp2Nf0QDOJouvf8vj10RQX08Fd0hhWkwmfpWj2YSf@lists.infradead.org
X-Gm-Message-State: AFuF++lD4TwtIKuwiiWbZ3xxzOzBiMqyc8UAceIXETdggJLgW2rtI+LF
	Gq7X8PZK4z/txSkPgjdwnnBwGzZKohnpDT5XoL8+DC88mRa2hsJKzPXI
X-Gm-Gg: AYBFou2EA3oQGmSV8GPA+LwviJBW+3zvBzSTp8JrOM4cpbcGV/2LBZYkWtfqK58tBot
	xhHxowgsvOYOil/h0m4PRkmWnEXpLf65jyNkrR/VmICkhFp3LM4+5z8AgtBzQK+hQJwLR9eQeAR
	shKaTX9FpJeJRK7wQNdLl+g2xlJFvcKpzxvOdJS5XE+QFAXHRr48aw5FHvrj+1qOBMsQcxKcOAv
	Uo5bT0oBLxwZh+Axj0OVDzT4s/G+xc58vZYKmz1Fzyb1BQg4tVb5LlqZJRY7p+s4yeWhxc9XDx3
	DvljbSwvyBUaardLhXpIoim+4xHDgGwk4IAebq7QVJbAMNnxG2eroExd1fhDGje4/ICaR2Qmz5J
	8MXeRu/XSrFIpa8AGxeVbG8TmELoAMLqn7nbP76EdSTujksNlsHZhjyaxFMiSt00zFhix8dMEtf
	TH/1MGRFJcvTYP93S5PHq3YsQ+y+9iyLdVTkn0kHkcZ26a3DtA3XlGi8EzsQ0=
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39b262aaf3dmr37885553a91.19.1788795530498;
        Mon, 07 Sep 2026 08:38:50 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:38:50 -0700 (PDT)
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
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v4 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Mon,  7 Sep 2026 23:37:05 +0800
Message-ID: <20260907153713.2572547-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_083854_277469_976C9BD1 
X-CRM114-Status: GOOD (  14.83  )
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

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..8e898bce9af73 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 1
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3


