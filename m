Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8C0CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBavdG36JhZKmN/pedjw25qWHClEhA6t5bxsk6oa0rs=; b=DJyxmvEip/5uAe3Phlq8CiAi0t
	MVqBqjjJjMHo3gsBDtUYTzmMHwYqbYnMunLOm6UFWk1O+nXoa0Fa72bnwHDVuANHnr9k+y/+YhfKF
	yTZU91DYxqsCN8R8fwmvYWd2xldrMoaJhCDlJD7vbQJBsaRqNy5nNzfYdVFAGo6LPugPWBE93nE1Q
	Y8SdgeutXBn57XtA+TASbqcoZAdr/JJHCgRAxFthXzZ5ZOOdkwWUERYRAt8Hhk3bb/4jUpF9k3hHA
	YkdrNUX85Xrz/tkWwOgI5DrgWx6isGDi1PfUoisxuFqPopJI8JuyJQr6hr7oiDFOTKx0hAdS2jFZ2
	KWNZPXeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86N-00000008ZCk-2Big;
	Wed, 12 Nov 2025 10:29:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86I-00000008Z50-2Rsq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b30bf0feaso75668f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943357; x=1763548157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBavdG36JhZKmN/pedjw25qWHClEhA6t5bxsk6oa0rs=;
        b=Z9Kx+ezRBkcLP94ckc6rGVeG+YAqFN3RWJiO+X2cv4JFnikCHxScozEMhKkuRgg3A/
         4YdwpoqGAvd5zKk2NjWmCTJ/4SACl2qLeLJD7OjrFnNRYXlJVT8rpNQ4x3vatF21nA6X
         zD/tjY7FAR08WvC/SkmBJfFYlSZNFADTu6YSLbBMc5tkzkvgCihs9Lm7ozI2Tm7FXAtV
         abwRRK1WKh3aG/sbGhkwAYRgHOcMX1Sj+c1aceGY3MkjDFwgece3pVrMI+Z7EXEeKq2H
         OAdF0gsU1EVT1KYtHaW7a5ymmgKkkP6gehSWOKEaBtu1NRPMpoLiW2sWTvgxYael+2hm
         gYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943357; x=1763548157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kBavdG36JhZKmN/pedjw25qWHClEhA6t5bxsk6oa0rs=;
        b=Lw1RS2vLnO0PD//a5nDQRmdqj9zC3WpCyliAS4i0BEhJ6580QZrxTdkHaCQwojg4/a
         bfI/i+Pb7POcb4tZQ1XtDphKYIbrhEZQWw1Mb2MMX5WukpL5Vqxv8GmqgpjLw75ZLrpc
         70EictJTPZCUWpHwJpM1NEsba58zehwL1NUGA6S7fF262zA0W5NxVeKWPsSAmgP3ZMEB
         VqxOAJsibQuhg1dmMqADws85AWJRBY2M2H8rEqiCDZrUemunRxkfPs6Rq0tr1GRu1oyj
         4IvONTZuxXNJqqGWhqEUvbjTlIGhPOwZW3/AWnNsWq+VunPqFMxle23+tKpVtLOi5eLq
         1vFw==
X-Forwarded-Encrypted: i=1; AJvYcCWvlyYfgctF3TZ3jKo1OK9a+zv+YHMqk+xqSFysca6/+K9c5UU+hNUIVssmZ5uT9aTE1Up2PhFANNn1qyiiKRBt@lists.infradead.org
X-Gm-Message-State: AOJu0YzQflsob6exLv+85rs1Ho6MaQ9RPRECeM+vl7q7E5Gy6eaMaF4N
	T254Knr/b07mX78+qDg/swAeHKesXhbN4ifkhpEpK0/QasujZJcuw6c+mFhz5CCagIk=
X-Gm-Gg: ASbGncsojCmh6g8F4ZkyQKL4M+d3vLvPm7cExZ5abNivpE1WDe7ugt5ePS5GLNjjCto
	x06gMBQcM0XaS971Lbk99JBWmfezICAR3ckU1WmV4/eOUJAxou/tt6sScuE9f7gmAnkux8aOIY3
	UkZ/NynUwoLUqJ7u/GXSbpb8q8Rdl4uDbfK5qx9Fed6tXmaS/rwDQ40nDPkvt1U177J3cjtHp4L
	LB03NpheQ8Vke/d//S216g3KgvT4FKIa7UfYSw9v/J5+OdnU0cMtp+QDCb02UJDUWLzqQWp0cki
	thF+mXL4czFwYY4IqPSQSWfBHWehpJxlbcwr9SkP9Kax2B9VZwxORBxucRmGoAw8zHZikbRj7O7
	npBo99ToLxvBE/jhhD0uyGAWwmCaZaAqyqyKLiyoibAB6Vz79xjdvcaniMYlHt36uJIs07MqNNk
	xgOdK/RNsGljKWrLY9
X-Google-Smtp-Source: AGHT+IFcsJyQX0vQHIxt0g6rxRaeK4KQcZ7ubS4Xn6BHNva6HYRONLKZdEpigTSHkx+N3rxTuPNAQA==
X-Received: by 2002:a05:6000:2888:b0:429:d4c2:caf3 with SMTP id ffacd0b85a97d-42b4bddfecfmr917139f8f.10.1762943356808;
        Wed, 12 Nov 2025 02:29:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:51 +0100
Subject: [PATCH v2 06/11] firmware: qcom: scm: Simplify with
 of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-6-d46b72003fd6@linaro.org>
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
 linux-tegra@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kT5IA0GtAEQVfWhYH3L9qEziSnbAJtbqUptdjRPcgUw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFoaaq85XzS8Gm+QHLYdjGk6xAwN9M9CcUpd
 yKEYT6rj7WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhaAAKCRDBN2bmhouD
 10RbD/0QYyKGuzIytM2noX3te8ScA/nUleatTJOM6knZFKx9CzhpYG1nOZVLI10Q72t5HzseI+4
 Oi4wEKdkIUc6XVheTGBlr8XH/Ezs2NIXUugeMoQ28U1w20QF+5sOdKiBJ8lFGbqUkaW5ErSIVt/
 /3YLlicO6MacIZ4wG1GV3ODj0yi29Vwzsw8iQ6oINdD7te+YPp7eyFYr3u9hVy7D9m+AtgpqlhE
 1jwS8nFRrDTRBr3vIOIiXi6uTMdXTyROOufwqlETGtvxuy6WC0fZnONEg2PJ8qVsPQNOyCBh0Qe
 KuXhHY2766mkdS+jVh41HhZh7SIw5e2xVOU2um3CFI40O24+xT7NU210IHtd0D59Tlt7f8ahqeT
 gqgGRTtrIZEtR1EJqjwVRMIFU03xVQa0xRCSi0n0lLlN+IbtqaO6q7tuszNI5dmnr83xoxqPSmw
 +ADtjoptZfcndaqEjxeun09qQBsRMAEB6TRQESSXEFwnhpgJx5nYI/WyXlNdMqRoWjIPW9dVcVZ
 2tmiITlPOWGxzTM7M0qFmJKgZds1jse18mQQhDI4U8b1YwJ5dY51NFWt/lDicye1EK9A1LMjS2h
 EuQHxg4sJU6eEe4Iuvo3xH1mzT4yrfSHABnMOF76JT3JLeDs1x8Mp3J67S03B0BKK8z92LlIU4Y
 mvucL86lWwzH1vQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022918_738181_2FE38276 
X-CRM114-Status: GOOD (  12.33  )
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

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/firmware/qcom/qcom_scm.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..1a6f85e463e0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2018,21 +2018,6 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ }
 };
 
-static bool qcom_scm_qseecom_machine_is_allowed(void)
-{
-	struct device_node *np;
-	bool match;
-
-	np = of_find_node_by_path("/");
-	if (!np)
-		return false;
-
-	match = of_match_node(qcom_scm_qseecom_allowlist, np);
-	of_node_put(np);
-
-	return match;
-}
-
 static void qcom_scm_qseecom_free(void *data)
 {
 	struct platform_device *qseecom_dev = data;
@@ -2064,7 +2049,7 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 	dev_info(scm->dev, "qseecom: found qseecom with version 0x%x\n", version);
 
-	if (!qcom_scm_qseecom_machine_is_allowed()) {
+	if (!of_machine_device_match(qcom_scm_qseecom_allowlist)) {
 		dev_info(scm->dev, "qseecom: untested machine, skipping\n");
 		return 0;
 	}

-- 
2.48.1


