Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C506CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=950Q3osvXfNrhNZDR0R7N+wo2IA1yL5cHorDQTcIxKM=; b=DEuD6AwNFLmj/v5A+WTrTo68I5
	8GrTTIxKLjxwSQvKtZhp8pOcnxGiTZQcYLPpRoLe7xnhR8wAXmbMvqA9Bf8OsmU0KDa+KPc7tUUDM
	ATdNkGk77ZtgTCZ8tBwqk9qXIkP1mBsoOBekHtITC/5tOY/YXG0K9dRfRCNCRl9+N7LBuj9RNKicb
	/hb8GNlOwAr7QBvOYGel5SDsbGyL9zMKB63zLQubEsajS+z256ItO3n7j8FFeQ7PAzPdEa/mlQ0Oc
	zfhR/8GxtKI75AzfJUl28aP0a6wX+/5JR/KuAFjpmSXM9HXhHPpa4618i5KZGQAdDikeSdnUYoqKD
	Ujxvz9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mwc-00000008Mvo-1Jvn;
	Fri, 17 Oct 2025 16:04:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mwa-00000008MvM-1zgx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:04:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso16173085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760717079; x=1761321879; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=950Q3osvXfNrhNZDR0R7N+wo2IA1yL5cHorDQTcIxKM=;
        b=Ia9Btc2ss6nrDN0t5QtudY/FTXoWDjGLzblEewybV/t51azKJweoqhcoRkmEgR3Zyw
         t6m09VEJRQ2pMGmuf7uZbcOWhOdVqNI/e53xPOiMTKnGT9JDDEgOSq2R8qWy0OYnu7Y6
         UKRXArm3ucMOFUP1BkbXzTGsbqKgUIIaoKLvxuQ+WkdJpNY+lifdw/kUZ+5nuIRuGOOI
         dbhPrUtH3Uk4crcASO6/2N1dF891rfWyKgc/x8QMAiN1xisPEj2lAbiBR4dLrnXhwJaK
         WbaM9EDEknXPy8IBhK738R4dHi6pPB7doolvTIpduwmtZV1BIHrmehOzHYTIBh+JDD00
         JjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717079; x=1761321879;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=950Q3osvXfNrhNZDR0R7N+wo2IA1yL5cHorDQTcIxKM=;
        b=ojmusCDLTUCXH7o8VjPb9zL2zHG6C+KXLyafU4raHhNr65NXeLVdBu7L3ZB3ytDLti
         CQaBiK9Wa8o3HmvhTI5jiMyWAmW2aV6wN1B8TbypiNL2gZkqn/GfqC0gsba7c31izw6I
         n+NW0AZw/N3bqTAxrq3D+iO5cHwwjaOFw+A/dMaV9QrretAHUH/Ttaogwl0qfvHuoJsQ
         P2pKezssNUY6qRD69EpDj1/56XZ1VIlmDH5F4+EyOe2MiaXc11okXOGxF14VFaXJxqrb
         /sLf6LAO9Qc4PdI6zAv7AiSigoQ793vYWu/5/L+K6t2bWNBl71TANz9/ZaEbUeWmRK/d
         Ogpg==
X-Forwarded-Encrypted: i=1; AJvYcCWLUXTwhvp1OTMcUo/kxoaQt7xK883HiY4AmGZgKBcTJMJqh/HvPCNkr6iS37VzGcbj7RaqHyQZkktXuEtpXT4S@lists.infradead.org
X-Gm-Message-State: AOJu0Yz31q0fJ2ZbxLR+bJPm7MyyZF9CQseUGyH+tjzkTC9YawIYPR16
	jj8HzXmRaVECfXxQ9esVQxxizIONGuyjSxPVg7M7IQ5pSjmSs2lVXsnNZtqm+K0Xq04=
X-Gm-Gg: ASbGncsi1YdClLFMqMgtZfIcclysPd5TmExpRwkDSDBWcF4ODPOJwuks3nv1yzbmwNl
	cL97PTp64oIDDhX9dcgtihNdsklKSCnNsFOs4dakScUkic+6NEIpUJYL1OqqiJj2ZruTJx8PV1E
	1sxUf6cL888Q2AOOZn651jyrQIRczW1R1rOziuLGYQXlVR/Fw7aWA6Xnmz34PnYaBRBAiOkxgx4
	wppP2/8wooK6DwcTctCXiyr9IkrqyXAkOT32a/nMzbK9RnlewQLxfdLt2BAb0u9EMCKCtMG+i+g
	ywLtRW+WT3QcX3g6CnWh2apSnlTZHAJp10FXCe+ll9rWyTTBrby19c7DPEdLxJIRqNykdgmOAic
	/UWZwSNw2oZ3mP6jq4TL0tlPe8mM2VFph8cOOZvzCq1egQbxdgxNMz6PUEYBLDKPqB2TWn5pcXF
	JbJSjQ1g==
X-Google-Smtp-Source: AGHT+IEqaf8aEdQodsl+JMqmg15To8fNumQ1pcFMtGOlWgs5DrBRbhx4c+4oaiAKATvKgQ4yjwGtCA==
X-Received: by 2002:a05:6000:26c5:b0:426:d72e:9924 with SMTP id ffacd0b85a97d-42704dd6cf9mr3110630f8f.51.1760717078511;
        Fri, 17 Oct 2025 09:04:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5a1056sm544f8f.2.2025.10.17.09.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:04:38 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:04:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: aspeed: Fix an IS_ERR() vs NULL bug in probe()
Message-ID: <aPJpEnfK31pHz8_w@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_090440_542059_F43D409D 
X-CRM114-Status: GOOD (  12.49  )
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

The platform_get_resource() function doesn't return error pointers, it
returns NULL on error.  Update the error checking to match.

Fixes: 64d87ccfae33 ("spi: aspeed: Only map necessary address window region")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-aspeed-smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 0c3de371fd39..822df89cb787 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -865,9 +865,9 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 		return PTR_ERR(aspi->regs);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (IS_ERR(res)) {
+	if (!res) {
 		dev_err(dev, "missing AHB memory\n");
-		return PTR_ERR(res);
+		return -EINVAL;
 	}
 
 	aspi->ahb_window_size = resource_size(res);
-- 
2.51.0


