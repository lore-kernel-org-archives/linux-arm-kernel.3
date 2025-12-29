Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8C6E92FC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=; b=NRF0yIaRLzOF0KCM4sfNoiWyBJ
	AVSElxg5RUj7rhBlIqj8E0sH5deZf4iopjGrOb1U65jeTM3gLB42G4y1HWZxsCM/tbWFqplRiDFv8
	EHTbxUvDr+aDg7WFhNdX5KMqYXd3gP3C5BNgWsRoAkkhDsg3TvLvDS2JirV1zTOO/uSz+vKtq2Ynw
	Nv9TWSNpTdz/Coh+eXpIJqfGt3F/mn/4VfwaCOrI56U6Aa6Sb4gJ4mX9+Fa8u1J+TwiMTxN/5gYLD
	Qs0Jmsv8kBxP9R0prtW198LAYLoV9MMnnW8/SnTs62QaI7uh/55XyLRBH0+PkXjqmK3CirSSWfnsZ
	YAgtdCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAx-00000003y1x-2zP5;
	Mon, 29 Dec 2025 18:41:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAV-00000003xZy-3v6t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so22431425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033634; x=1767638434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=w0vAMawIU1xOTFz0U/hl796/ypGFvTkTzu/lxVecpNq8oZDdTzl4pNxwQujiH7n9Ax
         6qnwAHq15F50iaARzY8PmxCdtDC2hU9iRT27LgSfqjiog+J+chDqUtIZsoknS0ScB1k9
         fDdw6IpQq8nSO7NOCmgQNd2MDDXypc9UwdYNo1SQF0bUycD02OxHuxpAgjh7+NBtXppa
         EsaijnjtIkCadyomiKTjqxp4hs3K/dTUgCv8fAdfSS+gbuc3K81WgAWoCP2fllNLDBZp
         2CqxlKupTB6OGIbksQjHjWiyU9ItFT8UoJEqGeyemX0fEOQBNzBszbsPKGxeAQFo4k79
         sSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033634; x=1767638434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=bZAP9mRyeUliR/ElEBEdckt5/kUwRwXv48xu8+MXjGiuCzmFTZznuzC9epFrYDLDPf
         anSNJIsA6HSvy2+pVDrru4qFz0nSyOdtfh9jDwzAcW1Q9ISL4azOZtYCgCp77+zbwKSS
         uskv5sFDuq642CQ0oJNio1Zoclvesy3qAP6aJ3FH2ByeENXi4FJ01ng+F0lFb95ict3l
         E26iijfkbYO+lmmv+XTr963ACJeJlChvag4NStn3uSipeSV8qcJUPEhLQcLuCTylXmhi
         UJ4I/Y+JKTCJZj/s1/Jr4DDIeKvQ1bG/tVoSeSdjSwc7DzOhfuGGPJ8EIT+vyJhJ1dnF
         3ZVA==
X-Forwarded-Encrypted: i=1; AJvYcCXTnqhSYnlddf/CDSyfCTR+qKytcsrmSRK1h9yw0hXGaa1Jeemui3Qk2krWW2grMlmxi3lS8PRwfqLYSQk/TiW0@lists.infradead.org
X-Gm-Message-State: AOJu0YwV6yTrNOAyrGopdx2VJgOYllqvFEQ2rHjs5TRhFhJoOHwQsNPr
	iDpE3eodzRA5HQnxIn8JilKsGMADPW6Dx9B2daTpxYVx7OA+NL+WJRknJUiG1cCqXkc=
X-Gm-Gg: AY/fxX5J6LQQP3H6FFXYvJL2xPcJ0H//7nioy0ABeGEOIGRfpaLObdlklORXqo7zz7t
	B4fvn8C3k+D6fanrxPxRYaULrDixAI86gU7mLpEr41CAJWQOz+BWsMs14lsJrwkFd8IPEQFizL8
	Rs0AuDcf0dNOz93Ss1coMzToiG/Owh8VUEauJOQvIN+/DIqq1YS5eUP+/yutYpOGJk35yqQabNQ
	/YVSeWYEIziHgkWirobN4UohIZeB5GzXV48Lo4gYeacIh9NTRF21r3hT26OmldJa2UsAubHXhUI
	jJRofe1B2/rrUXXNRnIQWWJAaQJbqYv2nfcg9AwhdMcu0bW+0EhWI19CuZQD5YIIIgwsCluYXKg
	fU2BfZIKRNrjhkIT78nAA4PynIP5CnzNnaum8HoN/84J8G3Hi0cL3+zN0XMJvEyxmzN+fjaToaB
	HQeY7wi2pNOoWIVNFTovId9Lc0HC66QsP7SGHCpT8AagybUgdxvNzOVYqjZqfGtYG4F6bhiFwNe
	wmv8X18iS1OZghp1IAME0imGJ7Y
X-Google-Smtp-Source: AGHT+IEOW1WMqA9XyyxJdu/NN+RbiiVAdkX9+5SQ+X2Sm6Ndg4Ati/iuxawV+Wvcj48RXpcfvKGVGw==
X-Received: by 2002:a05:600c:c115:b0:47d:3ead:7439 with SMTP id 5b1f17b1804b1-47d3ead7574mr139091495e9.37.1767033634253;
        Mon, 29 Dec 2025 10:40:34 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:33 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 11/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Mon, 29 Dec 2025 19:37:52 +0100
Message-ID: <20251229184004.571837-12-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104035_981231_5C3E9400 
X-CRM114-Status: UNSURE (   8.95  )
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

Document LAN969x compatibles for SGPIO.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index fa47732d7cef..9fbbafcdc063 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -21,10 +21,15 @@ properties:
     pattern: '^gpio@[0-9a-f]+$'
 
   compatible:
-    enum:
-      - microchip,sparx5-sgpio
-      - mscc,ocelot-sgpio
-      - mscc,luton-sgpio
+    oneOf:
+      - enum:
+          - microchip,sparx5-sgpio
+          - mscc,ocelot-sgpio
+          - mscc,luton-sgpio
+      - items:
+          - enum:
+              - microchip,lan9691-sgpio
+          - const: microchip,sparx5-sgpio
 
   '#address-cells':
     const: 1
@@ -80,7 +85,12 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: microchip,sparx5-sgpio-bank
+        oneOf:
+          - items:
+              - enum:
+                  - microchip,lan9691-sgpio-bank
+              - const: microchip,sparx5-sgpio-bank
+          - const: microchip,sparx5-sgpio-bank
 
       reg:
         description: |
-- 
2.52.0


