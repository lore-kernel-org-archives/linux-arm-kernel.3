Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02313C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bb0r5Zm6I8Szf8jWYWHBvZVhi8hKX4btISpujVINzRY=; b=BCFEcenOK0zacq8cRjljsj0Oc6
	IeR49zbKGS3u6j2geJn99oE35s7ILRBobXDZLylYWff6pvGvLgHWm+hr//HFiDcHXTYXRdCgHnHNC
	FwmUwr10WTYvTm8kH8GZfLDFbDkhg/8BsG6XNy9hhJ7sEcotzogKwXQldWrfVcxb19umW1bsTa8kk
	PnCFtd4ICdh5GZQAqU7JFVq+I/x/+7MiBQrRgo1DrCGNytb+bfjWuyoyf4LvuFqiqqq/VgNVNgd0l
	5zYb8O+F/HV9ZysEh3uyR4coCRE8OOmXO6L9+o4Qn05Ko5qzjIOSDWJZj+3g3HA+nduApLqjWwiNr
	32lYns+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Xf-00000000uzH-3HyY;
	Wed, 30 Jul 2025 07:48:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Sl-00000000uHa-2GvQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:43:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45610582d07so41126515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861378; x=1754466178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb0r5Zm6I8Szf8jWYWHBvZVhi8hKX4btISpujVINzRY=;
        b=fE7/voXw5Rng5/aGKgvfwQ0/Vlkl6OE2jtTCC2zz+9K8LHHq45/Wy0GNBCUMoSoGQc
         R99WYCUgreMaeWWzsJTUhthraZKeeYVkKZmtQDjRZDUKqYBeW0sUD61lriRiNx/ZFUjX
         AZYCWOFR+SLpy/OgPipw5J7KpykArBm035DkmcoL8SiFfiHxBjGDk5UhQs6HSBuHDHA8
         y+prAH7RE+eAuFABrIJq2K887PvnPLDCa80sdAZhZebMRdxfQpg8OylMSNBVHjqkbxCh
         XtEkcKeVVQ85yEPAeONwLhM4sZFQhfIs2L7Ew7u7w4YX2vK1WCuUEkp7WzHUsQv1GrvM
         IFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861378; x=1754466178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bb0r5Zm6I8Szf8jWYWHBvZVhi8hKX4btISpujVINzRY=;
        b=qkonGP29wJFfc5s8wO/n/5Y3047FR26juERSCrkNd1EREob76RfMF58qBP1c04EzGj
         jbfDrjqH6/v26HtlfelzUYf3QdZKpL6fn050+A8KZlunwX7/4CbBBTjJunxXeIhj9V60
         F7/g/rnnItXNuc9W15R8IzzwDnoiNqnKHq2Yj3jzjvGaVz9993awlp4UtqYNag5SyJ8N
         UuWOV1RNid83oV3dM3y+tW9vfO25/WkqPNsp3GaQZeuRe/iOoZM51zWNhKE6O4HB9+Oz
         9Ex5aAliaryI4jAdkiWmKC0LTLaum3Aw/AXeygyY6Ofo9McYJgqQtcrW5XLbZ9Yza+ys
         YdPA==
X-Forwarded-Encrypted: i=1; AJvYcCVhO2gm0wAcrBfaqLxne4uBDViUwvFmjW/8l6TkesXHwi1CziyGAvTI5HehwD3WFR+WhrG0NmpmwIHqDff937PZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi6z8o9GyA0LdNERgL8F7+AyEXZoMIC/BUyD2oCfTmhf2PV55g
	0HjH2lFEmqFG8Rxc+js/bL0sG/MntPT1A+T4HF6wwHCvUG3VAKuN5wPE
X-Gm-Gg: ASbGncsmQHSAlWa8uXZttbXJk/AZperKcvNg8/lP2Khy8gG3E06og+r4o/m0YIaXkDn
	NPPuotSPmcBQ7lZstRpZ4+HpBc9JRnOvCQto9qkhQccs7o2r7YHQh4NkQ3erskLiVCKpzJLfI39
	REM4/SHxIYrEBb/yjEfkMh5KDhjGZNBZEnIobMhE9umIVoHlwfFbB172LN3PDh1JMu1tgv1iC7m
	bonj6pQnKoNZpgbypqEvmHKpryW4khk4+NGEXZ1ByVwOdNNyfGDyx56GJ5QwMmaiKp79xQripMo
	ADNNQzeSC9cqGeTrEvfq8x80PjllzfdbQhuvDGYMYbhBGEO7J1AM+8fnpOX3A5fiwE/1MBfRfx1
	6irkxR2AZktYEVYAAn6oteKP9/3NThEpkW2Yv8mY6a7u4UCeaL4dKab5RIrF7b7G1Ch1ar0nMqw
	==
X-Google-Smtp-Source: AGHT+IGqJ/GyocQNWi7dQb58jVEqhjDpx0UDaUAhSjg7fFMMxHbIpWchP7IlqvbYUsuUv23KBA/2gw==
X-Received: by 2002:a05:600c:6287:b0:456:1a69:94fd with SMTP id 5b1f17b1804b1-4589956fda0mr8295915e9.0.1753861377826;
        Wed, 30 Jul 2025 00:42:57 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaed4sm14783835e9.27.2025.07.30.00.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:42:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
Date: Wed, 30 Jul 2025 10:42:49 +0300
Message-ID: <20250730074253.1884111-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_004259_577235_BACE145C 
X-CRM114-Status: GOOD (  12.17  )
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

The '2' in 'hsi2c23' was missed while making the device tree. Fix that so
we can properly reference the node.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
index f618ff290..5877da7ba 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -1438,7 +1438,7 @@ i3c11_bus: i3c11-bus-pins {
 		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
 	};
 
-	hsi223_bus: hsi2c23-bus-pins {
+	hsi2c23_bus: hsi2c23-bus-pins {
 		samsung,pins = "gpp11-2", "gpp11-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-- 
2.43.0


