Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245CBCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 00:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=; b=qVCJlS0cCEXpf24cnGTI7jzFDJ
	BSZqFIjC6co4pSMfS+gkfnwQB9JisfJbxKhbQuFlTzc996Kq+9HcJ4Tm3frCWWXqn6MqERxGonq5a
	XufktMhNB6SxbFB9HetwqgLc07tMtiLDT7xTsbMSfHpbuToX3yz5tQ60l4yPAN4NxbQrgtkuyun5L
	UN9snSlIi3qJe1A5NR1bQ8/YkSv5v51rp9OE01GOffT/N6IoW8AEWV6iIfEsTiMFATmKr2iR4fXeA
	/I0SP++44QTNxRPP7US4pFO5jYmg3a7ZBf1FezeRZlBQdX7ld8vMkojH9aSzI5IqNoMDuExHvRJNl
	wHqo8OrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6X-0000000Aj4F-1YwH;
	Sat, 25 Oct 2025 00:25:57 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6O-0000000Aivu-0gg9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 00:25:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-27c369f898fso41826655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 17:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351947; x=1761956747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=V7OwoSUoDJGJB1VuZvkpKeHVaIkrvxbHHT+Yh/QPi0iyHx10FrDAxq20iir3BhbJ09
         +B4u+dJt0FhpHC6lxyyFZHs77OGJ7BC4xfJk+mL96popRLRYFnps8XMkJnUpPxRz1cMV
         gV5D5bgpFGulpuD5O3FbSAXERldG7RIewgmYH3jWJllGxb3nN8LFV5AXV6rNaEtr5bvj
         JTmNCSmmJbaVlF0AgRVbX5zZJU62/HQRgEBGEZXnL35BLo4DaCAtdyNwuaxZhq/U5drT
         ObXCZSb+WH++egiXmVzGHFmse+1MTBqtfkbWrJnNbGFhRw8sxudgIjp8F31c+JCSDLIg
         Tndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351947; x=1761956747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=DcMw7HA/g5oBUsfahk5XAFA/aY5Qgc/x2KKu4KrBBg98djqZCR2HY81wuYlVmBAhK6
         9JBeGAgGyYOoT0zDgkITiS7t2LbErpgYWHT+gxNuxdQ8lQ8OBoG61jbZPcM/pK4Fkq/G
         xHgNuCKzBQMtq5o48ienkpBa5+4Cmeb/bwcAzNY0CqhNctB5w/HzpSUCLBBqM1fFGWos
         +lRKqac7eUEyyIIF70Z2x+Z3kpDAVCvBTT1IL11xAA2NIp0x8hEZktYWvxpiCpLUPjqr
         ry67aPVq5Lk4zd1OvnNwiHwxApJX0DRU91pPWLYr7/sDwN+rVHAljhxBafnCE9LqQPT5
         YVbw==
X-Forwarded-Encrypted: i=1; AJvYcCW5pGN6xA8EeVOHgddgd782trfU792h/PtY3kP4VzErzzt2sRIGz/Qfpghi+r6t2/lDlhOWvR7Sdi7kw/bktmg7@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuk0GqZJ/INSrUTvn8RnwdU3PUz6MoMTIj8fYJaZnC3uN6K4Hy
	8GSU1o2udvR7vYirUYoVOneU1kxB4tHhd854Xk5vAySrSkArCZfTuQtt
X-Gm-Gg: ASbGncvUAr2c720EsrVZ43KA+NYFPVk0Hu98CBsC5dYsRoRphMkm7kcBi/6FCM7aymd
	TVgCWyezGOLQa9Yqda6GgqW81TEAHqTsEELShQr+TM+pAVL/9ezESPzNc1YJfGoyL2xycGnWQfV
	Mqs1Bl+GBuvM9OzZT19bobBbPFnZZ6x4ZPKHG58zsHkObRfDR6sbK6jFBvVnlURqjRrvlnDvJRn
	5W+zk/HF0KoIoj4b18DjvTiz1rtC2Sh/h06zwp7IYH7RUkzR273DHSvB1oBhrRVUBUm86SOKdFo
	RnCXUMCZTThKAfcQD+x9H3WWYdE2tBquZeTeNR4q4uEOUvd+LlOttCXHzNx53G7Dp7SN9YIdMRF
	5CJvYJjOH4icJ45YYiJyXSg7Sc4IMUqUfTwJiZU0L3+PSEG3ZG+G6glbARbX55TF8SXWhOjgzTH
	riuNoY6ipNTSHOQv72rbsvuSeCICXrO6TetuBf2rfYXRsA2iRuTsIIwClH37XlRdeJvDrzx5GB8
	6m8vzjlSwVskW0PNIUy4namDEU1EC2XmzoPOlM3IYx34NmljAg3sjdAQxqSK9wX
X-Google-Smtp-Source: AGHT+IE7b7WlJg8PMfCez4BRWP01L89M03XHDqmXIAUdqR0o0INVIyz4n2FlGNeMHwcTEVAj8jvj0A==
X-Received: by 2002:a17:902:ce12:b0:267:a55a:8684 with SMTP id d9443c01a7336-290c9c93abbmr330781785ad.2.1761351947512;
        Fri, 24 Oct 2025 17:25:47 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:38 +1000
Subject: [PATCH v4 07/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-7-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
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
 bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM7tvHxyY2mQfvkOj2Ou1b+lL5wt2qeuPnvBRX51B
 rNbl1QLOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNdv5aR4VLggrKHBVUNC5VEVaVC98ZfZxOt6Jh45+IVmwlNsr23dRj+Z+7eV7D
 x+NRGVakE1ehjKc+n716bd2HBjQL/Jt/QqBk9XAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_172548_284949_CBC5FC11 
X-CRM114-Status: GOOD (  10.22  )
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
index 500395bb48da..51dd667d3b5f 100644
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
2.51.0


