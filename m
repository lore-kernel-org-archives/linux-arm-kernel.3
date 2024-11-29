Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F19AD6EBEE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=; b=UBJtPkO1mAtGescLd15PyPQtFz
	+iYNdyzdh0X6GF4id43dkj4k51VtDNBaFlfIrYPKE4kp9qTl16b4GpMU8FqKH76FPpJ8K+xdBxXv/
	ge5wSbOWgpBZWHEqkfuPF1UUQ1LFa8D5uODl+hrnJNX2C4l6QQBJm8qq0fLXExBq25/JUVS3LoR2/
	Ri0B39X47f68A6gzv2NWES4nuCls/DE6hpldkl4G4GPPxVh4SAJS2mQwdi9WX6+crwBj7qsQGxSc9
	LcSkOvQlcE6qidfEV2BNkMmjFXAtdLb7sIDKA7l0cHd+9JG/6QqPCrwAUe4RDTa14eF/ccH5K7M8H
	1/tNdikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGx2o-0000000HIH5-1Imn;
	Fri, 29 Nov 2024 09:12:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGx0s-0000000HHsp-2jwd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 09:10:11 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so1790849a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 01:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732871409; x=1733476209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=;
        b=aSHMV7q6xM9vh1szX+uJCLs7a/9wjOHHwP4FGZLQMSaHtgo3QNWNHdJCHNLlKyLJa6
         XM1AMB/SKzQjk/dHT27wfQOnkmM5GVoeyutIPYp9qsMUGf5nPCmADC+8HEeXbd9u5hmy
         WHDFMrdxSB4NJtaR/4TScSWnQhd9FpkfpVNT7XCnAK+SAKIG08hvI4kRWt7rtJ6IdOUy
         58G5MX1+B1l8c/5rGKiR3M0eJoZc9X34Jvdm6jDfAJmoNP5Bm6vuwvYh1Q94DJr5kr+g
         wZPPevS9gZdz8bV6QGhq2jhxPxZW+ZQ+ym9YWSi6iZ8HWSKb/7lAf/5EcBKIrOovyggX
         lxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732871409; x=1733476209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=;
        b=NPQ0VFqG9aUn6K4rZSftqdGXN3DKGLF1P47RRBKwsqq+2NZI5S7BePOc1NMps/Aot1
         pYZECEkf7NX8kLrlW/UPeD9P/uqjfF5yay75rYP9UyLEifyY8+mQTNLDLHhZpYKytjp7
         w3AOCaPVZHns1MO35uGXbREpp2Bpn/7sY9jXQx4ybyWVWlWklLK7tfV2nbDo4g8Fu1F2
         DJ4pcga5dquPCxmpS0QnGlpgkaiT6ThiDEvLLbLJHCNCmSZF8svSBYBLKi+pkab3uw0t
         g2zwWaUufqSwztbcQ3pN/qnPfLA5+yY2DeyCGfetm6Pny7mSjATp8kOd/TfqY+pDhxxu
         iEpA==
X-Forwarded-Encrypted: i=1; AJvYcCUetsZGfROonm5cHrJ+n1yOzRHLP2iS1QLeSG1JxCXXLwZJ/p+I36xOn1VtZHXXqXtBWJadyguwKTR1ZP29yHCQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4vCNtk0KFTLJ1omk/HZzpVjVEy8LEvVhffcGWb2gYWfbMWkGz
	jVHg2JOXeRgjQ4g9POTrTRx8ukVAY8WKewS6pIVLnHUvVJtlDa4G
X-Gm-Gg: ASbGncua7TiQl/MLSyWNDDBRE8Rii4xawtR8b+dyhMW4Zc2ieyFd/3/SI9tojB+yYjn
	OyYh0UC+Kdn/xEfCWunOi0YCROuMFazOu+wxd9l146GiJYOzhLx8K//z+6cjQq26Sg9SQUjnn1I
	gtV84/bmkfRHFtSKObK3aBmDxRGdmiJ3pR5FbmuBfW3qodZEby7WLGgXSN/Dk9LR3SGnRZjlXNt
	17zg1rA7ApElGHWNTY+ewI7FyHagVDMUec6V4D5UMwH3+vW
X-Google-Smtp-Source: AGHT+IGaSoNpYyEkF4MY0uin/iFl40YkpVFgMNLIjAQotNHq5x5X5IuG35tfQL+bge3PzeB+YGebeQ==
X-Received: by 2002:a17:906:23ea:b0:aa5:451c:ce26 with SMTP id a640c23a62f3a-aa581074c05mr802310266b.51.1732871408811;
        Fri, 29 Nov 2024 01:10:08 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa5999032c1sm152775766b.133.2024.11.29.01.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 01:10:08 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 29 Nov 2024 12:09:53 +0300
Subject: [PATCH v4 1/2] power: supply: max17042: make interrupt shared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-b4-max17042-v4-1-87c6d99b3d3d@gmail.com>
References: <20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com>
In-Reply-To: <20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com>
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
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732871405; l=1055;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=/EeD7LqHcTZ3/1Ng4iRA0q/Q9oTbn7vVY0BQy1PKauQ=;
 b=EvyHOgNK4AahgKG5DWBHSPPcVTYoTJaiheiGNKsbrhG7AOhn0QFFuOhoAyU4v55mKxKIL2oN9
 y0QTQM7oOgEAjn27raPOcOvSbj+ijsZ35rDRl/DiAFJeZ6tqZoApkdx
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_011010_695899_F3663D25 
X-CRM114-Status: GOOD (  12.62  )
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


