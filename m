Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859C9C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0eUpkni4OJ6N5I2ip/hczJtRuPECve9UUx0lHvZiWc=; b=n5zqHAuFMZvQfuTUFFaHNVymcz
	dlh3woIooIQW1bfk78MkSas2uq97I932votD+ztkcGPnw34ypxyjM4YkIPF6U1pBbnR+Qx79WAfxp
	Ibg8D/Db5W3ugb/1KGdESGxF+vfcRs1muXZuSfc9KzEdH7NKwGj+jsI+aUPZ+rSyBsH3d0NbEcyCd
	cX1p0oB9UgBdctzVHw+pkc17mJSLzVVOPrSMpd/VCINP0x2kMCgF2ZMSMKlfv2u8Or8LacElBOgR+
	7YhEDPmLoQpGdvamW6iSyHfvIbzcTQTgj0+34DGXtS6FoEgRM8su2X3zWLnwVq2ib4SYGuUcHRDjk
	5SKxCx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCnZ-00000000GJj-0uwm;
	Sun, 09 Mar 2025 09:18:17 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trClZ-00000000Ftm-43wY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 09:16:16 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6fece18b3c8so10839477b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741511772; x=1742116572; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y0eUpkni4OJ6N5I2ip/hczJtRuPECve9UUx0lHvZiWc=;
        b=DgXLowt/nBMQ9cRIV+fxyUW5H+MiAQa7CK6q6upI9YfZuYt+yRO4YrrOSZbHq64jY6
         eRVtLSJxAEYH+VUiq3r3c+h2e0ZTEAsmUD/GiKtq4MNxv7OzDWebm/Lc1H9sKzgp7J4y
         Rgs+Z/sH8xzsF/Ct27zHxyMhfTy1T9k3z3LXZ7OLsEV87WheP+19o/pUBTfwzHVTbpl0
         YbDkeHOVVQqFSmeWgiY9AmPhK3M5HtDf96cY9a5G75EwC8ycmA9NBQeFP1/+4lawU1Pl
         rIInfSTkz8EYptyooesgWcpfEbQz4bu8bVn+UVkSTKWfYPULyGIYmD1DbQIfA2zIj+Hn
         O9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741511772; x=1742116572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0eUpkni4OJ6N5I2ip/hczJtRuPECve9UUx0lHvZiWc=;
        b=DEaUKT6soskxqW136pfUBr1JFamK2bu3qm108XJrw3J1rrHdaMDD4Csl5/VkRFSnTb
         xSKz+IsjFstBV3SDB8Tao5yHHicBrzUSwrPmXLWZ3Qx/3VOsUkE2aEZOxiQqhACQi9Ng
         ERmj47qyv6jWsftIW5am9929VjELaIGnZcj4BshTlsOBAIO67jTJrvdM0uASQzQaJnTP
         VME+ZMExL76flKZDRFDa89r2mA1AAlGLPn4iilVhuXHBtGuQARnY8NQ/Hg/xS7ihPfS6
         zsehp7mTaeV+XOjStz0cU0CkjPaBEJo4Ld2LBIggY+Lqiq2zbiV5SmwICa5pMjauxg/X
         rjKw==
X-Forwarded-Encrypted: i=1; AJvYcCUR3TtpRoKQZqO5Hw2FYDlCN0NU7hLz2z5dbLb6l8e1H940a4AeLdrKk+93Zc7YNfZ+nqkSwWHvVhoo7l2dWS+w@lists.infradead.org
X-Gm-Message-State: AOJu0YydTaGpvkX92LlbeHyjcR8Ria2XQV5yV+cR2hbeRZkBrtYNj160
	qea+k4wQME3xlve0dG0fn4VBzT3B8fS9BxfiEPy+kO9rjwgOCtF4zbCcypUfnnbmWFtzdjnuiGp
	p+V/y2Xuotx9h3079mHxZjvkkWbgxViaJnPV2PA==
X-Gm-Gg: ASbGnctqAPbJ22pmeNaebLGfii5pxRb+ejkxsBB+hlAP1zbNBGt8RKBsmTfl4tEHwtA
	j22TsrHYT6kWiiD56zR66FFz2ZAWPMQsO2nWWabRfKkcdGzo0oVSif+986nbqxN7JOmigvalnAS
	QFFCR1bte4NRgrguuYIYMkFm+mJ2gj4d+SXzWt4ik4D1ZWK5xhEGM=
X-Google-Smtp-Source: AGHT+IFPECWoQ2SLQxFVAn6AAfos114PtgmwIoKQ+zMM+yCAQaFRw3Tq8C5wAZ3CID7rhAZlrgL2zlDgjqBdRN6ki9A=
X-Received: by 2002:a05:690c:6382:b0:6fd:3fd0:6f2c with SMTP id
 00721157ae682-6febf38323amr131915417b3.29.1741511771952; Sun, 09 Mar 2025
 01:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com> <20250308-phy-sam-hdptx-bpc-v5-2-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-2-35087287f9d1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 11:16:00 +0200
X-Gm-Features: AQ5f1Jp3ty9yF8Gy946JtVIhFnSayq957H6H-29ZcG2uPAfgmPlCXdifLdlKe4c
Message-ID: <CAA8EJpqYE1drM6=C0AwPZ-e5RkWqjMTpWQiwhA64qby1mmVL1Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] phy: hdmi: Add color depth configuration
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_011614_019794_3F586B89 
X-CRM114-Status: GOOD (  10.77  )
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

On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Extend the HDMI configuration options to allow managing bits per color
> channel.  This is required by some PHY drivers such as
> rockchip-samsung-hdptx.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  include/linux/phy/phy-hdmi.h | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Just to confirm, are you passing TMDS char rate or pixel clock for
DeepColor (bpc > 8) modes?


-- 
With best wishes
Dmitry

