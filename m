Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BA71093190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fCSFArSeRGuw+2+Xzv9uC9S50Pu154s6zyJ30lpqjc=; b=qxwrpLAlsQqsb7n9oXq+3RbyTP
	DxzvugbzEqf4Dnh77LTsWpEgyN/13BnMoONpsgDssPpsOWHi/yA4qOQBtEsPjS9IC7Se0JTsXGB5P
	9HfmLRi16Zl9d+pQOF20U8isQ6Mkl3Prxpd1j1o8D1X1TgVISjP4E75fUOA6W1rmXoIAIX6LYtaY6
	AiQp268XNMBqVdFfcNBhES2Sr5d0KvIDCUBiIoIAGSs2o48o5DXMFysJdCJ2ZaZgYi7obuFaEXD9s
	1DaM2jtBYBAA9OgtjW/MzhgLyM3dg/MLBNuFxkI6VP4EbM+fJzoJ1kOYPQEi4hblcR6Ye5tTeYUpx
	6sYPsVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSy-0000000CNum-13GR;
	Fri, 20 Mar 2026 08:44:24 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSo-0000000CNkZ-01sQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:15 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c742d4df00cso663860a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996253; x=1774601053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fCSFArSeRGuw+2+Xzv9uC9S50Pu154s6zyJ30lpqjc=;
        b=KfnCLuKoMEFaafWiD/vHuB0gfrVD2CqNmfZUVtCv+7z7lcEMauj0vFjQW/1fBgF/Uo
         rVv9Yjvk1m5azUI+Sh9iP3UTfGi/ppM+bx8YcotdbOs9jMk6Ze/K22brHe6otwYHPuIg
         foc5sR2SEGDHk/+c+VyENDliEuyNj+z+AK9dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996253; x=1774601053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5fCSFArSeRGuw+2+Xzv9uC9S50Pu154s6zyJ30lpqjc=;
        b=NN+g79ub7QVbxLUFvQ5BPmE6h+MoaTrc1AsLzPsorVNkvsKw2b3xwFKxCXc791Fp59
         0dER1jBGp4bMj7zjJz7yefa8MbJwXFxM5ccN+9UMtb6fr6jLe4K58nHHr2073yRmxOOe
         PchyRXN2Svj4HhEc23DPxwKE/H7oRwc8OGYPM77u9KVHY3wK3aTYFg3lLjO2ijybnoXC
         hQPRoDOMkxYOOQocUTV7VFWNcawVPrkDhU+8++UAw/JMa0WMEobdVvRKrj6ls1m2UZNn
         qkshGuR7E/BZ/ngIJt/LuhJgjpsxQtGT4WZYKOOI/WvDJxD/pTVseTSHCXAZBBeKoNkd
         /86Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZNTFh7XvrodG1zu8AUn2N02DftNV/upYox7NE1EnQSa4aqYU3lTYgRI+EkC4a/gdNWEArWy/tbD93AastzNL7@lists.infradead.org
X-Gm-Message-State: AOJu0Yycndk8Dn+rL59HmlFP/l1qq0vBklpEoB8us4JVf9TMXDxDi6QB
	eSt6OnQaiYE+wYXWg3cO1srYRD43kgZzXaH/PXANGJTvYyGOMcY98rW2Gqt4PFPg8A==
X-Gm-Gg: ATEYQzxvQKsc9D2uBhhtI56sH21/+h/xOIbd4B2CFqZJ6UettJntxTSCNDjMt231wsd
	OHUHkE18qE8EpXwNYe5klPjAFWfrrDekMFvoDC7IPXipGobsQ0IQi7PuIKEWeZ6/YMPHptkxWWN
	cT4q7HFLMeX9Ahbef9Pttclp8c74Rnzt/MGQDEEohYuZusLQD3/jPYHLWT8tsjlOGhUfRWO+ePU
	ajywTnG0wV5YeJ44iEfGAelnMcQ9+ko2UKC8JnP/9FEPdzvqXiRW9YFojbHFQEJhDosTVhwrawg
	qZxKm7L5WTVH4Z089KTnXla61ku2IgSoKyYwM85RaSkojt6UyBuRu5ky/XRQNWumn3KudF3ndou
	h4I1u4IRVsX22X0pe0Ayqf0p3OLy2gQTf/31fU4g7NhQNH+UDn8Mb5Vopozac7ZjSyTES09ITVy
	uyeS3q5iQkeYwRCdensPxY6vVU7DtZUgAHrhtPZI75OLCiT02g3SSZgMVQORXw6BbX9ZukC4viy
	mwjhfoK
X-Received: by 2002:a17:902:f683:b0:2b0:5722:f89 with SMTP id d9443c01a7336-2b077143206mr55106235ad.7.1773996253228;
        Fri, 20 Mar 2026 01:44:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:12 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
Date: Fri, 20 Mar 2026 16:43:38 +0800
Message-ID: <20260320084351.2461060-7-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014414_042729_BD1D3748 
X-CRM114-Status: GOOD (  11.11  )
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

The device tree for the MT8192 Asurada is missing power supplies for all
the CPU cores.

Add supplies to the CPU cores. The big and little clusters each have
their own regulator.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index f4c8c3aa7a57..143f7f4161a8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -299,6 +299,38 @@ &afe {
 	memory-region = <&afe_dma_mem>;
 };
 
+&cpu0 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu6 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
 &dpi0 {
 	pinctrl-names = "sleep", "default";
 	pinctrl-0 = <&dpi_pin_default>;
-- 
2.53.0.959.g497ff81fa9-goog


