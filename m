Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C30E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAkCsjd64377nzOHo9/POEtdFNrxXL0RDJBoIc/E4JI=; b=H4s9VfswaV4rBREw9gwrY2RF+z
	0wrAAOmEzcnneA4hYQaEU/IcxntqMeAj89YJSi219E70TD0GnQzcB9Y8QH57XbNYW+z2lWLb+QUCA
	CaWwH+Wvyd6NWpQfQJ5hDTbXhTnP3eQdF2kqYoHHD/dwNiPIeccY/4EZAXlMijB21QYKNeLyyGYo9
	9dbtsCFd9Pt4pboMM7ah9tAgmL0TajaLer2Sgoh49P7qU1Ux9QvfMsXbmtYLHF/EPsM4GXFfVRx7b
	PPv3nqnJQ/opz2D2qdwe2Db8Q6/zRURQ2zjUn59Sld9k73+NyJN9t+47ae6ZDosjuay0cEbe567/M
	fl/Fv5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tt8-00000007YlW-3JDx;
	Fri, 01 Nov 2024 15:48:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6thl-00000007Wza-0uQc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 15:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZAkCsjd64377nzOHo9/POEtdFNrxXL0RDJBoIc/E4JI=; b=qUPT9Hw772m1WmcOwDMuEyEs/7
	BSWbjIntKFzYc5OQVfSIGUIWRT5PhPyw9+6xsLPbeLe08gTSvQ/1+0k8RXV+vGHJQcHuVANEkoruP
	BJTyItWVCvJGcqIPFdJ2i8zcZP39yVYCyCOSi5p+wZ+Ety2q/5YS/jZRrA5tsBS0duyexHszNh8zP
	gsMvTz9rqs+AfYwpB4Osl/YWIx3SWOVFNNByd5a9yXW37I/rjMhsylaGjez1vP9+iB7lPmYxjrxwa
	fGnRA2VPMXX2/duyJMk9L314/t7//YDklnLgy+btvrcBBUZV+Yp8L3Rvvp4f+t26J1voCtMtnhhuK
	w/bhnIrQ==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6thi-0000000AlAu-0ZqV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:36:52 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so1733620b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730475407; x=1731080207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAkCsjd64377nzOHo9/POEtdFNrxXL0RDJBoIc/E4JI=;
        b=TUi3ORllD38bmefuvnKWvuxXejLB/M0wAYJyZHJl/aqU1p+EtTHJ3QW+OrbLuIvcKj
         DhgCNACo7TRLRUY6OCHPtNq9DjbGzyf0k4oA4wcsb+n06r1kDSOqTVmx8FC8l4SGCp97
         iw2Se0FicjH2bAZm7/9sf6aHciW5WMLp2uGvNgsqiYCrnyh/P8CjXrEKt93qKx1GKjDJ
         dcPxPB9F8xqT2j9vMiTmW9NXhbU74/osewaXc01hyHSmO2mxs/kdLT9+UV0hBx+vsYLe
         vxvVjGCiEIXasDSIj0aHatABVJNaSpmjI22ddcbClesdjFRdOlCbFL3Rytl4iDQ1ef7i
         Hxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730475407; x=1731080207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAkCsjd64377nzOHo9/POEtdFNrxXL0RDJBoIc/E4JI=;
        b=bKTuNMoJJfBtwCo8QkeHkkzUjEsV3d4tg6FaV/02Zd31subcgrdtoXXRHs9mUW5ve0
         t6Gn0EcVnoIotoOv2pkFEMXE0bRA2VKf9+sF1gCdIcbcTQiI8RYtuJLGDwm+DtqeXI/o
         aVvIt1wwENtBEQ8XLaaTnJQOvE7aygrN9J8RV+UfjvesUJZQdt4zQYOBwHkM4qU2mc8w
         KaJo/n1eVMIlzrZw46XyqrD0+/1SMv9evutrcJgIk4Q46d1mVL/gnRkiYYwwb7TixNnk
         JgUuNoLyBNWVqLWM478bAny8rM+cCWZE2YQ8k15N5szEEUEBQoxRjqFO8L8NHruklVfL
         CGqw==
X-Forwarded-Encrypted: i=1; AJvYcCUiFn7HOVgcEGizM4GO/5LARODD7haBhCwKEfsTqkG23qX9wJjhyz2gCOFbmKL3VhlnJEqQzq5sJsMuUxfmrb0s@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2rZQGeP399u0N+c8TWBzHo0iHMSPH4zefcFygH0oQpuIJ170o
	tn6KOtm7MPpToyKhFWiHNMkmYCl2kdO7+LH1K9By6I+fANEgN8xn4XSc3ld08jI=
X-Google-Smtp-Source: AGHT+IEFdgOZoHFIXn49wGqPLZ3SYk/IIboTgwbEWgDk6aBN4zZ9JHMpc9Eu70cGhL1y3h2fXMaZ2A==
X-Received: by 2002:a05:6a21:6e41:b0:1cf:38cf:df92 with SMTP id adf61e73a8af0-1dba54358b0mr5218831637.30.1730475407408;
        Fri, 01 Nov 2024 08:36:47 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452b1643sm2605552a12.38.2024.11.01.08.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 08:36:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Date: Fri, 01 Nov 2024 08:36:21 -0700
Subject: [PATCH v5 2/3] pmdomain: ti_sci: add wakeup constraint management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-lpm-v6-10-constraints-pmdomain-v5-2-3011aa04622f@baylibre.com>
References: <20241101-lpm-v6-10-constraints-pmdomain-v5-0-3011aa04622f@baylibre.com>
In-Reply-To: <20241101-lpm-v6-10-constraints-pmdomain-v5-0-3011aa04622f@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-cb14d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=j2mcJH9DFAs4uPVxByFXW0cY1Bip8MTsLuwf/lpgjjg=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBnJPWMwEgrEwQIThMQCDH53Co+Dy+UFgtBlPq02
 yv5jNKxjgmJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCZyT1jAAKCRBZNxia0/vG
 ZVatD/9PIphhgrCdu4GvT0ZcoFVEWMYN/GveHyxQaVTgA7X8q9UnYzf4iDUabsgz2qdYYSriQJ4
 LY9xLT5hNSDxrWndcYZWxPKlUY8LuFEnObdQgxSkF5ZIPQmZJDN67Aod2KvBS3eAE5R8oy5mg5m
 ztXHqiCZQLWsDmDrcIDn/tjPKJsbKsW6DJInNMWJE9lZxA1LUKU+zTttiVgdV98s+Ru/PniTjj4
 heSjrtcAhLdbIE9g9V6beNrAoZef121yLyLGP9AqvtLz8DviR8uzHCxlSBuLdynS6WIzanAyNlt
 ijhsBPK/VaS2MM4IKHuNEI7ANMn8KFRG5ei6zCecMhtFKB0YUemewj6a+TvytfAosgoJmsa17xH
 1dE387VUYyG/uxpPRRCLe3xEwAKx6O5N0ns9PM5eXngnq012v5Y9n+HlI5v8yQ4/rGMCaBbyCHj
 SPznTY2WdHrxB3FdhZPRz24njIsujGuZAFTaFzTfW/cHe7BABPQ2K+pAgMWWpeO1WCFsxWebf/9
 EFm6sla20f+w/sUAQEV6FYK8HKTWD+iQxOqfo7ba4fhgAv2zLQoVXkc+4uBjgcxJ1P7tsK+pM3z
 B9Il7J3Kkv6vQniLQ59Uvq7ko8/Zy9c5R/0NZXOb+JS/Wu/MBxK5FipqemkpKR37ROfqBqyCPXS
 3VBbw8YpsedLQTg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_153650_515093_33D13A36 
X-CRM114-Status: GOOD (  13.91  )
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
index c976a382d64c807daea72fa1ea9d6c11c8773762..ff529fa2d6135cc2fb32ae8a3ca26ac055f66cf5 100644
--- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -74,6 +74,21 @@ static void ti_sci_pd_set_lat_constraint(struct device *dev, s32 val)
 			pd->idx, val);
 }
 
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
@@ -116,6 +131,8 @@ static int ti_sci_pd_suspend(struct device *dev)
 	if (ti_sci_pd_is_valid_constraint(val))
 		ti_sci_pd_set_lat_constraint(dev, val);
 
+	ti_sci_pd_set_wkup_constraint(dev);
+
 	return 0;
 }
 #else

-- 
2.46.2


