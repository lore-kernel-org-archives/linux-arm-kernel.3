Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DF7CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 02:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvC4gX1oHDIM5j6whwgmhqEecsHukjk3hp3brUU36ME=; b=xxSOlQX9ulrLFwfKPJHSRK/wYe
	4OcKHgTMN1rwIZCeEmDpdgCxKNa3t5v1xtSVOBqC8uUx0zrn1iz2wuccWD7kRS/KZelB4aLAvHnMg
	Mw6mdR2R8ann/Ahr9MKUN0EDSyjIRd7vGUnlJhdembFyfro2nc7VSxNJTl0lpnbdscCAKYFQZ2Wwq
	mwB5kKc7EDKmpuSIlccoTtt0cql+FOjfHXr9W3ek9SpTaaNtwAQJY7z59yq804suhoryDwlaAxDMt
	HFuhq882ipy2sK8xKHu5K9Z6+H88ZNlLIvRRGSaIpDMtUSEui3k5jTsBwZvb+2RPj9vocJ42qRspT
	XmSUpdug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwmh-0000000ALPW-44LG;
	Fri, 26 Jun 2026 02:59:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwmg-0000000ALOn-0tgO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 02:59:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c7ee3952f2so2520465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 19:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782442753; x=1783047553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvC4gX1oHDIM5j6whwgmhqEecsHukjk3hp3brUU36ME=;
        b=s+KBiOnpGhByR89cSmqnGZCf+qT9sIHeLLVfvelQSb0pO0/XvEPDqBAVHTxODMnFOR
         tTv1cFlfGGARTuM8k1jilZYWwcTJr0uIUd6uO7YTZNsXAmQ0UwuOHhYiREyhYUVl+p8k
         hXhE0AON7HW7sITRR4gILKhwj96MqTyUxsU/trJs6zsEQlzQwYF29PKCHQh/Zkvs9PfN
         w+29IvHbxXLy62dEki5YlgZUyvUqqEcsKOkMC+5da4Etm2veD6RcGcM/osi8qPxdrYzQ
         RxDlpWhnyUwAOP6FAwoYB4NsbjOE/bG1T8ysPOGa0PwDh3FMVgU94CHwJPrGfLy4ClDQ
         iY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782442753; x=1783047553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IvC4gX1oHDIM5j6whwgmhqEecsHukjk3hp3brUU36ME=;
        b=iudJ7AVrC8D5p6hCGjd/i851DvP/pMhmgTPg86svY8q0x7CslSn3mGpPNZfqiXbPW7
         dzQyyQ5JBRzYCi/htG2T4Yem/3d5W+nfRAEeE4BSPMvm3WBr9O+SZBSvXr1xN/EkKeyL
         0Ps/F1ax4B2IhIcuXfISakJ1o0hB+JDhDgtVHXTqsQIEtOBc3zRR/ZLvV+bKjVEozLaz
         1R4GW47dnTn6lRCbMvJf+Hlra7wuLc77ms9kLQSWPaeIBeIk91QUVDOpRSzbUxRzMzbS
         RsZRX9WBXXwkWTj7TCGdotLf5fjkooTskKqj67wBmE5I3Y8A74LNoJyXRyS6mwV54ol2
         P2VA==
X-Forwarded-Encrypted: i=1; AHgh+RrI5mLN6HtFIBbA6ddd6GGnHRKAzG58MizvX1ckc/CjCYnu/JuZJyIML3Jd7wmQtbLAYZyV0vijYJLRI9xs/0KA@lists.infradead.org
X-Gm-Message-State: AOJu0YxRdjrsSnSbi/V0Sjp6x+mqX0ymD4cReOpgL+iZlR7kL49exK5i
	paGH7s04FC0JJM7Z0MCswSdvCRfj6Y4GPoA+VNRlHYUE0Q+g8bFLpTwkjhsF79V7pWk=
X-Gm-Gg: AfdE7clloKNI9ODBl0p5uPYvTabfCC5oz2zzoRprsXPAeQLWMbZX3CcNmsd48QUXkHB
	2do5o+7v31+tW9MegWtl48LP5ket3oLppQ982ilrO8m7U7FGx0ABQmIcaWFcMr6xqxcPfsE0+C5
	/9F40JNekiFEuucY0SXqkZYHhns1fxaL29+eopk5dNFxN5fTx4A/9A38MEVfEdq7G4paAiBbAGV
	AcQmAsADJENHrdhZeQDPFviZSjlm4VVtikV/oLQyUt5RIwBmJQnicwREFMlpBPOsbgMxollvLQN
	AE0QMENxcJEF2SpnV1UOU7/4jK9Wlvvl4lNHMVwIja/M3sGwNDVIS5CoL5mXHxOlyn0OZ8Gp6AW
	x6ryd5IGWET4E/3uoKU7ACMCTivvh3rW91czmB4mAWepLEWpH8PoYQY5B66/I1khTZyiWXBiXXR
	W7jMwT4auzYn0=
X-Received: by 2002:a17:903:1acb:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2c81f58569bmr423295ad.9.1782442753216;
        Thu, 25 Jun 2026 19:59:13 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm31252535ad.29.2026.06.25.19.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 19:59:12 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@nxp.com,
	andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org
Subject: [PATCH v3 1/2] i2c: imx: Clear slave pointer on registration error
Date: Fri, 26 Jun 2026 10:58:45 +0800
Message-Id: <20260626025846.106157-2-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626025846.106157-1-liem16213@gmail.com>
References: <aj1UR5ddawsdMbZC@SMW015318>
 <20260626025846.106157-1-liem16213@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_195914_253981_265CA3DC 
X-CRM114-Status: GOOD (  10.89  )
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

In i2c_imx_reg_slave(), i2c_imx->slave is checked at the beginning
and the function returns -EBUSY if it is non-NULL.  If
pm_runtime_resume_and_get() fails later, the error path returns
without clearing i2c_imx->slave, leaving it non-NULL.  Subsequent
attempts to register a slave will then immediately fail with
-EBUSY, making it impossible to register the slave again.

Fix by setting i2c_imx->slave = NULL on the error path.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liem <liem16213@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 28313d0fad37..17defb470776 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -936,6 +936,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	/* Resume */
 	ret = pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
 	if (ret < 0) {
+		i2c_imx->slave = NULL;
 		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
 		return ret;
 	}
-- 
2.34.1


