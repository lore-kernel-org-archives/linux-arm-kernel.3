Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E95C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 01:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zByC6Bd1xD5NQdxKZlsMbHMCFrJLh3d5i7fkNR6uL0=; b=SRDXe8wiblJmAQDpq6RuhwYd8E
	KWoy4HC31FhS5lKzdrcSjQ8RABktsKurHrHmGedgFPSyAsJ672Ba2r/ldLIZjAs0jUXTm1gJt6whV
	jdDC5F1DbOq81+5Xhws9hxN0CiFwKnKQdUbpOV7N7ik7lFnWolvuJESQKHFefb7IelYkyFAC1N4VZ
	tAkg0Qp3EVtC1xL7uRLYNtt/+eSy/b2tWq+Ly3y6HlFBzKHZi1rKO0bl2idmq1wWksTmkPw0UYj+C
	DHqtyp6XoH77Aq+45XHOlCdFUyh8JQwDCmOJvXpLxkspvQhc24cYYfByMDC7ZI1Y3Y//aJw49Ichv
	WKiLbJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXVDA-0000000CzVT-0871;
	Fri, 04 Jul 2025 01:27:32 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXV6Y-0000000Cyup-1s69
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 01:20:43 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-735ae68cc78so360932a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 18:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592041; x=1752196841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zByC6Bd1xD5NQdxKZlsMbHMCFrJLh3d5i7fkNR6uL0=;
        b=cUSSp9ZHfxCmDNXNNEf2X76OG4zmvj34h5GjcB75QId2BZ6CIc7nEyUT12pYIiomtb
         6PXKELtJ5/Wb9+tolsBo2PDA70VWwSsHTERNAlWwDuw+xtbIetK1MQxjyCtaKq9KSkmE
         Qc8aBFvOvlPcJiLMImXF1BzGW0KuIXqUXaOBuqcTzKQehGAwDmLUXRRLhYkkiBm1+nVm
         JWCf5+HLFlN0fTqdgbt5VLM4e6CDINbW8+yKLAyuOWdFHEdsSdWfiXz6Eaf/MDcogXxG
         CbNvXF735kwDqqRDYabrQp5MHBk79L8ahV6epGle2E7OIindiUjTCeTFOMni/1OwTQiy
         i7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592041; x=1752196841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zByC6Bd1xD5NQdxKZlsMbHMCFrJLh3d5i7fkNR6uL0=;
        b=FGOhTRRm8CmGdRVWYqZBIvRV8o6qIKzP75AEvAaKe2RgjQVVyPKABzFCDEqS17uXIE
         QE1kflujG5pmIfc/ZwZ+Nmly5rbfqhXVfrYQOEt3Kzg+tkalu/UsXiiZv/qw0Y+FSwsH
         8OO03cCEk8UGzFOpnCS74Qf+i2j1m0E10k1jsWPFesVSKiJidZNNTVo5SFxDR88f1pkD
         wwyHilNFlSvZvjvtmlyIqyfBzFeFiBazAldiX1N7dyVy3uQCe1mIxxamiJF+UYQASTut
         y5hAUAsOXhljDWateU/Lsht7G2i7ynoz5sFhbCXmNhq12YF9VWSUTthC2SbtAoNU3U2J
         vFRg==
X-Forwarded-Encrypted: i=1; AJvYcCXcYUdk6ZjAD86gvjpee1q4UWCgTocrmTZN7NcaF7YEWcwmkJDr2oFPkXMbAXcasWoPmxWI3UMO25ETUfCfzPEq@lists.infradead.org
X-Gm-Message-State: AOJu0YzJgPD8aXC/qqCHyT+doAYTnS1fudexrXw5jnCWDM5SX2h/IkUp
	9I116Z/IHJB3797AdKDfGKGms2VR+LTlvOcP+neAaNwr0VbyP0hw4If109mOzVy8BmD0GdtGBH4
	AqEitjL8=
X-Gm-Gg: ASbGncsxE6/GcEnHBN9cDNOv5hHi4Jclw5r9l++t1Xl6Am0RG5IuKq2kEL2G14oSe5G
	lff+LnSRUfBiEJG108lTcZJbliI1UDg5Sx+aCRUVYhQfaJApDEkgDX14jmWPMHQhy0jfWb/sRVK
	/tcGSjcfVadYyEnRHydu0M/megnsLwjjFFLF0wTufw8RPJ+E4Rr1kNdqhtGncs4UU2VVo1Xnm6z
	34NPRwiSRpggXjaPNA5CAUAvPFUEVN1u20b5eCo5etrFqBc3TLMhiwTpF7zA2zlYUxuoEcj7Y5f
	83CtfK2tE35j+NXCLzd1xSve+miI5TMeIN1Z1aLWHihyvXAp1vmFsTgBDImsAxU6AyVyAw==
X-Google-Smtp-Source: AGHT+IHh+how27xFPi3jlyY66JrJHeNp1IVUr1F4gL3pyWo/92sd3tMtxnIq687N17nvaqy2j2xmcA==
X-Received: by 2002:a05:6830:2b14:b0:727:24ab:3e4 with SMTP id 46e09a7af769-73ca48e3741mr340463a34.9.1751592041579;
        Thu, 03 Jul 2025 18:20:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73c9f9628d8sm203282a34.60.2025.07.03.18.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:40 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:39 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 3/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <1733ae21-7257-4fdd-8249-7eaebbf769a2@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_182042_484033_3A93975F 
X-CRM114-Status: GOOD (  13.71  )
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
v3: No change

 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 27a3127db4f6..9a1c97ea5463 100644
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
@@ -1200,6 +1205,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
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
@@ -1429,6 +1440,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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


