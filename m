Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4985CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8jg4fyhHK5uMCop2NLzryAbGcboP7rROBOu0cvEZn4=; b=blWmX4uB9TO1WZJY+ClvN93WRa
	/G9Ax3T4G2/O58xZptYoMmq+5fD6WNdFB0McL4azH8Y3oxVkFba4r1vgTFgd1+8K40LfJbthDS3RO
	xjF49bk9MhtO4Fd4C2IEmGEJnt24V4rKDOUJcc4BR4ErTMPFiTCjPPref2Y37UB3Q+ApqxXqK6fQs
	5dQ/QAhAofUvLCNGw0TLQX2K/MOSFUCr5WKWeWpCVxULQlBYxqoovGdzPL7bi6QolDPO+vwV+qzqg
	OnEcacWFsQlat5W+Ezxs3Yeh48MQ5X5NI8mfIYQOj0vw6ur/e142Ipq8zwXwgZgIf22wIMeOCgWqt
	H2F0ZcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86S-00000008ZJP-2XS5;
	Wed, 12 Nov 2025 10:29:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86K-00000008Z7K-3Uoq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42b2de74838so72035f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943359; x=1763548159; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8jg4fyhHK5uMCop2NLzryAbGcboP7rROBOu0cvEZn4=;
        b=l1aH+MFHoFFp+Gj7We+Fm2xXLqt4Hwnrig2LUt7P/8Vkbn0N/xvWM7PNVYTlw+EwF8
         N32khlcI8pW18nUlj9gp2nxOdaeHdMQ/FB+IlBis4dD6yy+a7Q/JfyCEJt84U/D4Y06A
         EmED2EuKd/mcFY31ll0LhP09FqviPL6rjPiZ0bnDsR8ZNzlJpO2bPH4NfMZHsGzOwFFi
         lzKR7w1afULzM0uMAUKNFYbdIEtrm9SckRAlZVjg8Rln8DLu7aoxgfffJ6lRLfnF4wjI
         budOBBLfPSFNsAtnO+McoG+DRxv3u5OvRCap0jkvzUpF9GhP/MjMiYIOoCehe3AxS4SO
         1DPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943359; x=1763548159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8jg4fyhHK5uMCop2NLzryAbGcboP7rROBOu0cvEZn4=;
        b=WGtozr+HYCAHaNTFefa80a3Jts/hZlhzGorzcAUhkRXMojkCZjR06OMf+l5LkpBH4d
         GH2BRtWiy0SLWAjeych2TfAdXrTHagN1mXNNjgITy3PDr2mcFVds9eFc90FvCGfPtFZW
         P20+hn5aH3ZAU9NNQ4bbK0WM3qw5zCYxO1oceP52xfvIkOxJzVecviBnuaYsihNMZueM
         OONhyxs+SwFI/YYaBzm/K8Y+9m98ohP+lgLtF2Yj7ufneBsbqW99V4oTvzXFGZb0LqlN
         mbpxXBvj6V86qS8lcovmiIl/I0zXWbYvMjsz2cMIngmJQssE3GiNqhJS4Au4F78ctSD+
         rW+w==
X-Forwarded-Encrypted: i=1; AJvYcCUUvHoWz0OfdgKoBC/JIE8x9yada6GGfRmwcWnEueblQhZ7vIpyrWBuBRH7VGwOGzNCSIspHkDXatwnMmZReT3D@lists.infradead.org
X-Gm-Message-State: AOJu0YxE2YaKXulhmZJyd3ISzEo9rIADWfzJbiQzGQtgVfhH7KOLMJ99
	snKC+M4DLgkTX4U2RgTPhgHZVLBCvi1iltyigKSpuwMsZSIUDg8IX92tN7z/o+V/83I=
X-Gm-Gg: ASbGncuN/9vbjK9c/FpAmjUDWDZKUwd0p+/ZOA7pRtVK5ugVzR4vc9xQM2wjn0WBFwK
	huKZx2Lzn9NmmfQG7Ax3/SFzk0H66ll42pw2hTaAhusaU+hczO6KVTp/dXRHQztSAZ6xtgLiMQZ
	63XF3+FcA5ezvS057Yp49peFC5hInTjYRfAVckdBtN+IPtvhLOUo3B1JIy5xy7IwdFBCILcVZKu
	OYOP2QkYvnN6Cf59/xzmWI3GG9f7sZpSS0NKSDRUTx56SnOwToC09q45/HV4PCPIwBk+wcBBgrZ
	6kSGvpT4q98kB5/0cGhP8CmmvB24M6GiNBhsHDA+e0AR3s8GYBgdgOnn9ZjcveucScjOR5jShLe
	cWCXZCxqIv97xI7Ww3rjp4BCzvSUMIlmU3IBMSXefBiTL3drhQXvATQygA9+0eTljfpiJQSQaCb
	daNtFybAIokC0YgfK8
X-Google-Smtp-Source: AGHT+IH9dewJqjj8SYnFozQKateD7TpVTHzXgt+iynxiB/fNOTE+IYg7qo1u8nzX9n/vnCz19PQWWw==
X-Received: by 2002:a05:6000:2885:b0:429:d084:d217 with SMTP id ffacd0b85a97d-42b4bafc1efmr1083179f8f.0.1762943358928;
        Wed, 12 Nov 2025 02:29:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:52 +0100
Subject: [PATCH v2 07/11] irqchip/atmel-aic: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-7-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=76PxURYmEkrXd49jHKzYAdKAFjWhYTCJ1RhdtYUjsPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFpX1jjPcusmg50wHzOU9s2cVSWN4IaAHruN
 86AKqHOsG6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhaQAKCRDBN2bmhouD
 1wQ7D/4j5UVIKbJRO9w8A/0yMrLCvPEecWg0ZVm3uhY6KWZuKJ7g7X8XApS2waMecdLjYgfJ+Mq
 FJErqOD754bWjWCvrMpGFDDTACuKG5kWu4KyAFSYY6OR/QJEHzeOU7vJ7e5diotyAQprTJNCbnw
 NrwQ8Oqdt4HHxddzjRU2vG/95R3SSf9chkV+zMquFDmCbgBjoM0E3K1nVfwPGxeiIjjBxDyQFjC
 QHHgU8PDGBvzgFiWDJMl/Y3vjIktjRH1smPAj3Pjo8nHuVWCm3smB9kCsLbf1zoDGRouUADSczt
 Ez4C2udeHvfVvbtGK/tw24fiNbjNyvf/70X4gvLOyFhxIjNJvweSvvBidb8dRaw9NKWdZKlSpei
 9xVbbkfadrlo6R5yj0BfQuoKTaN3evRfHbwbKhUdQk/xXuxYHmvTkLf2/NdP5PVm39XqAZlvS1w
 +zDkmj7vlRn+UnyGifq/6AmencCimfySoC8WXsqmauZrt0HXqJ9/QoE+jst42JOgIEaJAOvjaLD
 6uZx+80X84Oe61Z6O62nPpiJZc1xSVyQubCjuoJkWJwTTwWluvapigG3/J5odPXBFur2fjDFogi
 wcd2JpItBMjyw7Vhhku/q+Tf3t66l8EB1oE5fYxYFtm/XQEGvyvI4u4XW6HH1Ny8xVFFaAjVajR
 kKm0RPvl0lbiiLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022920_914419_B144D758 
X-CRM114-Status: GOOD (  13.20  )
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

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/irqchip/irq-atmel-aic-common.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atmel-aic-common.c
index 3cad30a40c19..e68853815c7a 100644
--- a/drivers/irqchip/irq-atmel-aic-common.c
+++ b/drivers/irqchip/irq-atmel-aic-common.c
@@ -187,20 +187,11 @@ void __init aic_common_rtt_irq_fixup(void)
 
 static void __init aic_common_irq_fixup(const struct of_device_id *matches)
 {
-	struct device_node *root = of_find_node_by_path("/");
-	const struct of_device_id *match;
+	void (*fixup)(void);
 
-	if (!root)
-		return;
-
-	match = of_match_node(matches, root);
-
-	if (match) {
-		void (*fixup)(void) = match->data;
+	fixup = of_machine_get_match_data(matches);
+	if (fixup)
 		fixup();
-	}
-
-	of_node_put(root);
 }
 
 struct irq_domain *__init aic_common_of_init(struct device_node *node,

-- 
2.48.1


