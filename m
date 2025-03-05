Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81366C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g64carhpN86lM7kPnuUc7tjq3kR3ZxlKeoOmJi6Slgs=; b=nPqfdzu2IWN7M/MZ98W3Mp4oF8
	kv2TwYSSaxbDyrIBJxWv4PJxKRQIEJ+OCTuCvcxriKknN+zOrXbi6/FcrwZyeV0jj1X3Oql/zPC3K
	xzfVPWhJHN2RPIYP9+1++5kv+p45/J7TY2vdMj+YwLmGyUzSh1KwnVXA+fiEzgmxp5lYxGY4MuTkR
	341rDPRndseMaMyk4Cr+6X7k0de2xsVKs61E3UlCa7t9zZmPmiLysVZJdPrfab5HeR6trgRvT1xsw
	uERyojTwJZBZ0pM6D5qfJt7hObTfWeoSpXb+NkyC9b7OBIJ4U2d2lWFqVlHGVEsHGJ2Tafle4NADB
	L9XkXfLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpomx-00000008Bpo-2ysy;
	Wed, 05 Mar 2025 13:27:55 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoSV-000000087pO-0GKW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:06:48 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so593721a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 05:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180005; x=1741784805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g64carhpN86lM7kPnuUc7tjq3kR3ZxlKeoOmJi6Slgs=;
        b=NLrIQqaRHaOiB3A8w8rDIFDoK4jXiz/L14aoGF7/ztMyzv5ZoEuzhNlptcd1vVEEL2
         1oz/sY8RYNmIX/vYIBCTK+YCYg9v++yfAlN0ONH4J/eB+Fao6tjiNmJmqC50BonDPfjD
         2wL5Lh7Z3so+x5/UCYBpyeiRHlirhUUi5Eu3r/ppYMBM1CBjvJ7EklJpQcQ+eWGLaOpJ
         kZJkePInHOvIp5ADAss7AWg4rgAhORfDN46kYyl0p7wa4kSGFCYpUqhd51mF8o+C9GvW
         hPTv6LuPxCVsK4iAu/h8pksA596WtHhhEqNYOJRMkRPao4HTj9USnGOsMiBu16tPkkT+
         QURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180005; x=1741784805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g64carhpN86lM7kPnuUc7tjq3kR3ZxlKeoOmJi6Slgs=;
        b=ZzRkHb54/MetCS3FHmFSZ80tNUBcV1Is9Qz3GdncwXPsYKqF8LZfTHGQVBrUD4fdPw
         WDTiVZ4TR8tvqOmBo+DA93q8WEQBU90fmE6pRU37CHMiPQmYle6LtyjHHNau34+EJZhx
         Z8+DG35dtzIYGRBI3lMdKR2b+CRRoh3GpS/OQdvm3N/hdUgGJ7n9yxlh8Cy3G1WIsHsh
         hPBb/P3UUcCrnfrF9da0KWN19DbCvIq+7ta/f+lksYReYaVnB+y6vO7/hD/eqq5Yxkos
         H+pHBcJYc4YdyHQyz26CULVW/MizWoYhS0UyIUCsuYfY5lsAeHooH50Dg2tyVyjclULr
         vkNw==
X-Forwarded-Encrypted: i=1; AJvYcCWtAriqos2aZzHZbWbny2qTniooNEAb3ensOvAHl2KtQWMuHIePlT9ZMkm8a6gZEdz34nmc3Ro+2LLFZwOf1oCo@lists.infradead.org
X-Gm-Message-State: AOJu0YwDCGAsbVaDzGBgW7Oc5dZLjQmL2ql68c6DyF0OpM5hISAeTrSA
	fy3C55Q/ZlXYj6HeGqYq+3vRNLCEhJ7gfEBlFpYCsUzWVErLAga/USV8HzU8n+Y=
X-Gm-Gg: ASbGncv1Ov98bGfkoriuFFTercTUzNNPrqeEiT4atTotPifH0HjJanFrnruBn4QW1oU
	xjMp/MrmdyEFGCC2ibahoEl5XGS9Sgb+TskNGqIJuzD9Xq5U+7xW7fRkKZOq5/bRLz1XdUxcd3m
	qb1iq5OJ5ekLu5ieSn+uw4aj+FMQcrFHgNFDaZ88vRhuqX12/xZJKI/YxIWrC6hO1Ioesd+Ers5
	amncEqzR1manNZuHnPqQSNw+uxHbhwekIGmoHRqHGRcb7vVVTBNaAULyuP/RCdmXov8QkyZqQRI
	haz198kCXiF3S2sjDzyDfcwhq0/xFxfM7agZMjfLGmRffikbjKMCkZ1gNNL7jcPeejpa3SPbgEy
	9yYp4+O59XyXdfYO4sGRoXw==
X-Google-Smtp-Source: AGHT+IHAJQdH7f8KJt+R2ffDvxbc7sUQ+b3jomBMCSiokLRmAxj8briZ+1p+KDuEOOHd7BerJyZSMw==
X-Received: by 2002:a05:6402:5203:b0:5e1:9725:bb3e with SMTP id 4fb4d7f45d1cf-5e59f4869femr3345168a12.28.1741180005006;
        Wed, 05 Mar 2025 05:06:45 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:44 -0800 (PST)
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
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 02/10] optee: pass parent device to tee_device_alloc()
Date: Wed,  5 Mar 2025 14:04:08 +0100
Message-ID: <20250305130634.1850178-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_050647_106604_C763EB14 
X-CRM114-Status: GOOD (  13.83  )
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


