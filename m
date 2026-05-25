Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FEFCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 17:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bxCYMuiUoPFXfA4b1WnIaiXxDWxjUVKA/EAz/4H7APs=; b=D7HqAVpR2W+G/sQiQSzA1KduQ9
	99kRY8xtEqv9fzMYjsi3WKWS9EXTSTXvrVehfvnobz4HadmLxDGRxF1aC7qDDPJjJawQwEirVJo8o
	f+T2kZaF3QAlnAqQQvRqVVoaFglPhpZuSQN19eIfrDgrJH1e6eT5Y7j8ccnON9s14RHCvziHOxUTr
	fhmB7CiPRnSoNo/ljF+WkB1PLhqph4RjTopOaGZeaEv9Dzw7kGS6hossW+fwU2sYB5wd0pklYEJex
	B5hSXgN8C9+x4wTveCSjdViyrwgT00oOZzmbZ/ZMw3/ucsWL1bC0WIvb0Wcpkyhh1XHeXE3RH5Jlq
	FE17lTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRZNf-00000000ACL-0lTB;
	Mon, 25 May 2026 17:46:23 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRZNb-00000000ABj-3qGp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 17:46:21 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-9144163319fso1005957185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779731178; x=1780335978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bxCYMuiUoPFXfA4b1WnIaiXxDWxjUVKA/EAz/4H7APs=;
        b=idwkU14nT82J9hJvbv7vvEgCxJ9aqtd+WnlsmLUX4D5QF9LpKDm53S3r1X9xMJemET
         ewbLh2HMn1DxsmW+KJyKSWSpFizxNEE7/U5N2h+TuTZEDq7dIq04g3ygCk6SQxQV9cRz
         bVoWts2OGHfa/XTsKuvqj/xoS7g6rtxkD/SCfccM3VdaU+bYa5V7MfMPuyRVcNCG/Twn
         xuKTK0B7OrApluDjhbgAH2ERHb91A0tN7n4fCrsmhRM+Sm+z+h/Tlk3sYrkEJpLew/BU
         m4s4s6ACk38kpsNqsu4JQyq+fuk9MO5Yo+8iTp91/nxxNxGWdVVgb1i9BiHBpv4m2iep
         Vxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779731178; x=1780335978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxCYMuiUoPFXfA4b1WnIaiXxDWxjUVKA/EAz/4H7APs=;
        b=OWGhZYg6psL+xYh1mb0kS5iY19uMsJ0m1xThEMos0uqh159Iul9nI4rXr1xyrsazet
         vB0vgIjnYquXfI0r9eImF5JACjuZwDj6fPKaFqFKd00QJNInHGPACNNoKWj3PCgtP/82
         dvjGXOyvtCPcShyxhwysUBcl9JnLQ8U8SMUjo6Adune6TXcGS2Ztv6qcCOEBOgh9zhZy
         S5qPV1eHwt+ARhNR7Kg3lkEnvxCL+IlKu9rJoWXv9qmnZ7+xPHxg6+j7Ca5RnDQielpR
         gkKd2ojFhPfJ6xJhjBmvfX1UsNuX9Ib/+pYXkjZOb2eN97UaJH5nmrD94coEn7z2ATmZ
         0trg==
X-Forwarded-Encrypted: i=1; AFNElJ8rV6b2GlBjYaAeaUyUYMBDdynoYgg7V42qq0fWc1BgxCAFfj6azQ5spx9IPsQbgmaCH3kwRVfKZak1lUsv4epz@lists.infradead.org
X-Gm-Message-State: AOJu0YyfRJZ5x0ILn6K91GbhFzGFNPmLyyigtrRj5tggqyS8eirJmuWG
	ohf78tuDwvHbHmCn+TR+vc+03s4O+eaPeO8iMLDycfupuChxXiIj2Xzk
X-Gm-Gg: Acq92OFd7Ira+fjEKtQBRbx0Xy0nt5GtEfP4iBptcEsBmHAnzevpPfyaWpBnQJUwDj9
	CTyPpFBp7sdQmJ8jr56cLVJ/GtIcrW3cRz4cLCLRbD/Sxp8AiZhfELImPx0pzyimIJE8PEQcVMq
	XTaP3E5tnF2k5EjqYzTwXTVLXUpC5ae7Lf0QbF4/dukUbIXW30Go2k0AypERoKYSTylkd4W51+N
	wWuuf/5hWDy/QIt1kENorS8vnMEcSy3x/10J2HV2xSLRwWoZ3p3TAZt0ATmhoxE4Ug+b6RsKs/p
	sbt/pu2/NNULXzq+wvme9yz7V7lP62DEWslr9tGq5oZVfAGSbFxk6leopFC+jFI2DYZqeukjrut
	Vi19Nu8JFBGztxKo8qIcEoXkpOnyXNDsXjrdnLvFiDo47jSp1u4gmIix3LWK2xGeMhIU7/gvNAj
	WtFsfaja0rX1/OpCOhgng8M0C7jTR+oLrHoM+vVP/i
X-Received: by 2002:a05:620a:2a08:b0:8b1:2853:673f with SMTP id af79cd13be357-914b48e5aeemr2262725785a.15.1779731178255;
        Mon, 25 May 2026 10:46:18 -0700 (PDT)
Received: from gfl-XPS-13-9340.xiphos.ca ([99.209.85.164])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914bba1b49csm1050653185a.44.2026.05.25.10.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 10:46:17 -0700 (PDT)
From: Gaetan Florio <gaetansjo@gmail.com>
To: broonie@kernel.org
Cc: michal.simek@amd.com,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gaetan Florio <gaetansjo@gmail.com>
Subject: [PATCH] spi: zynq-qspi: Remove redundant clock enables in setup
Date: Mon, 25 May 2026 13:46:14 -0400
Message-ID: <20260525174614.1052191-1-gaetansjo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_104619_953853_98D1D810 
X-CRM114-Status: GOOD (  10.23  )
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

The QSPI clocks are already enabled in probe() with clk_prepare_enable().
zynq_qspi_setup_op() enables them again with clk_enable(), but the extra
enable is never balanced. This leaves the clock enable count elevated and
can trigger warnings when unbinding the driver.

Remove the redundant clock enables from the setup callback.

Signed-off-by: Gaetan Florio <gaetansjo@gmail.com>
---
 drivers/spi/spi-zynq-qspi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index 5f23e902b..2aa2c9621 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -437,21 +437,10 @@ static int zynq_qspi_setup_op(struct spi_device *spi)
 {
 	struct spi_controller *ctlr = spi->controller;
 	struct zynq_qspi *qspi = spi_controller_get_devdata(ctlr);
-	int ret;
 
 	if (ctlr->busy)
 		return -EBUSY;
 
-	ret = clk_enable(qspi->refclk);
-	if (ret)
-		return ret;
-
-	ret = clk_enable(qspi->pclk);
-	if (ret) {
-		clk_disable(qspi->refclk);
-		return ret;
-	}
-
 	zynq_qspi_write(qspi, ZYNQ_QSPI_ENABLE_OFFSET,
 			ZYNQ_QSPI_ENABLE_ENABLE_MASK);
 
-- 
2.43.0


