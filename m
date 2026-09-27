Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EECC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKsiUf1zswQ5v01inYZcqNF5S6iWN3Iz43ERd6nymQA=; b=E3LBxKJ11s+Bl0aQibH4jI61k3
	flKrlx3B+qaAijDVuTlPnH6ZYoCzJNnt8RO4eyKLUYcyrKSJn5o3+zsUrblBe6A7yMKw0PqeMIQ0m
	LAxRkJZbJcMm9CFgXgkKaalcbY8DOxjAMUTrP4uDwvGCDBnZSCSqw/GR2pqf2HizevHdp1hwMjhkP
	epuCLmiTTTlMFvtoQjbmks4Xo7hmHmpxjVQ9MPXP+7IFFmsia1JQtUQZjL3n2ri6ezLCYTdzSePJX
	MXH+fr4tfsdViOz1o3mNE2xys6V5FNUS2OpPnzJ+yDlqoGiAneopaVw8u/hQU3oiOA1K/7V7tEGPW
	iF/F6VVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqXr-0000000GUi1-1ybb;
	Sun, 27 Sep 2026 15:12:03 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqXn-0000000GUfy-2N6q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 15:12:02 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885a1480a2so1217801f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521918; x=1791126718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKsiUf1zswQ5v01inYZcqNF5S6iWN3Iz43ERd6nymQA=;
        b=kKR4n0pt7GxcSotJubsJxX1FASrKzDYjoDsBDOwrkN9zMWJzZikI5lA3LxKiC9jul5
         UpvVjsaxhcPSF3s0vxS4wLuoJ/IGqDl+mluaLIA4w7VPqNj5Ki8EUUGWiAkcy/WEyrb9
         sWDO3eyMjSCU8VU0ykJ5oxxT8Kko6EBzINrmhPvNyAp9GgFHBsF9TA8mQkvytfGonURX
         sdF92uQwwKmk+7vh/7uj7+W6wBzfTF3YZUeHjpL/3yLjeitjoY9KoCxHXau2Oc59gALj
         4FNrA91OXpzosfHfTbIVWvBBhPgTM2freVR11PjxO8GntlEldCIV32TZ4Kkyf0H9hQ5U
         XmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521918; x=1791126718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKsiUf1zswQ5v01inYZcqNF5S6iWN3Iz43ERd6nymQA=;
        b=vJg2vWNaFLrZ7XrGRNy887Eqiw+AcIPQyQFjbiEK+WUrxeGLHFh89g2mvjDKN06Qmf
         q0d5mpX/2X6JvHjEpWFE012giiCcXI8o38OuLwD5hYEXSdyOblhGcXfTDBd+qhF0RQeH
         rKPKuTVbBsnsHAUxmMPyq7nRybP/bnIzT+A1z9uzh7Mx3SUXAyNHICtRutlLsRmDegO3
         6zzuqpU5Yw69DzQK7m46nLkU4YTohSLHSCFDm+e11df0F4qMAbUATWJJm01DebrlwlmC
         tQA8E+huoakTnm/haki9sKiZCfDoAtg12l2bfHUePlKsr+Dqb/m+IQO4xV8uGzbOcsKy
         IksQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuvb+5sRBufPTOMRypl8TB+8RCaYoflEnBT6canZ2i9kUQeTvObwg5Ye1BsXaRruQsqgm4+WxCD0JtDnSvDSYM@lists.infradead.org
X-Gm-Message-State: AFq9FYIv23gE3kLc616BrB3RtRzTidX3BTaEOlOmStFzRLUkfXMSGg56
	T34lCZmWa/hmPaAI4HC+HJf+Op4AB65xogwO2C4eh+22C8/8+hVRExnn
X-Gm-Gg: AYBFou1LGQldR148xNewMqqRjgtcBW45vvlKOJXzYzAZrQXuZKPOINL6IeX6Z3vj8nK
	7y6WpPxg1qK++I5aobu+ni6S20Ptcgklz5fDSE5t67dH0nHhWC9J7q8GjJgIA+GPCyfanAYZRx3
	d6xZy5Tq58RGPaScn3mXWZbK/OC6Sagl8BlxJ6/ViXuvi1riDPBfA5437UQr9if8QM4GLl0D3Qs
	0w8Px0optHvsV+jc0+RRUWEH1c+4+TdHMlRmiw0lC5uFWci3gZwNAA133B1A55YtErqh/OMa/QH
	NTl8Se9KoUgxMyGSHxk42p32sK+IfkoIdz3ke8mvNj6H0aeYRQQu7hd4d0lGP5SPrVM1/cmRnhq
	DOXRYOdGvJm3dmqCoDldEw+GnEzWeCv0Mnruuf6BiHj7BYrEAaucK0r1n/Brcaq3XhFJYkg9gXW
	nGlgiKgRCaYuu8JJugkLcNM9mqNxJb4PJu71Lx6YWrWCxkqlvGmTOCwMwjeKiVH/mCMD5TIy+R1
	COzoLepHUnwBUXIDKlSeyW/c8LMLiZI
X-Received: by 2002:a05:6000:288e:b0:488:820b:7e24 with SMTP id ffacd0b85a97d-488820b7fedmr12875064f8f.28.1790521917582;
        Sun, 27 Sep 2026 08:11:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:11:56 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:08 +0100
Message-ID: <20260927151016.186493-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_081159_619364_E604681E 
X-CRM114-Status: GOOD (  13.21  )
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

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..6fe3b6410734 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,19 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  # The B288 driver has no in-driver pin table, so the mux values have to
+  # come from the DT.
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
-- 
2.53.0


