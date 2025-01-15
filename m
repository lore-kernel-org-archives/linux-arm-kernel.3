Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96217C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 21:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RygItKIJJDoEUCzJbxmAIl9MdlXUeeZINpK9kjgMTmo=; b=ZWUkOGmExIERIeOtQW9pvB7Dyh
	hWRtCiq4Jl8qzvt85in5BK9kuZrtfWMvOQI9/fXZRmKAhgiq43t5Ko4nadYw4h9WKrFH/C1BY0HVn
	qdpaBiMDDOmLIzOS9aJTaGxlE9dYVupswXNKWtc0NTuV+X3JWTlgBIzcgSSDOQeHKGaqz1UkV7Slv
	dswKLU+HXinf+394JWVqlME7BWBpHRM+agegjL0mo36e/LRxKswtXB4npOWNHTsTa0JzRh3h7lFvG
	Xsf3QPJMRm+gFvVOAkxCKwoV1d/FSYLcwiynGfpHYCkOJWcXTYjWnJKpOfBA5ZkmEe5XhJ1bInE0z
	OjW/cvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAqw-0000000D9Ga-4ACp;
	Wed, 15 Jan 2025 21:23:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAm5-0000000D8R8-2Lrc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 21:18:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43658c452f5so122175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 13:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736975884; x=1737580684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RygItKIJJDoEUCzJbxmAIl9MdlXUeeZINpK9kjgMTmo=;
        b=XOqV/MVZ3yxQD8sRBgB+Ls2gRJoP1Xveqs8IRnUVznlAiVKQh3bTsG2nmdZg46gN+J
         q32nuPM3fWdOG0M4aA3WwMMzMB/qMvJixAguSKNJnOLTnQ25DlHAZFGUQilMSfQtbCIe
         vBf2SYBZsBn9TB9OSg3BotlRP5LPGzzziqeX1vjl/qkapUwI2hEASO9G3I6+uIp/la8Z
         2admhy6WSxFYAWky4Z+M9cTF3+56LNpymY2/oc9r2Ohk9iEW9uPVHgHJRXcZchDX+Sex
         b9dRH/DpJwDhJLe35pz6bzKoynnIy0EOfBBt28bzZlJQXWpJLvdV5vAc4DIAvs7u9U5X
         5dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975884; x=1737580684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RygItKIJJDoEUCzJbxmAIl9MdlXUeeZINpK9kjgMTmo=;
        b=TzwdIkZntDpaH+R6aMmpW4uWHNmhU6BZthS553mo+NC+oHQcd4zjS1F602u7sBFmKU
         CV7iVxHVMvt4cKrjr6noa7AFU2bfqRSycE3TOBrzp27yygmt3CWemR5z7JcHTUVch1Ah
         Z2cVJFBNDjFoHgFx76bOPbKH16RxTe+gb4pz2L5uEXBQWQ2UqTCNin8NyaJQ6L2PW3qz
         2Hpgwc7YbvtoTBKgyc5aFR3yrNgYSbD6vzGbNHZEUn3Fa+KXG2BooFgBM2O5dNRC+Txm
         S3NDF/aq5hsrT/yr1PBM8iPCVInwjfeQkqCuxLwhPpHeOi/eRAQx889tQRL2Mbm/Befz
         +OIw==
X-Forwarded-Encrypted: i=1; AJvYcCVGSwszYMPHkKt2yiq5rFmqholqY/DV60KFrZZTxnSYEYW6+QZcuUVvRVXbk0Iijj75xRIufKNttgyCf1wf3Ctu@lists.infradead.org
X-Gm-Message-State: AOJu0YzZSpdaf0j2VDncX1DSFKmgdoAQvIEWDwK3mp4tZDmWyQiUXtIt
	SYIaTb4zTIxpLMhEe4f//90hjKJmjtCOl70imNwfdxoII645Dgoazki7A+y23R0=
X-Gm-Gg: ASbGncsAZlNaUrbbZPsvWkLLz0w6WG7uLtz9wI/ZHQAUz3o1QogPGZKl7wXMJyS1oKa
	oPVv4+fgxJ6qv4Wt9b+HO0Cq5hZDVvuFGAImUO3fndxMUJ/0LYhmEXYEmv8Lqo21ijUF6laKWFq
	qCphOColsqamzHhvAyPYNKLJhZV2i5FEsO0LJYpGzAIiYo9ZwVCLrBF3UIBxT6ppO2Zd619DHzY
	wXrAmH23vU3TAhWoToP+8086q3mib7fpAZtxh+uCSktEOZZu4B7isNQbdzdVhJTnIO8Si0=
X-Google-Smtp-Source: AGHT+IGsfOhRu6D0LOsuqf3Qj2pk13pONLIyJ5OgpWh66yJEuII6b5Hg8jLGZocLy0vupG9WNXgWuw==
X-Received: by 2002:a5d:64cd:0:b0:374:ca43:ac00 with SMTP id ffacd0b85a97d-38a872e15f2mr11170817f8f.4.1736975884220;
        Wed, 15 Jan 2025 13:18:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38efeesm18992607f8f.62.2025.01.15.13.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:18:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
Date: Wed, 15 Jan 2025 22:18:01 +0100
Message-ID: <20250115211801.194247-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_131805_595461_02E40325 
X-CRM114-Status: GOOD (  12.62  )
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

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warning:

  mt7622-bananapi-bpi-r64.dtb: asm_sel: $nodename:0: 'asm_sel' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index d12eac9b3eeb..9f100b18a676 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -320,7 +320,7 @@ &pio {
 	/* Attention: GPIO 90 is used to switch between PCIe@1,0 and
 	 * SATA functions. i.e. output-high: PCIe, output-low: SATA
 	 */
-	asm_sel {
+	asm-sel-hog {
 		gpio-hog;
 		gpios = <90 GPIO_ACTIVE_HIGH>;
 		output-high;
-- 
2.43.0


