Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3796D41177
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmhD7xqaP3tJ0Ge3gQd2f9t6bDUERo+PNGIof7/k4qE=; b=b8CCS7oe35T5M60O6dzpGBtjYg
	UA3jEMtY6M+oUScanpz5T0yrxdBvljyzRpJn9gwqgJqTsdLuR9qWSRQVZUS3DS0LgG9N0M3Yjgqa2
	nS7DEyZs7r1fq0Teasc63m2qRa/YdBIzYHaP6smjWEz4i7wqAUMbVt0A68JyUQyqYWP7qWVsPn5Z4
	SDS5s9a7ER0qAScgo3ZrWidqMaCEvlXfkgP9j/t8WDuHX8she3FGqzV0f1sjriAvA2ozD0viIaU2e
	C3cjdkFbN/dazRQmdAAvcnl9/X+oy6+zAL9IzahxdtvjDyHfNA8aOPebeIaNk83t4ZPOSWw+90ThP
	MhWutNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLjl-0000000CFfU-0av0;
	Thu, 15 Jan 2026 11:42:01 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLji-0000000CFdV-36uA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:41:59 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-12331482b8fso2545546c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477318; x=1769082118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmhD7xqaP3tJ0Ge3gQd2f9t6bDUERo+PNGIof7/k4qE=;
        b=CGZarAnPpifSzuO6WJyqS8Ua5MIVd72zaBlYIgzup29GWVU9qtbA1QyFBk7DRD9jzX
         jHm6WZROcdQfo1LKPtrVuajM2WfoFaclXnEocZAakUS8pbHLIOC9XSI7e//WtehkbT+0
         l0vwYIdhfMKnenw9l9Vt7zgFG+3gwE7RDp2TfcMa+Bvb7XcbpD0w6vGEc7RCjL+iO21/
         RXshvbdwuPgrpMPbpK4DaGbngU9vg5/EmLxLW1e1nkj/FF8DDK7VLME7vs1i6ijihp8b
         26Ywacrb7Wfq48bbDBWFPMog/VaS7A63/vZ6YE4July/NL347Kv4t9mZVF+/BFNGvK8I
         vHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477318; x=1769082118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmhD7xqaP3tJ0Ge3gQd2f9t6bDUERo+PNGIof7/k4qE=;
        b=g+Oc9OaBgPZRWwnmF/FyuLMhIu2wli1cMLu0+Jdo25PUklEurELOZ6FBJJgArpEsnz
         U8EmPj3+Kbf21fu80v5QXfZ6M/eX07dwlNyQKOjwg2rqraM3Q2Y7N/TzTzGK6Z5xrD+9
         +JywyvpqVITxYcC3k7Az0CMtMss1ZCR1pbA79dhA8JKxeZzjfa0dhMoF1rsDWJQq9jgB
         fs62swJ+a56nLhRq7GOcURUFDwolDOCo4RtV6f4BQVEpCFYxUMKWTer03sOPNU76umOD
         M4MJZzphPPGbe9/Rg336i8lyqsetKP/QdrpO+iHdYv7ff4RuBdntBuvYSBfoL1GQ/8q6
         o1sA==
X-Forwarded-Encrypted: i=1; AJvYcCWLytbOJpvCrsjvA8AdzqC7FARIbryeQyftStZ+uEKQjzuxhXMTypqP6uEIHU9uW6gf4jzZA6czpICU8ma2WixZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxfNZcOtyHgk5rxT9H/1vrDm3Pw4h0a8ZKBwAyOtAKcDSU0Ymio
	HWmyU4kKvXVlBkdhpQRnodMX0o9QzZ/S40VnfJV3dVZyQPriVYNKEiCht+KW4tfyrbM=
X-Gm-Gg: AY/fxX65mmNJUWG3P6+1own7s9Guae2z8aez7Jfn9XKbeGluBwPDi1CudgWx522MiDz
	H0RxRLeszqfbljPluPwRr4eM1V7Jjpz95i9v2tWMASsVChHm8pYFWQwO0r9jlqxVQgvbzCJ+Mae
	lewxKU42vTtt+URGgO6TJUODB+ttOzNPhQZmwsEy72li6+YiP7O4gxnfaNCGScwIzsLUYl+pH+p
	1IyXaeGFNxrXwg8MFfyLzzIg3dd08YCkET8ZydCtEGZ2ZQvdIpvjnWsmfSpuyYdhqFG9cRc+Z1Z
	V6iwP/g9i3b+JMfGNeoNktVSGbl90RQyK+0Hj3SzHiNj4Erym8103ANwQWYex9woiGOCMr/N8qk
	KnX7p1JKgRidN5wPU7fbT0wqsWJn0zIy2NG3X+C6+fxiMZT8naknP4zxq9vmrk60oTcXfwuBL7W
	CPidjdmN0cvZeztU4XUV4jYQlPhsA6h3ASRrGIhRIQr9HAH+KL+/7k6nVuiA2NgIecVz4A3lY9G
	kGxy3/c
X-Received: by 2002:a05:7022:6184:b0:11d:e2a3:2070 with SMTP id a92af1059eb24-1233778b5f3mr6944456c88.44.1768477317748;
        Thu, 15 Jan 2026 03:41:57 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:57 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 10/11] dt-bindings: net: sparx5: do not require phys when RGMII is used
Date: Thu, 15 Jan 2026 12:37:35 +0100
Message-ID: <20260115114021.111324-11-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034158_780304_872CC9DB 
X-CRM114-Status: GOOD (  10.00  )
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

LAN969x has 2 dedicated RGMII ports, so regular SERDES lanes are not used
for RGMII.

So, lets not require phys to be defined when any of the rgmii phy-modes are
set.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/net/microchip,sparx5-switch.yaml     | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index 5491d0775ede..75c7c8d1f411 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -151,10 +151,23 @@ properties:
 
         required:
           - reg
-          - phys
           - phy-mode
           - microchip,bandwidth
 
+        if:
+          not:
+            properties:
+              phy-mode:
+                contains:
+                  enum:
+                    - rgmii
+                    - rgmii-id
+                    - rgmii-rxid
+                    - rgmii-txid
+        then:
+          required:
+            - phys
+
         oneOf:
           - required:
               - phy-handle
-- 
2.52.0


