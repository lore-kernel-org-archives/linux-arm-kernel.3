Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C797DC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=; b=3xc7G18QKxFglNUx6ZcMZ3ycv3
	rHATGoOZBNjh3JF1+XeB3DqNhw4mesHvCNU/RZcadC9UYV/fl8MKA/auWogDqYK7uiGVfARufw6GC
	+MHLtJRKyebyJCTc6n2LelrbScb+FWAKhbIHFqQad/ns6JtndGhnzC5SU8KLMFBKJP3jq0N0R9dVI
	zCs1Z1SEcqlnADUkPbBTXThBoiUMStARUAEBRyydzEbG21j2Xa9S7oiaZYCrjOOrhRgzq091j+fJL
	o1SP4aSEuzEOyWO0jJFu4aShyB58Dw+QvHMBOg2nmYTDGYvVjmw92T8kDttbZlBhSd5GLPV6YGoQd
	6z7vqvgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnIK-00000001UPt-02Mp;
	Fri, 02 May 2025 10:07:00 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnCU-00000001SfN-0P0Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:00:59 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-acec5b99052so299118266b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180056; x=1746784856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=nkWJ0uTyeh1QasbIquemfEyp6y9jmc+iW8NyUFyNZXv/agweuN4xjs/0fN7WpJbJYn
         JNgpkLXPl6LXtW1bqX3zsjOfP4GZpF5pmSxksV2wFUqUouKI4dvGM7yCuGgHuLHFpiip
         3Z8LKMY3lPdEDzIYF1JMnFjB2wx4G9Ylc/sN89oHHSs5sPzpHp9eoNlZTmkfFKce3nbq
         hpnJe9zsNUX46NCesOgRtPj++lxSgHEg0vz/Vbt/fXg4p+npJ8RD/jhcQn+aDqlmne1b
         eqtle8H4tY+WzB74zqejcYnpm0kjTWh8gaPpHD3+5bGhEifbF33Mj84Qo97keDt6B5MF
         cBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180056; x=1746784856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=Jpn9sqnK2jlcoZF+bJ/zH05WsOWcc1UvpsxjysJu2pJ+1wYhK2XxoY3um7bUP8cwSN
         af4bxoTsI1qUQDAejLDd7RrMpPgcGoyRMVrYuV2PRk90m/pbIwaqS5KNVJhstLkpLotF
         sH3BZlcDu/b36zxyhZoo4pHouDWbwBAUIe0Lke9dlEISJofbImptO9lO4imF/D6whRkQ
         /+gZK9QNqsfneEDkvwPls5ab08/PhWPCPEU4pj5+LEkCraJqs3K3aZ78aPfGIKcQem+Z
         cw5yva871JlVfpsDrs4YazUIoOEWYmiRXPFBjmaq+QDSoVUsdj6+g97F2zZV8cVJqBU9
         +0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXJkkLAhWYwwt5X9811X0mqBxUzTRUMj60wbWd8HHZJ8ck+MiNYErvwx3iC23Og58Kr8wYQASkgYY7+tOwMeZ11@lists.infradead.org
X-Gm-Message-State: AOJu0YzZQDKtVqIJU6hlPnMOWGo0/01GlDQ6deE2sPC4Rpmd6PYGX4pr
	WNSHjUYdrpy3UEXhlv0fi6QvCN2jpUxYEchrUpnMim+xqMLeb2HOrSWTVRDy6co=
X-Gm-Gg: ASbGncvD/3QhSyNpG4mWXOGD4JVQ75FquJWKVkjZUwoCk9MYDk7sQ/xY8fCepEGgieW
	ujgGeZpU21MFTQCRYwEecNsy4Ag4qmhxFcvnlSmBw+3DBg5vWWlOtuMf3yS2lKAoZc8cFtCjK9U
	Ed5HOzgYllieqvidKAJ+PNL5pGskxCog3uAWq0Y9xw6AZZrdVzHsJOYejtPir2tCcH1qpIxExEX
	AABGbNV6iauM8SD7Cf3Wn5S/wNKh8ixSicnjyYsT0bPIteso1bXcrbIiR8YWj+V16MDofgr+NYX
	+3OnpcppD4AodWt5oE4niwyvkkSOIrG6QbPQcMx6KbqvtNQlp6SIr03Whrd5X642jWITRiH6xso
	JF+/mL9arvnrh+dOuSQ==
X-Google-Smtp-Source: AGHT+IExOoNljerMnP1yPtzh01rTrQJbnwgTFzxXZMgDFfUCD64SgckGTYoDWopJzNJPBPdV4tUdDA==
X-Received: by 2002:a17:906:6a23:b0:ace:ed3b:285e with SMTP id a640c23a62f3a-ad17af80380mr236112866b.56.1746180056392;
        Fri, 02 May 2025 03:00:56 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:00:55 -0700 (PDT)
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 02/14] optee: pass parent device to tee_device_alloc()
Date: Fri,  2 May 2025 11:59:16 +0200
Message-ID: <20250502100049.1746335-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030058_149065_076BCF4B 
X-CRM114-Status: GOOD (  13.79  )
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


