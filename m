Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E067C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSScOVwhUO+K0/3KqN7maXbkfUTR6/cC4fz9TlS9l30=; b=RObOK7WoOm5uVEHXd+RweOhuUa
	BotD7VujPm24/+W3S9jkVx1VQD5lx9jgHo+zj/CtCYjz8OFvZSDsnTkiWD6srG8m6G+eRMqKj8Pye
	RcHmU+0dzoen0exZ1bNkvWYsuE4V0x5cJY4UpmZQrkv0ktoabIMJcnTWkUA+XS8X9sa5tdTZtcyAg
	4UbEN5tHdiQXfYL1oIRP8lp4sG7RgedAaDEJm5iIWEX3Saz82WhZitjZTJeTm38CH86jruma4c3Pd
	GmbCMqID0lm5kZitbvJ+Ge1wnCZ96uwoguPCTKRKH8Sfi4Cn0NEp6ipEYaL2TVPI6CbAw/eFUC9VO
	G1ov1sig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ver-0000000E24z-2fE2;
	Thu, 24 Apr 2025 12:26:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tmF-0000000Dfbm-3j54
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-224341bbc1dso9313835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490355; x=1746095155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSScOVwhUO+K0/3KqN7maXbkfUTR6/cC4fz9TlS9l30=;
        b=mzfaIMR0BXWHld/TNlkseSxqnFEhU2mFApsiuw30sdU/zP1niMtHEfSqV2EZMcJH/E
         T6QdnRbl/LH9hmGHUmJH4hcr+jZnQGp6q6eOIlEQv6P+gF0Ohq1OS5jAhiZ6e+4oGpjn
         bZ1xu/A/i+85e8B5p4j8f09+rMJ8SernmYjFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490355; x=1746095155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSScOVwhUO+K0/3KqN7maXbkfUTR6/cC4fz9TlS9l30=;
        b=SpBx66I0zVqioj1jOMspbiUwC2lmVGw+0x5d0PRRSj1BAqQtXOmJ/m7+IrxUJDySfb
         fAHF2A1PtvINwVwGLmXGMNcgy65B4EWEk+fVjqNiODxAoqcHG5FMOb8+ZkCcexydU3Gm
         89hZZlslrIZhrFNYE5jpXsaU6NW2qiFl1H+RzXH2aaR8DigMAjXMi/FMqNUEgOjULZf/
         6g6eNyv5Q32FJqyNVnqHSOmyAwhHvsfU2hL7vOsgNCAZfEj/ClDxIQ58uUyuWZ2zjv5y
         Ia0rXWEo2H95kk7LO18k3br7YUcMXiHp7gnZj6mBYVAPVWvYroziw5SrT1hHXFhiyotQ
         dn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdCs7YrlICibmWVHkU8yyn4PShzqd/tNB+m2wsPfCbsvnJ4tjE6We7AjbOGHR2xU52VkzQXwE7/rmnTC+iaPgG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0VxfBCsoVAfW5L/2jV5WcWnuZiKZ5iAXpnnXKZBYT8jg1/Z7C
	MuO0d5cHMufDd+WyLy4elIwVIN2yMxNZoUH3IHPMCXUDfbkV1byD2pfx9XWEfg==
X-Gm-Gg: ASbGncuueOLE045kbchLGNcsU/8ITDUQnQ/Z9BaRNToFvvACNlVQuCXO0GeorCaq6OG
	PYMv7hICK93XR6ujeX1XXPVJVvu+KHx4JvjikLuCMJAWqqAsvV2N0YK9/Bw870qnIvDJJ001m2B
	gupw9qyLrYYU9uf0NNXgNwzuUIn9bTGqUtl+FWOlLmc8QD14nRjR4m5fJp4PJsKWeYHSUCN4Wrf
	tqUy8rHfomDgfDzHgnarftonwkB8WBpMTKv1g4qILMh/LUzD6ABfsiPegWLbKjUMKhChP8JHLYu
	L94H65fOUIF77xsq0AoLGjH3a9AAEsa06L7sr2e84t2aysPIa+C2UsaXjQ==
X-Google-Smtp-Source: AGHT+IGVWgP+9f44cPO1R7mfB5z1uFUey5yQnac/oTnGNxfAaOr9FFOdDrHbUFBI3ie8mEMC8Jfp1w==
X-Received: by 2002:a17:903:17ce:b0:223:5e76:637a with SMTP id d9443c01a7336-22db3c0e722mr27960035ad.23.1745490355124;
        Thu, 24 Apr 2025 03:25:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] arm64: dts: mediatek: mt8183-kukui: Reserve memory for audio frontend
Date: Thu, 24 Apr 2025 18:25:05 +0800
Message-ID: <20250424102509.1083185-12-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032555_939256_AC98B2C8 
X-CRM114-Status: GOOD (  14.56  )
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

Some MediaTek platforms already reserve a small block of memory for the
audio frontend. These platforms reserve it at a fixed address, though it
is unclear if that is due to hardware access restrictions or simply
compacting the reserved memory blocks together.

Reserve the same size of memory on the MT8183 Kukui & Jacuzzi families
as well, to align with the other MediaTek-based ChromeOS platforms. This
also helps with memory starvation as these devices commonly end up in
low memory conditions.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 0fe9f2d1b912..00b97cfa0eec 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -85,6 +85,13 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		afe_dma_mem: audio-dma-pool {
+			compatible = "shared-dma-pool";
+			size = <0 0x100000>;
+			alignment = <0 0x10>;
+			no-map;
+		};
+
 		scp_mem_reserved: memory@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
@@ -198,6 +205,10 @@ tboard_thermistor2: thermal-sensor2 {
 	};
 };
 
+&afe {
+	memory-region = <&afe_dma_mem>;
+};
+
 &auxadc {
 	status = "okay";
 };
-- 
2.49.0.805.g082f7c87e0-goog


