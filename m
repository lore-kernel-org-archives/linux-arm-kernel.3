Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0828DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 00:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=; b=OQuQ7dzIDuj3Pajf2z0YJwpXDj
	nl8xaYg8vnGR7BBBumjHruTf2OdR2by6XineyrC3ZBvpVv2gbj6j6/HdkjTVmQgr4yqEOmLobJrxT
	ybv/RVsuEJnTiFYIkZTSROJYfbrZngyBZv0pVsnYt8683OCM8mllbUaCe9WsYLof21apwEkTYlXrh
	Z1M8nzp/m/hqS4/sXy1KHyCcpx2QwMvXG76wLqtGiAA45IScLHLMLKkXphpwzhRbXv/BbNwQgAO86
	myPjt5xWr9Bqki+TwK1+l0C14BlyU2/LMJxGWB/SIlpygle8FuorjfX+SgA89Qbshs3+KdMZhrhgc
	qnt8EfDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS65-0000000AihU-1a8r;
	Sat, 25 Oct 2025 00:25:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS61-0000000Aieg-2eVq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 00:25:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-290cd62acc3so31221005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351925; x=1761956725; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=PDtStdt6Qb1hqx+nk2WROSk+qXUl4rSno08SCoe/6s+pc+lPRUSfI45UvzuueSvTMf
         P3dDDkZE+HS9QbYOYaeNCkMTZP6bIKAeu2vvcSplkO/ArjE3uI54LeMnXwvcmSO4cvSJ
         tHF6HxmNRjVmvWNfFyhDHL7ZAENbcA0iQsi4TcdGBE1/+I+6YE8kIJJjdbBwIkQSU0aK
         rZcRTyy11FSjwEisThnCTfE+qE4DVkveIc0O57VsRYhPfnrzpz+IkeUj7vsYYZU4/8Tq
         MpwcRJFQqm0w57OpW3oQknDl/RkWaCazAomgT6/1J/+xtcb3R0jY7MV4yRLHcz7yIO4O
         ostw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351925; x=1761956725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=UgtMxxN2L4jTTbPSrrgKgS1BHfUKBvjv928MeOTp5Vr0Gx4NM6tApKWoVGj9XTf8Tr
         ddz5UiUSwyONQGZkFy5vecqoalPyE4Pph9O6M2HemAjaxizTaB2kkjP1vhu7O+AAzuM/
         7bDXngGky5JPHtkIye2ZVspJZQYvNO8Uz7JYyW15xVkvTFfbvkEvC7wuryOxrNa4c9wJ
         UETn+ovEpEz6qdISTFY3f7IzVePPwnj0SaUKIELgYr0nX64EtJ7vST0hJfAIc1t0R0Fa
         CKKc7OHcn7oPzzhoifhe7Z3HjJ1FlPWMsGPjJmb5oWmA6WCBBG5cjXLsXbIpWQOB50ti
         UtGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxJzE9fcH/8vvBllCStgrGSeWBft4xiv1llmoDzI3R7WH+GKYHz6KYeS1kLX6LJbkpkpo9lAFMi6il74GT3MGo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6avv98VS7CIHGtAxrtZH9s6zQxE0wGtRVekr8sqxz9YGDlvda
	wgzwQgWIyVFUL1MFz14zwuFrFrnpRpcJ2ZvDyNSwnd5Eb+06N0sP9Quc
X-Gm-Gg: ASbGncsLF7JKJIYyOPZ09qsU3S3ZOUVs21mK2fJys0LtHPk2/L9F/hgOYmGZssUpIxj
	QUspqb1byC/rCbnsNiEGxdL66/m/EIwRkZltV5B3Vew9M87qQxkcRDri0pxsTkXG0kR4iHuFb+y
	D5217IBGboC4T8bmwKV9Ms/ZGdRIAapZRFXJdJn0zIl43bmW6oB1K0ZG8GhdKSRhUvzphHWAyn6
	MBPWNMix3O/aWx//hrdGx7IXjNropIL+xsxxPIN0f6Bgc0Y8uooUkXznIcqmL+jng1kYbwt0AzF
	3wrNA51/4GjXpFaKppoizlyoMDL6c7y2lYEi7awJIUHFbQaZRLpQtgvrfoEX61RF4VuBgM6AxJs
	tuxu/0xqcQfTaeq18uRKr7C9z0uzQs5to+GVQVhQ68YMt8UGK1KVshRluzuzX6+UHqg+OTw3AOR
	j2f8vhZVF05bV9MIASRRva/TeTvRLh1JPtYUbsfm8gEesCAJChE8Btr2Rjjm43XLN8P6qca+T+v
	HIaVBzddCqkhqALJzsVmVT4WO9c6sI7tLFOOaRQkNz8t6yjdVWiLnZt8K3Lajnn
X-Google-Smtp-Source: AGHT+IEcAIrM5gDLd6A2M9OWpDkFvdgMAQWlJmHHcjPPAuvS+4wY77QHgPJLW5SNNNq/wEEOrEct6w==
X-Received: by 2002:a17:902:dad2:b0:286:d3c5:4d15 with SMTP id d9443c01a7336-2948ba3c6a1mr49230345ad.36.1761351924748;
        Fri, 24 Oct 2025 17:25:24 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:35 +1000
Subject: [PATCH v4 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-4-374d5c9eba0e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM66XLGLz/n50Chebub0Ao9Nf53uT3wfl11dXS33N
 9x2ymOzjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFSfMmdkeDBb4PWe+6s0vbok5oTvmR4jwlY+maPo+DIp1m2PikI7LzD8d963dV/
 l7GSLoMiFjx35q83EPmxqWT39yQmNyVyhhrPc2QA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_172525_716472_22BC1650 
X-CRM114-Status: GOOD (  10.44  )
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

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e6cdae221f1d..500395bb48da 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.0


