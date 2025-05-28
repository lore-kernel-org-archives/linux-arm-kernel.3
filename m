Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557A8C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 20:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jox9SekNR3rtKHNYCobALo8p2iBIaUa3VzzVOakwrMQ=; b=R7X+SbahG/h8Iwe1odaVNBCIR9
	MfmInV9BHdJ73kHRKyqzb9OWBLkztB6u0gm6AdmtUMN1HD/xAuvl2g3yGSzbntlKeqptd6JNOevrZ
	pM5+TMB6cQR7BoxhlSP5Pj7KiFL2ghZA0d8w6wCO4MMVpOLGEhyc2wnHQQUIQYiFkDC4rky27+5vK
	rQqo3Jv6oAxRT0ETpFFRjXTJfmCi+8rGfahHJYa4dXr2Ed0ngpJ3N84nY1aQslod5G793zd8O/Kio
	QEYYO6wB0rNh41marE58w4X8UYg0k5qdrbOnFsbHLCrVsBOozsREzCzQ76el7CAjWxOKaMF4q8e6t
	WR1BjEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMxz-0000000E2Pq-0t4q;
	Wed, 28 May 2025 20:01:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMty-0000000E1uk-3rIz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 19:57:28 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso2663125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462245; x=1749067045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jox9SekNR3rtKHNYCobALo8p2iBIaUa3VzzVOakwrMQ=;
        b=vfmW7c467MYsu4BLirLK5KuoQiTSrySmHxx4XEN1qZF0eCJwXpt+LKTy886gSky4MH
         9N4FwsGM8DgSsARparwG7N5qlVJ06Qo032S1rgBIVsg4WaAzsab5Nm+gcKtLA8d5WsBA
         ql/IK4Jtzm50Uzkvu+URbP+HYktfA6ws5D3egtBsAf8r5+d6L4crq0+SVr1fPngrEWmC
         otJTBydHMwuTaoy40ZcLnX63VAOvDnliBiYktit/GaWMYu19C7RRuuVnTYXMVglvCEGg
         g8ecWWzykoUc5bXVw7X36QaOlwwUrYUUrKU8mkiB33AslTr0cFN4sP9+MV351v3Ni/th
         iMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462245; x=1749067045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jox9SekNR3rtKHNYCobALo8p2iBIaUa3VzzVOakwrMQ=;
        b=M2cyNi17zWu8kCrQn16ILORGMYiN5ifWG3DYubELcWWFvUxPU/JCk/nK38rMAKp3Ab
         OhrjfpQ/GsjPPNdUk01QSE22RWlA34WSwPCQ4s3+ie410vwMc8o393OBtW0Kjx3zEwjg
         6eVVArjuKbDfhlP2BB0Ed/jGjUOzEwNqP8gTcQy57kwAWh+u4CQBnwEXDxHHiKe4ucep
         dzuNWPucX6rOsvTOW0i4KssHG86RIrbj+oH+JyhdsAuPsncmdzy0S5tPSfmja+2mb4Bg
         JcHFaBlQzK3nOdN+z0yIYQ50yTKqoc6IfvRkuffo50h1sxwj2OinSXvRKSvaEQ/xbZN/
         44bg==
X-Forwarded-Encrypted: i=1; AJvYcCVjzKQaqPWyJoLohNfaagCPC5RNPx4Ek925Denf4iViFVSY/H+VQ7BVqBdwD6z95So613V/wpneqaRosDSxw3HN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrvt23VfkO4MofwcivyNw7unRNR+Bcw1XHIVRj1SVyX2nWhHjw
	eG4zlWypIM5JkZeFSNTcq+nCk9Y19BatmCF9Y504XV2XMJ8Vy8eV86tmpiHLIsPLvjE=
X-Gm-Gg: ASbGncutXp0t/qNLq3kxqFYbFTWSbLLxDBl/FwtcW/8udFNyezbxUdDCfA3K21czr+q
	yZhIDa/u7z+sZHROIAvDBwGnutUPU4cyDXgRIARPeJWb8NWzQuZdpqe3bJv9DHpR2PoeCD+pR9F
	o0w5i463FdaGwPLe9UI0E2+q+vzopqfdBfpkDKEPvXioDsxG2QN17tmGRQ9++OlBHflk0RW51go
	iaPLo9o+jDa06LmQ3hYFQ8kRtcuVaS6ZcxJFodZ7fP+7P1VsfRAyUTk7qyPXlGvJHhHt1ZYYXv+
	kmMTWjtUJhCcxZw+LrjDNk35kPtDE+85LsfwjVFlDUf5fLIwCqjJ2gnnHbbWdTbm2g==
X-Google-Smtp-Source: AGHT+IGFimIQlDKktgw+rSB1HgWLv0+JQH4Uvai1EVQNKILhkigc431Q3x3/98hg2t4hXWqFBll7vg==
X-Received: by 2002:a05:600c:4f43:b0:442:e0e0:250 with SMTP id 5b1f17b1804b1-44c933ed7efmr166096775e9.29.1748462245206;
        Wed, 28 May 2025 12:57:25 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc2d383sm586565e9.32.2025.05.28.12.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:24 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:20 +0300
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
Subject: [PATCH 2/4] usb: chipidea: usbmisc: s32g: Add a REINIT_DURING_RESUME
 flag
Message-ID: <b1ddbc5993b2906cf916d023fdf27b07088a9672.1748453565.git.dan.carpenter@linaro.org>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748453565.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_125726_962187_3FEA890F 
X-CRM114-Status: GOOD (  13.98  )
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

The s32g2 and s32g3 chips will need to re-initialize in the resume path.
Add a REINIT_DURING_RESUME flag which will trigger the reinitialization.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/usbmisc_imx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 118b9a68496b..95759a4ec60c 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -155,6 +155,9 @@
 					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
 					 BLKCTL_OTG_DPDM_WAKEUP_EN)
 
+/* Flags for 'struct imx_usbmisc' */
+#define REINIT_DURING_RESUME	BIT(1)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -171,6 +174,7 @@ struct usbmisc_ops {
 	/* It's called when system resume from usb power lost */
 	int (*power_lost_check)(struct imx_usbmisc_data *data);
 	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
+	u32 flags;
 };
 
 struct imx_usbmisc {
@@ -1266,6 +1270,9 @@ int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup)
 
 	usbmisc = dev_get_drvdata(data->dev);
 
+	if ((usbmisc->ops->flags & REINIT_DURING_RESUME) && usbmisc->ops->init)
+		usbmisc->ops->init(data);
+
 	if (usbmisc->ops->power_lost_check)
 		ret = usbmisc->ops->power_lost_check(data);
 	if (ret > 0) {
-- 
2.47.2


