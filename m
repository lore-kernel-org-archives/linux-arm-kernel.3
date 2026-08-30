Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B09C61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFh7tNrhnkyS5rc0tyeCiGcCiB45l4CkB+Wkyp1hfZg=; b=hvcoDxFlh+yJhUBuojippZRMeq
	11dnPmhwgNTX+IFdepl/OnNW/SY6ejkxSfZwy/Y7UF9DRQRarwqq45t3MdLY00ugliOChavQoOTzH
	OSjBSw+tMSrxH7/sdWSAe+VKebVrcw7D26ts7s2J9KEahreBmeO5SHkJUIW4xvd/VcY2EVoFlbAP8
	1xm82ejBcrRaowjtSbc/ZHe7g927yxxqshqrw23flWwtG98jOf8AdhT8ySpa2T6Os8Jfdc1srjzJg
	2WYxHgXz16nTJ42IgwVy1/TJ7Ffl8hJ7ppwgFsCUhjtlCw1xmMpohHpGqBhCjtvlLA1JMdIWb1ljj
	WTzNyldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j3I-00000007wGx-28hS;
	Sun, 30 Aug 2026 17:10:40 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j3G-00000007wG5-2gyF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 17:10:39 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso1893595a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788109838; x=1788714638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFh7tNrhnkyS5rc0tyeCiGcCiB45l4CkB+Wkyp1hfZg=;
        b=srzqMNCwF1an3HoMHdirTWroTYsoriqpLarlPSrYPcIiVj/KDqAZ0fikJM+lluj6H9
         jtplec6Pyer6qyzPE7MeJOWOY5ia1vKvTWTcGVyz0c+D9KTPECnavFP+u2Gzge0XOR2V
         TIA9O/jFgtYUzGcSrrcJfNsZWA0tgouPmW9yWQmBIvseioDWpF0Vizz4sWIurQtXC1VE
         Iyn59XxKys6tpac2oPbHLUDg0p6wwVsDJS2/91nX8ELez3ZtKbnRYSggakz1xK3g9nzB
         rnH4AkAlevuls6KoSWKX15JHZuPJMsOOiX6qyZILwHnu/khKv3j0KKvS9xtSPWvcQ8ke
         NsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109838; x=1788714638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFh7tNrhnkyS5rc0tyeCiGcCiB45l4CkB+Wkyp1hfZg=;
        b=oO00CPcmFxYv0O/+4L/LOjMOQw28IPQ8xXXjd+ScD0vcu5Fm9bfGGPIX/Ir5TtljxJ
         NJaVvILw34M9OAnAeSZ0O6wCs8IVEzc9cFtV6+nIMVhNksVijz0tGMO5QvwNrJh7h2WR
         rSOa1l7SoxbhyzG+4T68E8N8TE6JPmPWKQhUwoIAdXLY8Y4fEtmg0p6+FEv0Pq17r7ET
         2kWlJxaHwK/C2Alp0Nnad2/AgDY0+hd/IuvyK9nGZDY9j7OAGBVZTTtJN/sQ7hELWumh
         srmQFhNp1/udp14SPIwziFJo92g+xlxetJBsxFNvHZApzkFXvbX/MDl1819BvjMsrsuV
         CKzQ==
X-Forwarded-Encrypted: i=1; AKwUvByxqfSUxaW3C2UBvFQNUJzus6Se3XI+XvYz5n+vCdqKWBrYwocqQ9+VdLVLhpDQrhvXp7gGpn86wBaLlEC8iyPn@lists.infradead.org
X-Gm-Message-State: AFuF++nD77gaqm973yG3y2t42KNlhDyJMS1V/t9pCpriVgAGPLDEebbd
	99dwDqJloF058ZeuFfnvDB7ESFQ2LF7PEeKIwJf8185PfKUCaAAuSpld
X-Gm-Gg: AYBFou1kAG/4isfm8JJMU2MyaYFazd2ADGtcGf9Ix/l+uI5/atVlmis4gMshx3Z0fR1
	uiqwLASPfWTa/UBya1cw/sKqh4RD95Z2KyMpHLnsVSHRLpjHenS2RZ0SYYYky2IzzFiYdE+vhNa
	cfninsHJNQ5Zy233qQgE4i0I26pw1agd3tgujEWxdo7z7A9u0aZNtjq0bm8wrTCVLlltR+TKwy2
	1nT9LWK9/GSvAtQm18Q0QuI5JciY6e3jUq7UKYqg3C8W6NI+7VRSrgICEL8fSNklTiFMCtT7R0N
	VmKb2AkIOiH8rqqEQAqhTh0mhq5dr/gQtT4BOeTDqEfebL4UuDuCmr3qAOXP6DsrWa5k89RErgh
	tyUe/eAB8OOiaq7Eh3rkQVwLuRpNo46Crxq/lMLlM2ocUfql2L2+7jQ2r5kp56J3XF5E1C3y9f/
	lddLnaYpjoHDLaf7j3p98hasX1giadb7purEcJRJmr/nnmEVpaVgYnjFzVvEgod5IE247L
X-Received: by 2002:a17:90b:6c5:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-396d0f9d0famr35772568a91.12.1788109837836;
        Sun, 30 Aug 2026 10:10:37 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:88d5:45ce:40e:490f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm17047101a91.6.2026.08.30.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:10:37 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v2 4/5] iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
Date: Sun, 30 Aug 2026 22:39:17 +0530
Message-ID: <20260830170919.470974-5-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830170919.470974-1-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_101038_684570_1906580F 
X-CRM114-Status: GOOD (  12.05  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Use devm_mutex_init() to tie the mutex lifetime to the device and
improve debugging when CONFIG_DEBUG_MUTEXES is enabled.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index c7fbdc21f8cc..11f2bc12c19a 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -524,7 +524,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	adc_priv = iio_priv(indio_dev);
 	platform_set_drvdata(pdev, indio_dev);
 
-	mutex_init(&adc_priv->mutex);
+	ret = devm_mutex_init(dev, &adc_priv->mutex);
+	if (ret)
+		return ret;
 
 	init_completion(&adc_priv->completion);
 
-- 
2.43.0


