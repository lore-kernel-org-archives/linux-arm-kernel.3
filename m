Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E40CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nE3XF9TJ3rEGOneChwFEqNNIrveo5+lTJId+Q3nPPQA=; b=1VR1TSvRRlMs8NI3P2wXdIwbGD
	d4q82iK3CT4o/D7tUQQopODWQqkrn/FMJ+dcbZYrRNCoIFapfrEs3I/DOawO8uiHle/m4QLUzC+TH
	2lTpuzXfB3yGpQcLqfN1WN0OxuGl+/QOrY1rpdBzyBjyoY8HUgQxOT5//nTPP0hPCbEAiqCjphQD0
	bXUMLo5ajbaFDtRupzm7t2RJx7vbb2VUsUDNyFcbQWHY0O5w7Jp8vCqUP4jcGPRi5E2qdYWzPV/KR
	2SfGXkdl4Nd0wBxP17HMsa3dw9rBoAvAQtE3hFUu7yokVJlSESHPB5/KFI5mOjfhVw8BEEKBr9/1d
	Q8TCnXnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJG2-00000007Q3R-1MT3;
	Wed, 24 Jun 2026 08:46:54 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJFz-00000007Q1A-0iRa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:46:52 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-37deb2d3a28so130983a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290810; x=1782895610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE3XF9TJ3rEGOneChwFEqNNIrveo5+lTJId+Q3nPPQA=;
        b=PuvftsW8FJ5+xuJ1JUFNF8zyNG6ddcgOn88lxnmiCGB6jHesK7g+ZgX5+LJqdi09M/
         3lzAVAXJGChOhJt/ClNKcIGcvb3ny6zA1AfkzSuaLNFtqQj08GxjoSugQTG8jwEfEC3H
         rLVKaNGsUp6r2yxcUfJF+uuxkGj3QAUdjd0p6yJGoXyZp0/bFkP7IfY5Nvqy9jT6TCyJ
         r8hQJ4vzj7vAwNxyBdEPHgCYgtaJG4ptquMNMTnooOxPJlV83QAzPbc4DUxKLDuMaqE4
         iSeZJehek36+NeI4XOCnsmbI1G6moFC7YxDUxQ/4Lqp3rJf3BGxNu2cSzLYFWWVaYFxY
         ma+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290810; x=1782895610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nE3XF9TJ3rEGOneChwFEqNNIrveo5+lTJId+Q3nPPQA=;
        b=rC52vlnn+7ZT0wr+dH89paR3UBXxJOhDtdymm+ehXJtQIR1wYdRt7cS+PhMPKWZfSj
         CWws+XDBYGkuK9jbokCBmXU+YD7XPmhwq8Af4oI8RN5dBycQNM+3yywWOpZ3bxbcIFT+
         UqXawvwBkwVGGFJIFUosNagbDy1+tG7umo36WMMeQduFpin1eE19W6p/IOZ+wj/Cz+Q1
         bsfkyCcwsURx0DQHfVLbmwA+pTVrduNnWR3Q7yt1jJ6FhSFNXlnE2jQcdpTf1voKYaEL
         IKx6cFGPpbKnAGeh2fAQWDPqnb88jXk4UHuahe+w9RtKl3+BAWbp5EMZ9f3EEel4jQ+5
         ShCA==
X-Forwarded-Encrypted: i=1; AHgh+RoGlQgnXsjilYy7f4feHt5/IR1sNxnwrSE9843kXpUr5+wXLwRP0jZ7MVso5J1TAam5KdgLbK2RqgIxV6Oo3zls@lists.infradead.org
X-Gm-Message-State: AOJu0YxxKtVd/wfo8TLcGqstsEYL2/nUxKLMrHVvhCf+AHhxkj50pcf3
	laS8IlXrG2lMZEna0Aw2IVwAGPnSkrPa35/RS9SX9W/5hTS0HoW3Js/V
X-Gm-Gg: AfdE7cmtSVE2bQ6h/XL/tAGCBtOhBSIaFVNTxUoAUVUkLl70LiTiA26DTIyxXEXnrPF
	nYLTXbGTawpZcBLbJTmknGUh5kxeT5zdA9+WsoYI+UeCnfyNiijUadOifM6CZHRweQ+XobCE7Ck
	CIpxWJyAyHNyNBJAtwQ7/gJJ4DnMctufjyLvZ32u0dBHAe/477M7rvIQzYUZEJ4xnDL5n3iR7u8
	KkhhHiX5i91cktIJGTddj4d1WqtvtNESCrvjHUgSSEX/JW1h9tfzQT906cRU2oVH5D+orSwoK4Y
	7S9odixP7Xfzb16n2aVYQQThBT9bE2b2PLNPO4r7K+xhXcuK8RY+AUST6Yn9EA+GdiVRdKb0cow
	XmvFRGNmNQo0l0pqS2HI3iZXdDtlUmYQfky6OWUsRYzhWe9D4oaKwgU/urNbwL6bMO4+NmUHf45
	cj/ZFQW4PynBb7RHCIHqwDKMGR
X-Received: by 2002:a17:90b:278b:b0:37c:6975:2e3d with SMTP id 98e67ed59e1d1-37dd0d3de38mr6759149a91.8.1782290810525;
        Wed, 24 Jun 2026 01:46:50 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:46:50 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:39 +0800
Subject: [PATCH 2/7] dt-bindings: arm: rockchip: Add Alientek DLRV1126
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-2-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=1084;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=hEAydHqntdYMnlyAwKWZtU7FCzzrJfeB5kFdTHg3eh8=;
 b=LQo6M34edM3nvXNVY+lWG19FP/SsEWFUfLZegDFVnSHuVJWMtsEo9BN8H+BQsQz7HVsHAPF9k
 ntrv/WOTO4JAdqu8mcEVaIdImKoX5QNJcMKn9i+mijaj9U60D4syALM
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_014651_240293_22BF7416 
X-CRM114-Status: UNSURE (   9.38  )
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

The board consists of a DLRV1126 carrier board and a CLRV1126F core
module based on the Rockchip RV1126 SoC.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..9058f2a461d5 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -162,6 +162,13 @@ properties:
           - const: coolpi,pi-4b
           - const: rockchip,rk3588s
 
+      - description: Alientek CLRV1126F SoM based boards
+        items:
+          - enum:
+              - alientek,dlrv1126
+          - const: alientek,clrv1126f
+          - const: rockchip,rv1126
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board

-- 
2.54.0


