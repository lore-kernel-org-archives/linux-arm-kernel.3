Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F947CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCEpBcWqzOzxXS+spa/CGSDCftzF1chyjPQmDO6LlhQ=; b=iVRCqyxmfPPguwAnwMyMAuzErQ
	/hulmPkjJKVbNYyVv+ToI6BPm4qtD6u2d+67mQmFdYcqFr+4AqTVzaI6JL/WpNQIGQD4VNWN2xapH
	ephVbOJdngVC16sxN+XmIQoJEB195VFuXEHBmIvmg+6fA5JHu1afzdqaeUbzkEs/61JjO0FhacDvp
	VERh6US9oYaAiwsHu/Byw1Sbp+UARwqUC9+GKJbDazt/er60iYeBRqez2+iZsdJ0hVpWA+loKvo62
	gfLcHKsjjKKpmaNGTIZBH+XmE9pA+bibFpOUDsFYpRSf3qIyPu/4tyXt+lBwezvQMf/6tt279lRLe
	agrRAbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Lm-0000000G8go-07GR;
	Thu, 06 Nov 2025 19:08:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5La-0000000G8PB-05DG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:43 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b7270b7b767so17818266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456116; x=1763060916; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCEpBcWqzOzxXS+spa/CGSDCftzF1chyjPQmDO6LlhQ=;
        b=dJ5AMzcxxPvYV9H9Y7GO/7epjP3xqOWkUD5iJQ99cU0lWq02MGZDErPSDLpY/rI5Oo
         kqXK512w8YF9fYOxYeAlnlnXTaEjnNU2OgV2t0ShbRKpDt35hgDqVowbHwol1tg/YdfF
         LyqP39aqN2V9sZmatJadkQSmVep6gHOWIY3ToDSnqqO/AY8vt/vSjdPho00SpJRGdQ2a
         h/0FELbobWrFWZhvU27nd0DvA7jKmKFrE2qd2iqYPyq7GZhF5ZlzFhuErByHWW3hIvH9
         1OEZvZHu8N9lU1qpg0e3PRsSuuR0j7cye1WIoY1pow0yIXnrH4vSQqHVWE1TPM+Q+W0M
         tZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456116; x=1763060916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YCEpBcWqzOzxXS+spa/CGSDCftzF1chyjPQmDO6LlhQ=;
        b=Eg/9FORSMhXjPAm82cOOIw7U9dS3TOvs819vKbZRArW88NFPL0hwKQLCNeCGywwc+1
         ZzXltB5c3qklNDqD9u0Mo9YDbtlFeihk6IBYqFP5Qep6uil50zJ470rtnj1b/TJ5WA3J
         8A6otRJq2jNGBRfl7C9kZrGyGWIZtzb3S5p79vZfWyCsQOfeBx2nxahHFJqxmo+YmkcH
         lCUlA0XHrxTWY2lpt2QqjAa3+Y0iTI0P9x8b4b8CnumY+t52DyggMrsQrQmHuyB89/0u
         jkeypl/VjBuorgtvU54To+MvFUrvdSW9k1UHjqoqiK5+GDX7qGUgf5oHxCBO50iE2VTd
         UT8A==
X-Forwarded-Encrypted: i=1; AJvYcCUuZRawOppfmZlHDbM94L5Q5Gn0tJs4W0h7ZmJI637kqvr7nA0rlN4v2fr29Xf5uKkGBfGZuFsjVUAB0ISrZney@lists.infradead.org
X-Gm-Message-State: AOJu0YwTieUOOlJ/4Tvu56TB+urUkPq0dS24SD/OMa5CddFMRW9bJPNU
	1C7vDnq9l6vSwk4HQ2OD2QP6qzXdHPtSUr18hmCCz/xEH6Jk23vfTSls/RnB8nG/sQk=
X-Gm-Gg: ASbGncsOmtmlZBeM8ZgMGjVEP4xhxKyX7ml/5U5ZkuSS+c9tRlNle5VhxVMCP+UEg4H
	ELEIaTdeeR4fbTFvA/CvuoxpWtQYga/wg9NiCyEanH2pjVwGngeFJTPBGzrMX08+98u3qZXR3lb
	FgOQpxsUkRjkJMoE17pBFLx3YBBUEwsSvy9VNWBF8GNXPQYqWQhyVGhRmHiDej5QQSZ5gMxUVIm
	4ICFpbiIvmwMopTLTc/1aL0POlhktxMotPT58bcGvTUp1QYuIsl/21TZpB/Q5+203/sP//Lf12M
	9m0AYQpVlWH1KkucxzwJP36ZAe7wbivYq952aHcRAWWJQU7r++M5Oby8/YBzrNmK9s4lls3px3n
	AE2OQJpgu2bJW5QeWEM6wqSN1/FI9ACZujzyW+/sBsrbR5GnNqV0JFikwys10MbSL+TA2CLnZ1j
	EMJF/nL4Q9+CJ3Z7z5
X-Google-Smtp-Source: AGHT+IGtACsnNdaWz105iCINoWr5n9UXht5NcROgRS6+92tcuuFFCVXa8Xeak1w/fHe1KKxJJQTUmQ==
X-Received: by 2002:a17:907:86a1:b0:b70:ab64:434f with SMTP id a640c23a62f3a-b72c0a8cb89mr17450666b.6.1762456116128;
        Thu, 06 Nov 2025 11:08:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:19 +0100
Subject: [PATCH 12/13] soc: qcom: ubwc: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=duU5u56PDy568nC9gTgD/sRRW1Kja+NAYhWyt8rAuUM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPITu0xcd1Xu7SDbTfboqrqtm0O8I5f3k4GxJ
 sb3DuVcYy6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEwAKCRDBN2bmhouD
 13hVD/4nWu9gGWq6/LJwCrfVYOFlQ2hUn93EjQWiFRTwwmgC9sbS3NA9MR19W+gEIdKMVerKLcR
 qWz4RXbJ3AR8qwBVAgGhp5mP8v68fVp06zYEjKkmsDZd1zJYY6QRtlVK4l5h0J+my+9zwRl8O+Q
 YzKoXLBhxFNRiLPny1JxlIa1yaTC6CNYWDt04MnQmbnPJehWYg1NUbSWkF6HsEdtyFhqGcvc/+B
 9uZA72RelClKR8PfknzlUexnJVx/QyUbApsMuxODlLZaZAV7oL9xM4Zqgxolw1524IZe2eDPBgD
 KS1EquOwIM6NUJIbkQ0MTBy48To3g3jW7ssf0ktGE7EI1tPR3YvdCgq4R9h6yWDw3KaquxNvqRM
 JBcv1EnddNFIiMxi05AfKZ5xkuWv4dxzdVQqw8kgF6p9YpgE8ib3h3WM5JtHXptC3QswTi8sspr
 HocdHYB2mNKGLOKFSZ+4N+xnPr/oO49a15Nl0B1bNbdKTUmPBLfIn5f2jGjRubu6zmW6mF9m132
 6WsB6B1i6jZUXmWjgSvfn4pc092phlb0LULHZfbJSgzsN/y0xTkKM3TihUIYS0w34xthKyg8Zk3
 pRt3JEIKc/Qm4FALNBmlQN6hGotDxh4wfz1G2vFQhMROvMlxYyGvu+V0LTe0qSvGDwveKy11LUH
 1LudEj4LNSbfXzw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110838_437125_DF20F354 
X-CRM114-Status: GOOD (  13.15  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/soc/qcom/ubwc_config.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c09796163b0..1c25aaf55e52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -301,21 +301,15 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 {
-	const struct of_device_id *match;
-	struct device_node *root;
+	const struct qcom_ubwc_cfg_data *data;
 
-	root = of_find_node_by_path("/");
-	if (!root)
-		return ERR_PTR(-ENODEV);
-
-	match = of_match_node(qcom_ubwc_configs, root);
-	of_node_put(root);
-	if (!match) {
+	data = of_machine_get_match_data(qcom_ubwc_configs);
+	if (!data) {
 		pr_err("Couldn't find UBWC config data for this platform!\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	return match->data;
+	return data;
 }
 EXPORT_SYMBOL_GPL(qcom_ubwc_config_get_data);
 

-- 
2.48.1


