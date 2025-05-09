Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC50BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82buFIB+rtX6lyncKzfqQ1BjFEonYyuZcyA3lmRU5C8=; b=flaNc9eMwo6aaw8o6P2g9mBbx5
	W46d4rtgdgPHzwQaG40CmDQWkx2rrPtpj5uWYJRWl7sKZRR1zX7SsOOhmRsHQdCjgTydfI48jecSB
	UfPDc9RCeEFbwe7V2yMOCM9uDMZFSPGjlLFFJ9dw6IDFMESK1u83BfAY39pVl4iHwQvvgcwb6YsDL
	zF2B/CS2YN2zRbw2+tALow3Wg3Mu46Vt6MfMaG4NdwHmjF81W6mxZ97iGOanc9TZB4Df6c+rrLsOw
	PwZqOpAztCTWKXucZYHOMFce/89YKxcps3EVYX0eNkqsCY67i03GOuw7eeflSajMENmr7YJfVBFnr
	gGrdNzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMO9-00000003W7G-2XUw;
	Fri, 09 May 2025 11:59:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZH-00000003Nc1-1Dsl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a0b6aa08e5so1820263f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788821; x=1747393621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82buFIB+rtX6lyncKzfqQ1BjFEonYyuZcyA3lmRU5C8=;
        b=u/JBX/Qqi+kbuJAZ7bybPKENy4Vf/I3UG42V2yKurliZ1RicmcIieYy5PQgOHLc3k+
         s2v/6u5H6tCMUt2YSnQBcHUUqzEjwc4z1ZBB6DBkqZ+0ZnI3Nad3W875qpG0bElyjFu+
         4v0nmhnIdanqb9dOUxSNn7ofbT0j5yNK1rgiPaZYKkDrigV6mgNtnFDd/6PD3oErinMg
         rBU9cMTjfdGWr7tUvTymPecee/mxUExAKn91qoQgBKTtMucHdGFvFKV1FE9I97csTZP0
         FINz6vB6q3lqv459rnKMt8F8PK81/1AWDmM8nkQfwcfoPAxkBNN5GfOp3l0incVHV+bt
         URyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788821; x=1747393621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82buFIB+rtX6lyncKzfqQ1BjFEonYyuZcyA3lmRU5C8=;
        b=FSGJpUP5YLtl/rwQIw34A44/bJY2nsY4s3KnVk4YeNs0Qrjec4k/RWnvBIAjgA3Rzq
         89V6ISxIBzFUuZNLyktUZTuFdTaiesyZA9mv4kL5wf/kuhHPfTjEcXO0YVcC56LDqPr5
         dxtZMiIRhuxxIG69VOteZTBLzF5WrUDQ6+wjx1xSqoAYm3qXEVWYTxQ+xvqc+Rthheas
         NxIefN/7mTZuhAiZlpib4VYOvMxROZOriefg+00HFmvsZrHKcSvdZP5kQn+4LpqArUPW
         D9P6ZiV/GDpTRRMIh3JvrTl7gFZVSjZcp7W0YONGOY9V395r1C9bpd0A2AKfdc8+Sgl5
         mLnw==
X-Forwarded-Encrypted: i=1; AJvYcCU2UA5BSSPyWoyIs1gmyoPa1uU+mCo9vhzRJ630fpU48pEXw5FMSFWhrmR7kO9SYW3W41z+juHUTD2/KfzkqBH6@lists.infradead.org
X-Gm-Message-State: AOJu0YzMEyJ4oY/y6L8cbDUrOmJeqV16iY/mhHDk8Xw+AMdW2tXq0D3D
	68igoKAEqkpenqsmZF89X4+gYgFQhMBTAq7BYBgyRkZ6pt8tsAqg217LbXBSlKY=
X-Gm-Gg: ASbGncs7ucgtLkqV9sRonLyyrdxYL1eKODF4jgr0zkU11UdU2PtkamnnX887205EN26
	GZXq9fSNlNtx8wH6csLkfo9H0FwJF83SZFgZmNGpDyAsw8KApQ4WpYyC5g0ZkbSTKN7EHKyaBMl
	4bDFQIuDPTXnFF5Lt83Kf8ZbzqUMrFNccIg/BfrBL3UyATKJ8MykEWDckydx4sMGDTLfGUv7vmI
	MAJCG+Mbw30OVUPquDFl3X6euiZW+87fZx2ySJh6kAqW+MuTJdCnZbt/xbonZeHSonBSas2Srtu
	5KeH51Lk5nHOJfSzhDvku9Xtv57U9fQ/gWZgHLv1mZZSR6o=
X-Google-Smtp-Source: AGHT+IEE94+EF9/8yZCVzM9YnUpAQNsIoaIC6oYQfj4cjZjT31gCTBuncCPpzbHVyG2nFW+mquupKA==
X-Received: by 2002:a05:6000:220c:b0:3a1:f5d7:b041 with SMTP id ffacd0b85a97d-3a1f5d7b0d7mr3035935f8f.25.1746788821614;
        Fri, 09 May 2025 04:07:01 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:01 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:52 +0100
Subject: [PATCH 05/14] spi: spi-fsl-dspi: Use spi_alloc_target for target
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-5-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Marius Trifu <marius.trifu@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040703_338170_393B1917 
X-CRM114-Status: GOOD (  12.64  )
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

From: Marius Trifu <marius.trifu@nxp.com>

spi_alloc_target should be used for target devices. This also sets
ctlr->target automatically so delete that line.

Signed-off-by: Marius Trifu <marius.trifu@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index df6f85122bfe..f7f9425a19e1 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1340,7 +1340,10 @@ static int dspi_probe(struct platform_device *pdev)
 	if (!dspi)
 		return -ENOMEM;
 
-	ctlr = spi_alloc_host(&pdev->dev, 0);
+	if (of_property_read_bool(np, "spi-slave"))
+		ctlr = spi_alloc_target(&pdev->dev, 0);
+	else
+		ctlr = spi_alloc_host(&pdev->dev, 0);
 	if (!ctlr)
 		return -ENOMEM;
 
@@ -1379,9 +1382,6 @@ static int dspi_probe(struct platform_device *pdev)
 		of_property_read_u32(np, "bus-num", &bus_num);
 		ctlr->bus_num = bus_num;
 
-		if (of_property_read_bool(np, "spi-slave"))
-			ctlr->target = true;
-
 		dspi->devtype_data = of_device_get_match_data(&pdev->dev);
 		if (!dspi->devtype_data) {
 			dev_err(&pdev->dev, "can't get devtype_data\n");

-- 
2.34.1


