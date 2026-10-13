Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F327CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 02:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYkXOkbNNXGaV0h+0g9qXlZ8g0hBf5btV0g9hsE1Sag=; b=OAHXdfFM/3VhAqJ8OpfwJGvK4e
	5EO9CksdiHV7roZUIu/vs21JRXUXLh1O8pL3Mp0U/Nqo6scjYkc5hbvauHklnT29CMNMXjOEO0Pz5
	Omaofn8xoC2xKhzZYdz7iRJHFIQ7kQCUrpA95zClug+7jXShqSOkMLh//EEkxvzA5fvXaZWu/dwX5
	POpWQyNJHGe1m11V0HFyhL+3vQ7vHREm7RuEP62ZA+j1Vl78b3X5y3mQT/XixEXnCapQYg1/jH0YD
	NrbcO4n36mWJCT2yvoddFxAJgSUXVDYVFv8LGCJm2efblUh+IhHRRVTXHpsbba3vFX+0WZpbnWHo2
	ROGTt9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSgJ-0000000BqVq-0bLU;
	Tue, 13 Oct 2026 02:55:59 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSgF-0000000BqUy-0i3d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 02:55:57 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3282db206d3so4682061eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 19:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791860154; x=1792464954; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYkXOkbNNXGaV0h+0g9qXlZ8g0hBf5btV0g9hsE1Sag=;
        b=UU5jfo33v9ipbppa8rosx5kTC5ssKp4RNn3wwXDo1s3J1vYVqH0HgeihWd37gKKouw
         /gLgo0pl7wmocpZTLX0Z9Fhqi2HMOr0N1XWxna6eTCMQg1lGG9sGakt/MBlubGR24fAv
         +C3wxl7yfZVutvNRj3ummfs0PmIWkKI44/Rx8LQCTu/C2DGGLHBHEmLkBK51jFPu3NTT
         YkyLXbbPM0m2benguTY0s6JHnKpX4sThhkVHQEVRIwd2mHEkfH4LBIWJW9MlYDIueZ2j
         n/yMNCzV3vmyz40SHsAwsPkkH9l4dip8IIQvfbyGcftr6rJY4CECbllO+K6NM+k6JAXZ
         A2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860154; x=1792464954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYkXOkbNNXGaV0h+0g9qXlZ8g0hBf5btV0g9hsE1Sag=;
        b=mD3E2bSZ3T+bzVFgfDGnPjJ82E/+uoG2REeGaIuEo+JvuCTxHMTLE7oVHlBFpkMwy5
         0+2YLtTIuvk/8KzWOdQVV1GyZvZjmqIf6o13guPw38O41g1MzrF/n6rqXcV1EjTcXYN+
         PTewWtCjvTG2iPLW1Yx0SONN11trLleUW7Gmg9nnYIx2SMARXJ7rn8Zp+hetsj399yuZ
         0VLwJuOtNsww9Df0RmZClU82qvf06aPhtO8TpxJJdZAqybIPd8WVTEdbEZfbGmD4jk8f
         QNS6O/eTjVsSia5b9nJGT5/FZXJkRhMqpgRm+nv25vzbxsewp4lXvxEDeQEIMUprmY2N
         3bEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtGwiKMPk/Pkdv4/cDHVMBKfOyLJzf4/rG3WByoLL84JbZvYHfZCAWBO/iPEr4OqvL8G8xFNxaPFkmt0RL1SIw@lists.infradead.org
X-Gm-Message-State: AFq9FYIPbcKU5mkyW1b1jdARb4a16Ldvj+oippA0NE5f+z+/fjXhLkbD
	pfzKrXJnrrGjy1g17LmKtIS78sGVq74RuEKjAjfIYzzQ60Xrie2TX/rW
X-Gm-Gg: AYBFou0iQhd5dYpmhfvPhEpAzvkowJvVJcjmjutl0na8vGQlQjvnQT9czjg3MrHnlnd
	rlOQUwAu8IamU0FMJU9l3AADnJ1OMaLVnyS5fy7c/2PhPr1KroLFW4mXjcx2oTmLrDU9Tu+otbX
	UqkNBokGIvUNFc6jWAH71NeRVMjVuiPRM6YK5wxpfoREVe11Hb5O4VIRkc4mRp4M/HpvMeCtBxo
	2L0ViHdRHJru5ZRCVooUTLfEt78j22h2zSjKo7R61Hih13yvza6lHNVuVh/FQb61jVX65p6knIa
	srUEgx9d0IIVdkzTPKqHd7kC1yJAE0DlV44JKl33JssWSAY+jgVKr505te5i4od/H3vf5L+YNzs
	ORFqWyZErddm5k+ORaSy9WauHECVf5jLRyg/xQBshTXNL4NtBW/PsqugI/42t+jEm7lDMvPrV1r
	XpZr0i3broaJdWinMRwgjGt2M4oa/V4SyBYMLaSgafK487+pwFLzxWpL2oiftyizm6uyx3K1auE
	Rs2kEtbTpAk
X-Received: by 2002:a05:7301:2a8:b0:358:cc1e:e23e with SMTP id 5a478bee46e88-358cc1ee683mr11380792eec.38.1791860154159;
        Mon, 12 Oct 2026 19:55:54 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:8056:897e:dae3:8e2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm50889219eec.9.2026.10.12.19.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:55:52 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Tue, 13 Oct 2026 08:25:37 +0530
Subject: [PATCH RESEND v2 1/3] usb: chipidea: Use %pe to print error
 pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-usb-ptr_err_patchset-v2-1-f83351b3fc3d@gmail.com>
References: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
In-Reply-To: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791860140; l=2766;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=TEC9RxqWL5ZvX/2g2f4/ytyr1XZMsj0b8TTkJVHK0gM=;
 b=QkczeSx4eka1kEzqETu5ME1HMWRf/Vg47Ckpa+SrLyRkubs+nCQL071XMlMAgJK/fBSL2YJWV
 64bApH1c2Y9D/wHzuuyEmUJDQR8Hle0oeyFEHPMIRCp4DspjmUPyiqW
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_195556_663027_E568FB3F 
X-CRM114-Status: GOOD (  14.59  )
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
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


