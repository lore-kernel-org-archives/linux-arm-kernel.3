Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D153FC44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBHTVFHbPFwIbhPoWqS470Iobk9r2Zi67JYQlymcIdw=; b=BdJ+8GY5TidpdK0ZVD03Pv8e7G
	kZGU12XvQ6d9IY2xJBKkyhW3adk/hgcbljxjuUZ8m72gecmgj0X2KqqnDepstUgC34B88ztlK/9yC
	iKab6qCsAFe0YLZhCWbCRFICoc6N5IectNzDSA8sD/wmKS3Oik6tPhWtruhjwG1HBuhoFENNcFFLh
	DXO0R7UezhdKJM+ha+bwGq1S2MCUE7A7ukacWg/G6jlXXRfJWwgojT/grkRV5vsmceJzElbnakBvC
	KhONwOCf1Y/cbUqoWLVAWYuI01QatLrm59mRVq5Hi1o7o8i9vN3of3f7usvrCZFf5ncvmveIv/zo8
	IYAp53Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR49-000000050XZ-3ZAp;
	Sun, 19 Jul 2026 12:56:21 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR46-000000050W3-0vfG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 12:56:19 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso6233416a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 05:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784465777; x=1785070577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBHTVFHbPFwIbhPoWqS470Iobk9r2Zi67JYQlymcIdw=;
        b=GQ3guVekIpfVX8GlWpI+Rn9cbuO92Zsiac4FXtGr0zyFQOtk1xeLxXhuTve/FRKvGL
         /Dx65lwNUDiei3gJDNi2mTqeVLm/rdN5WAMOVaGzxsL7vj51E/wBgL3LiLkJhebmq4iX
         UFijLOJNV51V4o6QzuzN0NgUHZAXxQcZWSbBOx341E/ZP25cvUnQW2BrYEzJUJTDdtKP
         pK6U6qtf1B7Lf+/CnRrnI7PZ8sehil1ilMG1oMyUOZKrc1R5D2TPuBi8mutoEM9a4CU5
         n51MMYg6J7lAHU43Jb3EnkuRAEHcbFmbvDrOkTLadP2xjsb262OBhdOh9EhcWxrejmtN
         /vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465777; x=1785070577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBHTVFHbPFwIbhPoWqS470Iobk9r2Zi67JYQlymcIdw=;
        b=bkrtjfmX7phV45axgBw1ClhMpJe0OUWxY/E0LmJF4CD2r6lFu0kvvQhfMk96EEWZp2
         EJqFE+Xqu2S9ujONf2+eiEY+DI7lH9kLvUGng7gdeuxBG/qDFdF1s9K/F1hMw2tAQ1Sg
         lrYJjSnIE9oArNF694J3fJhtArFYe7bqT4NRNDzbZlaYlvawC2x5LsshIhNjfdeKh4bQ
         TGLTYicEg+oTXyVpzfI6L+euCs4SeFJg5W00xSsXph/0Zy+3BxsC0eNyiwUPkw7QV7FF
         smU5TvIF+L5nnc1MZ8zoSE3yVJbBg8u8ajiXwDlNjEfv8rbU+2qQXP/JlxxwWXydfgj2
         MVRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNtKE5GHgpunbDVTDE0bdnWbN7vHgRNHZWOtfNyu7KOcHngClRJBVtIEEKG8bzn3LToIKfPYjx2qM6SQ/aXgSK@lists.infradead.org
X-Gm-Message-State: AOJu0YzZfLSiJoUcwlmjhoc/hl1UkOWY+VtOvzkRJEhH/a416Gy37+i2
	hM5BqHyC1/nRX58BOkXy/ZIx5KdO4Inr8mx/MkMr4qIGU4+3S5MDDHp2
X-Gm-Gg: AfdE7cnrz3ZI0V7qqn10YFcPGDww09w/hvZ52smC+xcDYMhRdYj6fGnVqVJuXb2/wbY
	IvEVvbV/zruBrmJ8AjuoUz3bmCwW3i3NhFzDjhpnBGlyKOvkmnodmMNYDme3jFxOONULuGKNvDC
	uhU8nSlMWqD57nEvTy6dA75Lji3QuR/Fz8SgoWEgR/HzdZao7E2wGHdHLhhg4Nb048SIHQNsNw+
	ISo0CBY80GwFaEbVlMpW8sYLWhUjmyZw3QDA6u6dKQciojKhiW5aFIZf+UtLSFUs4HvGKya77iQ
	mRI3nSXbkG9lmwmXuHZxrkS3GOgBj2ckRw0mubOYIy9n2HyxI2H0ZVuJT41FC9AuLuaxfd8adI+
	nchSiYMloaaEel82K6caAUvntaS/9Nx63pQMEJ4zFUcaDyRIa/bhIof33hs6WfrJRK6+pMCZo1+
	9btSk=
X-Received: by 2002:a17:90b:5547:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-38e4b441269mr10885100a91.10.1784465777270;
        Sun, 19 Jul 2026 05:56:17 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:edd:423c:25d9:f95a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm20990052c88.9.2026.07.19.05.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:56:16 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 19 Jul 2026 18:25:46 +0530
Subject: [PATCH 1/3] usb: chipidea: Use %pe to print error pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-usb-ptr_err_patchset-v1-1-85f7f2e4fefb@gmail.com>
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
In-Reply-To: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Duncan Sands <duncan.sands@free.fr>, 
 Chas Williams <3chas3@gmail.com>, Minas Harutyunyan <hminas@synopsys.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784465765; l=3053;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=n1zAO1jW4yVvRL07k2kgrVmGbmcyj6ikcTfAZVsVbnQ=;
 b=/EAz0qSfa1ZrMbHJH8QpbLX7wPvSeQecXMcU4Gf/i/q6LbRiAJ+x12SC7uRmvXyky0/DKO7rt
 pqai+Ji7fWLBLYYsUDJPeM5oyFKLNgt4Z1de4LkHeqmHlYvJzx6AW9s
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_055618_282613_4B00BDA8 
X-CRM114-Status: GOOD (  14.85  )
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

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in imx_get_clks(), ci_hdrc_imx_probe(), and
ci_get_platdata(). This prints symbolic error names (e.g. -ENOMEM)
instead of errno numbers (e.g. -12), making error logs more readable.

This patch fixes coccinelle reported warnings:
./chipidea/ci_hdrc_imx.c:452:5-12: WARNING: Consider using %pe to print PTR_ERR()
./chipidea/ci_hdrc_imx.c:468:5-12: WARNING: Consider using %pe to print PTR_ERR()
./chipidea/ci_hdrc_imx.c:222:4-11: WARNING: Consider using %pe to print PTR_ERR()
./chipidea/ci_hdrc_imx.c:222:24-31: WARNING: Consider using %pe to print PTR_ERR()
./chipidea/core.c:684:4-11: WARNING: Consider using %pe to print PTR_ERR()

Compile-tested only.

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 12 ++++++------
 drivers/usb/chipidea/core.c        |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..7bfe37ed68ae 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -218,8 +218,8 @@ static int imx_get_clks(struct device *dev)
 		if (IS_ERR(data->clk)) {
 			ret = PTR_ERR(data->clk);
 			dev_err(dev,
-				"Failed to get clks, err=%ld,%ld\n",
-				PTR_ERR(data->clk), PTR_ERR(data->clk_ipg));
+				"Failed to get clks, err=%pe,%pe\n",
+				data->clk, data->clk_ipg);
 			return ret;
 		}
 		/* Get wakeup clock. Not all of the platforms need to
@@ -448,8 +448,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		pinctrl_hsic_idle = pinctrl_lookup_state(data->pinctrl, "idle");
 		if (IS_ERR(pinctrl_hsic_idle)) {
 			dev_err(dev,
-				"pinctrl_hsic_idle lookup failed, err=%ld\n",
-					PTR_ERR(pinctrl_hsic_idle));
+				"pinctrl_hsic_idle lookup failed, err=%pe\n",
+					pinctrl_hsic_idle);
 			ret = PTR_ERR(pinctrl_hsic_idle);
 			goto err_put;
 		}
@@ -464,8 +464,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 								"active");
 		if (IS_ERR(data->pinctrl_hsic_active)) {
 			dev_err(dev,
-				"pinctrl_hsic_active lookup failed, err=%ld\n",
-					PTR_ERR(data->pinctrl_hsic_active));
+				"pinctrl_hsic_active lookup failed, err=%pe\n",
+					data->pinctrl_hsic_active);
 			ret = PTR_ERR(data->pinctrl_hsic_active);
 			goto err_put;
 		}
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 07563be0013f..09db8a4eace2 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -680,8 +680,8 @@ static int ci_get_platdata(struct device *dev,
 			/* no vbus regulator is needed */
 			platdata->reg_vbus = NULL;
 		} else if (IS_ERR(platdata->reg_vbus)) {
-			dev_err(dev, "Getting regulator error: %ld\n",
-				PTR_ERR(platdata->reg_vbus));
+			dev_err(dev, "Getting regulator error: %pe\n",
+				platdata->reg_vbus);
 			return PTR_ERR(platdata->reg_vbus);
 		}
 		/* Get TPL support */

-- 
2.43.0


