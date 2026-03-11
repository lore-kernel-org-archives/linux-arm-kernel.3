Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73567FD88D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 00:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4UkaIVkjTxZ19xGJc/X7b8NyYsvb0FdSydtov7Zv/8=; b=wAg7grWo3g2hSioMYHP8MC58aV
	WRsROdUXOs28gmzbjc6NHSb0WjbUmpTuZE6JL0L8clPtQH1hGbA5w/ryN4lMXcuWc13xffQ4BHUJc
	QJ5YbkZP9QIEQmm6Ig75XA+P5fGY9Mt91XDkZZxAeDKuCKlexYbfKOUQXZx62Q+wkLHAXHVgRyG1L
	paRGqPwzNRAYbuI5YDErv26ReC4dWFkoJWk7THFLddzjm/nRQzmbn1yzVlrQfFagaiJ0bhAZd3OzX
	CbY1ohvijcGLX7lUuwFyTRRBYYFJaqLouanEcFBN7JYqwU/nkvyhtFjsWlMzeCMZ/j1jSeEF1Dm5V
	0ubJ/6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07Ir-0000000AQLY-1DZe;
	Wed, 11 Mar 2026 00:19:57 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07Im-0000000AQJR-0yTP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 00:19:53 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso5105576a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773188391; x=1773793191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4UkaIVkjTxZ19xGJc/X7b8NyYsvb0FdSydtov7Zv/8=;
        b=s5xnWpP+cyUbBXaE7AF6Mrq03KfEnYrODFsgtsQNYXCyLAY6WwNmlM9rkGQKwHft3C
         wH3pn+pXBldFW4AepSax/HAJ4hRXjW8zgk2JPKHMXPT84r3OOCCo3TBYA8VN+DvWDMts
         0F0SIpNIEdBdwoL8dnMnPtg38sUCMACcNs94fArOppnSM/QdQeqn9QxWijFAmmwXsbqy
         rQQC//2k5zDCCv7FEQYhqklKH2aDwnT+AJDpj8aeHiM2ZMKRuOfywCJoAU1siUOGML4V
         5yJl2B3K+C3Z+4h+U12uwMBvXyd/lKrOFi30GgvUJmy0BLUBsC1q9hOkruWr1ngS4MAe
         N2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188391; x=1773793191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G4UkaIVkjTxZ19xGJc/X7b8NyYsvb0FdSydtov7Zv/8=;
        b=jFg7S0WbzAPl2y4hqD4m5Wg1k1V8vK2PLMv4UfLinnNDr+CymyNbSUo6ySCm/g5c78
         8Fi3ovSeyclYDgdhh18/fdAzgaAjNQmrI0urfSK5qQTE80MJLw4pg/NRDYkmEVwf766v
         p5r5vCn5rsG3FRBe6dujBIyCcpXa5q3xjOKaJjyHON1Jvm3eiA21CM1Xu2kzG37pTVSt
         fzu+DLRxdcAi3fYPzKPA3DjTum4EMBsUTgrHJRiL39h4+6ZX8KgQQ2e/ATn3ZhSaicQ5
         HFyX0B+ZUx+PvtIJKLPWSShTeZ1ZVsF0wyO3JJ/cWsd8Q6ZQCBz0FxXpr+ZQr84HKmq+
         Tn6g==
X-Forwarded-Encrypted: i=1; AJvYcCXzunIbdZ3lRsqS7wxQ93EF9EC5E/jB3ELAB6qzva9clO6v4WTUxzBsD1kAYLxhALXGmx+UgwBHQyhkEunvQRE7@lists.infradead.org
X-Gm-Message-State: AOJu0YyPgoIUipXPcr1mjmMuM+/KkJdaCYvWhtTV32HnLU0XsFTqWZFK
	XV3IimEpfmIsHdZjk+kMXgrAsaQHhk85ft2jvp0rsdL/jfLw/E9nEcI7QUbZGrtJdw89IbFF/nC
	lWa6fSGw=
X-Gm-Gg: ATEYQzxvhzv69qP5DSmTnyf19umIG9N/iyuVqwhsuNXZ33QUy5hT7AtiZqZyboyD5q3
	v2i+irk/jjHbZRFRYSMHVxryZq4erhmhmBOoj7qlNoTLa8gwcONlV+sbKRLns4MYW6HzUYtNL/I
	VFMZ5whjQ78GbQiYydQTLVuDOdTpy1iwhoRyotNgNyZZk1NTjXBLj5CY2wcTu3T00ZSRulroMhn
	QINNZtiGHrvHoW3nDnZkRwwEq9uCSC7bQRpNwiZU/ip+wee0+l577HwxjGES3OS9NbSweXo2+7y
	XCrB0iGLa5j+4Z+0IIHPPUaxX8SngvlVUY+hq2iQBG4TwME8r13d/5Q4phH7YFW5cJ9yhSrqOww
	jH7wEOwcdauot7Z4s6lHY/RPVeFecRUlWZhWa9s1vsGlQnvG8DT3E5Fh/RpPS69k18KZW9vFwRH
	pPi4cViw6W+7T6THNQLuqd6rQ6+vL8sZk=
X-Received: by 2002:a17:902:e5cf:b0:2ae:512b:eea9 with SMTP id d9443c01a7336-2aeae8932a2mr6152945ad.36.1773188390908;
        Tue, 10 Mar 2026 17:19:50 -0700 (PDT)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222ec3sm4843865ad.1.2026.03.10.17.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:19:50 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Tue, 10 Mar 2026 17:19:25 -0700
Subject: [PATCH 3/3] pmdomain: arm_scmi: add support for domain hierarchies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-topic-lpm-pmdomain-child-ids-v1-3-5361687a18ff@baylibre.com>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
In-Reply-To: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-53144
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=SpNaRu6uMd8HuXBGwkIHZTjCWaD47krsvCZKz8R9UDw=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpsLUiDjI6WNZvQ23csmjtCDm2sG6My9oxiWgsj
 jofXq40XHKJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCabC1IgAKCRBZNxia0/vG
 ZQFQEACPB90DS6xyqHEHKzUMOrtuYJlGewKdEEMh/l5LQXY41rYLvJsbqdV5LCx66GdglEiD4NP
 6jeDqaJIiZpGIJbxgDgw8y8w6vwseR+NoC8YtF/UTEhOrwYCzp0xxdI9oo/WwIr+Z2zd0EBnVr+
 y8grEV9ktvw4lR6g1KIMnvqIw3kgbMkn4FwM4Oi5xfzdEvH6SB2E6A0ayo8TA4pNym6k8XEgNgD
 uJr8d1plI43iOLDyHoQXaRjzp2Hf+zqNtMDKQL2H6McB1m08HIeuxUU21z3xIci4gF4y0XXROJX
 fHsBHaeAECe8YOGRatDhLklxJqTGyerbGv8F6nNqa1fCsyBy3lX9GjMhcUsrKln1ODUbvCTQKR0
 aahV1rNojPIrZvK4RyS0Uxb79RJ9vDjDnggMs0e1EyE2oFG6moVl1tzla968Q5o28bk6jP1hrDH
 kKq64Jd+N7nZzEgls8sh9PnSajocfYaDG0ae1zxUTRND2nx4aWfRgACm8mC/PiWfdmz4RbQRAK6
 jmRP69B4LbXGNZ9uhBO3Lvcta53D1eCazu6HrlkDwYozWWJyLZmchRhLHkpHu1Q8VSOL8MS91Jo
 x9K50uoHLg8IkriC+0sLR6QTRfqAlIknTnzIVpYRj40VFQvP69cRTE3zxdR9UZPVLIvsGs3QVT8
 93oWglDypvxbtHg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_171952_301019_69FD4968 
X-CRM114-Status: GOOD (  14.41  )
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
index b5e2ffd5ea64..9d8faef44aa9 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -114,6 +114,14 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	dev_set_drvdata(dev, scmi_pd_data);
 
+	/*
+	 * Parse (optional) power-domains-child-ids property to
+	 * establish parent-child relationships
+	 */
+	ret = of_genpd_add_child_ids(np, scmi_pd_data);
+	if (ret < 0 && ret != -ENOENT)
+		pr_err("Failed to parse power-domains-child-ids for %pOF: %d\n", np, ret);
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


