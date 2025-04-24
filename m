Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4584FC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0naMJuU9gAe+qN+udfyQSJ+gDe9HTRKDpMwSOS1Ylc=; b=1hQB3vKh2k/U8AZ9L+n3YNWU3D
	95SlJAro8C0gaP8IX0Lc2EgLRNV6c4P6qOzH6jVCOO0dXEzWwEZfuA9y7ypXjtDL/mjb5Q2Dk0cBK
	qCIQfIWlET6f5+d/r+8KHAfTdBgxQNOFpioOD7fHO+lq+mDmAUvqvOJTlhsk8sBcR39ED2d1Lv/YC
	yNfaLWtepni/YOpIJFMvwBt6RtB425ta6zuIzZbOl0xzI3bHZoj+JgjL294OK5LQNNZbSYA4tEqCx
	BuCdB5urCzbeSr3F180AkYWjgNOZ9ZcQEr4zyIeNhhiQ2qoJZu+Z/teHgcb3O6Qjlc5fXOZs2qYtO
	Xm8nzOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v7s-0000000DvAS-1fv0;
	Thu, 24 Apr 2025 11:52:20 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sFG-0000000DOnr-1eVx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:47:47 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e82396baaeso126633a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484464; x=1746089264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0naMJuU9gAe+qN+udfyQSJ+gDe9HTRKDpMwSOS1Ylc=;
        b=fWcagKp61GS1O/ZiANohCE9UapfAeLd5Md9FeBShGkC5hAjy+i/1EHKdVq9ziJjPd9
         sODZKduHvz7qtX9WACGms1zdJ2e3WSrH8uIRoHWnTr/AeRLBIFsg1gfgDx0D4FDej1Nm
         +hWkXLnUIdgFtqVMWhL1T/vX84ywJe4pQuhgyXKizFBsqwliC1CO45RVyxnqVzDpGJ+I
         SJHttd3yJTW+eG0BW7KvnrDH8NCKZZduD/YL3H/7kijYp1BTTkGPNr8q+HpWoRZB2soX
         /JmzYVoGK1zcV32k5DJ9yGcmI3T7zD48U8q4jdHvPulnip3w5z1dy3rSQfdNExM0XGxA
         m7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484464; x=1746089264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0naMJuU9gAe+qN+udfyQSJ+gDe9HTRKDpMwSOS1Ylc=;
        b=gV45Pe3R2zvS1uboCungue2BY1203lFPjepivCXgJ6sfEXbrSgMMvMXzawDfZWNsYI
         uPNVx+vVpvYQW0pQ6RVgQtN1TOi6WXNm6TKQbkpbyvm/qPBKJFJODwW32MaXv9kNrOaq
         YY+KJCOgemIfMMrRj/3qhm/xD735bazv8zUFgYNSuTxW8ZP0kzcFXXVNvQ0aAZPHC/6F
         c9MbmgXK4TUMsO3WRVx0EY8HZJXKXynPVFo/DRKDFtchXpm/pxcDMQze1rW9+P+dtQYj
         IVLynTNsA+fuYKz/0OtEk8/+iZUbFS7vAs4s43jEl8vm+9EDGYNdFJDdSGsRrO+2p5st
         EZuw==
X-Forwarded-Encrypted: i=1; AJvYcCUNAaGBtMLcCwrbtb939/0pVl+jemCNFnbY5ekcjQn6aAaEKieDtybza1FLKH1jW56lW0y2LeGMOr1Li72zsZs6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3PkpkTgod5lw91eKRNH/ZkFnim9CA/+ZFIqaqsmOn9MjZNG10
	553a2UaJhKJ/fiuaJnLpEgT93EIQqEIGtadaOQyXT+i2deuY6yhJxHQLHXX7gDs=
X-Gm-Gg: ASbGncuc57SU21xr/q5m9NG9VCtWcxmAiIXx5jy5lNk9J1L4HDynPldynCxB3wlP2Xq
	8bodUI1KQusRq0tK4w0BQ2+gDXQxIRp8iQKHyEVnkGCTjFnToCZkglfdO9ZlJT8P260XbzZdGyc
	+o4P9baM7yLtMElEOndCdVOcy/4Fgns2TfobGVFzXU+resZ3ePPKx26A4m2BR2m3rGF4mX9eZMk
	4rSediO6blI3D3H1AnOgXvJigHMI9yF/2JXRPGEPdwJnZnSbb5HSoeVtF8y9tEufTcJdiVOKgUA
	kcc+KiA/37vcYjkCnY56/4V9YHApZ6wCQojLxLVEHTeZjYkCsg==
X-Google-Smtp-Source: AGHT+IEqtIDEk3bgbvlxAZRptnb7L3v+POmbybrom8KtYglKCBdm5DoZlFBkTfsuHhG8/g5OHyFgfg==
X-Received: by 2002:a17:907:3f0f:b0:acb:6464:5f9f with SMTP id a640c23a62f3a-ace57220445mr58086466b.3.1745484464256;
        Thu, 24 Apr 2025 01:47:44 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830ff3sm71378866b.7.2025.04.24.01.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: allwinner: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:37 +0200
Message-ID: <20250424084737.105215-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
References: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_014746_430987_0AF560C9 
X-CRM114-Status: GOOD (  11.65  )
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

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  sun8i-h3-nanopi-neo-air.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
index 6d85370e04f1..9a2742363cd0 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
@@ -94,7 +94,7 @@ &mmc1 {
 	non-removable;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&pio>;
-- 
2.45.2


