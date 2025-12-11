Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856FAD41D6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a4wMDZK2ViUHeY8ITMBosr5lNb7hmzarN7W0g0+DF8=; b=N/3P0I818NVJFsBXKi88UQ+ob6
	e5N5mOgEJ9VXJwPbZQsTnbc1rLCib84iyyedwpyJPQ5vDoiO1wyn5CiAWLDR06xO/VQXtLIF5rdTC
	tRkbxbqy+myL4W6DbXMYbKHVTioMLlvBo7hRmQwNqqRtJkFka4b+q8Y9VPFscomQ2B+lDbqujulg/
	xokEPpFKoxgctnfpe8x3KZrHsKKYElZ0ycifXM5/tuguuGXRw6lvKloGg5khY+xQ36uGC9Ht+8aAk
	DWGcVKaaRhSf7ozm1ibx2Qc11iCu2TuO/zUqt0BC0vS/sTHxLDLSYcF+CU39odHm3TAaRKiw8rt/E
	41Qj4l3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkGt-0000000H1BV-2Att;
	Thu, 11 Dec 2025 17:16:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkGq-0000000H1AE-2QPk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 17:16:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so3562955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 09:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473363; x=1766078163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5a4wMDZK2ViUHeY8ITMBosr5lNb7hmzarN7W0g0+DF8=;
        b=FaBjwjdu0NA/4C2h5K3g+dyKsoqhY3d6+B9fHB4E+vUtNNKEIVD38y+3mFZh/KQWMY
         0eW81yQ9a4civdXQB+QhyG3chsSfDMSZwbl/CHi6g1uTDRF9MPGRxRR/va1CRBNodVK+
         JsbRYg4FxRn1Z8A9sPYI3bATeAsKTLWbLyl0APjwwNAWLxGzzEr/jYK/nVYn2tgluYZg
         xiIOo2iujpxpMcRzTrLld9WGtMeGSDNOOxy5VYlTWzOHewTY49DwJkLuIdEWdGd5wrAk
         MZUgh2RDr2vYjW4j8mSvnu2koPqarhKMV5qO7JUhfqCHdbbnfB3xmTedqyrKihLBIXNL
         0zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473363; x=1766078163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5a4wMDZK2ViUHeY8ITMBosr5lNb7hmzarN7W0g0+DF8=;
        b=t/n72B5k3+Bj96Q52oabmgJeKEeKIvFgSSJ4j63x9a2yVMx4XWZKJc7Rs9aS0wiVqk
         z8b7M2ce1kWh2ws1TEG6gUzlMteePOY5s/m+dZ6L9ibEam1jx/fsBovlz2czIkBNq+zK
         EPTIpMyUvsZenNqhprXWQCX+3OKfcB+jYoA+N4lxWE0DknVdPwKXs483VCa3GEk8LCb6
         o5Yztlc9FKe+00NQpfXnDA2iah9f0f6pMj3AVqcujqteAhnzOb41gx2BSgP1W8GNqtYK
         gl6zu+oS2qtvEEY1/OPMcIL1JxVaKp1kgPR+7+XhddJVh99o/fGryEnr87dzUSQ8Vaww
         7djg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4fYeHswd+asgl7uWSqEB2MG0rnAh1T3ujvoMbF3eS2WXMuEkU9zEDK/MMNY/91md4Qx5fGf42Pi9IkpeGcmg@lists.infradead.org
X-Gm-Message-State: AOJu0YxYtdbsvbSc5HmCR2M17rCEGA20Xk9mn/ZRsmXt4eykN9KJPRqr
	hpnQNeFi7YuUXTj36g20Qh3B0lpjsaz7/hM0tGzzncech4R3kaL186yXlwPxM9YFrRM=
X-Gm-Gg: AY/fxX6KssNLAXnsRbWL4P2ZIZcfB4Bv2V9r8st6ntYboDY0cFzb12mJ5D7mY9am+OL
	whTJs98xNhsfkicxpEv/9BE9pQOVcdBCFtn9STSiD/HWlskfF9QdwINiS3Nia40K/m6zTD0g4zI
	GrJbaEh+6hjpfxNx9zaidgSGatkjul/CL6OcLBKoxF6tvwV943hdAN8GtNQQ7gebofNiub89OTJ
	VqWZN0JzdXhY8Ei8y6GEVaiRdJ5KmnVcv2IMX1ucRdwOcQLrGNUoCVerMu/PvNWPmK1dYsg9xnu
	2DJTqckvfRwDBEzAQH0caYRkxvc9bOmKbLUpOxYbBp6z0gGCBud+YEmtki9WBGXE5NDprOfPtCB
	Nhw+TsSDy/zW0EV9sqyTwR1LvIukny2t1bSEa5/ODr950OHxJZPz3kynIe1mruuU3I+u9WBuhpD
	6ZmvLPyOpKwNi0jJvS9BhjerIdZmHyHg5w456B/+F1CsbwyQWov5++zbPS3UAePH8N4FtMfXBWL
	hI=
X-Google-Smtp-Source: AGHT+IE+X9wMDaoG4Q+goEXvBdmDRMpx3iuUbrVTqUSpfRdjag7tAC9TsJa1xQ5gBIFCyk9gG0Z+Bw==
X-Received: by 2002:a05:600c:4705:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-47a8377b8bemr79943275e9.10.1765473362428;
        Thu, 11 Dec 2025 09:16:02 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a8be549d0sm37688665e9.1.2025.12.11.09.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:16:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: op-tee@lists.trustedfirmware.org,
	linux-efi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/17] efi: stmm: Make use of module_tee_client_driver()
Date: Thu, 11 Dec 2025 18:15:02 +0100
Message-ID: <0896270bc530d1e3b7fbcf5f7e168172dcc05d1e.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=kVl/h/+w7Wr0R904x5vNxSBa3qE7VLiGeImjLkLbd5E=; b=owGbwMvMwMXY3/A7olbonx/jabUkhkyrPxrp7FaL9OXe8ilvWtXDYnnXyuCubaF9/dc/qQ+s2 AX+fO/tZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiS5TY/+dkhfWruk/vtTP0 cL2huff2Oa1DFz4+fvn+Z02QTsTZFcapRusUt3/LZol+FL1N4tx5WUnjj0vO9YtIlius3v/mkau lmEV/hrqgQ5Bo9+Z7c/u0D25JeHz1OU9of+bCC5nxDBrThLKXqna/lbZUSpX+yui1/4fwgVXZpg Vy73eFanE1iS53SWH2/Xa2N0e57UTUw1naEuIVizpdPt++cObS6W8dZyOy/66SXC7sfGmugYKp0 zdbqaeB3W3zTn2K/Z5UGl1h4r6npf6chcnpkA1NKuf+rPvXYhTp+7Q5N+XH7YzNOYd8rGv0i3Pz Fj5qvefCb/9NnHHpBEeFpB98fzf/7Jqp5mXXdlSnzIgPAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_091604_879035_7E39AEE8 
X-CRM114-Status: GOOD (  12.04  )
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

Reduce boilerplate by using the newly introduced module_tee_client_driver().
That takes care of assigning the driver's bus, so the explicit assigning
in this driver can be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/efi/stmm/tee_stmm_efi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
index 65c0fe1ba275..5903811858b6 100644
--- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
+++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
@@ -584,24 +584,12 @@ static struct tee_client_driver tee_stmm_efi_driver = {
 	.id_table	= tee_stmm_efi_id_table,
 	.driver		= {
 		.name		= "tee-stmm-efi",
-		.bus		= &tee_bus_type,
 		.probe		= tee_stmm_efi_probe,
 		.remove		= tee_stmm_efi_remove,
 	},
 };
 
-static int __init tee_stmm_efi_mod_init(void)
-{
-	return driver_register(&tee_stmm_efi_driver.driver);
-}
-
-static void __exit tee_stmm_efi_mod_exit(void)
-{
-	driver_unregister(&tee_stmm_efi_driver.driver);
-}
-
-module_init(tee_stmm_efi_mod_init);
-module_exit(tee_stmm_efi_mod_exit);
+module_tee_client_driver(tee_stmm_efi_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ilias Apalodimas <ilias.apalodimas@linaro.org>");
-- 
2.47.3


