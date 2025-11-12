Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61338CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsvFfAvlWLWUNByqNFGDgf521DahJAyf+bE64GmioBo=; b=isuheigybwxq/lrJcybuS0P+LJ
	85rq7h9CDK9sSzUJRTwgkoeDX7XaU+fQfq+9wYUuOI5SlO9ctazMjMzRpfXKlAs8dM2NA0HRgIbzL
	QLMKYKwpI4HRg5H5QekkV8VDo80bEjx9+NcyhOTD1zrri+pJZdGCrzItfw4qFGCTXIiF6UosVf0Y0
	FVCooWiH450DGEqPzUGZpLR4pAecbnTaC+kQEEkkK09Dc/T+Ge7UfwBYdn/K0uor5vzYr+eigQRTh
	x6YeimDZL0bC2/vPyesZWpUxZ73tM7kGTmo/8+yPNpMyE7O96zRfPNZAMEVlh6hhLCaYJp5Qj7eLS
	AlLA2PbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86W-00000008ZNo-0Gu5;
	Wed, 12 Nov 2025 10:29:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86M-00000008ZAJ-3kaY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477774a878aso169005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943361; x=1763548161; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsvFfAvlWLWUNByqNFGDgf521DahJAyf+bE64GmioBo=;
        b=Na2fqi79RPOQe4Jbx4Qk2JnffZITmfvmDQyPjVxKPSdcUa7e/SR/w7+pdGzCC6HqqY
         HhXlFIRKVaONrjm1EZrTl9uHtr21rnsj1TlheNkWkMzg5yEG3+nYoBEXR/K/gLDx8cDh
         ch5MF5arbtM8XowhQaZKZ/y4q/vSQcZtOyiDZkT9UU2xAhYzwt/6f1xf9HtYzIuAyI5i
         U49tdagPeWE+mzUNw/L+3n1qKBib812otC90Mpfpt1JGRvypHVNYIoJAf7Ula84TlF0d
         0qygZh+/NS6tVqeNHiwpEDcovzgjybQmOwFK/lQl+1VhlAkjW9XiqE0VNdtx55hR3BOh
         abgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943361; x=1763548161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsvFfAvlWLWUNByqNFGDgf521DahJAyf+bE64GmioBo=;
        b=Q+X1bKcDzakNArntc/aULR1cdsrcfSoFDGCKhNky+/FVGFnNtShjNg7SNgOnK8ZAHg
         x5uKUGODe2qI1Q7h3FMvTHK8wxSl0N8zOc7e7kf5WsGFYBNAagDwz+VlzxfsAiieTUA/
         BF0vcqk1Pmyu9so2C0EZHgWpCL4aGh8KHFSRL7f3rysvFTK9wPDsJhIVG5ErcjBdi9Fe
         j0aagsMQAN930+S9gTS3GbZ+6Jxl6lRmTh+rQpjZ4bsdH/mgcHGUvcWwJB3bzHd/DIO3
         cxo7PNBV3tEUf0P116Q8vbbZCqhq1XHiiT9/4zDIfJee1ntAktRkfmO/6+Df7STKeVEg
         Ev/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVC5vsZ9Jgq31xmPqfzjrsVk067MzK2oR++98RFmc1mwzNHhw8Pt4vIbQkkHeoSzhTC7O5a0ODRegu+0SyfG2eJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr5EQGU4r2LtY5pr3sy++M7cSdCYSAwtEzJhJg7cRy6F3pZfnO
	oJ1Be4ROWrfujvQlJXRtFgHGqvUibzJiMxW3UPtHv14sWh5uHzvNlPiDjP0qIyV6CWE=
X-Gm-Gg: ASbGncscDBHJc8UcJJvDlv+/6pQT2Z3j23eNpknzRu1M6n1zA1xeatGtIi3e1CVnXI3
	w0V5XTklZ2l7uDSCcGdwxIXv0fZiSgUW94PZ8P0seAlqiUxN/ZRHAaEoIX8C3UzVt4+eNDW//L3
	TTPfxB1aOS6FG2bXjTUBzLqug7qg0SdcmLXYPWh5d5LGQPCf1nWVPYog2kMRESFlTXX6CR9xQQw
	rWfYWUeSNXnZCfkjmbmWSxi90U2b23CfDGkkdslMKoOrkSJbYbvYd21hoqn9JCO6NWiTR0dWfy5
	xeE0IVy7NnVbUlJ6dsuF/FOXr6E3zWJ4YgoYWY//6ZPxTss8LloiuIY6DgODRjF+V2GYZtvSg67
	Ym4+cDgLqfz2712Dfa11oU8XiA/WqYHOj1XVBVpRPOn91cSx//fsmisMngnLi4Rf/mU23IUO8Ri
	4zwF90+UDMmMcYpz9CJ0TMuGdu1wQ=
X-Google-Smtp-Source: AGHT+IHAInGs1fY6MhYk+BOaIQN6jWgnuAcNUMCj8asWuYpXZLP7gT6bSs36V8+DqD/oHKzLuMjE9A==
X-Received: by 2002:a05:600c:458d:b0:468:7a5a:14cc with SMTP id 5b1f17b1804b1-477870a634fmr13473095e9.3.1762943360967;
        Wed, 12 Nov 2025 02:29:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:53 +0100
Subject: [PATCH v2 08/11] platform: surface: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-8-d46b72003fd6@linaro.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nbwVZd1B/0VhFu7wCpDEX+Xq7qXUW4QXmwaphM2p2IQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFqdZoAVmnIlbNdcg1Y+7nkfxGC6i0n15Upq
 K4jKAztwCqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhagAKCRDBN2bmhouD
 16TrD/9AMI5SrOqJWRLQ7jKUbUsOysXBLyuiMqQn38xIXkce16vSkar8aQIikXJi255w8BCbJN5
 XpoXeQslytCRS2CvSCYzSnwLKm2jyAZ/UJ1eYLlbnFgA+bS/tLQ+ZxexHjt9zLRFy5y/asoQ9P5
 T9ql1bh7o1gtWYg/4FFEWUimNr9blWrvDirnEFXFokhYDjS3gC7o+PuR2zOwO1cDK1KeZJJNkxN
 4siZTPlGWjvimJMhb9MFFIaD1FGMjk8Oo9RuC38wtEQu+3Qnfv/pidmsMkt9EOEP0qyuk39qX97
 K0bF8PhZ0HlmSGHSqBDDnZ7h6TT47NdxsBFm6VztA4UBwafUt0laGgFVTbdjsPh9eLldIzc6gX4
 qd98n+HB0L0CRvu5lEA4fuApN250SBVNphKHTRCHH4rvm+c92d9Rviz27WVVP6aXK0lXrLRvuSQ
 a/h5NgHZvUsRgGR6F+KsWkKyMqs82BCAQMm3hAXYKGAHaMWvvL+CBlqoakEF16kOlukPZ2PeyBx
 +LBG4qy8sQRRamg1wPYLUZkGifRetG7z45hjdPYQwpEltgLy0irZZM9ct+2IGITcZjmMnULegw4
 nTMQ+fbC0RPtlIJPjVmVA3X+PhxBpo1um9dL60Lwd6bft0tS+sEppobeeBlN0d0Kr9qBJ5OTrXg
 yG81W0MnFMi2LXg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022922_979594_218EB1F7 
X-CRM114-Status: GOOD (  14.28  )
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

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/platform/surface/surface_aggregator_registry.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index a594d5fcfcfd..78ac3a8fbb73 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -491,24 +491,13 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 static int ssam_platform_hub_probe(struct platform_device *pdev)
 {
 	const struct software_node **nodes;
-	const struct of_device_id *match;
-	struct device_node *fdt_root;
 	struct ssam_controller *ctrl;
 	struct fwnode_handle *root;
 	int status;
 
 	nodes = (const struct software_node **)acpi_device_get_match_data(&pdev->dev);
 	if (!nodes) {
-		fdt_root = of_find_node_by_path("/");
-		if (!fdt_root)
-			return -ENODEV;
-
-		match = of_match_node(ssam_platform_hub_of_match, fdt_root);
-		of_node_put(fdt_root);
-		if (!match)
-			return -ENODEV;
-
-		nodes = (const struct software_node **)match->data;
+		nodes = (const struct software_node **)of_machine_get_match_data(ssam_platform_hub_of_match);
 		if (!nodes)
 			return -ENODEV;
 	}

-- 
2.48.1


