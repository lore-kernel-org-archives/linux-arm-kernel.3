Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BFACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FV+6yoKv/P9OgvlWPQKcQD99p3mLWnHYMK2iXPsZM3o=; b=L9YgcIqcr6IQWX8i9hIio3Nv8N
	BU4NhtJzSK4YaK9DQxlnwUJWuxbzJoLBAGfcS/B/E2pRxnFNWmuuZKgiE8inUW4hCpmVw8XHtQ1AA
	M+0R8ndo97gmKWp7Xm0D/GoOA/cTUTW7tZoYFa7WzJWzhRPsxxX5xlQ3yDyEQMkipFclrUPDSbB+o
	zwMPsiDNdKitJ+63cMJVUqJcoZh+n6Rn3ZC0I9ZodMHz1r/xlDeiNBlPjpsOzlwypeqgxkPmMDfG0
	qzVAFqlPFMl1rWM5ylQjI0Bvwxv3biO2aobhRI/HIkOmezV3/gWXNlyyaXWf2fGXT3fC9/f0kGs9Y
	+bfMdCXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CD4-00000002MQ1-0eYi;
	Mon, 29 Sep 2025 11:38:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CCv-00000002MIl-4B1m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:38:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46e4473d7f6so17576105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759145896; x=1759750696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FV+6yoKv/P9OgvlWPQKcQD99p3mLWnHYMK2iXPsZM3o=;
        b=MQ1X2LEWUC5KKOMVXFx5PNvYGsqDajjI+LjH3EJsc1B48BSpT7V9YNrj1yHI0lAhVw
         FdUlPHNMA5+SqdPaLUQSK2cReFqLIaa1lY6IBNjcyt2ANrkbX7+hgN9x2kqx5jE4w++f
         OCNIXeQn8/DcPKmLkRT8t4MF0QQxmqiH7WGpKh5vNCRAvOl8mfPPSyaedKXZLpwo97lk
         N2JwW29GBpbiZb8KEfcYBAx8EoIa2NVZ8daO+vh5gBrUIoqSRBZF+ZfcG7cdc3G6RghM
         Vxl/dtYnolz/g/4g3e1kWgpDYDiiujKNvYn0tFyirtmur8HS7ZAmIDQtJ6wYlJzIx7tg
         tuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145896; x=1759750696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FV+6yoKv/P9OgvlWPQKcQD99p3mLWnHYMK2iXPsZM3o=;
        b=b2EpImNG6mV5diO0TgNnJAqLFE9P0wc6VyaeTGdB6bZf/GLoZT2AkVhOutLGh8vPCT
         MYgvTJL9+NLEM8FQf3znFezLKdWWmutjYNuo6NRSDXhXZjNTSZfmOmJ/3z8WhPwmAsHX
         fWd2N/xkTw3sSgpVqKNgp9soFNnR1L/zIlQJY0Kh6kpz9fVgrfqnqIgEzY2SGismuVgh
         /HBxCYl6/qWIiGbur0T82f4E3dmeccCozJV6WWuQjMlFiMurvNYOu7OYjdIax0XUSUXs
         4dwbWknw7QbLwFxNqjd2Xiz2FM4XDxI4xr5QSb/XBP5O2W3B0aC5z5v58TdvfqYlEvUf
         pGGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCmLMG371tRhjIQj3LzY8YvraKyV74T/J+F3yMQMXkVqWgsAVd1B9i+L4wnHMr/g9Dg9hERKxIdG9vxFQY1Njp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx71RIrLw/pxLnFPVTQj3hiD9tkmxZr2uHaNu1Gb/CGkSeLYfZa
	mQuOttDRK5mGzrgOtDV0naEespJXdEBqKRoR8P4CoA4gtfQvrzO3mCcZ
X-Gm-Gg: ASbGncsNf0IwamyZwosTBmK55HMSjDk0IA32GJ+4FOhgNYssMVetxJndm5wrANs6IGz
	1YB+wnn8VkzBol0GvSObHyOqwgZDWRIHsNXwy6vivF1CMfjXPXZUnWjifMXCD689QR5HG+TkOzq
	r3YxGiYEjXbk8j2hBSyQANYpCIGHT2BdnWUla+RyJh4j9Ix8xycblimpsDFSh2PwDi4eyN8a33U
	MV7pUcGXbT1Jc8EI/Qc4XyUjIgZb9IQegoztRkmQfH3tAOvP+2u3TkpZ5ZldoSeAfNAM0sc2IZP
	zTLxAUQcz5+EUZ/0/KwHYhuD+uRHHmVeKRfi2wKXPRlmtmJPOI377S8KLorveL+o5VX+sM+NntR
	v0WqtWyBODM24Xfs71I6CeOHhY5ZdsQKLGrzEngfZST5M8TWxeUkMhx8j0bE0VUoZ36mMj3rxtU
	n5rxtefQ==
X-Google-Smtp-Source: AGHT+IFI4JCC0CS5i7fI/P2/bpr7mkkJzs2jB30grNUffEVDg+ZThDdiliKzuAgxVdMuS1kcxLiNLw==
X-Received: by 2002:a05:600c:3149:b0:46e:46c7:b79a with SMTP id 5b1f17b1804b1-46e46c7b979mr68799125e9.2.1759145896077;
        Mon, 29 Sep 2025 04:38:16 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f53596sm9502465e9.7.2025.09.29.04.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:38:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/5] ARM: dts: mediatek: drop wrong syscon hifsys compatible for MT2701/7623
Date: Mon, 29 Sep 2025 13:38:00 +0200
Message-ID: <20250929113806.2484-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929113806.2484-1-ansuelsmth@gmail.com>
References: <20250929113806.2484-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043818_047736_8041BF4E 
X-CRM114-Status: GOOD (  15.61  )
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

The syscon compatible for the hifsys node for Mediatek MT2701/MT7623 SoC
was wrongly added following the pattern of other clock node but it's
actually not needed as the register are not used by other device on the
SoC.

On top of this it's against the schema for hifsys YAML and causes a
dtbs_check warning.

Drop the "syscon" compatible to mute the warning and reflect the
compatible property described in the mediatek,mt2701-hifsys.yaml schema.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt2701.dtsi | 2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt2701.dtsi b/arch/arm/boot/dts/mediatek/mt2701.dtsi
index ce6a4015fed5..128b87229f3d 100644
--- a/arch/arm/boot/dts/mediatek/mt2701.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt2701.dtsi
@@ -597,7 +597,7 @@ larb1: larb@16010000 {
 	};
 
 	hifsys: syscon@1a000000 {
-		compatible = "mediatek,mt2701-hifsys", "syscon";
+		compatible = "mediatek,mt2701-hifsys";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index fd7a89cc337d..4b1685b93989 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -744,8 +744,7 @@ vdecsys: syscon@16000000 {
 
 	hifsys: syscon@1a000000 {
 		compatible = "mediatek,mt7623-hifsys",
-			     "mediatek,mt2701-hifsys",
-			     "syscon";
+			     "mediatek,mt2701-hifsys";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
-- 
2.51.0


