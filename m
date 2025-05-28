Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93CFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 20:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=daVisNFo2JYOWor9frp9fd1E3MXvxdVufApsYKXj4R0=; b=jGZKMuvsLub7dg
	VFP/q1/tqzFWjxBpv2QsEIk3xM1AB6NH/opFPX5Ca+eQ+tff57EWkadH6fWpHZynvnSEqv1gxwDC0
	NgbyJ7l81qv6ehjy62yltQ/CtN4qtlUrvaqIqd0+g/mVFJL20is1J5c8HAqVW5aGGVnka93Jgr0PA
	/8yhiefzsw6b8ZjAOwOic6ZnDFbAzVjrJpwvW2n5ZLFbdVrOOEpql1dRCtoKgphzvC+RK/Fa70O6S
	2Baejsmt+JUT+ek6y7ruXZ23Lh8qA3yxBo2GpqJHthc2xjCoV/MmErO8tdXHVVwkN76kd5Opb/eeL
	4e1Y8OUZy/TtJLx3owPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKN2E-0000000E2oC-2vyP;
	Wed, 28 May 2025 20:05:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMuH-0000000E1x4-2VNN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 19:57:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so123675f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462264; x=1749067064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=daVisNFo2JYOWor9frp9fd1E3MXvxdVufApsYKXj4R0=;
        b=fMtPahIhlQu7Auepp3dDMhaQogk966ZlsvTanKHYdjkxTBFxWmDFwI9qYZCbRcY28e
         AKiVeQP5uO19Mog1KvlvJPFCVzVGOdoDM3rc19GptadnQUP9LuGmqa+aiqN7lClIkiGT
         DYmXiP7XBpbE6zcSaZoJKdV5Sge/sWUGUXDRbF6LDLUl5/1mvl0nvUA8K1Li6Ri8F4bQ
         pKj38Wuo5Co4vGeRnhFnUGV1dd4QahvtsOMOKeJYSR+75nAzRInUtmWJXlSLD7vK9xFm
         TzTymjaR8+B9fODQTUxEcqmQGPzfzkUtoRBvVwzITBhI05LO2M7Fy2gyRd5zvJ1p1Dqr
         YhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462264; x=1749067064;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daVisNFo2JYOWor9frp9fd1E3MXvxdVufApsYKXj4R0=;
        b=XEHT7lSvc1JpOY26Bw3DwJQOeF+rQtatuw3xjtDblAp0CSmap8jHupbVooCGxyqvnp
         bR1DsmpTQRxBoeObu2OjgucR367UR9/h7b9+bmrGNFZg/7j06Ksw9btj8YsA/vYknEoJ
         IpyzZFGxrjVTomKgB2F6Iyl+OQ3YSG9HeMYhLe8a9HdbU4EKkXxumhpeOO+F9BHIhlIX
         HIh83av+bcqRzM1PckhxvbrSYDd5Oo9/BQYwsCzkWcyjonxnFiyofnC9uoQ7qWO7GPMY
         WX1UGSQ0RpeBZe6jmVcdCdohO38F/0tw9zU5KTDkavG12ITOxFKrqYLrcPSp/MnXBg3N
         Nebg==
X-Forwarded-Encrypted: i=1; AJvYcCV3J8aIQ6ilUtB7bIQEtREt/0J/i4iUHIA3UfghFhlDTCVYJsvcaGokSHdw7ERdEnLu3LUNCurqbOAeW/cHxWdD@lists.infradead.org
X-Gm-Message-State: AOJu0YwQvHTj+i425fwhVDJd2v8Ej1N6QmtAq8jdXWdnNM+nyCpokrQE
	Q6aJ8VvbKznwjzgBKBOkWdGavdihBAVtUomNItUuSf2413jXXF77nQUerN0EXM6gv2w=
X-Gm-Gg: ASbGncuJHMEcqlovdxvH3aj18IIqMzd0FOpfgmiiP8ycAJkLBP5ZTS0hQntkzw/U/qF
	sqhOKqijo727NJUxniib7fg0X+Z1Am9Xvohp6qI4IyWBLybjYgKU73uvspvRmlfdQ2+x7tWfNuP
	/gSJZHKkwj5YLvllTqcvEgXdpp3kkZjLH/dMjPEe++dEpisoG32mb6Nu7v2v71uM/ZA7FinvINU
	gZLjOC1Nx4J8apsG2Yyxe8+ZvoGjQTWh0NYQ/yKnoWTdadxX8WiFI4UCfvZNpnSjGgY5e0ibohu
	WGDZ1r+1v4EAOh6qqXFiYs3uFiaudwwZJhhmd3ru8LKESv6CiJrlTdg=
X-Google-Smtp-Source: AGHT+IHg9XasKs+N0t/qumXHpJiiJ8sMTppJmHwcsmrYSwVnYilz8ut2u+dvhBQCw0zXqxv2hFdsXA==
X-Received: by 2002:a05:6000:240d:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3a4d6eda63bmr10797738f8f.39.1748462264092;
        Wed, 28 May 2025 12:57:44 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eace3260sm2353096f8f.90.2025.05.28.12.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:43 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: [PATCH 4/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748453565.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_125745_640747_C98B36C4 
X-CRM114-Status: GOOD (  13.95  )
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

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  1 +
 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index ce207f8566d5..d062399ce15e 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -95,6 +95,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
 	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
 	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
+	{ .compatible = "nxp,s32g3-usb", .data = &s32g_usb_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 43098a150e83..34fd26faa303 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -677,6 +677,11 @@ static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
 	return usbmisc_s32g_init(data, S32G_UCMALLBE);
 }
 
+static int usbmisc_s32g3_init(struct imx_usbmisc_data *data)
+{
+	return usbmisc_s32g_init(data, 0);
+}
+
 static int usbmisc_imx7d_set_wakeup
 	(struct imx_usbmisc_data *data, bool enabled)
 {
@@ -1200,6 +1205,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
 	.flags = REINIT_DURING_RESUME,
 };
 
+static const struct usbmisc_ops s32g3_usbmisc_ops = {
+	.init = usbmisc_s32g3_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.flags = REINIT_DURING_RESUME,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1432,6 +1443,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "nxp,s32g2-usbmisc",
 		.data = &s32g2_usbmisc_ops,
 	},
+	{
+		.compatible = "nxp,s32g3-usbmisc",
+		.data = &s32g3_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
-- 
2.47.2


