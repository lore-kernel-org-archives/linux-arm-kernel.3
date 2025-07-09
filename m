Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EA6C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E976DkzNR+BwTdvOcAZRGj+DsyDJt9zF9/zM1CbhNIs=; b=nqwLEZp4kMniMB9ZncKFVuyIeM
	bNuNv2paIzpIfZxTuZl9BVg7xZZ7i1XTWn9iiIGOdxMen6qzJe3L+bJasbqfvau+3uOtEubVv4Usg
	0CH5EQQ0keJj5VrqErxZqzjaCJni7gvTYvpL8mGLNGOGmrqGm1R1FpSA4WM/xDL1+AwG6hhIpNH8c
	EB4hQNrERuMP7y5Lr50d0mUFADOIORAPG7VFHbEGV9u0hmd5GN2g0hwFz/HSzOom391RnjXPrTkcm
	lxTg773QcMzHIYVU0INmfroDbDikL1sl5iCHLYR99LX7Re7+rtNdYMMULmR9y9Hvy/jx8mkYrwvf5
	C6f0MpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPMc-00000007pdV-3vZr;
	Wed, 09 Jul 2025 07:37:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVr-00000007hF5-0Y3Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so31068265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043357; x=1752648157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E976DkzNR+BwTdvOcAZRGj+DsyDJt9zF9/zM1CbhNIs=;
        b=XDag0f73yrkU/VHZFFLH1rFcLM+5KOiDML2rJcdunUJLTRtb/Po80SwltKTHZP/Gqh
         dagg6GdH7URr10HKHlQ6+PW0log/H4s02DqtlTPNPLbFE1E50tILw9k2rRjSqUb4cFtP
         C2PMPD64tIeCStvT4GyKqJHeFdfepxH4wEtjN7Rk0pCvLf1OcRSRXtt5aHQWlfs0yVjm
         0K+ghBAsubY1N3Mi+Qj8NODMHOquvxAj/d43JvfsKlTF3ifI27ymfrcKBivpW1h2Rl01
         jZWHZSMTq5a6Hssq5rgKDx3GZ0qYtQMbXypxlCcKNhxAx7pVE4+JA2r58fl0oL1FbgAs
         TYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043357; x=1752648157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E976DkzNR+BwTdvOcAZRGj+DsyDJt9zF9/zM1CbhNIs=;
        b=BgrFXuVisbejNUIV54aKwbebHsoxsZdrQWBzhVYrbbhH9DXN/BUgsil6NBWbr+FlkZ
         i7XJwMJDMkEcMpRqwtRbFRO1723YO6ClU8CHSZzwB1V5g8gAZseL4tDR7kNtwFjT/0Oo
         OPFIxKcTv5ezAb76WVqg98dlGA3IZU84PPbGGsmYK8qG8PnuT6EmlW614jjTOdQZGidC
         7P6eM/X95Kh1426UjT+v1k863bs9QnDu+X0mM+CSQWKstN7Z3waaEa7ZwUAXFUkIyXWI
         0n43NVtiQ4TkzDbh87Ou3nMyOsGgwhbScZ+OtyVOt9ZsUjvHxNAGsOJesxzXj7NdybZi
         iWpw==
X-Forwarded-Encrypted: i=1; AJvYcCWCHKcH9KpHNbWBFHI7VRpY3GyJTevDgGbv7e/5G0V9DG8ehN4qwoDVkWHtPKfE9s29qtZb0rbXO1YSm7fKK+qJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz50ecXSIU3z677TC2nGbEWmtespZFSoUPaqdP/pH0TXrfyCjbi
	KzBcf+pY/fBVQ6Wzclky/nu638udaV4dbytxphLn1Z92Nt6eINMESYlg5buQHWqkK5w=
X-Gm-Gg: ASbGnctgiaouxUvefa7jVASeRNp4AR2c6vlOk8a/Oz2Jb7tDxEmPrCwBA9n876jqdgt
	IMTcImlktUu6eqLglWBPl/bAiJUX1dHKn9KYh7wJ7LXl89iuIbZtoZOvp5MW+9hZENE3PhaEOpA
	D1d0uYsrg9tYGGxZZ1oIlb82Xs4rvjM3+W/1pBso297sTSnS4rMTngCWWKZvoOINBVl/mkW5Vew
	pz2F8nJ9ruqhqZ8xIJEumoMbsdbzLp5PF+GBV/eYmiYoDefSUS2N3X6R3IJbt8cL4EBnx7dbx5P
	tMK90TklTBClA8gnC9quwscGPjXJlWyWEnHEsTW53rvGRd2Brz3vnPYC
X-Google-Smtp-Source: AGHT+IHi+3seAQJhUSG/U1FgiNxSTYdYEu1xk8bl6taZbECqdEFlu6Pv4ri3aXmTuPAo4Albaf6BVQ==
X-Received: by 2002:a05:600c:19d1:b0:444:c28f:e81a with SMTP id 5b1f17b1804b1-454d53e67c7mr9606365e9.27.1752043357343;
        Tue, 08 Jul 2025 23:42:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:56 +0200
Subject: [PATCH 19/19] gpio: zynqmp-modepin: set line value in
 .direction_output()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-19-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=854;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=IhD/N+4+Xg2O9hP4AtgHBCqqrPPHCOSCnlXwGhv+djk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9FUTxKP1TIjkWKQ/foJIGz60zeLZU+t+Fj1
 eYCIokKJ4WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PRQAKCRARpy6gFHHX
 cm2mEACt3VB84bPMSnM2RT0+6t2zvIhWob2gSpxWZnVZkXwegG0Xrt1uxZUq6u2uWKteI+QUILE
 PAGSWxD69oqxqWW7wsxvLavRZ5o4sskoD4fViABUqOqIq9K3XMK+/hJsEGcgbSI9v+YJo3dnXG8
 MYwfcQfboOgt73NEw6ou7UcAIN7cDUeGV38FzQuAIen2aryODpFil0IUF5syaurHY76mU1JvF41
 Wejs6/wXZJArjCsRppF/FGVKJm0EU4uBc7+haxh0ya9y5DyjF/MKKApjaEtiqBouTdsstPPPqFb
 +Nz6fIji5cEX9Bfvlt9TZ+GeIOc0aOvAIUysV4gVs+8G6Sp6mOm5m5Vzp59rdRl0m8R804kN7pg
 x7Rk4QXy3me49f9Ompx4JkI+8uJdDTph7aiy7i+/0CRAi+5Qgod/BP0Hl5o0PFbz/BBRJghIoLR
 JIH6t6WSHidwdPgTR6UkC9fjMi5IRVc6CYPpkpMdQ0k750dI3J7tkqfcaGQzmmLYrZgWJspnGy5
 yDR7dpXBLw2KfD+JeaVsOQXwCNlXsO/0FUW7Kv+1hQ9uoL1vU1LpRTaLdhoFD2rxRNsMw/dCya5
 YIihq1N/TQk3vSMpkZ2reNa8qq1UzxZD6VucjyLr6Ei9VeS9GQfa8gzwc39GvrrRBMe4lgWv5PC
 ycqiuAuPwx81i1g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234239_171848_3779842D 
X-CRM114-Status: GOOD (  12.92  )
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

It's ok to not do anything specific when setting direction but the
callback should still respect the line value the user requests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-zynqmp-modepin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-zynqmp-modepin.c b/drivers/gpio/gpio-zynqmp-modepin.c
index 36a547d6fc5a5c100f81c72600e14d620a462cc5..6dc5d7acb89c544d8dd9e217c96e41cc5599d116 100644
--- a/drivers/gpio/gpio-zynqmp-modepin.c
+++ b/drivers/gpio/gpio-zynqmp-modepin.c
@@ -104,7 +104,7 @@ static int modepin_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
 static int modepin_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,
 				int state)
 {
-	return 0;
+	return modepin_gpio_set_value(chip, pin, state);
 }
 
 /**

-- 
2.48.1


