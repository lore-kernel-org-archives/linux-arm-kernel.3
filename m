Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CB4C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwjbmevRcW4yMfkA4dX1AKUxaSG8vNc+QBgPKteOh5Q=; b=TjcQNzLtUmxU4zPMz/1t2Nit5y
	N8UF/jvicRIfUlWF0/1ZzV5RErV4OpQRPRACVYZ+/2gUSa6OcIjZDAjC6HJzpldiHabSPg7S91tnl
	KUr9x6bn5hosN2Fp5hUdlrV0Qy2nPgr+gaAh2o327mZz9z7d+VHgie46ztq0vqY6efYjAR9upRIZl
	fBqaEbUoQekHl+79org6FK0BECNH12u/4kexlVjrSdAuo9I2VOKFeZNdKUqqT9deB7ZUO5SLctrlw
	hy/n5Z6NMJXWTcEDVEk25UTsjzYIvpE0sx94wA6BP+5BG4dHWDE6KxOliqHjPoVwA6uHhEey4vCaJ
	raUvAxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvQd-00000009OkE-2MnM;
	Wed, 19 Mar 2025 15:33:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvNH-00000009NzP-3B0g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 15:30:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso6394195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398230; x=1743003030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwjbmevRcW4yMfkA4dX1AKUxaSG8vNc+QBgPKteOh5Q=;
        b=S+BMVPvnv77NmhHkYU5kpXqpp/hkszAgUv9MC9kXfEdAb/6v9nx8Wd9On15osu5Wsw
         XmlPX2aOctW/8+J4KBMwXq7NkyiD+njHP/df+X2Rwx5rpViQctu4LhsZke72KCcvpwDI
         +6GTIZabyHJk3ydaUqJSti8s6P6Z4WnNKEE4c2z3uP5F7M16Un0lx5gNv/oyawFmwKsp
         d2la3Y7waEjRsavlJB8D9XSY0YzWQKWmbiTW1XR5cc8ySr3Hx0AUbdPCwKJuxlJnWvGw
         EsPl2zvzuR3Boohdl7rfkjgz+B2AuVkDdVukFLlnCbqNd1/jCttH2xEmo/lRQFzzKA6W
         hVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398230; x=1743003030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwjbmevRcW4yMfkA4dX1AKUxaSG8vNc+QBgPKteOh5Q=;
        b=L9Z2gYtINq2OLR1hY6AGpGTEuerKrael0e9q7oeD+4P4Aosl986ddileyK/Mz0GRcH
         VMXAV1kTgfmnfSQB3N5UBaswNI1VqSb2f5aZHRCW4jIFbWmqeYpx3UXz18nLxn3A5RyJ
         wv5uysFhdeT/3F9O5YJwyXYWQCfmQceVizAKetCJ+5H1Q90I2swYpMCRRjSpS1Wo0bdG
         /UnONDPh3kzGXv/WRLoaxvx6BjMb0DLrv30ftGWsJhIfHzFSpUuYFfRvUgze/MZzN3KU
         WNVqlaF6EQHkUFG6udLrkOxY8hUJ3srR7SDx+hwHJ/UYOwgKdvj7bpCSzMaLw+CidPJA
         QUAA==
X-Forwarded-Encrypted: i=1; AJvYcCVz1FLGJ6dFKfFMeT0OGwCADbaRLG7lhXlKJowbYN1bnOfG/Lz+0OXR6YCslcKGntCI8yQFWyAIaRrd4kLkNrYC@lists.infradead.org
X-Gm-Message-State: AOJu0YzG7K6eiv2qv4/fG+umoy0EZcH/OAIziH4o6LJj4wSJfxa9/mVM
	auwe7cBS0rvnHtu8G5VvAYYe+BPwTLHFhYZoyFusH+A6fAn+8wSyqgDTWK7GLAA=
X-Gm-Gg: ASbGncu4cFdVg7mI4jBKAgcKUvJ7hCyCqLH8gFCqbfnQ4u0gPQPjpTIXF3P4owOb1VV
	yLDo2BV9uGkEvyIdz19WfjEDo5yH/wISlE+y+cAxobR7b8wmHPxrnAFUkVBEiHNtOeuWtu4S20J
	pqwogwWCCQDPEWyaebiuqrePk9+E5TtoNCNC5U7f8V0Tj9awiMe/+L5gkya/ME8Za+/mwqQZnQF
	6ID07I7dz1ugR0eaHbZLrvvDGOjO3twvmysWfLGMH+iY6CCM63HqaPFkAiZUrzlEgq9TAY1NbYp
	T30rr6gYOya8g8ZDq3uiKJAo95GzpIP1HP/oCJttIp2DtxQqtw9GbWc3lvjy6UScOiZl49PSd60
	Dw2RnDcGh6Ko=
X-Google-Smtp-Source: AGHT+IGMbhvAoKZ5MZTSGuKQwWBy+XHvI6tDwhUHbcw9eJrBgGY8SFOMgUHG77gsUcqyh9kE5lpXWA==
X-Received: by 2002:a05:600c:5856:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43d3b95f76fmr61386045e9.2.1742398229831;
        Wed, 19 Mar 2025 08:30:29 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:29 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Mar 2025 15:30:18 +0000
Subject: [PATCH v2 1/7] scsi: ufs: exynos: ensure pre_link() executes
 before exynos_ufs_phy_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-1-96722cc2ba1b@linaro.org>
References: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
In-Reply-To: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Chanho Park <chanho61.park@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Biggers <ebiggers@kernel.org>, Bart Van Assche <bvanassche@acm.org>, 
 willmcvicker@google.com, kernel-team@android.com, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=03nXe96Gz68DXY2H0Ujds8952wDZmWtW9nwe7BZ34Ws=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn2uMQZlA3NYaC9iaL3h/pGHUSlEutMRvCD5thM
 9WKscPfzzGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9rjEAAKCRDO6LjWAjRy
 ugjPD/97aGZqjPkj2/fwPbyQRgsv1vpdcmhpXOfwtWmb1QyfOW6/ACBPRX1BjM4Fb32yZ7mz8hW
 qS5ca003v2iZhlO/pxyOsaJswTIzUNpY+/X51cAEjIOA3eizjndOKzl5Sa/+pmuXvoW0MU2D64Z
 0fDE2rkK6C63xBtMv9vSyeGWP0xMGtjrXH28QjH7O7OUgpBpAlQIlDY2W+3ywbWDpvBLPObLiki
 f4RVMFgRf1mT43lig0UDqf4IKyDyAQClKCXMF7Ml7QKnYjorn0i5eFd/MjJGhXkOyxRcsBqsw8v
 UlR92f8uBwlQDtgiV2odpELxZUNQyspLFbzlzx1nXCS3J7tBuwmnyfipWMKB5d1UwL4Ccaj4yMa
 PsVfbR33+4w6vVl0q/0GCouG4KaeM9Ps6fgUpUh5t/C0RHhKTDQeru7yf2LKcTLOoy1L2mrvsLA
 XKBSjaQkfMctqQlBP6o8k9iViVBtn0ulX9Ug4dGcjyXzpOZl2QAuIAKvLFTK55Vem54BuYf+mL0
 1O00+Y3F/x6U3qLelrsYoQtxfVD/X7Tmh4nxSPO5iMorpfIwCHe+aIrkjFL/VJWRDvzZP8nmkjv
 fgC4v4xpypP3/70b6R/Pii7WMujV8WGTIpmoTrbE9XvBnkcEwQdB3o0Iu8VZouSWkgm2P5J/9cl
 LX5cV3J9ueEAxVw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_083031_800093_03DBC461 
X-CRM114-Status: GOOD (  13.67  )
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

Ensure clocks are enabled before configuring unipro. Additionally move the
pre_link() hook before the exynos_ufs_phy_init() calls. This means the
register write sequence  more closely resembles the ordering of the
downstream driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index d7539cda97da5023ec8a2852ff3f5191642ffd37..0c8c2e41e851cdbefc80a66d87273b7e8fcf9d4d 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1049,9 +1049,14 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 	exynos_ufs_config_intr(ufs, DFES_DEF_L4_ERRS, UNIPRO_L4);
 	exynos_ufs_set_unipro_pclk_div(ufs);
 
+	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
+
 	/* unipro */
 	exynos_ufs_config_unipro(ufs);
 
+	if (ufs->drv_data->pre_link)
+		ufs->drv_data->pre_link(ufs);
+
 	/* m-phy */
 	exynos_ufs_phy_init(ufs);
 	if (!(ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)) {
@@ -1059,11 +1064,6 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 		exynos_ufs_config_phy_cap_attr(ufs);
 	}
 
-	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
-
-	if (ufs->drv_data->pre_link)
-		ufs->drv_data->pre_link(ufs);
-
 	return 0;
 }
 

-- 
2.49.0.rc1.451.g8f38331e32-goog


