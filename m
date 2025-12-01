Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C85D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFWvZEEhiAwGjjJdNwTTNPizb/BR3jr6ZQBEE1XeAik=; b=pPW+zHuC1oLyGUArCitIuc4lfy
	hpwhcD0EbiHypMLNvYLGanWuwMFTQGMdzOWvB+q8DzsHb3HQNSZ7vCpySPn5DW/LIH0qXAB3Rqd5L
	MuFugcalvH0lI4W1akMSLSb4yTJ4lqjmAFRHd8Nkld9DIh+PfPXvJoxWAfKHR+iFQPfrJShnN/U1m
	6SmWevOR0I9/jnMsXO6D9B259lFYOBndlmkPttcy1YSYv4mJSZr7ucVN02QLX/MaMQq3H3gYOBuLR
	B9Pdm5MF66tdBxeLZi/jr2l14oRo1jEuF3YuJfHXS3kEiCfFr18UWqDJf2HtTJXaVKXmfy4x6CS2s
	wIN6e5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzU0-000000038FW-1Rpj;
	Mon, 01 Dec 2025 08:42:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTs-0000000385B-2Qtc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 08:42:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47118259fd8so35684075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578507; x=1765183307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFWvZEEhiAwGjjJdNwTTNPizb/BR3jr6ZQBEE1XeAik=;
        b=XntfitJP4D6FnEgoHwDnWMPoIQKVRs8B1dV+gjbocnONj7tZzSzdi4qDEFp3BWtfKe
         338deEXNYGVvajpw7Lx2YYtSa2/TB3Vxc3Kqwc2FNt/8D+4wQtJzFVMEsPjEAGpIBXHz
         LyvaIB/HcXzXu4P80EWALz37IdVargMP+V9QnDUZQ5Vn2myvUE7WsRsWsUlHW2UJBfBV
         7hwf0rstPcGLILArA6N3GKMRbRfm8fbgtYCDrloQRR7FML+D8sOdObSmuyExX05sVesb
         Wwoojbw8osHSsvB7JSxGfionjwv9xNN/tAk0mRsXLVnUwhkjRo4ocf3SEyq+J40ApjzF
         l2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578507; x=1765183307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFWvZEEhiAwGjjJdNwTTNPizb/BR3jr6ZQBEE1XeAik=;
        b=xL+0wZ4k05b1lPdoaZuAuw1OrtKzdbIF+h4lZWdAa3p6LXfi4M/GQ/qP8K2Mgk/4G+
         M76wihFDk8pQZGhvixFAdXR+VrUAIc82HURMGrnQF6fVB/Fabmr9hhAH0prc3UJIT81A
         ifSyiSmeqd5xhAFXtN7L/7f8nix1+KALzpuH6xHFYM//Ll2eHpvjV6Q3lLmXk+HrJiyg
         KLebVBwwsTZY1O/y2WTByyMJjofpIVn1zrTAlB2x4BTKhPj8eBgnSkdbQne4tPwhofOy
         5U0nyuhM9vAfbStqlI+Mg9nCmMEA+bGCrcwKAnO2Rf+Zrs/F/WAjXQUOoYw/WVfflly+
         SlTw==
X-Forwarded-Encrypted: i=1; AJvYcCW6XW/EOUlKESM1JF6UE1gdiiLUi1E4NnjR0XWbDl1Q4EXDQl1Iuqgc1dMTVVJOlTmeIsdO9EveUqCwbhpbeUjT@lists.infradead.org
X-Gm-Message-State: AOJu0Yya9adLU6o0q6fWPMqheZZFt3sr5V8SMf0kV8m1y4aeULTH9ro9
	4saBUgMBAhUlK74R/0flK5BUOdfbVlU4b+ucXRhfN08Zmt/7HZLbruTb
X-Gm-Gg: ASbGnctqQDHbYnMO+ZkUMQoiYNtncYqZuoMZbIVtQIobgK4CxoCIXF5vVkBN8r6EbFx
	A0SLsnwwP+s4oQwKWVA48SktV4GDYOZ5Y/ax6yfpXiMbHK5yu3IxAjIBdoPojQcBTt3Vahu8wlK
	mlQ1bu5DueZNksnuufAWMDYD5hVLaYwLl+3tmH9itr2VG7kJBtnzKZs+ISAOeZ/O4clrjsk9WIW
	C7WPprKymaZPXiEm6jaUYRNOCoNPdIoJwyAUorxCMzjEhDSaw+1+b3XohtpghBlSGSuPeS4svdj
	U1W9+aTlxX0KEJ2H6G+NvAADdg+6m3BYPgr6jrLLU4esg9yzPMS5T3ZqbSvks91pkvlVB7h7704
	XwQ6Dek/JThl+T2jgm2D/uZO2gxyrCd9nJ1DVrrvTl7c4nOxXV41EspalTXZZQeaZKsmq3dCVCd
	Vs17Z77HhdBX+MvGlLD0Y=
X-Google-Smtp-Source: AGHT+IGhs6p/Px4HSRx+ii7ASQl1YviEAStwSJLBm22f5Y1vrBH6D+UflFBC3i3z+pJ6RqSaeOB46Q==
X-Received: by 2002:a5d:588c:0:b0:429:f14a:9807 with SMTP id ffacd0b85a97d-42e0f34fadbmr26557716f8f.40.1764578506601;
        Mon, 01 Dec 2025 00:41:46 -0800 (PST)
Received: from owl5.. ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm24186087f8f.21.2025.12.01.00.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:41:46 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH 3/5] dt-bindings: arm: mediatek: Add ezurio,mt8390-tungsten-smarc
Date: Mon,  1 Dec 2025 09:41:38 +0100
Message-ID: <20251201084140.376058-4-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201084140.376058-1-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004201_800885_16D343B9 
X-CRM114-Status: UNSURE (   9.46  )
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

Add device tree bindings support for the Ezurio Tungsten 700 (MT8390)
SMARC SOM [1] + Universal SMARC carrier board [2].

[1] https://www.ezurio.com/product/tungsten700-smarc
[2]
https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Cc: robh@kernel.org
Cc: krzk+dt@kernel.org
Cc: conor+dt@kernel.org
Cc: matthias.bgg@gmail.com
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 301f9a1e041c..cffb0f6ac690 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -438,6 +438,7 @@ properties:
           - const: mediatek,mt8188
       - items:
           - enum:
+              - ezurio,mt8390-tungsten-smarc
               - grinn,genio-700-sbc
               - mediatek,mt8390-evk
           - const: mediatek,mt8390
-- 
2.43.0


