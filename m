Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EDFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bxEC8S+4wPaf6YNA7I4YHpQhkjSKPcljYjeafE5m3P0=; b=w9VhYMD7h1oF2MP9NvtWCZVzEr
	CHwHOixd+C8wH4UKZpKt/uV5e6SAIbqd8EHBmyD0DFgGcE9UAmzOCdMKsFqqI4PU7kkIQ9B/18rpF
	Fv75C9f84l6ctiJxejJ9ynIKfS5NvdO5VfxiwnXn3kAjvPkVXxNLfDb4DCZbHNvAhpofTt8ei13zF
	QbMVuCTGlk1Ky2rz22NC0i4N0RQrHaAQnAxgPD26pKoFTDCjFRXTMqR3sWCyaaNB9/ee2Y+MCQ3tA
	CkhS6n3on6LH4y4bvmZwZUZI7YBjBQoT1FsPbQmNpaWariGs7w96uPw/xemFH7nCURNG1+lnS50Vi
	2Rjsco5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi93Y-00000004mFZ-3GPs;
	Fri, 10 Jul 2026 11:06:08 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi93W-00000004mFC-2yfq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:06:07 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so565261a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 04:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783681566; x=1784286366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bxEC8S+4wPaf6YNA7I4YHpQhkjSKPcljYjeafE5m3P0=;
        b=SJKj4d5aawSAEjipGD0MxA1PepYhDV/M5qeLRytgEmxI0EW5jZFZJ6h1sFUUPvqfli
         Zu0/jkY9aWKyEcz+8MeLYDTgrW7sEcHGNFMhVgE6homm5xyJsVlisOYg1r7aF8gE3UGZ
         CT837LKahzC7igtW6tCP4tlzGEphYLwS0q/9FiYrd33d6xVJvIW4jD90D5BJYyplkEeQ
         Jop8TeL5IqAd7cVLSexNC/NjS4mGHWgvTdIqV0xqOUuoCi33rBZcmmxKawN5PzGWLW7h
         F8oCsw5LcLvsnQEZpLjGPvQRz1CijQ6A9LmnzB2FQeRoGy3C9GN54Xxyc7S+M9Jt1KlC
         V3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681566; x=1784286366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxEC8S+4wPaf6YNA7I4YHpQhkjSKPcljYjeafE5m3P0=;
        b=Btdz45IoqkLs+wfryjVTGpi/3N378U6mzJfZLEjJ2WI5aK7Z7x15awZRGQYSRV4JIn
         +7EtQKYfVloFQuXnJko4uFxzeOImJQIaFQZ2+Lpk93FVIUVEKxIsQetnB+vP1wH0kgBh
         X8ZtH39ZnOjPwFdIZ2pg2gIC8INzzC/AIwWfueZ0GssGwQJXerFVeCbiaknj7j26cqlO
         zbNd1Bu/bBOVLUVhE21UtrnaPNA89FjXlvSoMkBC80gvm3SazGvnHp082HDtnnJPiRfD
         cozXzfNfr4sil9rWS1YsiCwvJKoMXSrN1x5CK249F5plAbEsSpp0Je+DBM3/5xX31jYU
         iHWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpS9h3mxDiKvFxtyhbfQ1YVbRdtitkVmIe3J7/VDCh+lwxQpd614fM2AkUWU3dJzPnlPtWTbwaKgl2aHbCmUbRm@lists.infradead.org
X-Gm-Message-State: AOJu0YyA0jBylH+yshA595Cf4Jmr17OuQlco2cuCMNTZb1BHPOWnjaHY
	/LsZ6ovZAeX3rP8xzZdd9JAd+xYvorhNMDrMWxS/lu/q6JADBWh3E0kO
X-Gm-Gg: AfdE7cm/V7L2r8BKDGK25hWqVD2Sef1Kyj8kaH4X3MSWnkTLxmCt0mrCYKipjc91uh/
	5d8K7OuKw9+kvMo+c9juNyxCREDHaDy1rARkb7L+OngSGsUuc8LQ/5UEgpM251RgvINUvPlJUWX
	bqh3T2uS7kr2d84S12OUEdd/b6sNLvoUnaX8eyyvsVkiO+nd0weddZJhbKQtJT/ozTVJqhAw6Lo
	3f7U16JZlSESrXxq+6lJlgMneMvqvpnnrRDsA+mgeLpRJuM96MnP/3mn/Z94SRFJejgHWcoFEuC
	cDkP6/Da2lNcQcCvXL+eXlQFzSToZ0QnbHT3a/p15LpPKv09G9LnFVD1oAJICp7FnVuv9nneYIC
	GDh5BjQNg3XjcjCWVQMfLPHW9q12gvqNgnJgOK6HPeGufgwAwKHTNqCrcJlfRl3gs5ZXsvuei+v
	Is+tB0Kyrr/FyvVsC3xmYSPM7S60J37WQTfl6zzpyX9F5cXFwiMU/3mVU3OA==
X-Received: by 2002:a05:6a20:d493:b0:3bf:7110:9949 with SMTP id adf61e73a8af0-3c0bcbe9106mr13761714637.6.1783681565625;
        Fri, 10 Jul 2026 04:06:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm4960310a12.14.2026.07.10.04.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 04:06:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: uniphier: Drop redundant error messages in probe
Date: Fri, 10 Jul 2026 18:02:49 +0700
Message-ID: <20260710110249.31830-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_040606_755719_902F5FEA 
X-CRM114-Status: GOOD (  10.79  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Return the error directly when the helper already reports the failure,
avoiding duplicate log messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/uniphier/aio-cpu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index d3dba21b2d04..78c82bf42a8f 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -795,16 +795,12 @@ int uniphier_aio_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(dev, &uniphier_aio_component,
 					      chip->chip_spec->dais,
 					      chip->chip_spec->num_dais);
-	if (ret) {
-		dev_err(dev, "Register component failed.\n");
+	if (ret)
 		goto err_out_reset;
-	}
 
 	ret = uniphier_aiodma_soc_register_platform(pdev);
-	if (ret) {
-		dev_err(dev, "Register platform failed.\n");
+	if (ret)
 		goto err_out_reset;
-	}
 
 	return 0;
 
-- 
2.43.0


