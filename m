Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9BAC55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 06:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q983uYDsq4Xe9yOLC9LdYCCWYqVj2QLw2dxzgl89ls8=; b=vZSxS+BQynu3rgU9Z5RyCRi5nH
	xUGrJEoWOqbRuJi8Jpb0y3V1cY33/qkCAjyqABkDPWKCf0pY3bohls6buQu77kFX7+unTg1k0ViGT
	HfjNsm4ev0NMrILtlAfG7ZkFVDnQTe0rVkvSJpsAhjkDEj4xrOWVvfEYJkP5A4lf6MRHBDT1demjy
	LIBrnW5L5KA+t+O5Q59ynyOniSUzTcvZcNA6ANlasbfgFZp3j1YaYARS3VCYKwi22Xu8QTbuIHLeV
	Q190uZSRd+kJD5tNzfrazTAc+jdM0/Cq21kk98qxhsCDR6jAE+YmHeFW6VKwri0KxMGusupcDd36O
	UlUb1UUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsagM-000000096Ng-10Uf;
	Sat, 08 Aug 2026 06:37:22 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsagJ-000000096NK-3kXc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 06:37:20 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so157235a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 23:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786171039; x=1786775839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q983uYDsq4Xe9yOLC9LdYCCWYqVj2QLw2dxzgl89ls8=;
        b=ank90GflKM3rvHDY4r6T+38UXupk8WUJAcS3kQtGEKy/MxUE8MqpEeJSqlvJlnGqeB
         RsHqIge0BffIOsfhmik5XQkELgtGNEW4hvPW0tbjWFMcSU5n+LBaDMuKXpn1JjDpwH1u
         1/40JNElqIznAhmosHa41ChA2ipP7//6pvQibR7Foj8TSp2t6oFR/KYVvtXuEtyYA5Ep
         Trf6/CnmF9O3S+VNWqL6RT5+f+Y4713mN/h1d39mWj44x1ree2IakbCLMw02IQOW8y5h
         ST3zUrdMDDtJWUTeBC7Z/avaGzivhhtkQ1z7ifLgQfSLO0EVIdMzWhgOS0OMO5TXvJAA
         oqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786171039; x=1786775839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q983uYDsq4Xe9yOLC9LdYCCWYqVj2QLw2dxzgl89ls8=;
        b=JG84r1ZMh4so3CDWQN1Vh0KLZ6Ft7U3+lNSaXv9hg7EttRPCqljxvHtdj+lhHgjsKC
         bu2D+waZ4EI5kCIXC3QOPNice6QiisDEwKWz6R/mETKT/3cSYuSrzmIu3hjrP0qXKuK6
         62GnHf8RqxNUKiFHz8nHBONojCLU9+Kq3GdSpRywZxD2xkn50rrxZodPVuMdBwjSZgqO
         VO1iBJyyA5viW0kMXTqQFzaWBGFd5UWECM73sn7sjMC6+2rZN5v/lLY9+L+ddpJurGaJ
         iA867Og7BLQQztLfL6K/Sb5DeTaQdNeuSseGcL8/OyBbQO27MmdmPT0jpYFxb1r1O92v
         6FIg==
X-Forwarded-Encrypted: i=1; AHgh+Rormk/qYX7qe9sdK3w2eolmg2GTFC5p47XitQmgrfiSwcMvwvAhMH3DVgsODeGP3bBz7igkGVuyi17DeXB0Nh0r@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz8ifFxUFpTWGPWm+/D1JkSaHSmdjwBIWL5KNjmIPk0boJm38G
	ohyK8UEBwO6kv92Ssdi+wKBSIXO2j7IzXo6wGoIqxX9lWzo/uevacNea
X-Gm-Gg: AR+sD12g1nWgGjSg+fyDFMR6XV7wrFAi+Z96aoY4f0QUPLB4RZPdDv3VPK9gpGjdOkI
	5P8NjdTA+2f0kSDwTl0j4E7i/Dlqm7n1ccf/lPWh+wCzz31v1+R8w2SdrzwOxLDknOWJFDvVbcg
	tR4viWB2gSSgtF45kRUg4TrjctrjokNPJtgS6C3ST+C6A5kYB5C+Nk9pKtS9nRTiOPxxf/LHmEG
	hWDiisaUhDapFjpNfOq65ETNUQMmrvi8D0NZHVp3gijGI2NPxJJ/dQFFNdg2R4RyRH6yl6y+AVb
	50CvBO1laDVm/z+/9S+vNJbYphTKdlc3UGhx17Q57UoyBuTgGaYzyAtQoOXdzFEv69PmBV0Hvsw
	8rymyuOcilG0UeYWSEF4jWzt9HGbqKNJo1AmZ7lbntRs6ZqCdn0bxY7rtG+dBWflCMxgcmlmf9G
	dNmpVRdF+f0qCrakACnkRDhVPkfUs9oonjBAQa6Xw68xA=
X-Received: by 2002:a17:90b:3b4a:b0:38f:23d6:b4ad with SMTP id 98e67ed59e1d1-3909d8172edmr13381640a91.8.1786171038869;
        Fri, 07 Aug 2026 23:37:18 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd95c40sm5015659a91.8.2026.08.07.23.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 23:37:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] hwrng: atmel: fix usage_count leak when autosuspend_delay is negative
Date: Sat,  8 Aug 2026 14:34:58 +0800
Message-ID: <20260808063458.2609136-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_233719_937152_FEB1137E 
X-CRM114-Status: GOOD (  12.46  )
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

atmel_trng_probe() calls pm_runtime_use_autosuspend(), but neither the
probe failure path nor atmel_trng_remove() calls the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() calls to both the
probe failure and remove paths before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: c4f51eab6ce0 ("hwrng: atmel - add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/char/hw_random/atmel-rng.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index 4ebbc44fecf0..6265d9a8d140 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -150,6 +150,7 @@ static int atmel_trng_probe(struct platform_device *pdev)
 
 	ret = devm_hwrng_register(&pdev->dev, &trng->rng);
 	if (ret) {
+		pm_runtime_dont_use_autosuspend(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
 		pm_runtime_set_suspended(&pdev->dev);
 #ifndef CONFIG_PM
@@ -165,6 +166,7 @@ static void atmel_trng_remove(struct platform_device *pdev)
 	struct atmel_trng *trng = platform_get_drvdata(pdev);
 
 	atmel_trng_cleanup(trng);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 }
-- 
2.43.0


