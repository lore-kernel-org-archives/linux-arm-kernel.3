Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14873D6554E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jTcwQN3kMfRwn0MOtZPrgw4H2EwbAELatd4tH4NVBgE=; b=HBLxJmtm1tFC6oz083DASjoU5h
	jrmFfGcC6KgQ72sgPndFrT7yWDe/HSlnLm+rvwc2sPIFqHxbNrrd0qJLO03YxtKKEaJaknxxTGesR
	wMG4FU1HF4FwjPHCp9YM8WZxUHhQAqTJdbtFON/rBvvHpcdlOEsl7gVffjjeNWWazQoc8sx5Hf2kD
	An1KjzVRADoysCDpMrkXHXbipdXL82qmnRkuurA3jICl5CMhiHNoG5o8mz75vagQOQBPAkmlJxPpH
	TJLs9CKyu+xWmTQ46KV7OoUv5R2ouRU6hRuSj5fW6PJIQKUORdNT26dQ4zh2p42BhyxG614qEqKWc
	FNqaMzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpaR-00000006hsT-3fyD;
	Wed, 17 Dec 2025 11:20:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpaP-00000006hrX-32xi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:20:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b76b5afdf04so935161566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 03:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765970452; x=1766575252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTcwQN3kMfRwn0MOtZPrgw4H2EwbAELatd4tH4NVBgE=;
        b=CtinEczlO+EUrxgDA6ELEh4/zPvkkv7rRZE0dxCv5HYoIcBwFIon+qnKW/DNDDvZHe
         AU0g1k+YHyOqZDcyxaGxOG3M7m3eCnKvs2qKCAOG+DXYp1DBVkhOkFTupIix5kbuU91X
         /KANWGA6QjNiwIaDBrmuGK/fSFJAfeY8D6BspaamrtfU2kzkx72lir2u8b9zmgyUNGXr
         9bd1ijiH3VdWlsNTGxJOuSehp9YFomodlJdawwNZRUe8muPtMJDnzYCHuhK+1OeDhutN
         y+7flIk5y6pIGSKhF84U0P+5KpN6JKLW47Kf5agaKdVeaEFiQqt5JrMSYgBdXe4yyI5B
         KN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970452; x=1766575252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTcwQN3kMfRwn0MOtZPrgw4H2EwbAELatd4tH4NVBgE=;
        b=JVQDayG3ikfm47GCoJBaeaIX+OF23wUJ3ZfJaQnUB8GYd9eiubOAzbotVlbcpzBpkv
         PeXbNLMzLh9AmHD+eefsONg5AkLTESChzoDyoCcYrAPYeKtTlNC0l0sGsKH+XeqL39pa
         7T4641HVCyf38yiU4hGoQWfFj3dWrgOp6qKrVB4y6tzeyNb20h+gjW50aLir/U8XMV78
         Y3qbwbUKUt8aoOJyyqkeqqGoAnDNki19EhwVSkBD4U7U1JdA6VDgQmhw13rq9fWeHF3e
         kMoOVKT9A/wATnMznTcxddt0AYepaQ0AZ3MZLqUmP37BeJEpR7XsYf3/oT4rEgmI7Txe
         8R0g==
X-Forwarded-Encrypted: i=1; AJvYcCV7m6iZ9Br4ySwAEkgzYZWTGDw63qrz3ADcoh9joxk+4pGtSG3hz/Qg4GgAZ9DRzy2DeaeOrC/zDtSB4/Zxx9pq@lists.infradead.org
X-Gm-Message-State: AOJu0YzgDo6A3910suZy7/DebyqJ/ORXLfgN5LqdriuL+c2qprcKkuVS
	HDN3mLp7dxDYyfi6QLZluY3gd2Z57RMnoFUZIZdqep2GhDrSpJaCCRZSgcmxtbeKY3w=
X-Gm-Gg: AY/fxX4quuqNy6/sBcbp6SBIFqlIWefCbMRE1Ta8iYGnQDslubUlPfhO3qaPehUS2D6
	WAjg3U44/FQqT16rRZTXcmfDcsOe+3QATD0dNKQqzI3LMcTz6iE6x7f9eN8nlcEVwqjdAlKtIrc
	kw1Zppxf4z6Wrv58mHR7MGvLa4FumuHMdnGXP3DyDQjUVZYrd5npg1wjeU6R2XztVlK4I4mn2je
	jCM6BlG8HIPtvOrXva+wmFHN3nlCXNpPFUU+wTtI5BEiY8ekLehiUuvVlgFo5eK3zjIYrU9QuA2
	ynNcXiv/zKbJtTBgV4l4KjCBPlRLnefffcksRCNsPdMfCY4hRVT2ibTYTI8XHgXUEUINHqgBbqj
	XBK8uYFHekvmUVQxQZZ2ENoJDH4CvRX0ytY/EPqQvg/uGHJlxFizeeS+JNWBr0W1RN2QKkb0R/0
	zpTnbeXbH1GuZ+Vbd9Tc+mslFmfeg=
X-Google-Smtp-Source: AGHT+IEagpbs4HyNCpsx7OlTFhT0q9uoh62JevUfquHGVnwzeKSmc61VVn5TagHQj0mzzpbxTuoklg==
X-Received: by 2002:a17:907:bb49:b0:b7f:eb45:f572 with SMTP id a640c23a62f3a-b7feb45f993mr603953966b.55.1765970452008;
        Wed, 17 Dec 2025 03:20:52 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7ff725efd8sm417291266b.27.2025.12.17.03.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:20:51 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtksdio: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Wed, 17 Dec 2025 12:20:33 +0100
Message-ID: <20251217112033.3309281-3-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ip0toTFqPEpK+4s0Rx5RGWhl8GI5wCxXBuwM4DUFaEw=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGlCkgGiATO5RL0sh3KYGWs49kKJWdWd4V/InvAHNjCL/KJfD okBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJpQpIBAAoJEI+A+1h9Ev5O0cUH/Aoc wZfGf5D7k2Y3xp+Eq2OKaDjC4SdZdn1wPRyKoxuxJ6Tw777evLx2xaxOJa8gtNq3XXkl1d5ytJb wVedpUMeon8lBhvLxJIQnb5LneH9ERGhyVon+g65nMM/ncWgUyT+mQx9vl3gF/6wa1uz9rJUB8E iio65wqGEYu8Q7cWuo2o8sf62CaSimzLrnFiwIbD5k156AgQJIbnBB6+bahGKu1Cmebl6ZtC6CQ 1a3CoPsf+je0wTNPMlCc3Ze1MxMrEJ2spZdTy/SbYZQIG8OuMf/BsLcjij9wWnmYSQ8fcKxhOhU V130qUndlr9XefXvOApYyIOHzdPIUJjQkSphjic=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_032053_782335_D6643295 
X-CRM114-Status: GOOD (  13.68  )
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

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I found the patch opportunity while looking in this driver for a different
reason.

Best regards
Uwe

 drivers/bluetooth/btmtksdio.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index fba3ab6d30a5..e986e5af51ae 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1472,7 +1472,6 @@ static void btmtksdio_remove(struct sdio_func *func)
 	hci_free_dev(hdev);
 }
 
-#ifdef CONFIG_PM
 static int btmtksdio_runtime_suspend(struct device *dev)
 {
 	struct sdio_func *func = dev_to_sdio_func(dev);
@@ -1542,18 +1541,13 @@ static const struct dev_pm_ops btmtksdio_pm_ops = {
 	RUNTIME_PM_OPS(btmtksdio_runtime_suspend, btmtksdio_runtime_resume, NULL)
 };
 
-#define BTMTKSDIO_PM_OPS (&btmtksdio_pm_ops)
-#else	/* CONFIG_PM */
-#define BTMTKSDIO_PM_OPS NULL
-#endif	/* CONFIG_PM */
-
 static struct sdio_driver btmtksdio_driver = {
 	.name		= "btmtksdio",
 	.probe		= btmtksdio_probe,
 	.remove		= btmtksdio_remove,
 	.id_table	= btmtksdio_table,
 	.drv = {
-		.pm = BTMTKSDIO_PM_OPS,
+		.pm = pm_ptr(&btmtksdio_pm_ops),
 	}
 };
 

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3


