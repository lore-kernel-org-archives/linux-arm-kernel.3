Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BC0C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RttzpPmx4+I2vFDRVVqMPeYipRESqQyZkl6IDrQJbiw=; b=lMhzislFEXFoa8iLqggUyNV+Z4
	cSpZ1XhApZeTA9H2pK7dGktQQJ7kz3nUt5ywsp1TG8n1kPdpB7k/jTPH+990p1IwToWpE5YmgfVf+
	xIpB+sQt7xv8Tycd6AqQSgw5epehkuz2qgJE15a68Sh2ANBBulAJD1QChhA9uvV9sySbMbJAOKi0n
	FaAhbp6DQ2EKnPopWskAxVceHxtYSBwHOYaKlQbKUX6/KRQlkVzRmSfz+Dn3qibevh8huJXQom/89
	42CDfMBqNYlttaxNSb/e83tJ+AOBuER0xWCoMOdcGhjG9YTeYofJAq4pdgY8+XLUGS49DyIKEzWNi
	CYlXnaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPntm-0000000EO7b-3Mut;
	Thu, 12 Jun 2025 19:47:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPn18-0000000E9Mw-2OHM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 18:51:16 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a365a6804eso824608f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754273; x=1750359073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RttzpPmx4+I2vFDRVVqMPeYipRESqQyZkl6IDrQJbiw=;
        b=ZmF/ze6V4Kjmrn5xfqKM/1pXYgwVWUx7J6LAwof5uVQOOFs1CVh7mEcwLc//MifqZF
         Mp2UdhmakJVFUgoP7S+g2nLOi73cJZkfGuuVVLG9vmDKxAy6Nir+PsCg3U052Y/20Znq
         dJkX5PanWHANu7aaaSFqqFN+bz0gYFutWjeHXQDHDNT/7NWzCdleEHnibWc78M4QmcoI
         hoUMfno3Y4rI4OFpRDovH04QgXjBprYZ7EW3oApNpMXoYdsQLbX1Jg/Ex/lBmivZP3da
         ks9Am7cS5A2Zq1LepVcDkROoRdKgUfy0CEUjsylTKT5wObJqijwPexRZ9m6mtI4BTDJh
         1BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754273; x=1750359073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RttzpPmx4+I2vFDRVVqMPeYipRESqQyZkl6IDrQJbiw=;
        b=AVbZ9H68MiEpzVXbWaSyNuEekDGDA4k0Z0PF0l5sd8lAiiezEpTIWy/hhTbzqhV6T8
         va8nAAQ7L4uMPipnOyJk7HnC/N5Os5U6TeORCYE+7TMeVPuDM8TBEXTip+OEuDyLo9ZL
         1lJZsvhQZ8YAx/xltxk5grTM1/u0V78Lsc74/szKswPjGcAXcRIvlvtKd1A5kqDFCKd8
         Uxvt2vTbZtTKTPdYiPVVEK9WDBA+ubmFmJKZdCbTTrYyvjBi7wXxoZbljGQuqgEBe7s/
         ciCGaJjyAU3Y1pocc6MYZScgAoDtomb1xD+xHGehVdbm+Y4A9O/eYnKVGotRzif2OTKE
         Uoeg==
X-Forwarded-Encrypted: i=1; AJvYcCURS6+jjkybq3Ceod9GJDrR7gH8OGyXcJrEhtaI8nS815rEv9Y7GIBETGo8iMEmpY0qbdTSb4v0GOzkqGupE6g1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6BewBB646xbWL3r3aTXOvn/ZbfusOIquhiU3mH4l98lC+Dedj
	twIayglHTu2qvwSg9EkqtkjraltC6xPFIdev8i+jUfEapiAJaoRqwMQl5IHt6dKZM+8=
X-Gm-Gg: ASbGncsKo2DAksVB950qtrC/vg/2hCc4HnvbJApIC/OPM0jZ8UfVwr8xpiPaqGkwu/x
	imjUY8DXPsJaQWAI5JDMHDyQsG37t4rWPfCNWqWnkBPdRnzqo2IeBuo5pP9/EmwXf0iC3+l8NV3
	swFc1GJk3GufeTk43dM+xn5JklGM1SyB/0bOwYfOpKbU/CPEaVnL9urbebcWQlGgWxMm1Y23G5O
	/XEkw/W1oLtetVywrJm7APFpXCW/znmM81/AcLYzxfXGVlwJsEvqp1kseqwqvAN9lNbCX8HZe3A
	3WRMJ0DrR6Qbu/vest3nfx9/ZTJuL+jPwGPxAqH0s8e9Heh5j0U23SpclMfeYrx4yww=
X-Google-Smtp-Source: AGHT+IF8J8y/ngnpoyOUShRv9/aJkdzYRnZ60F/4jSk31esEVM/l95MI9oTPjOP8gHOhRdPMBTj3gA==
X-Received: by 2002:a5d:5f91:0:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3a5684cc429mr399383f8f.0.1749754273164;
        Thu, 12 Jun 2025 11:51:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a7f8f9sm113600f8f.42.2025.06.12.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:51:12 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:51:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 3/3 v2] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <957b91eb2270113a857474ddaa29c99198ed95ab.1749747898.git.dan.carpenter@linaro.org>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749747898.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_115115_029186_38D4FE20 
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

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes since v1:
* Drop the changes to ci_hdrc_imx.c since that part is compatible with
  the s32g2 chip.
* Use the .power_lost_check() callback.

 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 67ff073ad806..d5389156e157 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -673,6 +673,11 @@ static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
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
@@ -1201,6 +1206,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
 	.power_lost_check = usbmisc_s32g_power_lost_check,
 };
 
+static const struct usbmisc_ops s32g3_usbmisc_ops = {
+	.init = usbmisc_s32g3_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.power_lost_check = usbmisc_s32g_power_lost_check,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1430,6 +1441,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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


