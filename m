Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB2ACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=; b=Ss6I6ukgkTK2M3pIztkGRrysYa
	vGGhYovPbvj6t0ecVBjnEW0kmssc78Wu4sjVEqsRfyHtyFSM/3hQsRxc50jfWLN7xtSuAGb5Zv7qA
	EIYgOsE+qepNnUbKjnK58LWXkHuZTi2Iv7jtktGNZmZzCfrUOSSrIMDMMLggJt0HgMP5rSHfjshE0
	RV8jgehGsmZO/CWDo7/Q382BQnrRamO6Xd4zj3gqixh0+yt8rYWH18Arrhkjwio/EFD4T+rdbgwmr
	h7nG8o8f+NBe0hjEHMC5UEpJhhADtwSjR/Ke+qLLdlObfRbOwiP2szRMVM58H4UK6pQ010QnyuQHL
	YMBDhVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65iA-00000001rsG-3qMj;
	Tue, 07 Oct 2025 11:18:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65i8-00000001rpf-0LhR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:18:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-26a0a694ea8so49024805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 04:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835907; x=1760440707; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=iHTHp88iJFU1HUO/n3Y31Oz7LYqUNH/FrOhFV1PmxQj1L+gTZeD6Gjsfs3gz1iCNzY
         hynEo8xqvcn5q+yl0qDOShi0t3ZRXpFyDVmgyeThnD9UkJZjB8KAqE6g2CyO5Py0izys
         s6VpMYvdG8CYDaByeQo/F6P+Caa/9nxgDHUn+HTlU6mIyGQ4N8MeB6kkA+WuyMKp5DOK
         0j3RY3olWO8Sgj3hjw957op/jfH9zno2M1c1Djo6QxjJRrKFGOMeVOgFloLJLMiXFeIJ
         leNdEt5QN4dA2Vw6cTQS8cP5/AbguhRR8otYh7ao04VX8oi3IbIZECsqcHImw42vfsCD
         +pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835907; x=1760440707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=nXMpTlPwqRu0bA3ZojAZm489tn0Po4tCxVWjefYJQ1beBVHT2dpTikktZghrPqF7RG
         aixGuysZcFD7RC+Oncl3DEWij1DhmCCybBBvOC19a2neliSlzQhf6Sus3KMarkQqR+I+
         YwL1dN/Df3c8i5NuG0zfH6VDyZ/Jd0cio58OFbgXiIMukD6RMZ7AW/oKzhCW9l1W1Mn5
         MFgAipGqq9obEstqAXg/1/EqrjmRsvtgcGkK45HiPMIX11oJ/ziJGjv/J3TioDsNMv3U
         /QSMcl8Wn09/5bHb8t7/BlubN2gumoDSIvdyLi4zBhRgflHMVkKbEHDKFnNrvRj/TmB+
         ljLA==
X-Forwarded-Encrypted: i=1; AJvYcCWObdFKH1SE0sxE6nACVu7gR6hkqZ79AkQDCBYenNwXSjI9U+CQOMGQU+iWvMD/VqyQkNXKfkPO+dqKXL2+DrZH@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZ0ucBKmdJ5pzDZgi9YLEEPrQAXaWAshgRMsYuSFO/uLpGISX
	+kdnp2Qt9+2ItjhZhj+3fElQRCfOy6O1ReTt1VL0rurWJi01778uVR0J
X-Gm-Gg: ASbGncuOJfO2yAFGii9uz8zjircSvZiixuhHcVCbwmtWne7QzrE3ib2CGt9oz25XDTJ
	PHaucQHduVl4+OKzYvqMR4or4LxFy4Jy6cepcfYJnBXD1fQ0YP5Fm2wvSUSF4ivilcE9o4GbcCl
	/gOoWofEx8O3Ez4Bd7h8a+io9Py+VyDC3+F/awDYGmTqLPebzonGoTO179auJJG9fnNZusndGHb
	+ESgbkdPdPBEXjTsC1jKBDafsh9waIffxxMT+88e3FplQD0Mz7gtzsmQJ1AuW2u+IP1cTdLMiFm
	ACl/RgLqG0cvMK4JFl6OuPW+VfaO9aqIkAg6Zi0xFWBgz3S9b+pPxZVmCXoGETn+FXG7DNLB50F
	WSqbWnjyB4B1Iud+QTc3BWv3J/yap4DoIcQQWsG+LgWssQPWu5ysJ2Ep35lNiq7ZzjrhGsfoHD4
	2LmiI1TugwcgdWzDOIKvpO83mNP6i1xu7D0rmm2n+ryg==
X-Google-Smtp-Source: AGHT+IHQowcxR6757+GlLYRBHRpFuOKwNlnMD9n4eoDO0fw6pZm/bFX4pWpzRYdC3fx/Hl4yuHMEZw==
X-Received: by 2002:a17:903:2411:b0:269:6e73:b90a with SMTP id d9443c01a7336-28e9a5f9e35mr217258715ad.15.1759835907147;
        Tue, 07 Oct 2025 04:18:27 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:26 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:50 +1000
Subject: [PATCH v3 09/13] mfd: macsmc: Wire up Apple SMC input subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-9-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3bdvpC9h7ukB/rRA8obS89f9hMtfzQ5LZlU/1yf
 m/m3NIwuaOUhUGMi0FWTJFlQ5OQx2wjtpv9IpV7YeawMoEMYeDiFICJlK5j+F/ecz513768gKhX
 oQt1SgQCP8Zw/Du3t4Dro0n/rujl184y/JU0nKG83EgjvuMO9/Z7PNYWE/aGVTK4N/ksY9ifXeX
 EygsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041828_128627_5EB9D792 
X-CRM114-Status: GOOD (  11.11  )
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


