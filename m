Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D93BC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQhO5CK7xr+BRbw716ywq43T0E2MyjcZyeM9R805cuU=; b=dbyOSjCCE8852y0XszlTFUEpcK
	CmdH+9RKafQCrmcI7xioNjdZa1q9C7h597V2mLDJzpIiDWDyTKKTykHqzf8xPxwbNM3gotugWQQua
	6kmXEreY9XiCXPEoYHKfWBvkB4YAfxfAjGUt6J5zzGStclq7K382ZjyOIHon7ny5ZlspHAKEjnfRM
	UtQr4PYtwM2ptwldCGCzgj+31Eja/WrSXp8Jbka3xEBsYYOpstMKvqrxAIICNJh52H2FZfDQpxDxi
	jdm2R7brhci7rEPbv8OuyRdWTf6wt03ckl6UlrtMGCo7ZKtsZ9rNakdGVCWyJIU+oAzSgb30gVNel
	mtkC7ozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaTA-00000005O5A-2VC0;
	Tue, 01 Jul 2025 12:52:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZUi-00000004vGh-2JoL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:49:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4530921461aso36496535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370587; x=1751975387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQhO5CK7xr+BRbw716ywq43T0E2MyjcZyeM9R805cuU=;
        b=seD0vP8JdgN3ACy3NghbRsqZhjP2ksRO4NJcNBScLwsNrTa2LC439kI8NhyhOEE9+x
         4UDI1UmxXC9ZKK4fO16RiR+63iNrQhcVNizJAYTPW63f7a7vLcHUka3GPcu6wssqeKyF
         1F6uyCFuz/N5XVEKiQ2JRLUs1wbRnio65oxT95Qckwr9DdRsZ8b1NkBxqrYNnDkdGDXm
         3ktMW48eXRXzdfvPK43qxMHhMQ5x+paJn6kDaVe4fSkErPvu77INEYkWiYflZQgoTINa
         4b9wZLcm8Vw2MAS0CwOM6JELWL1uwUy5n6+5gyzVXmU0AUSU88EaZ3H/8D0KfEfTfGU/
         7lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370587; x=1751975387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQhO5CK7xr+BRbw716ywq43T0E2MyjcZyeM9R805cuU=;
        b=hczTEyFSx4syms3DwMcuRdCjyLq0+T2bxrTkJlcon79Me9a/T0mp0FQ08L0MD/Wu/V
         c+VYQLqhXk3YCy4qLCcv9soiz99sGgec+IIfG1yqxGb4vyp457Wu54p2Jrv5Y8TqekQL
         K59lXB0tIlyLvJFoLOTIccdJ62KDk2foP+WsFdfcFunXizRi2LFdvod2oP9nbmaOiaOv
         Tj6UD09wz+4RJqa1gMU52hf+Bfs3quJ2z6rWHaVSvuGa5PhpEkhS8F8aqHVZw8xupQgm
         AwuxHCBAhMXY0YwIuBr4wjAVLJuhj/KyGjYfsJu0fcJzTZO0t3zIw4vjbvLlzODGj4n/
         V3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDw2ImV0k9HY4xBk5pFfTxcUYS3LHLLZVsm9fJl7HqHpHpTWQGL37tI98FiEg6L4UxMPa2I86ceK5YrPETkS0E@lists.infradead.org
X-Gm-Message-State: AOJu0YywsX+0OrCpNLG1LxFbXda7K9Z4nXzCwTAgkakJeB/WdMDJq8lZ
	qx4YUGR7Ho8zASWU5FvwxoVYW8RzDFDYs8e+lj91Rnkr48SRnFCozFDlA6NwMxzu9Vo=
X-Gm-Gg: ASbGncsQeZ/lR/53zQDHsJ5RtJPy87X82kcxYibsSbxJFOEbeDqSOD6v41WTgZjnEdC
	HCnsPD2W7rWzBVDWNCciOMqKvknrCdXFe0D72T7hsL5Nu91YPhxM63tchb3oWO11Lqgng2NKlRl
	3iRf607MPrn00N1BLZuvxLquIJki2uS8sJBunz2nx/F7t1VqwhvFWjR337TCt39/IfcUThuyU7X
	NBZp17L/WsQx2bKNxkE+t2UNSK8+SJN/7qY2MQqce85QVSgu8zlwi8D7HjNp2zOuX3GQx6lXCQ1
	c68al1NJZqnbvx/vTMyTIgwdHRQxk4j1VDe2xpiw036PiGKhzN7aQQ==
X-Google-Smtp-Source: AGHT+IF5Sg0B8tl+fCojf4YIFaidiXIPVi9KuYAYLaIRKEo99mAjGGdG9ilSXjaOXUtGQt6ATnpQAg==
X-Received: by 2002:a05:600c:c4ac:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-4538ee85615mr149734825e9.22.1751370586972;
        Tue, 01 Jul 2025 04:49:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:35 +0200
Subject: [PATCH RFT v2 1/6] gpio: mmio: drop the big-endian platform device
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-1-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=793;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EQNCHQeiRFrJidx0AqHxdmYPY25oaY45CVK9LNBnNoo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tW4Xfv3MA0u8w4cDlEXM5V9JxRuYxPfOjsy
 yLM5bXKzu+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVgAKCRARpy6gFHHX
 ctvmEAC99TfqwF/82KeqILREi97Bf5pbCXyaAEUEuay+H27Gu852eYClS5j5nY4cOxII3JXlMiR
 5osHJY4CqYj+4f4xJ4/xeWVlxtqzVO4F3mNIwOA2zE/z/dhWhmlX5MIxUuxXdU6yY2ueLhlIDLq
 R3EDniSnD82XNsSesTrDmou7rOJgvn2AMCozSZPybgMvlc9fO1ZJ+9RNSKo8YN0sgru2Qk3qJCY
 QhE6Jlkr1z20e6yB4KwKoUwAq/ACWytH9o147f7iHZBurMkuXT6C44n1EEUJycUYEO6AxfYB9vz
 R+ed6SNGGOQpPw1vECX04T7HjxlwsVmWGrRHkM6kf+Z+llfzbnNhT3fSEErJjxNuzjRF4dfbFGT
 zpBQ3K2ijN8t44h93x4LYnxZpL7Mccj2HzYJUzfF76bVweV7Dziy3vTBTBdJ1ja60Ih0IeEDtQw
 E0//k175j2e4FnlrWemRr6HOcypAyh/mlldxn1YxS1D1xgDtVNRhCU0/zeLq86SlHJ05Xqt8+8/
 Jed2xmlucx1cpfua2QMuI9iYpNaib5jWx64F1QSZLeksCrl4V1mZ+Fsf7ENy8qR0l3ly0TAZeGH
 EfCcHNhMYBKD2h6aWd01IUbqRn0dCE+AbOrB9A63Kro32BDbhCLZGMXu/yJf6qmksS43kv7eGaR
 /2rqW24aN5W8lWA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044948_596882_B2259F2C 
X-CRM114-Status: GOOD (  12.67  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more users of the "basic-mmio-gpio-be" platform device ID
in the kernel. We can safely drop it.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 08466e123818e958755fe6e7baf5a4e8b8d863c1..ffe6b6f6cc9b1e9341e1c42cf8fee917e0147bf3 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -831,9 +831,6 @@ static const struct platform_device_id bgpio_id_table[] = {
 	{
 		.name		= "basic-mmio-gpio",
 		.driver_data	= 0,
-	}, {
-		.name		= "basic-mmio-gpio-be",
-		.driver_data	= BGPIOF_BIG_ENDIAN,
 	},
 	{ }
 };

-- 
2.48.1


