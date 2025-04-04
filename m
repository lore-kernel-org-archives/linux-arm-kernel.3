Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5EAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=; b=LaaFPy37lGaoN/IdE4PNglKSzf
	oc1JwudrYNlsHp2eWNlXVKUzl7lrZCeNrPIAxx2TQxrW0dd/9RlnTUE5SLRydkhfPvE9wMOTtifsc
	QbRhC/WI820OYdboJSsQrMMFKan7AcOLUCK240DOCFlH8E9Mn/sFhJdNvliQeCoHGIanHnUDldKMs
	OmUrDMdfDrmMFYZarGQg0j3Zffv8vto+PvNw7g1Ibf7xY/soZJNpwK5XPlOjBE0Kpf5+PQs0Cw4qx
	+ssMTsha9xfheJj3sXrksdx2NrMBNqqH0oS2GCFWS2atBuOWphKW+YeSdkWdmhputsBvy2IvM9/8T
	XwNLARXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iB8-0000000C0Pg-2Hhw;
	Fri, 04 Apr 2025 14:37:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0i5t-0000000BzGd-40WT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 14:32:31 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso3468587a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777148; x=1744381948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=Dr6DrkKZ34kaDMzpDMwOl2F9PguZUQz3WgaGTDXrhiR0agYuUrWdPKgt0nSve0e/4W
         FoJv5M/SAbrFIrjl/5dU2kbbfZI7xaOXPM/ly7+FHKacpxvpj60FLT7MfOailHMImFAn
         YEYRHMyvTWgVXJsnt62/PVXePtxYCkU6MgueBBpxVIzzr+UZ9Tjs/Bfq9nL+ALk8Fii2
         ar8ufScLZLcv+4IqX9aGyzNpwM3UF4Sw2SgCr429BRAyu0IAhz17Mdr+tsUNjXgwKl5F
         UF6N+KILDmpM4lq7q+UeupRcK1MZ5Ca5OmAEOlliNrH0zA5bIayptOPd2TvCXmCLQ/2K
         40vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777148; x=1744381948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=U12pFmKbYN/kEHnqtRiRbRTopwivpAvKMfrXmXIaPRBRfkgZ4BZmmjBQYs2FX4RANw
         inpdK2jefCNUn5lArp7y3WRLemOGFxOXzHKueoPvlWlneW0A5AXR+rp3BOc9BFw42YB0
         UrjMoN+YqzXaUZm1xm7WTxt1wHXPYTTqYZs9/ChaxF6prcvP+r+O24JKGmb8v6ZK5s4C
         /DaBCngJkqS7xA7ay4H/v/ZjUQsr6Dlg8hGDYMQX63jB+8B2x1UqftcFfl7/7vb5HhsP
         FsyPeZpKpE994Y6naskzDjr/i4mK4zOXTRiu8dq58HrJmPjDEi3k4yzY+z+k/U2rxBRT
         WDdA==
X-Forwarded-Encrypted: i=1; AJvYcCW0kLptLaUueKN/hh0zLLFsGuES9hGl4GUPbEyh6+NhTv9+3xTnyoLT2iJS4ufYQqq+0ru0ZEQH3vlHuYnv8CNV@lists.infradead.org
X-Gm-Message-State: AOJu0YxT7gFi40dOQ1JOqB9+jCzvchmOC5S3owW6XbJ7uDsDyVFKck3k
	ddgWDl2j+Iq3f3RgBZkqjO7vYXkI+MAaSQkKtfxCRan4rfNvZ2HaN4A8/iLGyVM=
X-Gm-Gg: ASbGncujNEa8rHNDjcqYht/l0wDIa3fmVezVkzo5/FxfY3gxnxXKFT/vhBK9cG6WcXs
	npVko/3tl82JinBXR6e7zBx2KAcu0S1/X+8xdY8W7zAyYdflvbmjm1xB1w7pzXcVnCJO16H2Jz0
	0YFUT+TqnTs2wFeSY6+MFTTBzMNsmW6sAzrde6WGE16RsyB2YnKIz04FGAd2TGmgmhtOkKG28ST
	duvBbkVVUjs0+S1PBQJPs4pT/uiBlPw+n9xtP66e5Es1zkQQmgLsHQcUgEyEDt6Et61YhByn2pJ
	sqo6pxoDzsvNdaXD+GJl+23eq4FMvogT9DS3DIRMVooKsPu9X28P+PUf7ug+lkvcEG8SzpUkhhj
	EszxxicRpXN6SZ7yOnL8eig==
X-Google-Smtp-Source: AGHT+IFkJLuZYKHkFqitQEQ3Yg1FLEq81E4C9if1/VM+Yaec4v2BrToG7RwujiSsE0q6nDmGLkPdOA==
X-Received: by 2002:a05:6402:4415:b0:5e5:e396:3f6e with SMTP id 4fb4d7f45d1cf-5f0b661aaebmr2120030a12.26.1743777148470;
        Fri, 04 Apr 2025 07:32:28 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:27 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 02/11] optee: pass parent device to tee_device_alloc()
Date: Fri,  4 Apr 2025 16:31:25 +0200
Message-ID: <20250404143215.2281034-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_073229_996289_B3FD0581 
X-CRM114-Status: GOOD (  13.45  )
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

During probing of the OP-TEE driver, pass the parent device to
tee_device_alloc() so the dma_mask of the new devices can be updated
accordingly.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
---
 drivers/tee/optee/ffa_abi.c | 8 ++++----
 drivers/tee/optee/smc_abi.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index f3af5666bb11..4ca1d5161b82 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -914,16 +914,16 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 	    (sec_caps & OPTEE_FFA_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
-				  optee);
+	teedev = tee_device_alloc(&optee_ffa_clnt_desc, &ffa_dev->dev,
+				  optee->pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_pool;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_ffa_supp_desc, NULL, optee->pool,
-				  optee);
+	teedev = tee_device_alloc(&optee_ffa_supp_desc, &ffa_dev->dev,
+				  optee->pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f0c3ac1103bb..165fadd9abc9 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1691,14 +1691,14 @@ static int optee_probe(struct platform_device *pdev)
 	    (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_clnt_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_optee;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_supp_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
-- 
2.43.0


