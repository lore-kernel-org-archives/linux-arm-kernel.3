Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77DFCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMg0B2M6mlNno5KCjV7xdRrPsgdx1eaJiYPjLRnt1dA=; b=BldzcnFJNx+HJiesW6o1uK0BAL
	5rQ9VxjjiHY2GyiDVGwND0zOLPNGJintGqM4JTp4RIy5QqxUEkhOcE4Gz4s7FQw30xTnHo5FKXASl
	IlhH1LFlSJHGrRKtiu3g/yDr5pWyS5Giv/RvSC6MUidztLQlXZ0DZPXXSR+jPMWyF/rZmlyZkqaZ7
	m1y6DJKWkg/kmLP086FThjnmrRSVAP2VLMMYOoKqPRrLDJrayc6j/ys8GRWqi+IE/6iyql4OAOW5J
	Eg54E1gexd/M9Qa3TLh88aqEKSySNrq95LwUWw6zhECL51lwVjngvlPo194mvTgXpDwOrdc/D8bGg
	FwEW2Dsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8sC-00000008fd1-1k8l;
	Wed, 12 Nov 2025 11:18:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8s7-00000008fYm-0AZu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:18:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2956d816c10so7549705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946322; x=1763551122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMg0B2M6mlNno5KCjV7xdRrPsgdx1eaJiYPjLRnt1dA=;
        b=C61y0UqiAGdEV31+OcjKHbxF91vNF0DNsDgvV8F8hfjN5XKfGj+gc0TgP7na9wyXY1
         j8EvKOabU4KcBWMxjN5MEogn2XZwZfJYF1IaMl+F8orulaQt2uArJ9KeTrOtECy1Lwzj
         Ww6cuYSeCLApbidd8DUxuqHxi4/2o4pQfxE/a7mWIgcbM3rkys6pywQ6+kJtQe2xUYlV
         D92XV7k4u0WNWd+Wp+LuOXpLIzBWOXCMvsspvQUdgH0NsJz8iLPjBOIvLRoySpgCIQPW
         KiJcYY9ijNuzICzau/gYf81LxZ5PZEiFtAnUK1B1NogK/QVONNMlV28EtbztyXChmqRR
         BD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946322; x=1763551122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RMg0B2M6mlNno5KCjV7xdRrPsgdx1eaJiYPjLRnt1dA=;
        b=Ly3cia210hwLdt0rIeMen+icl+8O2Sr3h5smMpK2iOL3d3qY8feJxJ1RJ9zgbKgyV4
         dAl3cryHkA8ng6QUF3JSLwrclT8EFDDFZbkJ2gtKf+PGv8TkwEraPtZrSyAK3+KCV7Md
         ajDug0Uz8ebbJBXa63kYAusqVq0BDt/ilNRuT0X38bvOAwWGtLrRP0cwdv2E3e7anfIU
         V/mD7OGoEku0WyqHpePRP74cYQ3LVeMJQJn3ZoLRblAdqzcxHz/USkyaa0HOXX98yHSB
         UDQT0u/fCAbiaDHxZVqaXjd3kama8h/IlWVqz0QvaSiEneVkFTBctlcmHERfidYElyKV
         9nfg==
X-Forwarded-Encrypted: i=1; AJvYcCVMg6IBUcDC5sy/yTgSm0PUmJl6YeQNfUGRyCATemInDD0IBBrw8pTq4NXsGj7zS/BD4H3+iWGIVv8PyJBnOe4w@lists.infradead.org
X-Gm-Message-State: AOJu0YxGShGEtFxVOzzNb6+HWRN5LgY/CK1TUpzjGqeoKyyg9bgWU74w
	hjTNlKJTdizcU/wPCcs/s7HV9WjqQfaGgTvS9qAJblawR104MjLypAXl
X-Gm-Gg: ASbGnctHvm/Ihtrf9tEpPw0qqQXisqMgzwEI8CHozwFNOt96GFbZhXEEzgNXEEXjJWA
	nd3HNff1YVVesXGhh9mAOxhMdb969DIzAW8aBU0UYOrZJvl/x15TyxjPnEbgZA3k2DfixNaljcw
	qUX211kIfjhOAMX3EH9T7BhCuDIrDMAcLDr1xhbEnPEdVzk/5ces2jWctIvlkrGgVgNV4UD5Zdg
	kDijwJ3tpnFCQwvBicZ4Huf6ZSs+Lpm3uYpSXa06gw2y1y/cri96+a5deOXzDrM0boz0uz/PCtf
	ZBO5ATHIzjkt0Tne+ToBytM5XkoclffHxCSOEvRWov6X1k4gwpdLk8nBnc5WMNSLT2ducEQtrf1
	FCt4GP16OET3vTsjdmy5C9zqSgy7CHu9LQFjJ5zg0ihZdkNeqK1nDvspnn9tbMWagRld1WXRHa9
	4GYXAmnIvXW7CUZzvF941fGTb7Tot7UzftIQtU4mhj0+JyXN+5OTlernYOt/l/i1a4xHfG6E328
	bkxXxKlT5LWU74/q6DWn9yrY+ESCeFxwBg3z6O0RRuPHUxq1rx4v/k=
X-Google-Smtp-Source: AGHT+IHJszkUFQqYlR5AFfzTGIEAaKvG8RL+kwBBJVNc77ojPYvNHMx8YbFZwpTAtKabQYIgMU5Dvg==
X-Received: by 2002:a17:902:fc47:b0:295:24c3:8b49 with SMTP id d9443c01a7336-2984ee0ada1mr33966605ad.46.1762946322113;
        Wed, 12 Nov 2025 03:18:42 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:41 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:55 +1000
Subject: [PATCH v5 09/11] mfd: macsmc: Wire up Apple SMC input subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-9-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
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
 bh=Gjco+o33Ze1VtTmwY3+n9x0V+5Bjmx76JK+PO6sbBb8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUe9MqcoXO87L1RrfX5F5enpO+XeLfuuXJ0+02Ubs
 7Dj91SGjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFTPdGH472O74la/3mPRvl8BylqCRWoyR8UunDqpHsCo80ls1Q6em4wMm22qelk
 nzL8Uw5BRsPxd9cobzkyfXVcpMehOeLLkl9dURgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031843_104217_1CE470DF 
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
2.51.2


