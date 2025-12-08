Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DE6D3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 07:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86b9GUNfdvttDCRCuxugZUht31CVbPRSKA3vMkwcp9w=; b=s0n9PYua019eKxNw8qx/MLL15u
	8xLLDk8AukTSppi72w/HYRa1k8QjSN3DFHljRxJ/AIpmtwT9BC/hhIZRdE7pITtQTWCI6AcikmPvO
	TUqepbPGlAd3mibsH5Mggjl1QXKn2hlfzsf9F1LTczuyogz7RS8F1/yg6tiJLxRX1ggtmYJhYL09h
	79GJuWy61F8vE3pFutQf8enS5zN54nFx4jQy0PWLNoYEARBLCmn8SN/gaTCsU8vR0AXL9ZlVK7Kb/
	q+DXxiZFCovuaBvfadl9XGqA2B9EGFVdOoXWB7Q373KwlPsw0MmpxA9fr8m0u1YZMYl7eFJIaFrJF
	qQKayqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkM-0000000ClS6-0djl;
	Mon, 08 Dec 2025 07:33:26 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkJ-0000000ClQx-3FZj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 07:33:24 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso6641887b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Dec 2025 23:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765179203; x=1765784003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86b9GUNfdvttDCRCuxugZUht31CVbPRSKA3vMkwcp9w=;
        b=OBRjKnUXfCrwzn0WdAX1hUHETMiZQM9zTRB7W923NWn+SLOv6lSZXmrDGARtjGSmCZ
         B9QJlF9Rb88WVvL+4Eclt/fQnj4Nly9neID3GKFJEqxTIQw/pP0a3ebgf3nlLD44eFBt
         9g9VfxBp69nm/8I5h1nQsVxBxp8A4oJBNbt6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765179203; x=1765784003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=86b9GUNfdvttDCRCuxugZUht31CVbPRSKA3vMkwcp9w=;
        b=aOF/OIP7UnOwkLLE0FsPf1AQUhgVxK08TfLDofJxVdUyLyH9T4U9sH+KKisjrH2xBm
         0pZ1t9Ez49cGk8xMHDwqrGJ1miI5qbZkSCr/ce9qTu8mL2BUzY5JKu/O8JmP78LrCa+V
         IwmtP3HDvxeF+Lq1ZoSI2V6rmye8qQQD+1f8lSE50Qqf/Khmq0uDl7DRFb5A3eKPE4TA
         zJJi77SrA2C1EQ9wRailsPJbh2wG6Ue//b3GuKwLt0oE7UiRAH5aPC1d1pyQMkluusT0
         3swExddGlc9nlsJ50uXg4pTNk7HhaqTmDqJELslaPOWk1Eehy+e8VaO+YaJwNIGSCj9X
         iOrg==
X-Forwarded-Encrypted: i=1; AJvYcCWCXZ0bNP9dmElygvJV/MYmyQGevqToel76lMn8lHv2xSJTUkfwMYM2rSJrBF/XU+7EaZAWsl459Y4hmHE0okoc@lists.infradead.org
X-Gm-Message-State: AOJu0YzWbzNguQAQt3/oI7B3gIkdqp4Z9sG3+U7r+gsX/MG1KLwchXTB
	xQ/c5rrGZ7AHMn/+dNPe/QLI9bUzvRThLpS2DjmFGolCKteTNUhmDKxnJ+DcTwl7HA==
X-Gm-Gg: ASbGncvUJD1CKFE+iW0dGLqF9JToGdDk2xYk/FiOL1mynfDk2cSpFMoHNMI5yb+Avm6
	NJ1lSvgmaZB+wEHlFiFADLEB5i12yH76XJr3xP4tHC1/SlakdBz6IzjUfo3A31X5do6LPZbEwHf
	vfK4djMZdFziB3JRKyatn0eLSRZIJ+R8/Xrjc612QO7HW156NLWRALYatd9X8DxhD2GGsQLuFiZ
	YTw1dW/EhylhmGvHCrirVCvNtbbrlqupv6EDWPoAs6eFULlhd3FchEgR1MS+tk2ac6mlQ4eQfov
	UK82zlat3UJ9TSqQqOG2Ef2FE2Vbmk5pVFUXQ3w4nn5dW6yAWg6gqqxTBraMBEKM729vqtbxrF3
	xLT0OOYaMRo6DYbav2DhXPu8DT+IhG6nYJxJhed6UltZPmNV25wfmoqsLZHrJVFm3eJC/fymOTP
	bMAc9E23T+SCuASwfpFOqC7jz+Tz2dV59VxPyN/apIA7OSc/qdwxFht2gYOkhCxyjq/KGv
X-Google-Smtp-Source: AGHT+IG+bsvH7N1bapcW1PPpLCcGsoW9Tvo9GMseHgeyoI6qRL9+qatTD69qLryiAHY5E8s1TajC4g==
X-Received: by 2002:a05:6a00:852:b0:7e8:450c:61aa with SMTP id d2e1a72fcca58-7e8c960087cmr4519854b3a.65.1765179203211;
        Sun, 07 Dec 2025 23:33:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:d31e:c84f:5cc1:d554])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm12127686b3a.20.2025.12.07.23.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 23:33:22 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] dt-bindings: arm: mediatek: Add generic Ciri "base" board
Date: Mon,  8 Dec 2025 15:33:02 +0800
Message-ID: <20251208073306.75279-2-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251208073306.75279-1-wenst@chromium.org>
References: <20251208073306.75279-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_233323_894522_348718C9 
X-CRM114-Status: GOOD (  11.14  )
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

To reorganize all the Ciri SKUs into device tree overlays, there needs
to be a base device tree with its own compatible string.

Add a new entry for the generic Ciri "base" with just the fallback
generic "google,ciri" compatible string.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 718d732174b9..9cff861c6e38 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -372,6 +372,10 @@ properties:
           - enum:
               - mediatek,mt8186-evb
           - const: mediatek,mt8186
+      - description: Google Ciri (Lenovo Chromebook Duet (11", 9))
+        items:
+          - const: google,ciri
+          - const: mediatek,mt8188
       - description: Google Ciri (Lenovo Chromebook Duet (11", 9))
         items:
           - enum:
-- 
2.52.0.223.gf5cc29aaa4-goog


