Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A960E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRShUSBjq5I6HKenuUGB0yK2sVXlFvGUz4LilaU4jRU=; b=L8rj6e2tcewPoHR/qrQ9GlcMql
	i3gBqv1dALG5Xxo7gCFu6LnYgpS/fz4mn/dgIwMo9pwCm1qiOleJWMzO3RUPaq46oh8rr/3rEtEo6
	ctJKjb9aqeHm9QdFoCRh1GjLoOvUAH998u62XTIuCBKY1+ZTPSgaq4A4oqlZLh3dnss4g49Hl7BRL
	qhDATK0yVfDZMEnm4ksQLYSj0FRtJ635MxbwDBFcqe6C07sEBtuNBxrtXU8DLfa1X7whCAZh9Y3j5
	NQW5w1K6wfNjQ2Vv4F1W7/dqlOW0B66DqODDUaPgtgCcx+6M9nUU1FHoKmSCxNsc/fTVyMP/ZMO6+
	J56AAHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMiM-00000002x1t-1Q1b;
	Thu, 19 Dec 2024 20:01:42 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMfp-00000002wI8-1XDd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:59:06 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d0f6fa6f8bso1777294a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638343; x=1735243143; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRShUSBjq5I6HKenuUGB0yK2sVXlFvGUz4LilaU4jRU=;
        b=GOjKGivM8Sls9EJiEalkGhLstHYBBJFMFQ4NOxrYZfFHAGc50mKeSr5rUbyGDNUMYb
         /gg+9ix+tc7bBr0zdoemCKe6Xqo/g2HfAvT5YgaeRfTCVwtk7M8PUJZQDfyTFbDfEvqi
         KdylBDIL1zFRECexku/1XXaosYAfunUApfjK6virTUYjcoDaFy8lqeiJUHGXQH9PwWou
         rtns0D3NHL3yvKzQgzfB5EHY+i5iUjq5xde/RK/OHkzISAmU+6Wr/0P43xBljd78KQRF
         GfTBlpUzpzpYGs59Bbe7GhgQJv3YU/s0UMy95Vx1HISMBzrRytVyZoR5aY7bm6irg+Dy
         /SmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638343; x=1735243143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRShUSBjq5I6HKenuUGB0yK2sVXlFvGUz4LilaU4jRU=;
        b=WKe24MhPaMPv4YBy/Np5bRxQftPHBtbZ1EhqgXqkbcDCS93TOrzXIWndtqAxZkHPFe
         K8xdsiiDoA56j+m3rho0ziqb6vX11uYztWx+6J8bSLGvKizNAK9aSqtWCRRQFfu/mklF
         qkzl4ncmFkEifSZo2l2VojRWSibM07GCCfuocsTIzp8japkGdfMy1ZTHajzTvsz9fUGN
         Abh24aozwg/UTfsVSaVxhrJ0I5p5OQTZcSVR8746xVekihopeF7eieVmDq0X5BpEnRgp
         WopqzapntumM+LZcpoDCN40HL/CqbhncYRXfaxFtLFvbV5FuoRP6kDZVyfHZipTGrNWX
         iIRg==
X-Forwarded-Encrypted: i=1; AJvYcCX8Dpt1XFzbiDM9vf31UeELSu7wYWxe41PQqpNyph3IY60SMDkaXpRyG+3dkT89/TkgeqOqb0OWHL5zNDbHP4jO@lists.infradead.org
X-Gm-Message-State: AOJu0YxXcUiFNs7uin1Bj6cCdgHJW+Gi51dcqzC1kxTrr0p60Ws+K1SS
	fXMHBU1M/xeN7klBi2XopCGel6JARQoRInSlEOtZDeS1UeOIwcWKM5WF28Ck43s=
X-Gm-Gg: ASbGncvRUnvZvvKcmJad7u/PVogUdiGDovgs9zk+HtaPE+VohAEa8P38Mpk0zH1gzkT
	iVLWOiheq/WR5kto75cOCadre5pBZ1bt70WO73UqOw+MQu22BeczbPQwTOz32tTk8eiGkj2iII/
	2XYkwsEtrlPZR+0CMcB6ECf87WPnycp11t3jfOrCUUwuPYbGCOGsiLjUxHqNN0TorJFdtl9Yab7
	XlRZ55MNTGtU5dpJELDxaWL1MNoPB35lJ1noGTjlqm3H7yHHg==
X-Google-Smtp-Source: AGHT+IFWWW5j/dWBpAa3jLvu/efCTMtDMJLR6V5NnS7zYJJvfEW3vIH7rRRkkbWVf34McH8wrBcmmw==
X-Received: by 2002:a17:907:9621:b0:aa6:6f92:74b1 with SMTP id a640c23a62f3a-aac2ad7fa01mr7034866b.13.1734638343290;
        Thu, 19 Dec 2024 11:59:03 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015b3csm96559066b.161.2024.12.19.11.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:59:02 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 20:57:52 +0100
Subject: [PATCH v6 1/7] dt-bindings: can: m_can: Add wakeup properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-mcan-wakeup-source-v6-12-v6-1-1356c7f7cfda@baylibre.com>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145; i=msp@baylibre.com;
 h=from:subject:message-id; bh=pbVz5i7bBpn8K6oPpV4EgG0QmN+pyuIY566qROm5zTA=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTqp6offH44/KPdSX7St1Yu4MBb2b7V4b+4yprywlpW
 bjh0NXfHaUsDGIcDLJiiix3Pyx8Vyd3fUHEukeOMHNYmUCGMHBxCsBETm9j+Kfnf+rjiws/Xwns
 rC5e8FZJWOSH/6XsOU5X9nTeO3/76stDDH94pxsYbfgbdG/acqct3KdkGd653z5re15dqvL45Uy
 t2mIuAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_115905_411278_57794A06 
X-CRM114-Status: GOOD (  14.12  )
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

m_can can be a wakeup source on some devices. Especially on some of the
am62* SoCs pins, connected to m_can in the mcu, can be used to wakeup
the SoC.

The wakeup-source property defines on which devices m_can can be used
for wakeup and in which power states.

The pins associated with m_can have to have a special configuration to
be able to wakeup the SoC. This configuration is described in the wakeup
pinctrl state while the default state describes the default
configuration.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 .../devicetree/bindings/net/can/bosch,m_can.yaml   | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
index c4887522e8fe97c3947357b4dbd4ecf20ee8100a..75963b11d31964c47679370664824ea111e70ca7 100644
--- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
+++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
@@ -106,6 +106,22 @@ properties:
         maximum: 32
     minItems: 1
 
+  pinctrl-0:
+    description: Default pinctrl state
+
+  pinctrl-1:
+    description: Wakeup pinctrl state
+
+  pinctrl-names:
+    description:
+      When present should contain at least "default" describing the default pin
+      states. The second state called "wakeup" describes the pins in their
+      wakeup configuration required to exit sleep states.
+    minItems: 1
+    items:
+      - const: default
+      - const: wakeup
+
   power-domains:
     description:
       Power domain provider node and an args specifier containing
@@ -122,6 +138,17 @@ properties:
     minItems: 1
     maxItems: 2
 
+  wakeup-source:
+    oneOf:
+      - description: This device is capable of wakeup.
+        type: boolean
+      - description: This device is capable of wakeup from the defined power
+          states.
+        $ref: /schemas/types.yaml#/definitions/string-array
+        enum:
+          - suspend
+          - poweroff
+
 required:
   - compatible
   - reg

-- 
2.45.2


