Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF22BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=; b=xC1ABG3Mac5Dm+en9HNeeN4408
	F4aujsNbxX3MlaR7NXBJHr2nXQCHY3aGHFRO+5JwYyxLMO+OQr2zIOSwmHUHzpJ7ja/rHxP3jQgKh
	67XAci86YVjQ+IVuY1DS0oxcBTsTHROkf+XHaWnilfvqCRXGWlPvmXhq2jAcNsDqRzEmLXT6CNrGl
	H5LwkBWW4kOFQWWUlVpEa6k+7z3TizNXHrFsD7DmrMrHTIf3bx/q+4D2NlA4+2Ciu4FDZqx2hVQ+D
	gA3xrW9XQQ/Ji5ziREVgJHPIXV+1ByJcx7WpVWXik715u2hopsgfVB2kOk6bOry6OeWiNsa7nHzJs
	tBQjkidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjXV-0000000ACBj-3NgW;
	Mon, 23 Dec 2024 14:36:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPiWj-0000000A4W3-1owz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Dec 2024 13:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=; b=DZoDNId6BctMpUPaD5lZboWcuF
	owQ7s1QP+E9QLB80SSgGG/Zux6HiZ6TCgElVaQR8RY+FTlULq60shT9Sum6vDDfD1dF/zNVG9+DmX
	3n/g7mSk9LGE4vtL0cxCHbH720ndxgh44Aww+30ZDD3Zvxoh2tsjKjdgKCU/DioQlraDd+vhL5v8G
	EnrJGXuek3p9J8bKgs4ILtcB4QMEmtExjZ/EiJV+XQID/FbOwgg+iDsjZCI/wpJ4eCm5l/OQtvGdj
	YwTJvVcrh7b9ZJUxor8m2+ymfKKPSXHgHif4nAivP2uzi7wWcOvZNXjsdrL/weFMX+rSuv7pCrc0b
	QjunnbTQ==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPiWg-00000006MWb-2P2F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 13:31:16 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aabfb33aff8so748762366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 05:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734960672; x=1735565472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=;
        b=Imshv9SMeFTcFrEMOJBbQHSMb7OkRGNAGPttpvGWj6Nnl1w9dSq47BzR10F/VRwojm
         FwA82hj/u3lRLHKNksfrZz75JPa88l7t7QgzPvPcSgr80MIj0xZ79iayXZ6VeGpvGz3f
         3PfXCymIMCuHuzqNavqVf4CNt2T/lF2Q/yyBYRhuQ8+1OygIKmrqV9AMi4tnYK5sgsQx
         S+SN+1OpeF/P8TF6oEEabydNJrYZKRh/njH5GY0K1kfsHmh0T85tL6T3uyzAWBMWPWEi
         o281uceQ3NFHSHxx7+SE1k9MrmkAIhJuoyZFFISCNGggwohiZ4pNrZm5mJi98jNxKL7k
         jXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734960672; x=1735565472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=;
        b=VWI35vS5UgF7FfpuZACog8qJGMRZjw8yd6qpZY/z86rYUSg2noJkJ2/Qrc7ziCSeJI
         TkbxkOxlLID438rI21iTt9kai3TRdGHMv6/VoefPvk01QPh0DMLyXXAutAHrYUGns3vz
         G/Vxg0J2u63vcgYgllMGIKCVLEwWR6R7puGrBvoCKeCrhk9W3HJ+qd/6BvHxgvwInxZ3
         n1oHkXsFdk2tiN8IgZUH3+glD9yKacX6BkKHqWXOajNN4t5p5TD7ttqyPgQ1YrUQjZNp
         kqiWdDMfl8mBJtRarRFL627ePuL7ZTyl2b3/VZUSFvUA/K75NRf6xqr6ivoipDa5T1Lg
         rgGA==
X-Forwarded-Encrypted: i=1; AJvYcCU7dpBSLfRD2NDcQkAe10tce9uAlpitRS8RggbHhiteZiQHU8Hl3FnnyeWM1p/PFf/iKiMPp5gu/4w6whv4Tp5F@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/RcHo+h78+Z6DHKp7KVC2/PwyDFG1VtIpPF51Hy9laitaZVxB
	IBCqmRKKgZzOyNI8qwGx4SeBVcFAGmocNU3h51zh47WPEVF0rSi7
X-Gm-Gg: ASbGnctQgLWcjCQ/mEmZlgDGaGYrAxx5WRdX+wF7XjHvFA0d/0dUEMVAzsF2C5x5m2z
	8PAiO6M2fSxQqPXB4Lr6wmUbVqxkL7AFYwJM9ktR/kKw7Fiq8H6EeTEukpFNbfB25e2fdt2KHbv
	XjzWX8sG4YUqgZQgqkSmBFYZUAI3yYiEjt+Mp0OHj4HzxcRNWelRob0VYqQafE/r1OAAcWZkx7T
	7TQc2u8ASzyFqUwsdJlSVT58aMGLB9qeSaGfE1ygCTUpMfmdAlI9eunlDvV+bnkGAndptWdAohT
	NKOY6UL57NWvXsdXIo8qEOvjKQ==
X-Google-Smtp-Source: AGHT+IEAjOSElAIIGrGWGIQMWdMK2o7RI6v/y07lVKjYb6AqUZp1yJSKckWfo1Bm53K/zjmZVsKLjg==
X-Received: by 2002:a17:907:3faa:b0:aa6:9540:570f with SMTP id a640c23a62f3a-aac081579eemr1553450066b.18.1734960671961;
        Mon, 23 Dec 2024 05:31:11 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e895502sm523749966b.63.2024.12.23.05.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 05:31:11 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 23 Dec 2024 16:30:39 +0300
Subject: [PATCH v5 1/2] power: supply: max17042: make interrupt shared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-b4-max17042-v5-1-e4e409723bce@gmail.com>
References: <20241223-b4-max17042-v5-0-e4e409723bce@gmail.com>
In-Reply-To: <20241223-b4-max17042-v5-0-e4e409723bce@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734960669; l=1055;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=/EeD7LqHcTZ3/1Ng4iRA0q/Q9oTbn7vVY0BQy1PKauQ=;
 b=ltc3kA6HcpduIZKYmVftqNij2lf7rbl9PER+OdeUoULkpB6JPpKkulYdc4j7/w7rYHRt1LhYp
 zt4lvjE87Z+B8qqX5eyIYMrKZZuAMRSM/NZnPIuV9vCF2JBkS3lLuE7
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_133114_837282_24A1810A 
X-CRM114-Status: GOOD (  12.21  )
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

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Make interrupt
shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/power/supply/max17042_battery.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 496c3e1f2ee6..99bf6915aa23 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -1103,14 +1103,7 @@ static int max17042_probe(struct i2c_client *client)
 	}
 
 	if (client->irq) {
-		unsigned int flags = IRQF_ONESHOT;
-
-		/*
-		 * On ACPI systems the IRQ may be handled by ACPI-event code,
-		 * so we need to share (if the ACPI code is willing to share).
-		 */
-		if (acpi_id)
-			flags |= IRQF_SHARED | IRQF_PROBE_SHARED;
+		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
 
 		ret = devm_request_threaded_irq(&client->dev, client->irq,
 						NULL,

-- 
2.39.5


