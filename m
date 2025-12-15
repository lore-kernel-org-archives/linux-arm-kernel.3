Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71199D5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lBoMkq+p5dQ2OsBBFnXVtnCRh4ggCKmjrfxDYkmgHo=; b=jERFfw8xUcITnRRV+oEyYyvUpc
	85OMEk5qIRCOe6mcmni4Uh+oi4iKR7rLv83VbU/iW9tndPToDvcP4w+7JCItVIyiTWS1jhKgUAQ/I
	tIkMs/D+uOwhfyUpMJ+nJFQeW2Y82blI5q7ywDZ0AUIZHsuyXSDeaXQp3snaPjoMMRW2xFwkv+gcG
	MzWcjvolx6VQoqDN06THbsAKFTWiSDAG3lVtZF431nhgLcpXrH7gmp07+LkhthZkrYaFNQEE9cGEu
	2yWh6RvOjbgI7SY+KOmSMGMWWwycRizikw5tvobJj0/pRm1UbNFd/LoFubZQd0a6xlYxF+1p5PndK
	5G+reDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Oa-00000003mAB-2RB5;
	Mon, 15 Dec 2025 14:17:52 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9OX-00000003m91-1Y5x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:17:50 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b735b7326e5so544518766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 06:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808267; x=1766413067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lBoMkq+p5dQ2OsBBFnXVtnCRh4ggCKmjrfxDYkmgHo=;
        b=VjrTBA67oNPpGpP1+dibs274Q8LZOaZMig8cNY5WvgCiRXNwABSj2e+D+a3IyLli9P
         MfkSgULXWu0hwIsHoUiEVLv730ezvmefNu/W+Ck3mLNF1TLvCfRhtqzaZzqsaBmaSPUx
         8ncyXWeDf++EPuIAU+4yYZx+N3YdZAIFwRmyuFj72grCRn/L3DSBqKf/upl+XsQiO+AV
         rwP0mnUU52LvREdL0fCEx53AENSzVm5B7oo/YNRfMWLGGngmRtheaziDDjFVUD7uUlXe
         PVLbxzW/fITA3Oe/76CT9afQC38t/nEojAsjrZeLwZW6ndDlWsC60JgTan1aE2t1iYG0
         WGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808267; x=1766413067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/lBoMkq+p5dQ2OsBBFnXVtnCRh4ggCKmjrfxDYkmgHo=;
        b=CxOwrdxZgyJ3rafEYVd+JINkZMvoCkWch8I0yMGsLy6LJrlz6fBoHkej0IexVOvkUf
         7v0BB7DjbNfAftJWmDJIVKCxX48tYNOj6KGblxpj9tVpOtHPqZymPeAyr8SJ0tLEKoDs
         ibiEbA+ZYaczjibNS+OThDI0+KmHnnIny/hJklD8/qxlbwb9ZPx8GnxzuLdH6/QrEXgv
         HLb8UVC6UdI2/m6Ri4gx4/fgi0u2STCReO4AqI6qIvxoKC2HLc/CQp7yMhzugX7BQoVw
         xxhDftJmXwMEFzWuQuAV6q/KzNwzJFejMJlsNqgJFhqztpjgMZbGyiJF9GX7we2L5afP
         kbMA==
X-Forwarded-Encrypted: i=1; AJvYcCVmcyYuhiR4WajlIxoV9LnKZpqxMieZ4nG4NbljO3/YI3CrQRmQXB9thJzGFRTPoywcudVjwDoB5mjASrhfJ7vQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxvEqB82zvr7jH3IYPR6p84itNo+fwjUGhaliEoDAVGc8AYk2dc
	fzU8VJJFn1zJxjCQWCQFxj+qo2UJwrMivhe0xK3x2ku5H895+9eQQ4F+/i8EBRXXUQc=
X-Gm-Gg: AY/fxX4aFfb6bwGXYuyq2MUe8SBuHQWpSDSPJcaGaQXbQaNY9eGfTPWO6vOuquCmNpr
	28Gntv9XkAhynO2GgtfluT2+8Zxv/Errl8n94ONZnz4cqSimhFD5HTMZRCJc+ZwUjcY628PV7YJ
	/zvd5uGimYPKdoRhibnNv9k2SdFPfWEx20PmUHmvz+kQN+jn2SLU+NtgsOW9fBBLEicG+WizAnm
	VCNNQSxuwWMCGkT6XAhpvM9JKBQ40nKMBl5mUNzafiGQJBHQ6K6ze0OWcvGzw6bgj+7rNklCpej
	aiPA+CzxBXmC/0vbDV0kxt/kMwVhd39G6H9tufZxmZzLfvvCkB2GiJ0D7zy10nrU/y764QgcRQA
	PAvrVFgcWcgezkkG1kDWJqN7eBJo5YXCTrizrylpBBvBCUJasMzLN8vMaMviHijJ0kDRB9aLljm
	toCbRxuCIAEkiflg1GGpYwb0LKCjAV73LRIk6hnTp9Yq2sMlXEvO2tDyJTe4MRMGAEbl5E
X-Google-Smtp-Source: AGHT+IEwhpzpbutxcSFXZMLWPGgvdTBRCn78tGwOj7IZhNrS+hZ8IxpcNZHWAUSqv1MI4HUnh3hlrQ==
X-Received: by 2002:a17:907:dab:b0:b07:87f1:fc42 with SMTP id a640c23a62f3a-b7d217ed7d2mr1308406266b.16.1765808266933;
        Mon, 15 Dec 2025 06:17:46 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7fbd7a55dfsm554177066b.25.2025.12.15.06.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:46 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-efi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/17] efi: stmm: Make use of module_tee_client_driver()
Date: Mon, 15 Dec 2025 15:16:38 +0100
Message-ID: <6a56ee61e485703d548e9e44d53b2920b4e43ca6.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yB7VDr3EZSkvb6JHyGDNmAwFJZy2w/A1L0P7+9qGdqk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhgZ97MgwPHXb+Xx9vet2pJx/fRw7XXThLnp 2crAvT8GvSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYYAAKCRCPgPtYfRL+ ToTlCACS5iflL8JzBfIHFC4dd9QU1VLCJ23/o3MwueoTbG3c0T+3+Ab5eAFzodoVurAYliob5pu dCvIygjW7D5m9ySrn4/XgKkHiY54AGvSbmsSNrVesGd4oFJGf3Nbo3TsaUZZWYnmY0+ypytx3sC jYoNu+MOi8Cr8BnQTHvWqdqh3lzQzJ8TOJIedFd0Wdh/LeHfoC6mf8mhe6wrufJ5R6QAS3sVl5y 1KnEG5sqI8XvYvgx261qZIjrxPtBeaWahLjOKNLFkGpC7HWMfBbAVP8nVWNbNXWRUZ3IVjMiJlW 5seuM+gr+TKUjwts24xtV5LeZbaCTzjo6uZIsnOl+ujpHHdr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061749_662743_D3777578 
X-CRM114-Status: GOOD (  12.37  )
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

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
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


