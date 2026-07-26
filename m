Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC84C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 05:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u8wfTYxHZK0x/PfVX6/DZH7+LGApngF9lOfO/2V5Zp8=; b=C4v8LdJR+EUbYAQQd1egPJU6aD
	7kopvU/aZorjFl53QXmg56P5pBdRaNi/lnrkMphCePyGyHGLnJNWBehpBN6m6YwRyLOu2gtmaCT44
	8WGoxH3zaQ+kC//BmFddAzoYRIm2pydp9gh/NT2cbUhu9jGJG4Wgjv2oFt0wOMKpQmqqiSNSomSM1
	1AWfAA+bE1+xQ/oCY0xuk+J7dijX0VYJDk2WjV0CmWqrm3LCOrOsb99xeU8nIMP/ukB1cqa2NkB6H
	jar6uXakcM3EvMHadDEMxClssiIjyCtfAftDaSXKmg7qbngN4sWUVi7zRGnVDYfqCJtxEODvKuDNJ
	Vr3vJY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnrMQ-00000000v7H-1slh;
	Sun, 26 Jul 2026 05:25:14 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnrMN-00000000v6p-0ELX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 05:25:12 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8486672f03cso1664191b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 22:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785043510; x=1785648310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u8wfTYxHZK0x/PfVX6/DZH7+LGApngF9lOfO/2V5Zp8=;
        b=BK7epbCEhxCx/vlBiSWY11hiE9NAWxMiJ3Dd85UFi0mupApFYEvCNyoajgljYzC0ax
         trU8LLvfnT26bMoAbUrfAkK4CB/+oMygqRBoctd+V7GOV/UasP/WltQfXpsZC/cOp5zQ
         rFoTbQYfx+61ckSSMBpcT0DdRpH4frouaT5+y5RD6SBhVwVZb27KlWeOklaKXqkdFnZM
         UiRike8WW6wctaNyfa6jU2SOFdvJdduR/4Y2ryiZnL8r49Cwwcj8PYZMZtBWcpL95DZu
         ohRbUHEUIo1wOlMRz8YlR7e8y/FNSkGB4mZ5OlqiwA+QL//gG4TdkGGS/iC6Qvt/I8zY
         Qw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785043510; x=1785648310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8wfTYxHZK0x/PfVX6/DZH7+LGApngF9lOfO/2V5Zp8=;
        b=PNGo/TnwQFDZMAlEz9qRx62vLNiLlTC4I4JlmE+MfYPKE2lmE4z9st83j548lQDuFw
         AyhQnARDJMv6rgkCFq6RYF+p23kaBlNN1a1UY0OXfG1sT8hRHHuYnmhMk3w+tftjdPu7
         7Lls2Z+e5dT2e+hGoaTHA/TleJlqbDUBNBtBTyRDf6jvy80w8TKTHR2XbRk2GlAYes07
         ljH8pdtfybYrh1MYlOKY3wnYExa5EbInQYfD/x8823ydjAXzS2i/q/ki+p2CV3kZcE9q
         HLO0YnnFP64FabqZluF1XoqsdMIafFHXwWJSoqy1dJpsLrvBXreVeJEnqddIuD7THdFa
         OpbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCB0p3nvLIs376r9W5/OadmfviMgb08VcTisryrXTLgSoGiG7Ms7ulFlf9+thijJDFmR5cYFbC1intPhpY5j0t@lists.infradead.org
X-Gm-Message-State: AOJu0YyxhdRWt8hkjOo1WGpv+7qWTqZkuiJco4GEY9kxx2j3OkEmVv+U
	kxGIGzJZUiyRVxxrn7/skA2GlSqf0v1VZDQUtuycPP7s8TLvoo24CblP
X-Gm-Gg: AR+sD10skxsalBJpt7ErqF7ZaNA59BnmI3/RX7f9pnCxCiWRwbw0y4PN2KcQI1l57hP
	FsCJkyxvX+bB9HbcumL73LDDe2hnbJCTaqfrbjYQhJFO+WKqh945IbiWHQn3/w32akqU3IqI8ir
	Ww6/mcO+4mvtP+d27N0oeyGjsdnJNmZrggCKvuqPZmLbZUwnH6rkEa3XL4kQQZozsTvksYt9Bx4
	sa/Sp8vBcuU4SN8BLfx9cbaUd41i/749wmt48/USUYzutmwAHsx49Hi3Uim8vVnEHLQ1Pv7hTw0
	JKn18UeVw7TgMBnzz0VqlTpbsAn85vq80sgVg00iQ9VRHiUY4UI0X59Ngu4VE21p3T0fJC11FQN
	5ur67gJZ2uVPpNqDQ05vHhpmR0ovP6XIGHn3wVAMfzghu/tiyPDaFPWbUMYtLvqXmWeE73VLbEX
	vwuj6sJxxRyPw3Bc/HVpOZYkU4W29vkok=
X-Received: by 2002:a05:6a00:988:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-84e5925e2a3mr3164991b3a.0.1785043509591;
        Sat, 25 Jul 2026 22:25:09 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e530079f1sm1574772b3a.0.2026.07.25.22.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:25:08 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Frank <Frank.Sae@motor-comm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Linux Team <linux-imx@nxp.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Frank Sae <frank.sae@motor-comm.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next] dt-bindings: net: fix spelling errors
Date: Sun, 26 Jul 2026 10:54:29 +0530
Message-ID: <20260726052429.16807-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_222511_112152_A9FE51D4 
X-CRM114-Status: GOOD (  13.29  )
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

Fix spelling errors reported by codespell:

  encompases -> encompasses (stm32-dwmac, sti-dwmac, nxp,dwmac-imx)
  curren     -> current     (motorcomm,yt8xxx)

No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml | 4 ++--
 Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml    | 2 +-
 Documentation/devicetree/bindings/net/sti-dwmac.txt         | 2 +-
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml      | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
index 26688e2302ea..e8108cde0f59 100644
--- a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
+++ b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
@@ -59,7 +59,7 @@ properties:
       be configured with hardware pull-up resistors to match the SOC voltage
       (usually 1.8V).
       The software can read the registers to obtain the LDO voltage and configure
-      the legal drive strength(curren).
+      the legal drive strength(current).
       =====================================================
       | voltage |        current Available (uA)           |
       |   1.8v  | 1200 2100 2700 2910 3110 3600 3970 4350 |
@@ -76,7 +76,7 @@ properties:
       be configured with hardware pull-up resistors to match the SOC voltage
       (usually 1.8V).
       The software can read the registers to obtain the LDO voltage and configure
-      the legal drive strength(curren).
+      the legal drive strength(current).
       =====================================================
       | voltage |        current Available (uA)           |
       |   1.8v  | 1200 2100 2700 2910 3110 3600 3970 4350 |
diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index e5db346beca9..75c9820ee60b 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -72,7 +72,7 @@ properties:
           - description: the offset of the GPR register
     description:
       Should be phandle/offset pair. The phandle to the syscon node which
-      encompases the GPR register, and the offset of the GPR register.
+      encompasses the GPR register, and the offset of the GPR register.
 
   nvmem-cells: true
 
diff --git a/Documentation/devicetree/bindings/net/sti-dwmac.txt b/Documentation/devicetree/bindings/net/sti-dwmac.txt
index e16287c06e5e..6e7e77da49bc 100644
--- a/Documentation/devicetree/bindings/net/sti-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/sti-dwmac.txt
@@ -9,7 +9,7 @@ The device node has following properties.
 Required properties:
  - compatible	: "st,stih407-dwmac"
  - st,syscon : Should be phandle/offset pair. The phandle to the syscon node which
-   encompases the glue register, and the offset of the control register.
+   encompasses the glue register, and the offset of the control register.
  - st,gmac_en: this is to enable the gmac into a dedicated sysctl control
    register available on STiH407 SoC.
  - pinctrl-0: pin-control for all the MII mode supported.
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 987254900d0d..fac882198a46 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -91,12 +91,12 @@ properties:
     items:
       - minItems: 2
         items:
-          - description: phandle to the syscon node which encompases the glue register
+          - description: phandle to the syscon node which encompasses the glue register
           - description: offset of the control register
           - description: field to set mask in register
     description:
       Should be phandle/offset pair. The phandle to the syscon node which
-      encompases the glue register, the offset of the control register and
+      encompasses the glue register, the offset of the control register and
       the mask to set bitfield in control register
 
   st,ext-phyclk:

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.43.0


