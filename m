Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1879D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=; b=a9D+zhu04caEhVa05NQVpx0tKV
	LNhtcI+hWx25B2V83/eVsxYWw4AAjsl9nwUau8tCJpGVs0vglGLkDZFANtV1pMkDIWSkaWzn372nt
	2hxx7ZFnibQE5dlE3J2MYlwXrdZzakvE69ybSCOkEeD5rwoB3g6XIdbZESJBz87crAbxPNBI1Vt/x
	9a/chWP4EY2CmFtFUqwJWbkJbCDSb6u2Oz28FF5h/StV/KieaWIVm9eK/9BrqZNtCQiADXI7XTmVg
	MR7PVHl0KYkr+VCI1DnWilTmBBkAFM5M2J+xzCXOH2x470Atj3x+d+Ed6ZCmiyvwBd9molayHIZCY
	tTy6IBqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52T-00000003Na6-0eZx;
	Mon, 15 Dec 2025 09:38:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52Q-00000003NYk-14LO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:38:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29f30233d8aso30061595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791521; x=1766396321; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=Ig20DVTdV8shGwVmJraBdpCSCFOyDi0xQ25QEw208V7OeOqGuqBZ0ZZCsowMg/vSN+
         BvXGMO6OoB0J5AFwSs63WeBEiQhO5V50zaipSdZf/sdQv4qnV+4brzEjb746b/gOh35j
         IPZ3u/cYG8I7Bu2zEZfUwo097zN5tKc80qREnmCb9jiHuOdq7gIrrMmYOp6n48O8koPk
         aM3Z58VJU5ZBLpstC4UEq+H7T79jIIIZLY8abO1mqXBaYRuqmx63AgHAIFMCweH9s2ML
         LAKR00EgKK/ICTQkqptUSPeXv6SOx1CLV38gvXgQsa4LOQlNi8IpEGu6d6fwPmHiPmdl
         WakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791521; x=1766396321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=J0sJEFcHWZPqqOjE5tBTHaxs58K0CFp00dFQlYctoxcv/UGScGlJAsV41wkDoRK+zv
         hS1OzqwyVqLcBcVZ8wbGbp1oW3RFyQFTw+Qa1WwYgjneJceQtary9XO5f55i3AAEVAGk
         9MBJQQlGvZfp9VDyVCSyrTpxEUv//Nox+c3ZxtS2N5S4iinrx7eObb3shaz0Kk1KR/fi
         DGHcvP8BXZDNhJus7Mxh3Zfv+jxTAd41VMkIBWymBUazNNsJWigFyascuuX3i+YVw8Dy
         zy9h+Qe9A1pe3vZyoUF7OkgSL8w2pnm0tak/qRrpZ6gYnIJyMv69fIoBssCqG+djJ51E
         THkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCfgNBH9B/ZrRjdY5+svWmrIwSul8hkcLjGcMQvOkz0tzuC+HGG+iAVcdnIO0YVIFRvFf9XXtQ4FjoUVMb+XuE@lists.infradead.org
X-Gm-Message-State: AOJu0YwHYkeD1SzvxlNkQw4726qEzQciZPDbyvg647ql3fNqq6XDHjot
	Z2HqtnWNgDZ8YF3B0dZ22b3sE76qym3IdVtwdpssSerYJhcPRpdf/6Kn
X-Gm-Gg: AY/fxX5gglsL6sHq7dZqEhC4x4atuzp8qopdw/NtQo95hj6QvRAZG/MMG73/MRdMa0g
	wO2HFdR/VjM9U2RZVuheVMqzlNBq7/LQsQwHeSyKk5Gu73nA1stC0MP30aO9nJGdJe/j2VyEyZ8
	QnflpVpWE87gzpMvdBDKs2UUYoe/SdN/o5sZNvyM9mZxv7HnKgpXQRRSKP/dDwwHcrip8Qe5nnK
	dc5HjaS0lehQZ4PsrqNRKnzbwHEl9VffYkmdrc8Amc29KOfRlBfj4anl1pn7RYk1T8VFdhEB+CL
	XR3fbRkacY38g6I/D4e0vSTmJOtXTtEf6O1Los5jdaZUK1rVWfM41tU5zMi/f4O1nDuLd/BwFiU
	nsj+j81c7PPJuEeAj3qWv8WHaNbvsaNDaP3L8kvpp0hhFP5uNyMqn8lQ16sSnFDD2GWajMN5SGX
	Meyhzh52DfG53vtuqFoZ2JNQQJ5iJUPjsDGkG6fOnXruRssGwZIqQAVhiYZncN0D/ZTH1HdHpn8
	+FeSfOEXbn0aGn+3jypdpKixTmbWIEe245Bw/EXiQkAjdT2xvNe0KLGgcTY7rH7rfDOt6TYJq1L
	NTWd1w698XtbV/fREBASCQ7ITjNS/whiX8P2Z9GBjTygd1/5f+I=
X-Google-Smtp-Source: AGHT+IGrLdLzfp2H9tiVac+SQsAe4bk4AskKgVbq1niNwYTYkBxJLkhYZNfHpCAC+5TQzOHObd9ruQ==
X-Received: by 2002:a17:903:3bac:b0:295:560a:e499 with SMTP id d9443c01a7336-29f23b1296cmr99473905ad.5.1765791521288;
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:47 +1000
Subject: [PATCH v6 3/7] mfd: macsmc: Wire up Apple SMC hwmon subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-3-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215lvbGxWfZmTpGq3Lqym4EiH8s2A7af357WZxnZyZ
 uYn2O/rmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATPWbr4wMO1zKc7g2zW7v4HwR7C559/WHjwy7/16ymvClxfJzdduSfEaGPtaOhFL
 JJzUP5q6folLGbD4z69LuKwW/Ls+1WpDgv6qMDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_013842_304707_3136A4BB 
X-CRM114-Status: GOOD (  10.54  )
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

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 9099a7a22f1f..fa7b822d55bd 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.52.0


