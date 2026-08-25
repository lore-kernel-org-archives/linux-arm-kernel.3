Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3E9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 04:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwfUQZyxeQn6CZecIrqNJeI2DT4d3jBF64B9NW5XMEM=; b=jq9rn2NXNJOjEhBj9UPwzUXGvF
	QEuCsXEo4nkfFixIQa9we7ttnBUFN5sfCs10Of1sESEYU+NGEIdv3vCl8ymCmldpaapvc0kzZSXic
	PV5Tj7TgqUtES5C3w0IlWUD335OACAFCEH7vTMs01uAAbGDo4Hfi2d7Sp1xvdIAPrTZveJ6mEbtm6
	LD5MIjkHOsnDVZm9fEsNSJwltVkC+AP8n9K2ZMKYNkIATMl6/41vyqcxNWUwun2iTgi5ADQCH13p2
	RjBQchinqEsZv877b9Xnxl5MH59EPSYPlY4/daIRiPxyKqPSHBVXY3g+nBoWpHAlXTrvIFwh6GxvC
	A6WUneqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirD-000000008M8-21mY;
	Tue, 25 Aug 2026 04:33:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyir4-000000008Ek-3YUi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3408030a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 21:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632426; x=1788237226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwfUQZyxeQn6CZecIrqNJeI2DT4d3jBF64B9NW5XMEM=;
        b=bzK3oUU64LNtRf9AL6PJukS21qE2VflXTJn7+T/GXsuNkdh+Eckf0mHI0/2+SYln7B
         tOW91TXXczTv0mtDZdrDuSbYZQEAg7zxKFlISq1mlkiX7sgE6lreOv45ejAmPMiUNsN+
         CGfi3oPutvIijb1tjDvlYFqnusdpd31UEsQ/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632426; x=1788237226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwfUQZyxeQn6CZecIrqNJeI2DT4d3jBF64B9NW5XMEM=;
        b=S8QljVBN6zZRgt92TosEXGsASW4uMVx3FqTQGloSHdq72LaKrotfAp4tx94ieD/egU
         EjpQretjgvLax/YPL/WQQsJt6G/lpSVUfyaUG+AnJzn3MTzPFqmt+bGWW3OI+ZG9ZV7h
         XJdA+3RfAwNEwmlGqfFcuUTcDrew3RJPYWuFaBJFyAVIu7Y+wC5J5zAMpq/6vqtYsWZA
         WTsb4qLS0qOcIsNTwL1iUQ7pvxCbReFG3iEqLDmNDWRqewTiTEaWaVWrclRFtSO/FGi0
         nDAHodxn2lwj+/2bDWZHoGAL30QQ96cwfSye+/hDmxEaa86S7/FevAo12eMzSDvs+LLi
         W7/w==
X-Forwarded-Encrypted: i=1; AHgh+Ro5acmMkcm1Bh0jK3+SCZ6xa+fyonqLrotPJ64uaPgwW+6VlgmOulvfp3Snok2MR8bXsPPruCl2WkWgQsRL2ckF@lists.infradead.org
X-Gm-Message-State: AFuF++lS0CPfuNq0wltHN+NRYs3+7LkucyEl22JFYg9RfWFkRQLdW5eZ
	hWkIUO1c8Val1NoAkd0P46fuk8H6/nzXQdGs3OwfQH84tschIhWM3yOXMQcV48AIbg==
X-Gm-Gg: AR+sD13KNzIroIZ2jwR/olyIeDfA3Ktkqbvg9mRNHy1S/Rs9SuzbNOdH0zKTf/xIioT
	L73feosYMbJ3EIgIoZ7qVD4p3esAJDSXpr43ds2yogkDa2AwiD+KQykxSQmG8d8qoZ7lY6LCkSz
	r6wCqQG56gbttxKkf3/EwNItMn9pkYd8MDcZAWQQBT1VXClCeOQ5QwI/PvQ0mcoRvDgTteCssKe
	D8XlUi9ilPfrzG6Ce0j2+j3WxrFGioV9Joy3aGgnIz5lVI+wWb7oDcAuBlYhm7l9vcZS0i75EET
	pVWD+er7TMTOrTDeB52kGUGWhBGQ+DwYU6jL/gDhDUoFxPAMbY1SfY8jBRAUrkLa//zHAVY2Ds1
	asQhQVoAJ/Syiksqt4d3WQJANTuM+vmhjxjvfOhzebjUsS7cEZhW1xC9gW4zzF0ovgOp2c5XiQD
	TxQDGZPM8yVCdH1wW+2Vvf1aXMkRv0qkl6NfmTpW0wGYOCD7Gm12MSOsJaeNb06cd67HLAW7mkp
	y3DqCc6D6jTG8xKiTeqF3xja3zCLPoj/GVq6KCcxZKXl+p728acbpx+/w==
X-Received: by 2002:a17:90b:2e4b:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396464a18c5mr7911836a91.10.1787632425871;
        Mon, 24 Aug 2026 21:33:45 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/7] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue, 25 Aug 2026 12:16:22 +0800
Message-ID: <20260825041628.988369-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213346_898192_D5D63396 
X-CRM114-Status: GOOD (  18.70  )
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.55.0.860.g4b6b3295ed-goog


