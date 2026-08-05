Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FC6C56201
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBLPmYrNwyqCULYKtthS+JHQCLS3nMPhwf7QeBH1JBU=; b=Obf/7jCgqM1yq3NeQ99r2b0vFV
	XBYTeyP5pTXR5nDQwUpMp34g5delRpZJlTmWbEofMCH/CmSyhUZauagnnRe+/mEQ6NljyKdOum7pT
	prUqdPIZZ3uQfZqphAt8mZWbXuGkbHSQMlAlfHkQ1IrSk9UBZHPZa79NgbTPlJxUzbmRkUHRMLiuD
	0B39rbjL/PnbMvkYTK2qdCDMFmNbCxyPSfjxsX2eBvCwL+pDaSdR6LYAtPxa6cH/vqJHMbf3SdSSz
	TBIPpNzSq4Yiu/yIt4w+kX65J7bAXgHn0+iK9RFXiKbp3b8bkvYi2pfN4H40ywQ0wELFK24bP1vcG
	HydRqI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZ6g-00000003lo7-1Izg;
	Wed, 05 Aug 2026 10:44:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZ6d-00000003lnm-0hNi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785926651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBLPmYrNwyqCULYKtthS+JHQCLS3nMPhwf7QeBH1JBU=;
	b=aK1FQJSV1z0YVzoPn1TPCwJOJJLZws3QHztpGmUiJTxAAzUjwN1ZvhTJ4rQgxxu/dv+MvG
	CLmTCUX+O6giSF0eGkrUvaRlFXN6JdU9POOmrauGG0IKQA1lSQ2H+t+GAsz8ewKyURO1jY
	s8ssLrYwbsPesgCmSJwnvWdoqcfjDd0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-bhSMNmX_O9uapLSNlvNpHg-1; Wed, 05 Aug 2026 06:44:09 -0400
X-MC-Unique: bhSMNmX_O9uapLSNlvNpHg-1
X-Mimecast-MFC-AGG-ID: bhSMNmX_O9uapLSNlvNpHg_1785926649
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e6abfca68so16901257b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 03:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926649; x=1786531449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBLPmYrNwyqCULYKtthS+JHQCLS3nMPhwf7QeBH1JBU=;
        b=gyeGbbz3ErBpm8jFdSVWPYwJdztIeBMe8qccdxDz1+8zlanrIQ4gFBfh8wpJNfDy0t
         dVkxYVlsI3/aWJp1rsa+In2G987WcuuGGsrWqI8ZepnwjGl95/H0i+dlkGijXTZF3M+G
         qv76lkCg4zSKQ7ItE4PIWuqhHceLMS4BB8QVqqlmb7RD3kuscaFDaL3xBW5d84LYOr3u
         sWDu/K+QQIgk9/Ht4bUWds1WgU+DNCZ8oIkvIQphkbAfPvaumC/L+qqRMesmLVGziYBD
         b3NQV1qTkDbSebEzVbJiJxay2qMO0t97jJh/8i9ttpAZiXeAEMO8zEn0MCEab/AD33Km
         15oA==
X-Forwarded-Encrypted: i=1; AHgh+RobQS7R1hqwAscNeW1LDIW+Lfjut11c3D8L29Ec/NMTqyDrr15h5/yLXr6PaTdV4wj/3korsR0L/a1ukLhWXDf8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgu04o5++PaLnjgGiP9x//PX1wwAUHWJVuXatzbu7sQzZ47QQH
	sJDmJvZuCesw9c5+reURPXkt4H/k5119ypnBydclAmEM4wXAQBHD7XoZftF9JqixL3Dd1og9hPD
	qwm9PJbHlq/rpEUSVL1MebBnJ7dYzraU/7x5HIyoMeO96e7gyBwXjrVgyntHsfC71vda8eAn+7j
	fek1GVMBQ6F8wMp9o7nzXsox115OgiZL8p74MWQc4at0BHILQ5zS4u3hGgcVs=
X-Gm-Gg: AR+sD12dqzydUKDC1YT9H/Y1tj7KkEOdo+qYK6TCtMi1UaWwtctW6FseXRm0mmLI96j
	QYmxDP8EzmOCciRaoVntRUo6dB8YLoeoz4VWHuLRHwueewYmM6QphZySwAMu2Yx3oodcil4o8hm
	eWlLPOGkSFChMwQI7JWRpGDCIKBUkbmY3e+A2Abupph/i5JU8VidypUUo=
X-Received: by 2002:a05:690c:4d02:b0:80d:964f:88fd with SMTP id 00721157ae682-8201f0c14a8mr34578027b3.5.1785926648649;
        Wed, 05 Aug 2026 03:44:08 -0700 (PDT)
X-Received: by 2002:a05:690c:4d02:b0:80d:964f:88fd with SMTP id
 00721157ae682-8201f0c14a8mr34577737b3.5.1785926648209; Wed, 05 Aug 2026
 03:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
In-Reply-To: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 5 Aug 2026 12:43:57 +0200
X-Gm-Features: AUfX_mzIqL0xVaQ870Pw0RFXK5xY2ZBOqREaUxjUjBjO8iIwCsGBLuNH2W3gAs8
Message-ID: <CADSE00K71ke8yXv8xxJ=e68kqPQAjXiOw1kY_BFpTsfw=xiJaw@mail.gmail.com>
Subject: Re: [PATCH] drm: fix missing header include for drm_panel_put()
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iS_6jSI-HiQh1aUzE-tGFpfGogmcsS7NXWLQ8Gbu7Dc_1785926649
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_034415_365953_B4BA040C 
X-CRM114-Status: GOOD (  15.30  )
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

Hi Neil,

On Wed, Jul 22, 2026 at 12:07=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Some DRM drivers lacked the drm_panel.h include to use drm_panel_put()
> after the commit b71a623598d3 ("drm/panel: of_drm_find_panel() return a c=
ounted reference").
>
> Fixes: b71a623598d3 ("drm/panel: of_drm_find_panel() return a counted ref=
erence")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Oops, I missed building on my last revision. Thanks for taking care of
this and sorry for the inconvenience.

BR,
Albert.

> ---
>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c   | 1 +
>  drivers/gpu/drm/stm/ltdc.c          | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dc=
ss/dcss-kms.c
> index 01e0c10b6ea1..7c5a6e2bc89a 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -13,6 +13,7 @@
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mx=
sfb_drv.c
> index 7cb19c15bf39..8b4a500347fb 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -29,6 +29,7 @@
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_module.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index daf198edb42f..8818dcf98da7 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -34,6 +34,7 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>
> ---
> base-commit: 0f065acf44aeb8c32691d88cc87004fd2e54e902
> change-id: 20260722-panel-fix-kms-panel-put-38c079412f83
>
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
>


