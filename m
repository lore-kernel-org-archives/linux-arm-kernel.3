Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE80CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 00:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=; b=HXac1hajca0iaOvaROJzqh0/KS
	CBeIZci7doGFOrVXf+fhVGRdqzJZEJThqo0OJseQBB6AH2qHR65Oo4P2PQOW3cbnNLhnim8B/RSMH
	k5ERFeNI5jXwv3VGuZpHQ3VjI102RCPwYEWIE41EOcyyIXZ26x2xerTPFLEv8/Ds2LOKNElESRjiy
	RfDcJurXuR9p0UgGRsrlaxE+jM/Oe/McKUjgch2Xkmwoju0APVAORwmv8HIO8IoZdF6EGVCTASE6Y
	oQEJcBQe1nhnucmle0+QrV4UL1JXSWKPQATV8biDdPZvKtUF9k8h9j9irlgeULkyiMPmOUUSoL2WG
	AAfaE1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6i-0000000AjG3-27bT;
	Sat, 25 Oct 2025 00:26:08 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6d-0000000AjBA-2fTC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 00:26:07 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-26a0a694ea8so19347845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 17:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351963; x=1761956763; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=fmAQJcO5/W8bseDnMsV0DlJ5u0QAw4EEbn6ORsiSKKG1MlgZF3lPCml831RHO6WzwD
         1TGPVrGVHMryoXuS/+dplC0b/qfjxFqqXX2WOA4S9oCGvhvEVKHIqkg6Ouh5aJLcP3zn
         /Z9kL9BsoX8nKjvuOizsBDyVFLf4tH8Ps0tuWcE8GBns/WaQsJmjZuW+TPkPxc2ncZLV
         Yz8xd4Is8SXJ5wyE+IBeq4kXaFsqttJP10+YrvMkflEIBz6kZZKF90/I/biF8iehljkA
         hoGtSJqiGV+lGBxxhpZMT7Uvjgt3U/5dZL0RxbegqJt2nKlZS7U2pWGRKwyRjDV9dOnd
         lUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351963; x=1761956763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=dW2dTKOb9pIHsYVZwWF6TXnGfy/+tA+3dskrhG7nUKxWTwiFJa18eresvebWDTIOMJ
         4denOnM59QBdQc3iOMprBWn/dz0UOmbaEmgaSQYzYilsC0xzS65K/I7k2qWEq6Uvcgq0
         15ht2OyTx5qJJ/GYyDi2f+NFiJD1ew8DYvKHryyp3nxRpj3Z7nbTVbvBzcnxl4pts8IN
         RF3rZG4DRIlwHO6QSMVMLorp12XkDfWPHOBVdaKWPEIpf+BQpGyoBMfxXWuIOXXErm1c
         9XbrKnDnheGSjdWkcZyR0YoKwbnzIci2cnRn7msl+fXsyGKIzd3PCigIQs+PoDihYKqZ
         OzHg==
X-Forwarded-Encrypted: i=1; AJvYcCVK6KYRdbmjiD2shlabqR3t31tPaOST0L5DInw+aaLrzt1UNQ0WTCpmF8ZzOrLWMT2az974nW7G94hmyHPAIPnq@lists.infradead.org
X-Gm-Message-State: AOJu0YzHdE6TnT00ioFWehra+tmUMHmjUJTo4qTPE0i/bsLd6gu5tj9R
	zIGX4xIiQlOoVvTmz1J157JmAIImFroEEh0r7djeg4uk4gjKU5QiKWHy
X-Gm-Gg: ASbGncvYKxd9ojfdvokZ1+LYIgEh7I2vFxobwpFc6XgM8DxSPgp3lydBksyawKhSeKv
	0F0FbTrdoOefZo0fA085SD+hUoPJHFLYA88pdCZuJrZP/tupTEUPlBuKc8/uk/CIFPK8741Ujc9
	8F8Mw3QpdvTTzZUCl4vrbj+QiCzLqIvbHQKMjc21EF+EZ/ok+F3ZDtUzneSbsjSJvQd/pADQrpK
	/3v9w5qIHo3soDWlafjzRCo5qY+Qzvc6NwhehmRHrwa84xO97Q2JVOZIIQpieuICCJA9sqLjC4V
	bQWgqPdqZALug7mYAZQL1ZoWfXQa2tJpF1Pr08hoXxKTS3W2EJtSS1kKogGw6HxEu1xqCe0+ryX
	Pj7IpUJbyP1eN1quAHp+/2e6e5p7nRyyOwF6U8VpzNzJq9nkG344gRNeDVbJPVzUY/LY2NrlNmj
	wbXGdeSMA6i9ksvsz76bXC646McflJX98vi0eITaBGZE+xj6u298yx3BtWOMdt1c+llve1u81bU
	TQV1nRq1ZVHmp04CsfGMj1DB2QNDvYSiHO+ynEAoqdiucZzgyUfbg==
X-Google-Smtp-Source: AGHT+IHSa7MdO+RyudQ13l7ZBDW5YjuDQoXfBKNGzygwW/8ijBbpH54bUrATc3DfIp5eGwuXkgv2HQ==
X-Received: by 2002:a17:902:fc44:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-290c9c89697mr387774495ad.12.1761351962920;
        Fri, 24 Oct 2025 17:26:02 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:26:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:40 +1000
Subject: [PATCH v4 09/11] mfd: macsmc: Wire up Apple SMC input subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-9-374d5c9eba0e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM4d3hJqcNPewfPwlleiK7fkXZLhtVltl2i2UGbKY
 wMxq6iQjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFQ32DP8D1tQvEl5SoUQr3Tpeel9LQEufdveGjjeWpK55erOQgadQ4wMBy1+6wZ
 LhiSptYttjWV5voFZ8fr10xZCNt+PsEww+B/ACgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_172603_728218_01DBDA5B 
X-CRM114-Status: GOOD (  10.28  )
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

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 51dd667d3b5f..3b69eb6d032a 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.0


