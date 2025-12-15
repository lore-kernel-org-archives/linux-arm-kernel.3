Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6946D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=; b=avM0EzucaYmOvoiETdzlkvwKGa
	ZCois1DwO8no3f6P+5bQDreih06ZzPtNozGLmvEgGU9tNR+U5C5bghRTajRLMZS0pzUHPQwAC5a8i
	5yNe8dsKcJ1zH9LIL7J96X3IAStcc2IHZInIii7z5lNCN7ixohXHU//K0sKLzbmYym9FH9kGFIsEM
	wwsaLuZbrLWAnln/4xl0dglsLsDGpSmzmB9wObmXAZfc2diuF0YrQecqrzo4E/e62fnq8v9Sa4KY8
	y71NrNFahgaC404PsEm/wWVQOw9KdGGyEgCb5PYq/EEQIQC53cIwjuH8/WE5x6rlfM6ctkca2Fyhp
	3GMDm54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52h-00000003Nix-1thW;
	Mon, 15 Dec 2025 09:38:59 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52e-00000003Ngs-2dsY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:38:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a09757004cso19544805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791536; x=1766396336; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=SWjkqFBU40znTGsQ5h5fejmVfz2/D5M38fNk5Cem3Kd7jeh3iwJLWbgj5isaykQE16
         r1akRCtCVGOMV0wPErxgQNXrRsYO0MjGTGkEwYalZ5qrYhp6xglUxdKy1Mi9LtL/DYCQ
         DmS56GT8ieFhjzlpKhHH++SJ+NH+qZtlYWdt/HvdvNxml3U6mh0mCiLjFbyKrM7ezfzT
         VvMfSYGNpxduvcCMEmEzuae8hAabY5hnw8PJwf4jnONEp4CVCfkl4HrWsv2dpiET3guZ
         juvr3as1VRNxKLtJAfMclj7A3Nd7N2DDrt9Z/Bpo/jOwVRqn4ABnYQwA30WWIJRzaiAk
         MKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791536; x=1766396336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=TGQ8VUeO5oPaqZQNfxWfg1YQ1kpW5MkUkxtrrku335LpI8vrd4R1DUxfg8Jj7cnX1Y
         dvtbVR7nDooixuHkQubQmesIo8jVtNeWXC3+i4IX1lR6UVqhQ4pVYLJmJ35aQAdOYf9h
         rqCdksdQbph6mARHgg1seafuz5U5YzviBpG3utdepzlB5TnZ4jt3sWHAg8I0Pql2zlGs
         e4TOnf0iwEoSLWEKxse4vB2xr6PMfYBV07EgDd4h69Jk+DE3xjXI0/fzdYq2UUx4SevR
         +bR0Vqv2R07HVKYjItB9014GMGncSkUWzA/a4SDw+X5K8Z7SCQyoeJsMwgARKHn1U/gJ
         McVw==
X-Forwarded-Encrypted: i=1; AJvYcCXzYaJhbrKP08Q6AhDd7Jadfrp10JBj9avrEsWo9MQmSOqXkO1RAYeRUKZMkB3Q9qvR6mB/Aem5CsTzBHN4dHlb@lists.infradead.org
X-Gm-Message-State: AOJu0YzMoOZ9qI5ynEYkO1EJihby5BgnVh6M9dRGKtL/e3Dd5crdKcgO
	3UQaA2qKq/LVkbJ06Z7ouZCli0YJ4e+n+IDgE/+i3K5NNvbfUKVnsTCf
X-Gm-Gg: AY/fxX4vleRcpEOSeuxdhInvnmFeLbld0wETwnJ9uznBVYU1//IXFToyrph4SlUHQKA
	zL70eBkOEfNIAgmfETcvXattk3HJUoVMk1SpAhH7VzM3zxIEZwAnEsk78p7r3ipDMA98XC+xVui
	1xGAvrGxGAcplxeoOjfZIDc90q4jOIs4SaAWwBlBKELORfIfrZ/H4zDAWHFwjpZUfmhIazOA6Ix
	FQsu221eYG0zA53EzMFeS062duwgaovNSv4CYdpmI2CYsR3y6OrECZvHHkyzRCozSiJmwxJmOwa
	XxrmwKSGIdkHSZS6Lb0O/cOJrHq08J0TM6aomnRfllV/Vx0yhLJ93uVKIMOdqSfjrUjj0RdV9e3
	o56M9E1+1GP0BmimzCOh/ArH7pHhIEhFojGUPsRs14SVkpJzrnwuwe4+FCWfyfrgUVkifvEwvtT
	4xbesnoh7Jx1NDj5yYiZCCzHNERA1vyZqTnsdw5Xc53GTc8qnObFz6GIUbWkFAkKyqvqjJxS7P3
	WbIHR9J30SeXkwNcN/uFqWtzZZrYXBlL3fKrrB0rfedjpmg5d2vhsZXzftnUsI8pMUiYud8O3aw
	bw7sIXaUyc1ul+2d7QXKaIq3wQdZmfLwbFwLY0fqpRqraptj+dA=
X-Google-Smtp-Source: AGHT+IE7R5Rq59mcZglu2dMbSmwzQA0DuoEDw9ET7Cf1MleDlYYipJlEUwm/OuRe6KJQVxXlQvBRNA==
X-Received: by 2002:a17:902:f70e:b0:2a0:97be:61a9 with SMTP id d9443c01a7336-2a097be6574mr64303105ad.35.1765791535968;
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:49 +1000
Subject: [PATCH v6 5/7] mfd: macsmc: Wire up Apple SMC input subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-5-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215ktRXclLcr81bZJ/cztR0mm1/JFf93fenKz6+6l8
 py6fnM3dExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKY6uJGR4amuWV/mXtO6mp0XihoUH5fHRSRaVhe2f+TVfXRAQXC6GyNDh446+7P
 CrSess8xtlknsz/4hc33JghmFvFFfQ2ffZbvLDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_013856_679251_61A3C68A 
X-CRM114-Status: GOOD (  10.69  )
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
index fa7b822d55bd..85410f357603 100644
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
2.52.0


