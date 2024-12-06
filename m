Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F53E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO297//2n/rgfagI213U6eCWKlgwMp68Rn9iCoz6hZE=; b=rlAO2uILAp589upjVmOlva16n/
	w5uyLsnayhW+npk7zhu994+UXXfm4NqRq13S7wzirtTqq790PEH10pCPsgG6QYac0ScUkM+7DK9A1
	X8xGwqvJH/JLCyO92Tnsd3KoNnDu6lpTdqPYCxFdKamp3eK/eStiaD6+5t8fnPD1rkonBwMOsIy0D
	CeIIrnDQ5tTVNHSkht5Bmp2jM/Mgqyq/A54I0whF4OF6Pg0T4Wc2KM7NSxfZhbGQwHsobZY0JfHRB
	2syQ4e0EWjxTlweSm/STVWIjd3OKIGELlefy7oK50N2e5zRrrOqri/so3Y60QS3cs2PM0XiAey0mm
	GmBAeXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgdJ-00000002snK-2xxb;
	Fri, 06 Dec 2024 22:17:09 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgZM-00000002rxJ-1WOY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:13:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-215d92702feso22246695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 14:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733523183; x=1734127983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gO297//2n/rgfagI213U6eCWKlgwMp68Rn9iCoz6hZE=;
        b=1PN2iqH8LfFzo+KiFCBS9oOz423oHHA1ffpr1Qv2urfP+QjkNbbjwygvTJvvDfJGsJ
         UC3AJHARvJR/a6NMpkN4m9FSSeH2bCcCdrG2+DvBZe88nETlB9UyJT8Li3Lfz+fYBYAv
         xwP4fpb6nQBOU/ShFWN2+DxZieXeH4h0yKycb8IspBuTIkKThI6xmUXOqBV4Z0iioxOf
         1GUx5mT09HKgt4GRpT7KI+XnPuRQ+H6Tck7a7XAaFaesrh+QPe+SYUAk8Qsorc3812N3
         ly9GXkXZH71oKzbuagxknkK/D93Bffl+fVpfW9Apf1rjOUseWgtytwTPW3Rer2No9INe
         bo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733523183; x=1734127983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gO297//2n/rgfagI213U6eCWKlgwMp68Rn9iCoz6hZE=;
        b=WSIOiNGAJ4k0RbnzzPWD1I27g95PbJ+cCn56kEZg0NI8eJbfDSqZUeAitpvB5ANbA7
         yX3gfqQgRLrih26PLxC2cXjtuEVaVbUvE+8Vk5GOslxnbA0hnJUG2zka1JSDhR8T0KX2
         B+wE2wLmlv0W5zN7TvLml/biWoR6ggyhF6AUJKypbZt8OD7Z7+gF/EMic48kN99mTB4u
         ayrqxD1Cdhcle7qzZxI3wEm/+/ZZiajRn/TVhyGnoQ1ScXCuqmwp0sJ+PjfgGevTG/hf
         WEjGQO0vI1y6ehQgjdyOS7wUOAACzMZvmmsWzqZsbuwB0UvYBysZvlwZG77+GM0F2OXv
         XiNg==
X-Forwarded-Encrypted: i=1; AJvYcCVavrItXFYvVdqdx36q5JcaZPL0XShoVg4YvaNKersFfYZZPuF6VDLUmI8BEC516RLepCeWcsLY8Oe7pYPBEdSB@lists.infradead.org
X-Gm-Message-State: AOJu0YyYsf0eD8lARL8U6rspP0EcGGEdDPPbYn/H7lO1kIH+ugp3/rnB
	mxioreOljOWta12QyNfkYslz2yRlE0w89rMFIfxHsOpUex0+8n7/TAGe4tSN+as=
X-Gm-Gg: ASbGncsVmRcDshqKkYQYhqjckRpfsf9OlPY5jPDss9kJBARvBm4eeqFr9HJ7qlwgJRV
	fhhRfEfhKWOLuagIPl8Hnjci9TpFcUOf6XTMMVJl7N9WjZs6DQbMjcR0EPWIzpFXhY/vykBfOqy
	4rcNHfYuEo71cw1OoE5okdZFGOYKvbt+lIfsnqa/FhAYdxlQDMGbY6JlbjrOhTi/G4dxwu5/ZtU
	1PfMpfO9SdbTnnU3unTnbgcHuQtL53Fove7vgSoH0/aUJHm
X-Google-Smtp-Source: AGHT+IEV5xymYqZ1yJV9BrjFB0Nh2Eg2LOwsypkmTdkIep4O1iPhv+s2TJ3JIQRJlUDRcRjBY3qeBw==
X-Received: by 2002:a17:902:f54d:b0:212:68e2:6c81 with SMTP id d9443c01a7336-21614d4ac70mr65378675ad.24.1733523183496;
        Fri, 06 Dec 2024 14:13:03 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f31a87sm33273575ad.268.2024.12.06.14.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 14:13:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
Date: Fri, 06 Dec 2024 14:12:51 -0800
Subject: [PATCH v6 2/3] pmdomain: ti_sci: add wakeup constraint management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-lpm-v6-10-constraints-pmdomain-v6-2-833980158c68@baylibre.com>
References: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
In-Reply-To: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=UYKwDCjPt0Pb4J8LYvmA473uK8bBnXmKBatytxsKAXw=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBnU3bsqDLxWO2AWpws47wAA/jFbeDffWrz4qPsb
 SyYgMi7CCaJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCZ1N27AAKCRBZNxia0/vG
 ZRrND/4xtabQMPgyDLpYgMJPS1c2LUeKnOTWkJ83z8YH1AJs8pNydn7rBCna/HveiMWUjn7DPkE
 KKjuHB+QYLsgb94migpG4raM9BQZK3UVq5Vv08t7RT8UtHiwo7OTJj2DIPhXk/U+ic7dmaFjD5u
 yDFV0bFWqpRXJ9oHvLvS7yCWjQy/U7jJxQKVMUQT53bQ9rDXdewLkUzf5A6lwtPodtCArIZnYb0
 OhbDVEfLGmcRMBVjYsQKYXHRCbCsucsAvqB2quIcXCKrLewvW3dyfsCuJQ74kWnTjccm/hXToSo
 MQmwb2jaRhnuUDS2TYZq3y8pkiGM6obB910shrpH8UrZqdHwDlzhahtBnvbE0gk3tkC+LfUJIr9
 PE5ciY2YECShjBF4B33L5g+4cIngkCf+Em49mC8LJKf4ETH3rac8WXlgcMHS4NfaAbvzeXiphbH
 T+qnxrpBzYPUkTAmkj+Iffpmjf2oGsbILBNduO/ep9k87AbAoVe1W3jZxjUUiqa56o1rNN6JjS/
 Gfb+K9K6+UA9ipYUJc+bQDtSaeFArjOtcjDKKt+8NDeK6asdGBb0r6RiPId1HLPfe+IZcoxY1ay
 QeyzotFYL8gGZxyh3wpDySjl+gEVhMUHtI/AfAebsDjUEBM5fUE+puI97FJnlCZUo3fKYudUuqJ
 4TCOKcNnemEYO8g==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_141304_421606_55DC572E 
X-CRM114-Status: GOOD (  13.08  )
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

During system-wide suspend, check all devices connected to PM domain
to see if they are wakeup-enabled.  If so, set a TI SCI device
constraint.

Note: DM firmware clears all constraints on resume.

Co-developed-by: Vibhore Vardhan <vibhore@ti.com>
Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Tested-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
index 963fe1901c959197d5d8b5d34fd8420dfb180087..587961519dcc9e13c32efe76cdaf801281f72f67 100644
--- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -79,6 +79,21 @@ static void ti_sci_pd_set_lat_constraint(struct device *dev, s32 val)
 }
 #endif
 
+static inline void ti_sci_pd_set_wkup_constraint(struct device *dev)
+{
+	struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+	struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
+	const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
+	int ret;
+
+	if (device_may_wakeup(dev)) {
+		ret = ti_sci->ops.pm_ops.set_device_constraint(ti_sci, pd->idx,
+							       TISCI_MSG_CONSTRAINT_SET);
+		if (!ret)
+			dev_dbg(dev, "ti_sci_pd: ID:%d set device constraint.\n", pd->idx);
+	}
+}
+
 /*
  * ti_sci_pd_power_off(): genpd power down hook
  * @domain: pointer to the powerdomain to power off
@@ -121,6 +136,8 @@ static int ti_sci_pd_suspend(struct device *dev)
 	if (ti_sci_pd_is_valid_constraint(val))
 		ti_sci_pd_set_lat_constraint(dev, val);
 
+	ti_sci_pd_set_wkup_constraint(dev);
+
 	return 0;
 }
 #else

-- 
2.46.2


