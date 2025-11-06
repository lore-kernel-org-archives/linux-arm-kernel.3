Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12F6CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muHNa/g+OI3fM/6qd0mUiU8Bz7ahY8JnmPu7Z+aL7Rc=; b=VLR9/x4MoTF3G2Nrn1xMS0i9EV
	62+bCB4yJ6F4FMjEbPX/G14q6LvWpgaDhLFf+b/UNcRVpHXjnV0431XRT4RxemnjL9FZQFRKwYHIG
	lKvOoLqjRx3zIlAGfz4vS3/q7sTaJedhduTXUeNcCsanaz1vXrNw5o21y0NH1VdZy4xjh/6ZI2thH
	FpvtkzDraGjF7qXJre+U2s/WoAfEE7h507nQfXV3DA8eXJvLrM46dxHCtzJn1sPaTHGpd6Jt1/opS
	EIZ0KSnB49NRV3lLFNWi2MAGWO3jfGuWbqlToLk751ORkiEPKibu6aPW3W9fRLSJn6SJRmi56AxVY
	S6VZ1Gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Lg-0000000G8ZD-0QxI;
	Thu, 06 Nov 2025 19:08:44 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LY-0000000G8M2-0FRt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:39 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64106cfa518so236354a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456114; x=1763060914; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muHNa/g+OI3fM/6qd0mUiU8Bz7ahY8JnmPu7Z+aL7Rc=;
        b=HAZWldPzJhe6DOE4rRO6lzWIg0pHDPMRz8Q5c2tZhwa/NvT3xNf1WZ8S29XommBAIY
         S9Rj1JWs6UKiEG5cdJK0lHZHc+kHyY3l2gcHyxZa7Tho2fnhqQ9ryMeZa0nOAxugq8fV
         1rWNiDUteYm9DUmYMjQC4D6TfhXS6sAfNAXeiCmF3N2wSbu5XBPSBVgDStPkNkEF1ZS1
         onNyDQLpKhTfxodtSRP4Xb2tnh6iDhimFIxad0XXeDMzlmguNvg0R5dcnrpuiEC2SipG
         /lVLbs3puUqszrhldiBbecqtmbCTdsJuplayGVR5o/Y4zXgb0TN3ZoVFPGN+Kx5bJzc/
         u3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456114; x=1763060914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=muHNa/g+OI3fM/6qd0mUiU8Bz7ahY8JnmPu7Z+aL7Rc=;
        b=aOKP2EUpZukbS98hnY40vHBZtesZukTvQdxkKpg0OUvYCXFw/cljZ1eUbAhYIcGiOA
         qZRBGN+520nXj/2K8vGcfBPo1PfdHHoK5Wj7Kj7U06JsIBVyy0Lno8Jnj0zM8hCawP/p
         zvMIRH4QVgom63GU7VhjfQezw+Hj0FS2ufelNyX7mjVkRBFAud3/VJYk8FYqOz4uHC6W
         obeAg3LLFVIt8mAOAAbtyqtgo8Tpzgn6Z5cL6hxvaiJpyl0Q+Ezhm77IHqZ5TOjHbOqB
         O7W3A0O3OOVs+l9LjzJl/B+8KAzlNgd1LMN9x6TCW2GXqdwkfeaQ5Qv+yEkcB5wKd/AZ
         Jocw==
X-Forwarded-Encrypted: i=1; AJvYcCUp4BNhrHsazXKEw4wLCC76hRYWKnCrTK1VKOPNt8eCsnc+gSFBR48utv61xqwiVIydDYi0H2L2mC413GG/fk1s@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3E1SwG1dm+qe++CjBObImn9EpC1aWUZ/zYaqN516RjEQRSSOW
	Aldxe+0+X4Vbp5Ct28YP/Gb537SUTK43jxkwErC9lSFzD+gFP3YfmKbAuzKJZRMyTGo=
X-Gm-Gg: ASbGnctBTOHcIw2RWLYYZaAHHlUkJK5P2cAkORix88m0tfUOanF2iG0jYPL60yuqM0O
	kzMjgD4ulmhFLCcJtNNAE2T19lRvpg7Kg9b2qDHI4GsPZ+RG0NjjAL+jULPF/cUMRryEZMtX3IR
	rB7QTiah8cJ12xsmlm53tfr9gQLVNslpMfEJRzbg5/5LXBixJl2TfUAYGy1BR2sWw55ll68Ccj7
	hYr2ZTyfcxJmGyXQ8MapZ/LdZLZD207XJ8JMLP+CrXz1TRJyaV8VahApIu/2I+t0yfaQdcduSXL
	Z1XtghMphVgfQFWuV5qk8EeTbqVAKDSDZR6OoAf3fFx95cMWqvEoCVx2RebOkfoHOb3SgJBeJyG
	FVy+JwfU91CcC7eZI4pmYIFW/erqkd0ymgvTmpNdQ5Kqt+jUbskLYTkC9yGikNAh+MKunO6R3Cj
	NBD1cuKIC6OPx5xcku
X-Google-Smtp-Source: AGHT+IE8YuEiK+Zfb/KePNrKoWBUDj6LEo4NOy/SwvD7jjkTn21cZNP/+8sVmFG2eqOfE4KV5Ochsw==
X-Received: by 2002:a17:907:9614:b0:b72:5375:12a1 with SMTP id a640c23a62f3a-b72c096b055mr19793166b.2.1762456113840;
        Thu, 06 Nov 2025 11:08:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:18 +0100
Subject: [PATCH 11/13] soc: qcom: Simplify with of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1467;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/yzRWwVIXgMTXi61dZTgBV9kK1Wc2gDXywBs5UcM6J8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPISQ5D0Sf9n1OrwLQgvE3GYjGuU2ct+njIDv
 jBQi2g+WJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEgAKCRDBN2bmhouD
 10suD/0Sda8mQq3Am4mP8/8RROtOsjW4BdT3uUIH6bBRs5zGPcOfOfa01RIWooqINqRTgM3kRP+
 GEfgH5VZhTAbhgaiMzxUTrbCR/3HjSKTBMCVQZzAVOqh6UN/p5eokZpmHXvtyEBU/MJqGzRlP+a
 6l+T2RkycuvLcNCNLtLgin+NLEeps3cQaf1kM3AuCl/cu0PqGRNRiKAIIb4HwqAI6M0YkSLYCy3
 E94u97SOssK1qs0tTOA2J5zNSWBhIp5u4CuuXLsPW4M2L5f4+jvVCexNmPlyoKvLjeKAmHwkaQa
 HP1E5+Ql7DAyDSKNKTkkRYybpAECIIOII6ib1t9BLrwGY2CyPBt8XiHkunFH1fm0aJx+pZaeNXR
 fpp1P67ni3gW5pIgRQh6ofX/QSEL/XnFNj7QD+I/DT8RtEHPUjuZBEsbk7YZYPDdvFfzWQGzSgN
 OOss/zZpWF8EUDYqKpYA+Cu0INYZbZzBGgSLOIBxGy3XBAQEQIQLgAOiysuOeojC7kyGsc/8TU+
 lzEcJiiv5X59CjJhJViLN2t1jZX4wryPr5HXwc0L7ZALSkxyV2kATV/hpoySJzLe10JBt8qHjU0
 eZx6SaG+f/clYYpS6dI1TegdwRpBvqsFfFFv9cmj5EJUuCUHDSqgehR6GEPctAsJowIa0LQBOns
 gTL09ogpzJ56Omg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110836_184312_08F90ACB 
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
 drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe69688d2..07198d44b559 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
 static struct qcom_pdm_data *qcom_pdm_start(void)
 {
 	const struct qcom_pdm_domain_data * const *domains;
-	const struct of_device_id *match;
 	struct qcom_pdm_data *data;
-	struct device_node *root;
 	int ret, i;
 
-	root = of_find_node_by_path("/");
-	if (!root)
-		return ERR_PTR(-ENODEV);
-
-	match = of_match_node(qcom_pdm_domains, root);
-	of_node_put(root);
-	if (!match) {
-		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	domains = match->data;
+	domains = of_machine_get_match_data(qcom_pdm_domains);
 	if (!domains) {
-		pr_debug("PDM: no domains\n");
+		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
 		return ERR_PTR(-ENODEV);
 	}
 

-- 
2.48.1


