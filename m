Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC3CC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 21:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=; b=EZbQy3AKnYv4sCehBbQy82gWVZ
	PWngYAYt9Q7ef+QkmrcoGzVmlZlnGiBmfLvKqPLzLeOxC5/IjdNb9b00J1sIk6bswO5mUdUh1sr1k
	2TUSJYqoO4UwEZZiVrUNZ2vq88GcQTZi9hmeioeI4CEAyAVKo6wF/V0tlOym638QRdMHNZ0zqia97
	nEqBM7YB5LxjEfZb28hXNX5Zjpc+b22yJPb5UXGLYxjndj0EI8O2ihNwVEij2jx8e+GC1VkAJEzJv
	sdjXlsUFzy/MqnfsGV9JMPDz9ZDXO13CT69IpPyIXTH95hWSj7kGVc5DgbquX8isK+ktSBLr5Rgc1
	GYN9NUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahfd-0000000H2Uf-16Up;
	Sat, 12 Jul 2025 21:22:09 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahP0-0000000H1FW-1r7a;
	Sat, 12 Jul 2025 21:04:59 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2810239b3a.0;
        Sat, 12 Jul 2025 14:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752354298; x=1752959098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=;
        b=O8EHHgF+25S6+poegfrU5++MbBQ2sEGnIN8C2XfZhcZivB+BEkk79ig9ETeduUsxmY
         W1Zksni+gPpgsuv7yybMo/GgV8QJlDt8CNjmb0xFYjnSfZyrUrE/JhKOCxB7B6xPca2x
         QOb5FfY50UAxem6nUIVo1XZF2e1wYH2QIkhq2VHyGowS4VbZbBu9vo+V/fcW17HsM5+M
         K7V7gjfDM4i8/wPcP+DfHB6lIo+4bNJ5mjqsKD9Sj5NxSWebE3q8x+pKDcOEO3r/0XWE
         fA8l6ywdtBkUvHXHJuT04X3/D975bz0/EBhw4R5KHNGb9oV/cpdc7GfN8AU44B5DMCbS
         5S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752354298; x=1752959098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=;
        b=k94LSm4SUrBYJgSyPvLHmQ6N7xINRG1wWk8TDi9w/6rpXoMZikveNVK7YPHfbFHu6A
         ZgwW/Pt6rztJZG8/eqnVzz3aVTX5DyqUtD5D4GfluE8oK5Xyv9KV7vRMTDMO/G2tjslp
         51mUxcqaxQuTidJ1tpcARkfiUmt8gzHFungye3nyetC6rIRJ0kM9QFe1U5FfyYycAIx6
         +iQCamJISOmzcZ65e9+soZ0PpUWQvl6KV0IsgV6fTVn1zqgL/fglvIab+XwhQoNHTlzr
         tKHV4Wv4A+CCqif0KDq91Pc0tATMZY+h7ZRIaSxlo4sUPSFR9F7025yxN5OOBEScP0QD
         BaOg==
X-Forwarded-Encrypted: i=1; AJvYcCUqYYYGVVpjIaNwQfgim9QK9ohLi3yfksIGGhv8Qkf7KXKq/LgfwysxTPoBCqJHuD8/f1M7X18I6P2SDLo+7VI=@lists.infradead.org, AJvYcCWa87rnSMvB1AOilukfhd4c4yp3R/CjJ0qoWyyM2jsm8p6/fZ1sSZe8CQ4bD0lZKWzsFaZ2gd02/Xcq1yYbvRrJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxFg5QrTJKcnvD4YzZPX/poIGlF8IWnhDYo77vaRoL3m9Ziah41
	AjE3ovKKqfS3qU71jWynEJ2vfpCV3fTIHPnatG9uhFTLVnpbs//NezcI
X-Gm-Gg: ASbGncstpeQfy4qTTdEH8eF3MHrnM79hdQtQNyVGIiuL9Ue0EiLewh4biU2td7HzzKe
	/D0gUnfQR482ZEVlkwo8Mjwx7h+qmrb6WJW0KnabAp7ufUWkaIBKjNX6BfrohE2UuMYg4FEnG50
	2P6n18jtrNLo/lAJ5RpZQdzLubh8AQv5SDDGlJaQ9fWukRzX8AmxNLV7+hjCm3pA/coiYLWsaBh
	773+fbzwhSYzoNVKJsnvW6b2nXou1qHd2KiHPyL/ONVhh+TOssmWM9sjGZlFhvSp/mwd5b4h5TG
	nKeFGUEuOm8ib5+LxaDeGHr1glqSHFkH5L+11QyGc46RmXh977+y/H/BWXdDeurhn3p8z/qab2K
	jYWI=
X-Google-Smtp-Source: AGHT+IH05LGizbK3GZZZX/dFXVZD4uKLCLM5CZELt23GFHFB/4CwZk3LskZFmMki9iqIUXWnuhX5uQ==
X-Received: by 2002:a05:6a20:c709:b0:215:efed:acfc with SMTP id adf61e73a8af0-2311dd59489mr17727867637.7.1752354297699;
        Sat, 12 Jul 2025 14:04:57 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5d30sm7988645b3a.5.2025.07.12.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 14:04:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv4 wireless-next 6/7] MIPS: dts: ralink: mt7620a: add wifi
Date: Sat, 12 Jul 2025 14:04:47 -0700
Message-ID: <20250712210448.429318-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250712210448.429318-1-rosenp@gmail.com>
References: <20250712210448.429318-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_140458_481137_3870BEB5 
X-CRM114-Status: UNSURE (   9.48  )
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

MT7620A devices all contain a wifi device as part of the SOC. Add it
here to get it working.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7620a.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7620a.dtsi b/arch/mips/boot/dts/ralink/mt7620a.dtsi
index d66045948a83..460164bdd430 100644
--- a/arch/mips/boot/dts/ralink/mt7620a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7620a.dtsi
@@ -62,4 +62,14 @@ uartlite@c00 {
 			reg-shift = <2>;
 		};
 	};
+
+	wmac: wifi@10180000 {
+		compatible = "ralink,rt2880-wifi";
+		reg = <0x10180000 0x40000>;
+
+		clocks = <&sysc 16>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <6>;
+	};
 };
-- 
2.50.0


