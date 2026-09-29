Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BCFCA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 02:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=; b=2MkjWqRpgVVxDMn57mO2qwJvqd
	OHRfx+dQEhZHCIApuH/VGb6O+qh9x56DKCqNPKxLsWmR/NMbI/D5qdMoCw47/kwIC9wi1PW7Qxgn4
	/VLbZX8ZtRyiFDpJPYlDl8XtxjFrZPSicFvkx9f5btRfnKJYOeZ3MmDfKX7pmZ9ahHs1BGF1N09Ye
	Cla0seLAETbY2f7d/0MOcuxfY+ehBHpgVD6uYcWdFVnYSVn5wlBO6G3zHdpiyvbLUf+FDw7jmOJFq
	hWsWtAU+JxCzGT5UaewNdNs+Y0oeB0kXz8c8sknIwKj7qVvL6Mascof6HFcfa+O6YsCypycmU9E3i
	glqe3IDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNJd-000000026eO-45Zr;
	Tue, 29 Sep 2026 02:11:33 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNJW-000000026cJ-0UfP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 02:11:27 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso2000725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 19:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790647884; x=1791252684; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=xppvmuYm1G4iyNIttBJQTyoierjQNWiY1GxLep1QHOuawIXRN4cTpBg0WFQBsNFVcB
         McEbD/duwMHTbSzzsv4XP9oov4y3XuH50y8haHPsvcbESqrlr1LZMx3mcWKT9DJ3YzFP
         5dVRIabLJF1fbArJBClYOFREr52jTtHNZHoeZPI+dQTef/gBeeVKm4ng7JA4s7AooFCn
         uBfRtwbBLJW+aNXsmw4Zvf5gLjpUvn2aLdbWZPH3WkmBGpTgLjQwQ+rC7IY1mwv7Rub/
         43AYU9DMAwRe99pxa9zY5HW1XhKNDjCpQgykfLTqWPrbs/HtH0IbWETUNNPuIxerkpTM
         B1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647884; x=1791252684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=aDf75oK7V3/4A+4TdNLWpSq5284q5EKgs1GVoYfTZctaLvHMj8UWQHS9kMtHoEaFOk
         ADm/A/T2Cj1RePn6aNiQKdc29GCJ0bu5WbAzek3k84XZFWqNpwwMKiV6cD5Ih8bK3K+k
         ZgzTXBRt/yvRnFII3Sc8xSH7xGg1PlJ7CMwyUS0ZLKfMThejQovGgOvG0gWdR6G/fbhh
         MtFF0u2nibSS0ZtHP+M7K+aPPfMhiks4DP96wf6xnP9e3bDZfQvlsPUPmg9mndZxHSCo
         aFND4aFc+RoSTHAtD1sroLHTY7KGeJ+A/mwJUDdzC3OlM0/oH3TaE+3xq1qyKgCmiExz
         bPQw==
X-Forwarded-Encrypted: i=1; AKwUvBwfgh2xSSD/Gkk6M0pepDnvHfJ/1IPopRELx8fRiKLr6YnyRoasLtODZBIJPR6JRHMpaJHxsUtYS+1G553LJycm@lists.infradead.org
X-Gm-Message-State: AFuF++kdad+9GRJrtVfqh6/D8+CRgAieGtLH3FPhiKKcXAAOM0z6h+ha
	6jKJO2PxvON2hQA5byFPb2jv6oVBbc95FqYAmzLaboywMTNUeqD+iICxzxpf/BqTzOek/34vdvr
	O3QmrUwg=
X-Gm-Gg: AYBFou24iBYIPKreHxdQhvCWVurjLKpTeGsEbkwU3ruo5A8bCE/wKLYBOZngOq1bd/f
	c4wcC059ssyc6/hWMK3NWHAi/M1tPTgrGl5bwvZAVZqiioa4r9uEMh4ZgiiMX55CF14sK3VEvul
	FzmvrKzKFiTpDKlX/K/wQpMZ6PPP1ZSIt0w6c8Xx2J4OKtD/354+YuHRq0lSr1o+9+5x/QXoD6t
	H3Ph2qA119ztPUfO5JjbMftI/5dcu79lVSi9RCqbw70+SFGYFrbmk+eTjipVr1L6tk1hMalXBB3
	7Ce1BFQnPGLSY2+Kbn5haZ27gR3Kvp8jq5f/eovjJedfWWnGsyMD5ThCDJDU58g/uHBQLUrVSMq
	7eP6fttkheEDtiLUvMsi7/PXM+p7FqkTW3gxSozNt5XFFMPM0gI/fNXb5DMYN4PIxc7XfD0zZPS
	NUdhNxHDiycArAJHJbbbYVyg/YhuzhA/1Y5DMZJj7ejvOPnPDBNadDWgub21ScP6o72qZkI4QK2
	uQt3svu8Zc0f8u1RKo4jcFDWDjDT9HfxV2DdeSTcmEA/C7uSIQsKoCS4E7O0w==
X-Received: by 2002:a05:600c:4f45:b0:49f:fed0:fc47 with SMTP id 5b1f17b1804b1-49ffed0fe54mr129390335e9.1.1790647884336;
        Mon, 28 Sep 2026 19:11:24 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm42070145e9.14.2026.09.28.19.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:11:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 03:11:17 +0100
Subject: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_191126_170356_57098716 
X-CRM114-Status: GOOD (  12.40  )
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

The Exynos850 SoC contains an APM co-processor. Communication
with this hardware block is established using the ACPM protocol,
which handles IPC messages for clocks, power, thermal management,
and PMIC control.

Add the "samsung,exynos850-acpm-ipc" compatible string along with
its associated match data. This includes the specific initialisation
data base offset (which differs from the GS101 offset) and the
"exynos850-acpm-clk" device name required to properly instantiate
the clock provider.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 942a2e9f02f5..5a16665e941b 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -39,6 +39,7 @@
 #define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
+#define ACPM_EXYNOS850_INITDATA_BASE	0x7000
 #define ACPM_GS101_INITDATA_BASE	0xa000
 
 /**
@@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
 
+static const struct acpm_match_data acpm_exynos850 = {
+	.initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
+	.acpm_clk_dev_name = "exynos850-acpm-clk",
+};
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
@@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
 		.compatible = "google,gs101-acpm-ipc",
 		.data = &acpm_gs101,
 	},
+	{
+		.compatible = "samsung,exynos850-acpm-ipc",
+		.data = &acpm_exynos850,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, acpm_match);

-- 
2.51.0


