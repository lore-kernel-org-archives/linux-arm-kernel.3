Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FADFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 07:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irqIrASEQnL/P83qLaBuXsZse+5FN1F0t4SWPoFUX4U=; b=oej4tJo94x6juiQRaKDwwPaj6u
	ZftmMX0goXkHSolNv9TieJ3uVE7bxAXYL82pVaYXIcRMqKiIU7aLYS8WqlwdvSIPV6b3eJQ6gG/VW
	m9QSH7qq+580JMIbjreQ2FO5NR/EfbPn5d4bf89LZ6+3odIKbjrFeUyJpENXwZkcYu/yUc3YMD6NK
	Dx/0hhcJTKqcX4FvtgleZhcfdYv640koMPd63YqaIKEhzkujGXBP30LFqXzZc4OWtImqXGNYuRdqI
	/uIEA4IOkxAFstEPSVyc/5ZwLUI4cSYtPog6afwNzpdECmceh1/YOXd2u86I3pts32/mgRWwDSS7y
	02GULd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXy6k-0000000Aypm-13Bq;
	Wed, 15 Jan 2025 07:46:34 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXy4J-0000000AySj-0fc5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 07:44:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21680814d42so94972945ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 23:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1736927042; x=1737531842; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irqIrASEQnL/P83qLaBuXsZse+5FN1F0t4SWPoFUX4U=;
        b=0pdpWLFBgxalU0KPs0mpZmF1PBBu5KNJSYpCC1hl4bxlC/MbCKUCmJ5HxdSrSL1aJH
         3ehae9WpIR3ieyRcJuyWs1UIRSY7c8Vkk8gEYz1wPogS96hjf63myabZXc4/wr0AjZP2
         zJJvO3+CTSlGWuNVEwQWXegEIFY7UzwxIxuiKt/+tQbNrtd36cmWcqOR05MewX6Dohka
         /va53isjmMKwVOlUDORgjTvme0YtJsBnEnMgTsx778+ph3iGgQIJkLVkKCq0NYwE7Bbb
         KEiCPOjxNIKDmR4Qrooxm9VgfNX13y5lzkpJ/Sz+c8iRX1EqWHikaqPlqDP9U+U1Acf8
         gSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736927042; x=1737531842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irqIrASEQnL/P83qLaBuXsZse+5FN1F0t4SWPoFUX4U=;
        b=E9+FPu4Msevoml/mvQ0u/ueUT7S6kYRCt2Gz95pW0YEQEz8OztxoxOHmW70FzrDUCb
         ayVExaN3GcZBfjUy15ogxQPThmS81yW/FpU74wSCbhp0gSahJr12G7AmDB/XpWHPC2rD
         0VcU2WwDoiHM1hVr/2sMM5u3RN0nBEgA2Jkxste6wPr+bvPUbJbAG3u6DJTqdH+eBlBZ
         s8QGE3TW1NRSQziJyHW3Rg+3IZXNXskQ1KGX2wIwQkTK/cksU5jth9WqJlCqCTnrBx3T
         hIbXM1VH/OA3iRNH79wIqfz0ZN0fZe7S4u3OuVsZwAsV7PyyPF3mjLgqoE5TYZxofouU
         E9ug==
X-Forwarded-Encrypted: i=1; AJvYcCWguKSEIENM4yKQ5ucsFEnNGdvTip8XLCEAD4SdDzidn6LiIFihaVMSW9+5QLuv+lUVPdB/uNLto+6lr143ZNgG@lists.infradead.org
X-Gm-Message-State: AOJu0YzgyPmbaMgi2Yu8gNrgBSUmkmfTeaAaEMEnqUJOqKYhVQuTW7Ns
	ql9cH315El0arUSBO/z/PzOXzksJFScG8M/V4hhQyUrAdzgrZ6KQpZXqgvP0dIM=
X-Gm-Gg: ASbGnct3/ms0uOmlHaFtFBTbmBydga8+/KYkn6sfcqeA0FXYmlaGn+ICyhDiQXf45hJ
	LDaB3wioXK1zL73lU0M/IdKQSLEhzIdciTEd3s1vpt1GiZZkfMeOCeLWInLwbISTj4+vOoPApO3
	V6lCqQioqhoZO6nReeq+jvZYXJ0sfT1rO62+ASC4DnFfcQV3E0oNXI8j2144R7D9IxPSez+xfXW
	fAfy0CAnfq3OGve83k+asE/z3Y31xPCXAtCboogIF6oTmqZxkpR6D3YK/jvLNI51y3Aql8tG7Mc
	2OsD9U47ZsB3m0A0vVzX3m6G40QOhFzlNU10WusrOlY7Gy0KndX2WZhY/e/FeOKdiHbROh59LJK
	Xyoi57XZ38N5THoR4
X-Google-Smtp-Source: AGHT+IH7wyHxwHg1k5uN8OxK8Li1gA9Eftad7ox/l7Ex95B0bB66qcmyx0Wv80jD0KvFDC+GMHGKTA==
X-Received: by 2002:a05:6a21:3997:b0:1e0:ca1c:8581 with SMTP id adf61e73a8af0-1e88d108843mr44198267637.21.1736927042246;
        Tue, 14 Jan 2025 23:44:02 -0800 (PST)
Received: from [127.0.1.1] (2001-b400-e25f-ed65-f855-8c86-b103-448b.emome-ip6.hinet.net. [2001:b400:e25f:ed65:f855:8c86:b103:448b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d5047ea0sm9335482a12.58.2025.01.14.23.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:44:01 -0800 (PST)
From: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Date: Wed, 15 Jan 2025 15:43:43 +0800
Subject: [PATCH 1/2] dt-bindings: arm: mediatek: Add MT8186 Skitty
 Chromebooks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-skitty_kernel-v1-1-6ef2086858ba@pegatron.corp-partner.google.com>
References: <20250115-skitty_kernel-v1-0-6ef2086858ba@pegatron.corp-partner.google.com>
In-Reply-To: <20250115-skitty_kernel-v1-0-6ef2086858ba@pegatron.corp-partner.google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 herbert1_wu@pegatron.corp-partner.google.com, 
 Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736927028; l=1395;
 i=geoffrey_chien@pegatron.corp-partner.google.com; s=20241216;
 h=from:subject:message-id; bh=6hi/w2RSrE+ViDfSgsZQxeXkmC6s+DJOxBgbxZkuhZk=;
 b=mtRfNsy2B+eYE/hksXjSGuB4MmhaoenYcN126RNPUF9qsdO8z0Lhk48HgqBb2OLLWXgQN2yoL
 TtG7FVnKFelBG4I+OYlg4P9mYFjyQBlbG0zqEf5E7bx4AQwFvqtfbQc
X-Developer-Key: i=geoffrey_chien@pegatron.corp-partner.google.com; a=ed25519;
 pk=P8X+ifKsuR9w8T8cIa35nudXKmZX6qk0iS+5EcuwtrU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_234403_193012_4D579067 
X-CRM114-Status: GOOD (  10.22  )
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

Skitty is MT8186 based Chromebook based on the Krabby design.

Skitty also known as the HP Chromebook G1m 11 inch. The device is
a clamshell laptop with an optional touchscreen and keyboard.

The SKU IDs of the Skitty devices map to different touchscreen and
keyboard.

Signed-off-by: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d9aadb7b77e144a474b79da005056..b57e86946d7565720fdee31b2bbef288b0508769 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,14 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Skitty (HP Chromebook G1m 11 inch)
+        items:
+          - const: google,skitty-sku1
+          - const: google,skitty-sku2
+          - const: google,skitty-sku3
+          - const: google,skitty-sku4
+          - const: google,skitty
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:

-- 
2.34.1


