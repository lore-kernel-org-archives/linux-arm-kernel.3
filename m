Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A1B1093190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aR24nRcCaE/rLy7RyBGgujkxzzBF1DIVho+ovF6igY0=; b=k5jfd5XD+xLLJH3eZHsT5TaATe
	tJef66nZz/AZAtJMZIxJFaRzRkDME41/J7Nxe416kAIop6PmLmFppJVuEVWSB/uuGwDxUE9cX1zDH
	doCJQHW8B9OSfwv73mR4d/yqtV9UhHL8qiVYcmNLTNOCho2uN4ZCGTY/hUZfE3aplQXdNWIPuyRC7
	61rEeUG0TLOslICfYGZV7nrqweKu4DqFnpel6g1zZQFm0HDlSsdvqt9ieH3SQpLy1utqONXgUD7j+
	Vr+JP2iuJnmZylDTAXcGYVtMSO3zth9t+L6qw2J8n9qSC0b6LZCHg5YgjYDUmUXHPHr7toL8Y8bCy
	ABOfC+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSy-0000000CNvp-2uvV;
	Fri, 20 Mar 2026 08:44:24 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSq-0000000CNmW-0L8a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:17 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ab232cc803so1514745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996255; x=1774601055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aR24nRcCaE/rLy7RyBGgujkxzzBF1DIVho+ovF6igY0=;
        b=b2QfDxyuugqoznW2XkUAoscL5JitgtPYqiVeziicXSJcoYt0yp64bvPAjuL2AusS+4
         uh83bfb5QvMMV2x7eV8x+ZG+UTMs1A3lizagSIdI3cI3atwhCR1ndsKwJy8vAanQ1A53
         EOHcj0DM3pgJ5ig8QckO9YYlLMb4urJyN99lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996255; x=1774601055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aR24nRcCaE/rLy7RyBGgujkxzzBF1DIVho+ovF6igY0=;
        b=j9ASOlP6doDY+ShkHYzYoJiN3GO00iZr5CaoqtPUPreOC+nDSYahjJj+8Am3BRp1PL
         rU+lHbqIwsdqzeODk7vCc61epMElTfHJWHxaU8N608nePwxrJK0lxESrJatA2ldmKzVM
         ihZS+1n3GhehOv1F3JmpVdG4tm8vT0+v47JwR6gwnE3+f6yCiFUFMHKSKPV/Npmd6oYw
         x04tVnmx/YWUz03+JR+GZ1FBizTa24YOEJAQOAfCwOgmHoRD5eSloACoNpXXqIabHUGb
         57rm2NS0NzCu0A/X/yGf2XN/fhRuXL14L3R9ikruTaSifw2vU4vlMDqz9m16Z1AyC+z7
         iK8g==
X-Forwarded-Encrypted: i=1; AJvYcCUeM14s/Y7m00kbG/GlCu+LGQffB85wcNqhzcgsSYiQwyHQEcs0wAhftuagL5tSlaRS/kB1WaG+TsLkK2SN6Mhh@lists.infradead.org
X-Gm-Message-State: AOJu0YzSAG9E3/JCTdAa1wX2rvGROYU/9bMEoc+R02B2sOvwbeTkTkPg
	Dm2JUzbIg7gsBARg+8S5s7Q2pZSE0IUTUMSf6zWcJxR5VXHCueZnXmg0plsw1OpuSQ==
X-Gm-Gg: ATEYQzxx5FwFo/6mpJRGWGMarUQpdkIbFWfWisZg2pl66DWEDEABL7Dd6wW40zsLhs9
	4xVmuBnKUILcjFY0lodrpAmDmLDW6bno1edyGXtRQnK8rv0NvgDqt4YP7Wj6ERQ41tlTN6/36bT
	ZSiqQ9GxcTGjWUvkluFVTRnc3Jeh91QkjEMw8rn3f9DP4gOacYzlD5ZAofQi9kFfSm9ZwUGmk2G
	HbLcRZx9JoivFEjpwnIhoqJT68S42UYeblP8CKnsip1Ony1LThVZL8b2pWV+2EKeh7eL6mJJnIl
	HurjGbr/Bj85z6ifvz4U616sy9Mxasi7I7NrpwYZgNmGNHaYVuSzBjA2fhOgPHVXnFx6FlG7+Pt
	qPlrL5XK4o+YqvSALoB59HNFV+BaV9o6ykUE6YC+p5+7uN9fQBDYP3jR/JCFmV0vqOCUlqIAHpO
	ToWOytPBGIuSnoyUVMWia/rSJvvu+6zsaYAh1X+E1iUoP9P/7CCn3DWV+zgdMAyaIy2OmRlnf/Q
	CyieE5V
X-Received: by 2002:a17:902:fc44:b0:2b0:7026:24bf with SMTP id d9443c01a7336-2b08271d51bmr20115235ad.14.1773996255498;
        Fri, 20 Mar 2026 01:44:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/13] arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
Date: Fri, 20 Mar 2026 16:43:39 +0800
Message-ID: <20260320084351.2461060-8-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014416_664147_78B21237 
X-CRM114-Status: GOOD (  11.62  )
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

The device tree for the MT8192 Asurada is missing a power supply for
the SPI NOR flash chip.

Add the supply for the SPI NOR flash chip.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 143f7f4161a8..b71c4c87730b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -660,6 +660,7 @@ flash@0 {
 		spi-max-frequency = <52000000>;
 		spi-rx-bus-width = <2>;
 		spi-tx-bus-width = <2>;
+		vcc-supply = <&mt6359_vio18_ldo_reg>;
 	};
 };
 
-- 
2.53.0.959.g497ff81fa9-goog


