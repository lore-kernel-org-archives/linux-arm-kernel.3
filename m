Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485EACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SiTftMOuutV4vYFy4eckN5Ll0Y2Ut9a5Qvq41E2l5PQ=; b=abj2B7Yqs/RDn68HPYgw07Q42N
	IjHtl0UDb8HAjiMLyL9AKTyAKN8eN69ZHlbQjtxqoJS56HJ5O/tbqZtQpagrV/e4U+q4fh3XD9B7i
	wHa1wVsHYF1qz3DDPPZVKxr2EyF5B65SQCnYjpKa/MB9OvwPOHW8/o3SuldLXT8k6RAvUrT1UMV1W
	PeBSvC/UpTR4ldnxDR3sUw6SxxgDIJGBZeZ/2XRyHL81mm2TwmyRh0+Um3ilVczh8sxqHcHG1cckx
	ce8N8iw84EXqwCZcpTpGYBucYvLqLzrM8Wi07M/o38oSR9Gi0PJS8VIzIDHHeI0ccloOsut8PFiqh
	MUZHUjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKV8-0000000AH1z-0vFf;
	Tue, 19 Aug 2025 11:27:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIp5-00000009zr7-2WZg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:40:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso3556323f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596405; x=1756201205; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SiTftMOuutV4vYFy4eckN5Ll0Y2Ut9a5Qvq41E2l5PQ=;
        b=QregAEZYR+KhLOKckORWWA1ciNCwFRe5ROIhBOjauaYEhz0h4kA0DMXAAbeo6ll9/6
         dTDsLwjqTwRd/4+X4boPX51/SVYYm2ynKQgGnB4h8LSFv4P5H1et97bLzwbmX9BmuI6l
         Pr5zc349yK4bMXmJBw+8bkUsdHlLcyuav3mFru5+wl/rZta7ghxGsibHNsRWRB/Muzrk
         WrLtzoHIRGDJgL44kIdcPbiJChtUxeO9Y/u3Jh8HeeujadOQJ2NcRpqFp2UQ97s9seST
         /0YfWuOu9pJ2BIfDMsLx8h5qWCPDktCVa1oW3jEykY/h7TaXirX6d8zvmSm5CHe2ucZZ
         DZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596405; x=1756201205;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SiTftMOuutV4vYFy4eckN5Ll0Y2Ut9a5Qvq41E2l5PQ=;
        b=dylL0yhAdwxczTJUn47An8nJb2Hb2wvOZesFKcSe0tFkskS8E+tWbHL6zDps5o2jHX
         chTo7hKKs+fS3Nhn8ixx5L9G3ARPOd3zhJtqMEYe1u9MbVmueaQsEGujs7oJLq6uD+v8
         fHpDEmbpkHeGcMiSQxmBfm6MnKs/IuwrkPSrpB3q+/5z2haAmXM1LkoLEPJwo0ECgcQd
         Sy43H+gkuNZ8EqnjFnIh+DpUp5zRwTLNxF3jTaszfATzz6qgS0vhc+01DSpfX5wci9GF
         TezFdt0HIsg0CH71OnXWq0qYhN3bFPLZIAeCX2F8YK8quno8OQIf3J/EIu9P3Ge/LP9w
         fw7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTV8i2ppRlL6QQy6VWRBHjptmnKNhQjpZu70JbbBFeDbc2KgalfitpNtKVfX2LrDC+VOy82s6ll07gj17mRRfC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8NMYT27MgU4aSU7pVgAcAIpjnBUq8dEgNTG5LO0XlRQ/kDzYh
	K0AExHkEMphv5Q+7UCLZspKp9kpAsGzPb1XJeE6zpKCAGSWZ8yeuonzGYksjlRI0ACgJQf9DnS/
	zp1WG
X-Gm-Gg: ASbGncssEYPMNEDRCTdzHZ2srmBwLZBaAH+ybE4ODBIwZriP6D9mVS2ESWsw52r1A/e
	FDgLFNJrUGN6B+Z40D+XJGwTQjLJr6mnA93fge6OhFa4wKKf9L5VINMEHf4HV9BCu7SJL/Vww5l
	3asc8JuFYtjcVAbjE0XHU0vHUhB+K4A27swFzKdyC3cC/1wNPLFVD87+JN9h83crBwclfsgEJ9o
	8mhrf+6deEBTOiX3Vi6CtddoRkR0FwbZ2Rb+5awpHnZKs7wd0jW8+NIH0AUcBYmI267gZZcheoc
	bUleQQVrO4ioB0fTuAFLI50sgOZFrz3Bi3F8fS6AQXNveketAEH6hVmeBAF4paHJCRBNAzUHeTh
	PCHtFwtvhLNAqDZHJgma7vQMLEFA=
X-Google-Smtp-Source: AGHT+IEmA2rIqWh10N25HpFTkyRTLf33hBwL7CA8l3kzmU1d9YQ8FcSm/BSFS4F04By6ZWvUc9Balg==
X-Received: by 2002:a05:6000:2310:b0:3b7:6e64:bed8 with SMTP id ffacd0b85a97d-3c133d63836mr1403055f8f.28.1755596405461;
        Tue, 19 Aug 2025 02:40:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6c324fsm201628175e9.1.2025.08.19.02.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:40:05 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:40:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Elad Nachman <enachman@marvell.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] irqchip/mvebu-gicp: Fix an IS_ERR() vs NULL check in probe()
Message-ID: <aKRGcgMeaXm2TMIC@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_024007_638017_9B01445D 
X-CRM114-Status: GOOD (  14.96  )
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

The ioremap() function never returns error pointers, it returns NULL
on error.  Fix the checking to match.

Fixes: 3c3d7dbab2c7 ("irqchip/mvebu-gicp: Clear pending interrupts on init")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-mvebu-gicp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index 54833717f8a7..667bde3c651f 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -238,7 +238,7 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 	}
 
 	base = ioremap(gicp->res->start, resource_size(gicp->res));
-	if (IS_ERR(base)) {
+	if (!base) {
 		dev_err(&pdev->dev, "ioremap() failed. Unable to clear pending interrupts.\n");
 	} else {
 		for (i = 0; i < 64; i++)
-- 
2.47.2


