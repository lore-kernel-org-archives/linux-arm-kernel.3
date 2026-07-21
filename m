Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFF8C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6arKxt/pKAK4HvJvMnbtdBhQ+d77oJa3U99lYSiiAM=; b=KNBYtOiVbnwmAutHnMX0BVVnIo
	WrIFIVVJgcAibeJ0BqhNlAl7aOxQMMQ/ZQGJVKHX1UggyQFw8OedNqhwUhxNgmTzCKgA8pmBeLZ59
	5TBocmFa3JHnlk62MKkDEJThi1rh/6hTCEu6RntHYPO4ZHSZt/I0PwW240YwlJYhAwoGRkEqkBvv4
	vrWyIg3GZenbPF4oGSRG/JEndVk9XQpRW4uUg1LohGwaNm+mJ4tByHvEYAGLVS3UIFR8dJIW2sXam
	vZ0R5nT80WXy5HwG7p29FNj/+Uny8zi7R9n0dvHKnPtkns8aGPS0IqpJvWiLAvdYXflBPFS8JqFtd
	kmun7oCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Af-00000008Y6n-1nGw;
	Tue, 21 Jul 2026 06:41:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4AV-00000008Xzg-3srq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:41:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47df6a5655aso589843f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784616090; x=1785220890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6arKxt/pKAK4HvJvMnbtdBhQ+d77oJa3U99lYSiiAM=;
        b=abhxboKYTw0deYokzABdj2HhwsLtObNrXA1RSU5l4kN9HtXHl1TTAdAtW6BZ7DrImG
         CMlNQDNDfdROSEsexn8YMTOs+cxw9Idm3039cROYDIKUWkXSmOwozIPe3sMMVQVRTb3k
         sDWIvgf9ncqsSxq8HpvngWwhsoZ0p6tK9PQcVfwUtKgffHcvBA5MgOEZzC3XrcPs22WL
         LJB8M4Qay4Uv4ImzZF0zgENK0ViLeSXIksoZYowm4Io31qq4QggCgCm/PQHcEirH0TyP
         1FXNukzEB367HqBp5JcM6M40IRJBqJucEZPnlZGz3wV/15iEcCPzkShVFktgXGFxeahL
         KxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616090; x=1785220890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A6arKxt/pKAK4HvJvMnbtdBhQ+d77oJa3U99lYSiiAM=;
        b=k5ZII4jJ2YS4hUAe4bvbobT6/LkIFwM41+FnC/RBy3kOOqJVpblXJuq1/89bR8dLpZ
         T8PV58F/cic4Nu2GI0/yAUvj6fDjq+kk4735t63JFAcqTLlrHGKIODQAGqHLF7yH2FrP
         RssE72L3/I8aB9k3dgxRisgGhjiF6UQwyr3tLwRPLvfOmuOsyzn17yg4mVhcaAbtorBV
         0c5MGwTrbuVzvyFJvPRUA+tGReJRX/2fPsAHzPUTnKMrws8Mn/VwuFgtPFl5TF+26QU7
         Lz3Mdw6f+EcaSPJqWNzlbVdZ0cRmYK381T6c7FtbgWka78OBkEIuopHchOI5NmuykPd1
         rgQw==
X-Forwarded-Encrypted: i=1; AHgh+RqlkmnrBmNg+zVGwI1MMlMDf/LfPsCRFF8y/JLElkwEW/PX2ZXeSQEYPHDaQTZK8feNysYSDCvOp75OxRE/OrS8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy7ZFJtokFte4Jay9mTGbdTrPPnw+YBfqp38M+Y4xDpoBKOOhD
	i0KdJ4YsK59M++vx8DeSS4WeOFox1DleaOXVLU64H6hYb6D79VrjVKBf
X-Gm-Gg: AR+sD129f/m/yeZICXmXgcGpY9WdnPinUzfjEL8N7nlUII37AvUDDWkFkR8v4FkU1mt
	8eR8l+Jj6qYdk1CNNx+ZrmZkSjJzsGaM351bYJiOlOExmt4zB99zcjSGTeB+Wsz12jvjZT2OZgQ
	KmCdONBFP0q7PPNd2S2FSEaNB2ATKfKXBBV7sAUP6beSsTdXB/0336Z/0PApR5KSUAXwtG1UUrC
	QE3Fgx65bUKhBT/eVlAezK0IY4zjh2aPIXhDOVYAZBKGCsXt3vw6WO0a9uc02sr4jR2WecPWd9M
	n/+1TCmEc08wlzoSEQAIV+Jf9/T29ogphKNDiFIc8eECy82gNvEFQiZFwamzZ5apK7sB8F/u5lC
	98pUL1/sYiWjVfiKnVV1Y53YPvVssiEJR5xNgCIjv3J4OrfoRYwpE13VWFuvmdiJ6EJy8aBWQZK
	qsn3WaYMp7Hg4e68Tonp8p438TYc+4fpvszr8Ao2rHJAriRHxO9gbrkwYK7Mpc4H1X18sTSfufP
	SpXGyzhPSDnqBKYa3xcBg==
X-Received: by 2002:a05:6000:238a:b0:475:3a97:8e2a with SMTP id ffacd0b85a97d-47f6233d4ecmr10721512f8f.7.1784616089904;
        Mon, 20 Jul 2026 23:41:29 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B88AD00DA0BF9DB4519DBD6.dsl.pool.telekom.hu. [2001:4c4e:1b88:ad00:da0b:f9db:4519:dbd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm38837951f8f.22.2026.07.20.23.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:41:29 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
Date: Tue, 21 Jul 2026 08:41:12 +0200
Message-ID: <20260721064115.64809-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_234131_986902_B8D0E91A 
X-CRM114-Status: GOOD (  15.22  )
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

The HDMI RX controller can expose the audio embedded in the incoming
HDMI stream as an ALSA capture device. Document the #sound-dai-cells
property so that a sound card can reference the HDMI RX audio DAI.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v4 (both suggested by Krzysztof Kozlowski):
- reference dai-common.yaml and switch additionalProperties to
  unevaluatedProperties: false
- drop the consumer comment from the binding example

Changes in v3:
- no changes

Changes in v2 (all suggested by Sebastian Reichel):
- reworded the commit message to describe the hardware
- property description now documents the DAI indexes (0 = I2S,
  1 = S/PDIF)
- moved the consumer reference into the binding example
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml  | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87..b80660d 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -78,6 +78,13 @@ properties:
       The phandle of the syscon node for the Video Output GRF register
       to enable EDID transfer through SDAIN and SCLIN.
 
+  "#sound-dai-cells":
+    const: 1
+    description:
+      The HDMI RX controller has two digital audio interfaces, one for
+      I2S and one for S/PDIF. The DAI cell selects the interface, 0 for
+      I2S and 1 for S/PDIF.
+
 required:
   - compatible
   - reg
@@ -90,7 +97,10 @@ required:
   - pinctrl-0
   - hpd-gpios
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -129,4 +139,5 @@ examples:
       pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
       pinctrl-names = "default";
       hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
+      #sound-dai-cells = <1>;
     };
-- 
2.53.0


