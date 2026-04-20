Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782FEF5A8CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 23:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLT3tpSwkvQ2Tt/V/NMhLxE2z8Vhzn3uRFvBt+UOKAM=; b=2U4FKzA8HPzYhb/T4lOi/yIvo4
	Dk1HzdBK6yEqiIDQGP5ktuS8M5u2sjfVmKXn7mptyopT1eV4OnFaw1jP9nc9eHJjj+nm4zehN5cps
	dejp/58eQ3JieWBpjofoGSkPLDUsayKYqbTr/Nvv5rLRUNGITIcUXpfyPxu7sGFB0Ou+w6jNVHjQr
	8XlGyofL+WEkbN4wyWbYIL8hrggll5kN/lgL8Dd0ixd/p3JUSBuT0Zw49uPYvXyGq4vi7FXODwYG+
	GwcZ7jyzmQOl0hf/5llEBTbkhVvofhbIOcehmf6PtpIjNGKUCq8Ux7CsugiwjIox0sRBCyWxYNLlF
	+R0VxtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEyOq-00000007qMh-45jQ;
	Mon, 20 Apr 2026 23:51:32 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEyOl-00000007qKf-0Pln
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 23:51:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so2512758a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 16:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776729086; x=1777333886; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLT3tpSwkvQ2Tt/V/NMhLxE2z8Vhzn3uRFvBt+UOKAM=;
        b=uNmFc5r/Ge8YoAoFDtP6NAxVN2ycWzwLGuDU2Bq/CAomVuUmRYbjfYLAKSAN55XY0Z
         7Lp3iqMUxA0UMMPGjkMovWcxty8W9UcjBo8TYDTuThY32ouz0YBbSmH1+VuEZO1orXPx
         eaQmp0U5TfHqocsh2h1vVhlNVI8lHV0YNiLDCwwR7Vgu2ruJ/xJMWOl2IU/ZY79fLTLR
         uP6+fDNsR4b0xRkony4yXASid+87DJZtoQSgnZ2Chucnw40HS/W27dQs6LJ//n/m4X0o
         Z0LARCy6AsgruELCDExF/1i8hphEeRa2+zze4vZitFPzHuoU46EazhjkQOc5eRq+L3BI
         tKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776729086; x=1777333886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qLT3tpSwkvQ2Tt/V/NMhLxE2z8Vhzn3uRFvBt+UOKAM=;
        b=RWMrWCQ2AIonhZ845TRaBX16PYm6vOVb+WfSIu39IQjeH/IZKCuHIRNfhAMNH6Ubyb
         7PoMG6uvIBhwhmgDIMmdKs4IUFm1S2TuxdcvGmT60kq2QZjqQbqq0jol/0cFEojhACp8
         SB/46jC1qaq9ynHo5p3FSIp45V18DW0QI9ANGJm42Ujk+cqTtXyh405VcaZMmUnGmw8N
         KFp0yFrrZo1ewaxAnBdvpZ4M+pd3B9sly/A/nAXL/aqaZLEHYj1+MJWEkGse6UMkBrnU
         CCjhMn7Db9mfTsK9thdeHgjD3gnXpvWn7hMdPjL3vQH+aAHFZyf/cm6+BJ33txXd7oq7
         qO1w==
X-Forwarded-Encrypted: i=1; AFNElJ+c/apzSTNf1kqY9bxRl/5Dc61AS/abykqOysC5zQ4bEJT0cadDv0d6Rpv8s0+nNRuYGuWSRpqHOsxN1VaqCeWR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8w6aRCQNRLRjT0I1aREDlfhqiqB9F7oxfL+D1ZDgJRtq1qwgf
	TGTWirrHt4ZkBuMzvR3RT1NXXLCT8k4D6+j7GvunllB2Ipl9FqldHcaqrFkhfLALwUI=
X-Gm-Gg: AeBDiesai+qMCmcX6I89wjRCeBzfatrY1rxqSHZ+CRDuH4DZWK7AwWJoexWCm0d3lhu
	akhDs0NoCSLWSeIxxgKLv8EgI7SZGPp+e9ve5GzpfKWLwvZoOLoEVtrs+uAA6qVvxFNWHOvgB50
	MzC9mgEgk2CiAh6l2GUa5Yok16ggMP7hQFkVpnfXS/9ucNaZUGJE/f6bg050nAwBAAbC2VTm8oT
	/RGMZUK/X7Ff6ghgjn/Ayq9kFmeTB3HosVe7Au/2SiL6hveSobAfhzhxXsTBmWWVDtK3NwFN0B2
	/UnOfGa8eFr4EFkM4FxZTMQp/amHITgH5KC2gfWJ6z9Q0tcBach7Ki5JWMehMwKbXrbErwGNBlQ
	bBRVoBs0yGIUpK6yjMBRqhe/zn7ux8hW60pVpG+i8qhywkFlZ37OLofAktHGgMaNNJtTERJ+who
	YSN/g8Ar+qA83WpXe91VQ786Zez690Qw==
X-Received: by 2002:a17:90b:1804:b0:359:83d3:27d3 with SMTP id 98e67ed59e1d1-361403c326fmr16049310a91.2.1776729086216;
        Mon, 20 Apr 2026 16:51:26 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141898ebasm11819562a91.7.2026.04.20.16.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:51:25 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Mon, 20 Apr 2026 16:51:19 -0700
Subject: [PATCH v3 3/3] pmdomain: arm_scmi: add support for domain
 hierarchies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-lpm-pmdomain-child-ids-v3-3-c2c40bef238c@baylibre.com>
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
In-Reply-To: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=fQmK2/l/owONuV/KAsTohuLBlI/zxOSPwI6yoI7yexU=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp5rv6y2OemQ05EvI6I9Eb7ji7vCtT8ygEexN59
 biCxvg2gTSJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaea7+gAKCRBZNxia0/vG
 ZWyAD/0d0/YBQizqrbUviBkwWp3DBYDrtv2ykMygkKlK5l5L3sb28ibT5WnM8ZKqh+t0KUia/iZ
 z1ZHFEHYVTHi9u+NXT0H10ur1LRQnWGt5fziPeyxaezbBY4YrI/MerMp3WyJ9xuVPRWOA1hbbii
 HvTXoszaQQsEngTIMXMz4v/+a9W8NcOWYD3awqyH1Dbr8aSno7skX2VyScGvFIBeCHo4PMfqx3f
 rYbFgy28uknIGuOkg/CWTwjojLRtghphUiE9bfW2083x15l6bhlcvg4eTAFL/IkzQmd/pUPLzKD
 Ww8WkE+0rrAvtEh0o/UMFr89T19zGcyPaCKJXBSa+7AhimyFta28Iz7x1mInWwrkSSv7rwQDxi5
 K70tevOBPa/T5RgkyteJfwHSKMTpUsi3qz5YYV41r0+VFVzBuklBnQmgVAgDpA3sAhBiVM8zPgo
 dDLB094XaZa/Zr8ZtRa5EauOf+LM04uLX648SRJMw1HgO0E4qYU5qiW1axHnL+aQb9j63RHEoZP
 zgzU71AQBfc+RsWUukD2frkeinl9TgSa7UgMVrb4fjd9t6AH1K0NDThwQUdogfzqM5wHV+uUbya
 ImAuPuowMRCnwI57qIk42BJJJk7hBurgdH9Q9kP0yP0yj+37ivwb/NruZSiW/vU0XrsFBVln7C6
 HLUBmgLhKNszwiw==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_165127_142860_EF9184C3 
X-CRM114-Status: GOOD (  14.53  )
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

After primary SCMI pmdomain is created, use new of_genpd helper which
checks for child domain mappings defined in power-domains-child-ids.

Also remove any child domain mappings when SCMI domain is removed.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index b5e2ffd5ea64..66dcf2e687a8 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -114,6 +114,14 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	dev_set_drvdata(dev, scmi_pd_data);
 
+	/*
+	 * Parse (optional) power-domains-child-ids property to
+	 * establish parent-child relationships
+	 */
+	ret = of_genpd_add_child_ids(np, scmi_pd_data);
+	if (ret < 0)
+		dev_err(dev, "Failed to add child domain hierarchy: %d\n", ret);
+
 	return 0;
 err_rm_genpds:
 	for (i = num_domains - 1; i >= 0; i--)
@@ -129,9 +137,13 @@ static void scmi_pm_domain_remove(struct scmi_device *sdev)
 	struct device *dev = &sdev->dev;
 	struct device_node *np = dev->of_node;
 
+	scmi_pd_data = dev_get_drvdata(dev);
+
+	/* Remove any parent-child relationships established at probe time */
+	of_genpd_remove_child_ids(np, scmi_pd_data);
+
 	of_genpd_del_provider(np);
 
-	scmi_pd_data = dev_get_drvdata(dev);
 	for (i = 0; i < scmi_pd_data->num_domains; i++) {
 		if (!scmi_pd_data->domains[i])
 			continue;

-- 
2.51.0


