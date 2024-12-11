Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB004E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZXwQI7YS6Q3F5RUIqA6y7OiUdvPTyw1jR4jWoj37sI=; b=dtm/quoaTxDzY84k16beY0FCH0
	LW2cmvaZMYBp8CSAO1F5gblgR2II4PXyDmUAc45xgGg2IAbYzgoC0N78/Y1GBXXyjRw0nEMBYrHPa
	WCJCUW9qR4go04Q4C6FhUeWMwbDf8GYnKqcZYhaKfFYS2nS9ngMedgUjpz5rzaqrr0rpC6osC16yF
	MLiZv4sTsvELI4FfGX/3LUcBpUQmb2i4SFxS62Pd1AwpxN3cZpTSJyetBBD4LXG5Q0nLQ2WAR5pnz
	4ZFyk77QZPJpBSJ14+eplMUncl2OosS8knrMnbQJZL3aXu9cYu0v/XhgVb3lZDfA2oaIpWuox5ozN
	k2to0nzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPd0-0000000FT2T-09f2;
	Wed, 11 Dec 2024 16:31:58 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPau-0000000FSUL-49vO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:29:50 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa689a37dd4so689601166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 08:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733934587; x=1734539387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZXwQI7YS6Q3F5RUIqA6y7OiUdvPTyw1jR4jWoj37sI=;
        b=HA8/OUKNx6F5kR82nP68mWcguNB+tXB+tbqGF1O5Qfeaw/U5Q/6kdnaD4k+T68pqWU
         fcWa3GiprhC3qwbhGSUwcUhAVTUmNkHG+oiWn9TT7/4EAcdRr4Jx1ypgCBc71EyN1ic/
         XPQjRgFus6gMixcfdsU+DVu/DupFPWQdun8fJoAL9f3BQovWl33qy+OhNipY3rQuolux
         SczTL+m+fd98n/4s+JnVzimo8Ck9B4RLLVHlAvaFCI7p0Sh2hzmNSuTA6GFas33Zyc0Q
         e9OP34ku7DZKExOQnUCGe/VLEQUTZwbmWhaJ4jSjiaUDhBxO98SUhkp0oA1cyvkjgLWg
         qO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733934587; x=1734539387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZXwQI7YS6Q3F5RUIqA6y7OiUdvPTyw1jR4jWoj37sI=;
        b=ZyqFI+gYoGq24OO2Whi17KzItyunhXHpNmDv+cqrzCvYpbB8r5egA4x4mFJbpbTdxE
         hxp7fg2ZVKnnAEwBv8YoK++69kc3rTvgdbiXvVZbbGZ6M6inceAYKm3aQR9agIafeWev
         c3J06c9TkqvdpaN52xYxZdQQ0E78ee80vdxTqcObgqq4IJa6eoloDSYUUYJWdEEvQwzP
         KV5NJaNvqxbiuqa+AYSkSWNTBoZEWiVFj5GpR4T1AZkXcyI2pjY1+V9yXg46l0iy3Zaw
         BgqRO7J/lITsbSuG7zsLKjwXSle8m7txSmGwoBeJfM5XopdadKtFLZVPV9Z6ghexgy4J
         CMsA==
X-Forwarded-Encrypted: i=1; AJvYcCWMY0fWIFLbLwV3Z6SRoPdrPui24Uuj/D8m0hDfXWFXcAkes/ONn+x6j+hPYUqEXFEj9HiuQHFhxv/wsIauwT6M@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Xl+gtH6U59xZnpVSDdxFiwo+Miie4QItkP6xveWsm7wD6TLk
	MREMkD9KCtq+txvjfFXwZYPx0TCk1b5GhKZQlKfk9ONBBycHUPdo
X-Gm-Gg: ASbGncsn4S1aGM0/Ja+M18vLSvUJ/UorAy5dBUSZRpdGDmkGh7HzciNXfbkt436uI7v
	y/L9e7nx5bhEp/5IktQz7YG0UEqsSWI8j3KNjQJSwlYKyEBbzXmUadbx5T8MjUE9zJwlPLh1Dd5
	08Z6BrTAiwnX97oV+cWduY8RklFlBeKUhTGVAUfwn5eO55JpEsSW1EOIHyk5W0nxHZ9/CJbd3Mc
	Os0HBs4mcy23zIcA1ZCu3Zvg9o4jR1AvJmDkM2MhZdQ4Gu0ueRXdKOBTYFWeUBnVO6yUT6AjtRp
	K92Di0NDh6YEvTDwPbpC6SSaKLGy3A==
X-Google-Smtp-Source: AGHT+IF89Azw7R+LBtZ5j/GcwiiT1UcuEZB17VWqEacuhbhtSs2qPWqHLMZjnAqNMgw3+9T0X8dl2g==
X-Received: by 2002:a17:906:59a6:b0:aa6:c169:4e21 with SMTP id a640c23a62f3a-aa6c1694ecamr50424066b.6.1733934587197;
        Wed, 11 Dec 2024 08:29:47 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa663334906sm678451866b.72.2024.12.11.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:29:46 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: exynos8895: Add a PMU node for the second cluster
Date: Wed, 11 Dec 2024 18:29:42 +0200
Message-ID: <20241211162942.450525-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211162942.450525-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241211162942.450525-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_082949_024758_A4BA4B08 
X-CRM114-Status: GOOD (  11.97  )
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

Since we have a PMU compatible for Samsung's Mongoose cores now, drop
the comment that explains the lack of it and define the node.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index ee393f4f0..90b318b2f 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -38,7 +38,17 @@ arm-a53-pmu {
 				     <&cpu3>;
 	};
 
-	/* There's no PMU model for the Mongoose cores */
+	mongoose-m2-pmu {
+		compatible = "samsung,mongoose-pmu";
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu4>,
+				     <&cpu5>,
+				     <&cpu6>,
+				     <&cpu7>;
+	};
 
 	cpus {
 		#address-cells = <1>;
-- 
2.43.0


