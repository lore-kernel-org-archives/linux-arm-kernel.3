Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B85FC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qe3n3ZQ5LVdeF6eehOPJZ7TfJ6ssfs/dDpnWYl0JxU0=; b=1NBMhZTLPX8Qs6xxsNyJdInMmj
	h03/d5FDvjD1NQmJnR9sTuT9HnFauh8AC1s81GROpcMJmxO1ejxuWTKjFFP3L5UW9iDlUbpdtaMdE
	7g0nCPES9N8wl4z25+PBXV52RPXqJbI+q5Q2lrJuinnV1MUuCyIEE0tpWKBrTkdlP7AKdtvrlDNCB
	lAJWBRm8fDK/0W77W0VIbiK666wVmKhx7UzRTqEoZZ4IZSozGqrkaRwOBOWGQ+4eCzn2yUdGJCnzA
	j1N8UrdNGlKdyQyMz4roCiWu9fxUXKd6rMj5MyWHYmkveYHDXoPtUUqnGw85vnao/Ia89jPxMrziH
	ATYMDsfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTln-0000000GY30-2jvk;
	Sat, 15 Mar 2025 15:49:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTgr-0000000GX14-39J3;
	Sat, 15 Mar 2025 15:44:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so3681385e9.1;
        Sat, 15 Mar 2025 08:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053484; x=1742658284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qe3n3ZQ5LVdeF6eehOPJZ7TfJ6ssfs/dDpnWYl0JxU0=;
        b=OJKX5nN8FPCykU+080jd8FnSXf71ax0F74Xl3D9CNq6A/BApSg/tXdyJoRjxXBZQVp
         t331SXcl16hB0HvaMMBAqF8m+lJI+/0/lIEvyGwugCbKeyhzxXIJy2hOm9WaoD5IAMNr
         NxFwG+Tu3P/YgVDfWKsWZ2iLMTLw7+cuilP/bJ9Oz16LaB8L5pP/YyL2eL7pldXl+epa
         tiAjmIfVTG6003Ppt10z2MCp/MRHw1TcIioHWrOTOZePdDC+6XziPi2ZArGW/lL4yGxK
         0y/i2cA79GjJ1FcHV5jRxYcwY+7Uu37ZfQ+SJPWJHCLA1CIqzAa5z6e5/xE/kATgFyNd
         21CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053484; x=1742658284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qe3n3ZQ5LVdeF6eehOPJZ7TfJ6ssfs/dDpnWYl0JxU0=;
        b=T8mJ9BuUQUIPU7fHH1rw/rGBZx+iIXuLDTZT+zqmKt370eK1ClyuBfs4tt8g7v7tY9
         nDUoBDQ1p48RTCyRsVtAgKzd3kQVW+Hkgk42RChxQF/MIDKDucv5NXxF4gqEGwcKmlPJ
         1RQb6yCFGLcFrYmrSis9rVTcAWBR5CUEgVUzB0qfBiYHubcwg44AQwQy+PMggJLEiISX
         0yz9lVc8S+E2I1sA2VSxUVyXybBZPThi0FVhEFyUJ2T20mI59zuxGLdaT9znAqfumidB
         djHzyJQ5MzLkfh/OrDs3teh+3ledl58HYNDRk4kQoHoXGyU/R8TCta3Hm0q0BHRmbntG
         4cYA==
X-Forwarded-Encrypted: i=1; AJvYcCUQslVC2Kgewo869XxLH5Dzs18wq/uYv3yt1vOQvwpfi8y7XzDN6Qh6u4sungIYGp0Za5l9kPgT8lNYWFeLpBg=@lists.infradead.org, AJvYcCW6J66AWsNcyINj/Mn8eIwRPo3pYtggCQn6pVpCULAIS63RJnwXP9UYJkD86k+M8s5rsvbRDrhLNwD19LbQUXjY@lists.infradead.org
X-Gm-Message-State: AOJu0YzSe2g0SND8ZftXaDWAxvc8f6O3yQgT1jClLFk+CQVOiykgBts6
	P7LnfCAibBKpDrEjEDVOpfO4beRcAlbjyo2edo28jsScZ7Fkg0EI
X-Gm-Gg: ASbGnctCOoSFT9sPlH20hNa8+0XQMjSYxJdpULn+NyrapTVKWu3xtcSDssrB0/XSSMQ
	vDjVko8XKtHL6sHYMrnmbH9u5C8KU8yqCdWuLTC6I9x0rasM/dq1XNjkb93nph45UxjHTVbLE5Y
	36vsxHGMvRYr/0yjAeOi+qH58+4UTtnE4YQAMJk4e1Uo1NbnJU54rx82pUTcRGj8idwG6lVzzVF
	Ms5gBposMRUTkPa4pe6ChIG49rksq6C6QBaPX4fGqv63qb17SKkZu8h1ekITmGdmAY16DNrWRBg
	OP77yxhaLTfxgQnelBtsSu+Uys14l70j1FXxbxeJh0LeQWYI0zZ3K+symFI15xeZI+Luupr6o6c
	aNih5qzPJS470jHpD3oK6jite
X-Google-Smtp-Source: AGHT+IGTFgETv3X0OQn9kvlEZkX9uQ97Mv1FK3vI4v+6bp7/gfuNtt5DkcoUjwWXNpHFChDijAtH+w==
X-Received: by 2002:a05:600c:3b87:b0:43b:ca8c:fca3 with SMTP id 5b1f17b1804b1-43d1f235e79mr82196265e9.11.1742053482562;
        Sat, 15 Mar 2025 08:44:42 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v13 02/14] dt-bindings: net: Document support for Airoha AN8855 Switch Virtual MDIO
Date: Sat, 15 Mar 2025 16:43:42 +0100
Message-ID: <20250315154407.26304-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084445_840295_FB7C6251 
X-CRM114-Status: GOOD (  17.47  )
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

Document support for Airoha AN8855 Virtual MDIO Passtrough. This is needed
as AN8855 require special handling as the same address on the MDIO bus is
shared for both Switch and PHY and special handling for the page
configuration is needed to switch accessing to Switch address space
or PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-mdio.yaml      | 56 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
new file mode 100644
index 000000000000..3078277bf478
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 MDIO Passtrough
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 Virtual MDIO Passtrough. This is needed as AN8855
+  require special handling as the same address on the MDIO bus is
+  shared for both Switch and PHY and special handling for the page
+  configuration is needed to switch accessing to Switch address space
+  or PHY.
+
+$ref: /schemas/net/mdio.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-mdio
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        compatible = "airoha,an8855-mdio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        internal_phy1: phy@1 {
+            reg = <1>;
+        };
+
+        internal_phy2: phy@2 {
+            reg = <2>;
+        };
+
+        internal_phy3: phy@3 {
+            reg = <3>;
+        };
+
+        internal_phy4: phy@4 {
+            reg = <4>;
+        };
+
+        internal_phy5: phy@5 {
+            reg = <5>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 576fa7eb7b55..1e8055b5e162 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -725,6 +725,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 
 AIROHA ETHERNET DRIVER
-- 
2.48.1


