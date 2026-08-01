Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8916C55175
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pHBa06CaOVH7j+70B2z/e3yTJBG/rMdeErbOIVU81A=; b=ZGk/xuMDvlIWSBSVTny+pYMywx
	1sB95i7OgL1otgG4bYslAqsshm4LVgVkQfG2Wv7PZ/Qe7im0oHvxMxUhqijLUzyERKV4Ww2P/xIry
	YnliFTntT0ea6wFgnsiouHNzkZR9FubKnag05Lj6Qc7xxWn2XBHg/GrVFW2weCNh+HGizAY5WT1Ls
	BX06o9b3K0auEVbWS98Ynt8CDq0dBM4U8fUKbYVhdBDiZFoxpOwLbX90l7PHQ0xXszV/gEYZ78AhD
	WwU4Ei/rwp17thoUES8c49/9greQd1tjdRRX9BXj4MkqHFB3cFxBNo0nxMU4Jh1pnR0LDMqSxzjup
	kDNCrM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq8qu-0000000EeGz-1Qwl;
	Sat, 01 Aug 2026 12:30:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq8qr-0000000EeGJ-312g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 12:30:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2d02b4c3601so21912335ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 05:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785587405; x=1786192205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pHBa06CaOVH7j+70B2z/e3yTJBG/rMdeErbOIVU81A=;
        b=dpZ3Gg1QIc85BatTdA9+XzsI/3e4mvKwwzhowJyiHid2Fj/s7xou5D5/pa5xeky7XM
         TpmcT99G00IMw0f4r/jJsifl67BeTtsa2NcqBii+2QWDfglZ1vtisQ11YfWkv9uR7bDj
         XZo2P3Lx0Q1Tvx1XGANLPXV1Q565srMyySkK2z6kon8jQhwnSk1b8BF+ghu9/9jH8sRC
         Lh0tY0KGLbF+L55DYTN0u/2OtiELe0Ube42ddMCO2iyVUCRgOXwZYJiU6UxU5ysOApFL
         xPzfn2wPUl4XdG7sqHoYp1YkFLeHaMi/PUiXC4JHb4lrbUvi0HvYQ+aJOL34Xe7qmInO
         Ov1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785587405; x=1786192205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pHBa06CaOVH7j+70B2z/e3yTJBG/rMdeErbOIVU81A=;
        b=Ky7Ddrh7xiV13hAiBbzXgRArSwQEAv9UUoNwaTMg9/G4qZW/qCee7d4KAvA2kV2bK7
         fvP/OaMsgxC1Xhjtc7FDShBEi7Rt2RA/Zr1pbWNIro2KOigMXxo1j+XFjgqeBeMCLaCa
         Pbl0cPhkXBrU44GDvkMlnrt6qujwmUK4qefH5+8F8mqf3Ld9pcA+TQSQSAhZo2/u8JQ6
         bVjbKO+ygmh3+ko5WHD3UKdV4ylQFNfawfjccXt2V1f3bgH5hYtDedyy22H/kbHms9GP
         LBdLq1Q4SXkaz5x13aZ1E1sJwKQxjcDGpmH0LLXY5rbpuOEOjjLGX9CQGNH/VPGxZlcH
         z70Q==
X-Forwarded-Encrypted: i=1; AHgh+RqgcTKMop5Sw2Ww6iA9vEqQD2reltb56/d4oUNucq/broHiml9Jv9/40Dw6FbHfW002SmI+xzmbCf+WPapJ+Nxe@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyh1IGnmEmmUh8FqlaXQksS/X0yOjqnLoxmN122D7ikOgmGmJF
	MEPfr8tluQwTNi4jw0QYXUGwf0hf8h9j+HqSDohZVEfXTSpiOC9zyDPB
X-Gm-Gg: AR+sD13VlYvYgEg8A6YrLnSeTYwSytMMEdzbzfkDOGDiuC/BTDwWp8++wPpDHmocsY/
	6cvUKhP+fZdYmORWmiCQqjU1Mmx01tPMlSR+0oxgzy4huspXZ5G39L4uinY+lQl+R1ZyGGNjUzj
	R4oUe5qS9aZNKkIGZMisfHguaXWsngCEQ3Dm7/mBIT+XwlA2bylcAac7WCO7Yu5ShePdNIxgP+6
	2GE8ZYsW0WSGKEzQrGhr73VcUHop/16MT2Yp7l1MlBToTgQYlLFGzcTMXHriw/0wTSTu4TeS+OS
	w+D224FlztvJc+wvWq+9UkvJV1fEw5Ck7zdBm+bWaoj9Er5wG12iu/H7wKK6U3gxpGTE4+52jX7
	wBsq3F9zzA24ehEcn5mb/crwLVuIw04Jay2kXUka8o6w1ZxlTv/d/Dq3luyQO5wWplQG230VrFN
	5hKjGhoFY4dkRBcH/6BiJIi7KIjDDslHX2+uingOTizOSvqGm8sMpzCvmwdDqIMH4=
X-Received: by 2002:a05:6a21:3086:b0:3c3:a1ed:3c23 with SMTP id adf61e73a8af0-3c92a53bfc2mr3432958637.23.1785587404863;
        Sat, 01 Aug 2026 05:30:04 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:9df5:1cd1:f108:c202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045022sm16174086eec.18.2026.08.01.05.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:30:04 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sat, 01 Aug 2026 17:59:50 +0530
Subject: [PATCH v2 1/3] usb: chipidea: Use %pe to print error pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-usb-ptr_err_patchset-v2-1-1698e298c1e3@gmail.com>
References: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
In-Reply-To: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785587393; l=2678;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=mFXIwz+ySAWkDRjmYY9h6zI5LpQ96dUOJf0gRTWHXyw=;
 b=jfKEnthypoEP4Ged3oIPzGHgkh8fKEboHHtGYp8GnOOl731ypclqaBCWEJk45aqjaYWxcPebl
 IdK8bprk/6pAX4FCm6k6twbF0DDejmsTDWYcJ4FJf/VMEEHKfJU05J6
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_053005_793488_8FBAC5CC 
X-CRM114-Status: GOOD (  15.00  )
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

Fix coccinelle reported warning:
WARNING: Consider using %pe to print PTR_ERR()

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


