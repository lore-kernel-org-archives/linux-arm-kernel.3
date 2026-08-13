Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482CAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 05:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9jEpSymG16S90LWBY9Z/OiKp+TcgWzc+6zLqoEqqxY=; b=Pn+ORMsZXmY8rFtV1xh7Fu2mJ6
	+EMcsiDglgwyab67jGTJKRvJaEzS4ryFmkRN4pi765z/tIEcXPmNVAnPdMBEGQrleX8Cq2r0+DgS/
	UD5noUPghPdI/7XEPSvoD28fKtLvc2AuKjVnK8gsdV0Qkz93mR3K42ACD0aZnog3+KFMect2rl6hH
	bHX7du5iNskZGoVEbTRfOpRysp1TCrlXaMmjKVUaEx3kuZn7no06eJIgNUJJ5d5oxWcYzYjcvP4M4
	WuidEKC9KLx4xmn+dHMInjHq6uAcrZ+2edPaGK/eG2usr8cxAK4cw9Ce7XXbaesrW9pSmSrQ6Efci
	z2c9sxIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5M-0000000HQW8-0AK4;
	Thu, 13 Aug 2026 05:34:36 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5J-0000000HQTj-2ojU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 05:34:34 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38dcbade417so1971104a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 22:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786599273; x=1787204073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9jEpSymG16S90LWBY9Z/OiKp+TcgWzc+6zLqoEqqxY=;
        b=ryKknR7qbEL7WpUTsN0gnR3JIqjvL5QxXC6pQ/kL9eK58k5o/U1+YkHcJSYRPhl0Zf
         2M51ymcMHTvvjFQcdfC0O05dlYVByiFP0SresQTToI3Zy9WlPtYaiF3zZeSvXpTdW238
         vIKI5Jb2vYEwumOk6XWWL+TcCJ+7BfRXTPItCM2MzoFXARMnQ54OlSinN5U/hNBy5k2g
         +r+24VKzr3TbR83voli1LnM9z91vheL4UEfZLTPjQr0qBBhxEUpe7q97JmolwG64CC75
         XDKMu6HTrgoZVmEKYsqM0qE2moGcMSYdxbKEu3L1TwiqAD4knOwGRceRI1HqNYkGYqoa
         RXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599273; x=1787204073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R9jEpSymG16S90LWBY9Z/OiKp+TcgWzc+6zLqoEqqxY=;
        b=OKWfr/WAJKjAPynozp7hxI/yPITFi+LjIGVSITh7gDbyll657DefSB1QFL1gDe2NY6
         aurF5SqRHqWAeo9ywAREpOyWe3jnk3Ok8aDKC70mMDBMTOK6wUWwIMW99JAIuPvdZPiM
         f23/4z9ZIFsotxdtoOp7FtH3qciEb8Tz4ZYARulEe5Rl/AbWHYDOz1gmAINGYXQz0OYa
         u+924uvwfzoDsmPUwOrpwaSLqu7qis8tW8zjRkJ/8J8nPjoEcNVzhELKr0QcsgSara/i
         auzVcR1AG4iHgvLdcx9B7bnNqEQJVmGLOjOgiXjCv9YLYE9/0hMqdT8E5cSHUW6tKVBc
         JiEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4KbTm06qs+6JeDeF76sNkyJb8faAvQrhjATIGLAO9SaQ4HNNLQX3bD2QBMJX/+B4ZZUGQfsTWN+Z2u5RCJ9LD@lists.infradead.org
X-Gm-Message-State: AOJu0YyjUjYOwHoQF+c+Z1VPr9v1PpER0BDdEbjdJeT49zRdrfVRbuj1
	zXQ0LA8czA7nE2Tk/p0ZsJP0BdypCmVg8F3oA89shHgg1xRmCeRadTZy
X-Gm-Gg: AR+sD13tRgr2h0KUZ7+Y1YOtvwH2a+rDXBnQdFGI0NvcC5SIdx9LdW1dBChcZqHl2bO
	keQ1a1Hra1nk6tnYzI8TZQl74ao21qify46giiE2VytugLnpCSkoWaFKjwn9AseBfU9Na7cY8hz
	H12OrNnDYtQWQr3Ut7Kphu0vCVVaXPxOsrcb2DqLNJr46L9LxieZ2vpCmauhRhRfVJIhvHZkNfp
	Jnx+EDH8nbsaLRVrvQexYAdyhv8W0hQ14VJ2nju1PMUBNtIktiZ8pFFTFYg5kwoqgYrqMl1R8q6
	PKpnmySjnzMkBuReUvV671DztqFS8Obwi114Qy7qsDYIzdZIKV+tL299zJ7sy37latHQ1IHUXEs
	TBenrGniKmjheO/RpBQDFveVxupMHLAiWg0ASouxAUna7GGFFxvRJqSPyI6E6A6eRqPlZbdpG7b
	zT8G5fJKGpYsVJoSi0r3nYDWuNMc/08hozORVpKQyTAQsx8W9LxYGm38XKkucdA7WpjqWxEXZxU
	cv0PDgMWLucUayvft2kIitw2DVFae8rG4k6zwFhoDE7aMAmUh1uznl06uFNVeAUI/zpbHrww11w
	kasPJ5cUUMTgAdk=
X-Received: by 2002:a17:90b:52cf:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-3931e278f94mr3672086a91.17.1786599272978;
        Wed, 12 Aug 2026 22:34:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d872ec5sm594734a91.0.2026.08.12.22.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:34:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] mmc: davinci: Handle optional IRQ return value correctly
Date: Thu, 13 Aug 2026 12:34:04 +0700
Message-ID: <20260813053404.21553-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813053404.21553-1-phucduc.bui@gmail.com>
References: <20260813053404.21553-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_223433_721350_544CD542 
X-CRM114-Status: GOOD (  14.70  )
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

host->sdio_irq is assigned from platform_get_irq_optional(), which
returns a positive IRQ number on success or a negative error code on
failure. Therefore, 0 is not a possible return value from this API.

Check for a positive IRQ number before requesting the SDIO IRQ instead
of treating zero as a valid IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/mmc/host/davinci_mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index 773577a10512..c503e5f5c886 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1303,7 +1303,7 @@ static int davinci_mmcsd_probe(struct platform_device *pdev)
 	if (ret)
 		goto mmc_add_host_fail;
 
-	if (host->sdio_irq >= 0) {
+	if (host->sdio_irq > 0) {
 		ret = devm_request_irq(&pdev->dev, host->sdio_irq,
 				       mmc_davinci_sdio_irq, 0,
 				       mmc_hostname(mmc), host);
-- 
2.43.0


