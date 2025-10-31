Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EABCCFA09
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RV56NpH1lI5ED8FEKTPa6jAqZswvvDhZwVi486+R9e4=; b=sHKU7Kyt4WrUTEhPvX246ZJcQA
	etxm30lvCMuaA9mafp+BNbsjcomjVazUBH8z26ck+BYUZkHhgZ63vMXopwzGe970XyXi5Je3CJ0Y0
	/8k0zDGFP5qE95z9E2yPUisyw/X7nWdwWdMA0pZ8lg+kj8U2RxV31/Bzq0m61mKQPz/ojpvvJ+W8C
	UORonqRVfU4T3NvrrYMC1aNZ1Hjt/ofOVDADpU0V/Q6Sy/03L1SzgO3198JQmnwRjwb/YUwa/PJnU
	FgY4H1mTDI2zODH7HKQPrvlvPx/e2pMLEG7matn/FIzQ6JQ4OsrNLovMOYx/rZGxV1OB6O6rbuWoF
	CbyCn/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEog0-000000067Wa-3g0f;
	Fri, 31 Oct 2025 12:56:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofs-000000067Pg-2zrq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4770c34ca8eso19340445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915371; x=1762520171; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RV56NpH1lI5ED8FEKTPa6jAqZswvvDhZwVi486+R9e4=;
        b=BfrBTsriSeCAT0o128NVYBXYnuMdqzJeLG0aU/1cuiwDsRr0lNTUegknbx2hyq2+ac
         h88Cmy/TC/gHKOfpKDYtVn9wSPa4mFi6xQVkp9GQmSq/spHw5gNLZ3c7U9En035PV3LR
         QlILV4Ar69Ia2bIiIjihHU9WaiV+onQMWywNTM35VSVvRXhFLgtozx7K6PeZXSzQ4NNi
         DAojJeLwLjBxi4YGpdAbF6iDNv9+CGaFJjlRLRLFjSnrUkteLDmeVkKdF/M9n92OwnWp
         yNwxBE8wZb8IQSqV9YVDcJ573br7hUFqTzF5D1AP5XrbTvAc1p38fjnj/TQLN04OWC6O
         yOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915371; x=1762520171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RV56NpH1lI5ED8FEKTPa6jAqZswvvDhZwVi486+R9e4=;
        b=soAApk2eQg8wnbjthhKvD8CGwDrxdHEbGlmlQmnGwJrn9BNtWIJgFoHN9xOXXxLeni
         Sdo0Crye9wbtaHi9liKcvUlRVK97m4mWAl4DxOA66VbfS8LgIQ8IiM06IQcWC6X0LPm1
         kKG1ku0eEBHfwE1G5gl6LOrfohRjmyeTB/IVbXdpuubVrMo6buA8rllN4mhuhmej/cH2
         R5rK6mx0bRNsu15yRwux5oMzBfZooiyOa1DpKYSsjPka6lASVKrAycrTVNxFjlxcKd7X
         dJ+Xke2s9po98WV8+ZyA6dPNuVE5UEqTDWm2E6I18ySOE2HA/HouNYfWfWE2q/C63h1y
         4RWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQgmG3P+kuNv7/1cPtLXSGALwrx9BygFIBzz+IqdYlJhMYYSedKPtTWeb/sQRR3ZjPQ0iSsH8R6eBPSWdt1qaW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhv+gDAOKXKhxdMojSN5pAzi8HBD24DHujG37x2H6qdYLuMHBt
	g8L60k7Ymb5Slp7D29VxzgOKyttfF91LNZ+EoaVxumWAPb7QeQnApx9zuEXLN/awSGE=
X-Gm-Gg: ASbGnctKSjKYQa4OAlA4nATqD7Ru4H+X6rioJygm+v27mh89OOG52/XyEEz/txNtaQh
	H8QwGWtZP+7AYsfRnn2dnuYjEkuj56oeZyKyPvfe8jEPC9yQ/cuvZgwfEVJtX2yZHFtS4v8kAVQ
	jQySeQhA4mAfV9eCnxokTRh8662cUFOiL8QPCBCp8IczXBQHeN9Gf738sPCtrWl52KxsOgkrcxH
	CRVPSIAHvoT9ZGHdZzyTWIWtu4duPypmmC+whMBwLZ2JBfp0jgowsFyF7yqxon9p+TxBdkmka0h
	I6pyNThEfaiB7z7PQDX51hwYA1hX8kCufE6sv5va/A6ptAQzWTz+5EjxJWGRlSesWmMbHzDQg3O
	Jm+J3MAjxVULyB1n6xGIwYmfTI7rccQ89TR64faQCG6ne3JTSKcY2bhy2SEURIUtnk4+Vlrb7Fc
	FATf6LxIkls7VftgRVq4r+XEiVk3KNEGv63Ab7tKr8JxbhHlkGqaDi
X-Google-Smtp-Source: AGHT+IFeggZ5me4AtsVkM9uFz8xqiFgrnYQxbJrRB9xgQZPpOldZCFch7kDit8HV51sz6CbJralSnA==
X-Received: by 2002:a05:600c:4591:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-4773089c4acmr34565735e9.21.1761915370805;
        Fri, 31 Oct 2025 05:56:10 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:10 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:08 +0000
Subject: [PATCH 09/11] soc: samsung: exynos-chipid: downgrade dev_info to
 dev_dbg for soc info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-9-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=1062;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FIHoekKrBczbbS2fXtyE+7Irx4O0EiIRwRvzO55FnY8=;
 b=3OjTcS0UxbHqkoISucKjpZEuvX9vXYQp9nnD2kJ4+sGz7IPnIXZMCM6+YJE0WSVoEpcWN6fhL
 AHJDtb+21OcA7QBhRkXf2VyPH00dSPqRQdyZZ3BygbNy9FOa1XSl/mr
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055612_774518_F419FE13 
X-CRM114-Status: GOOD (  10.51  )
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

The SoC information is exposed to userspace using the standard soc
interface. Downgrade to dev_dbg to stop polluting the console log.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 92cd5dfc0a9b641428d0d047cfefd4256a893ac0..70e09ac656e4b95d5d252272bbe02bcf0f6fb2ab 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -241,9 +241,9 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, soc_dev);
 
-	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, exynos_chipid->product_id,
-		 exynos_chipid->revision);
+	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		soc_dev_attr->soc_id, exynos_chipid->product_id,
+		exynos_chipid->revision);
 
 	return 0;
 

-- 
2.51.1.930.gacf6e81ea2-goog


