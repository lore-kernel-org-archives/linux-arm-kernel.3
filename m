Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287A3CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IYwgECH2Vb0kFa6dag8ngSP8oduCmQ/9S3DpTHTLEQ=; b=3RG8a7Tmz+FpuvYzqm+pgd5MJi
	Gkoc9FFSUeKifdfffTzEYeEFfvEj87YZtoWJlNcj0voXTJxuhFGnFxBhiMUWkgv1crAMEoQoDv+j8
	UMdnfBiYtmmW+3u69gXiiqS2d++tOVXcKa8vindyMr1R/19KELX0NDiFXPtrlHCh2ic/ZxW+LGGaK
	gh0jAghCOAJTQFo4rSGTLRJFQ61uC3+lSAoSrJWEeFQNtG9tgXAqj+Q6AzKAL94ImPsgepbJCRrSo
	Lfy2JKRILM4JPiyG5u3Xasn6oCaIrK8cTk9T8cwHY2HSFHdp5xNGP+nAPS4NgfcrcZy8YMbfbvaKV
	q/ld0o7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9jN-0000000785Z-2TjS;
	Sat, 30 Aug 2025 00:46:09 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0ux-00000006Avs-3H18
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:21:33 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7f7a6baf794so277482085a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 08:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756480890; x=1757085690; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2IYwgECH2Vb0kFa6dag8ngSP8oduCmQ/9S3DpTHTLEQ=;
        b=XEVOOkWB0FfDKhPoUSagx/hCVwVOxxzwZ0y1nMCJhoRJFXjAfzOV57qrMj2reOg+Hc
         ey1VkclZjICVfGXU5PSqY77Enf8yywwEJRjW+KCVWpT1nyFq/y30CC0wP2PTxETUTb7C
         dFVdjGrpQiGs+4jMrQcwv9CUdzRUyONRoYPVoxtON5U5D2mgF5ct1fU401/NwXodao5U
         4JJFU+6aqecOEqay+bn0jCHwb1fIIhclBhiQVeCDqvQW4jdU5n6LMgtxa8lCiKi6b5pK
         PiONtSZpgj2wmx9pWXLk2c/JZj4B2n3wQMaR+TE/OB6p5NN0597R82WY0D+3mN4SR4dN
         mnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756480890; x=1757085690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IYwgECH2Vb0kFa6dag8ngSP8oduCmQ/9S3DpTHTLEQ=;
        b=rEKHTJYyvYkupC/YX8USkSFkXG9nILK6OUYnxn2FGTAWa4irwuISTfWJmYaT5VMyCH
         VSVtJv0NLUyFuQc49fkyS7dPtP9RVT56fLF9V2gRReHzbsqTZu6kSltHHtQC3sVce9cg
         cvYV/R2vWbC9Jt7WTDe9tOXjNKOf6BtT36pLK9Vlk3xgE96k3RtwAeNx0DER0KPg9/a9
         r7+nnc1krTv5/Hc0qyYIVajKwwIkoZZiLamk+WTCfs6ZD8evoUndLDJvGDpaoJZNwnp7
         O37+QNCZAe508fkV/J2+WNU5cjc7EF9q2J/+HFE7hmLVIbdu+hfLh1RKs5wvFRUlag9J
         ybyw==
X-Forwarded-Encrypted: i=1; AJvYcCWWxGNpvjrQqFkopqXtMIkZZ98Yw3/2ZSEMFjpezRcGiLC2JprWp8Va4avXMC9J4OWRw/SccTCmHoUJhI0nWp1M@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9tsMkLu4LH6ek1MsrMf0RaMax/UYJbum5REGvPy1S5QIY+idP
	9MHkAJzmpcGQ/TUsxjQ2KStAsoM4Y5rrBisWulAhgJdoXA+L/ly1Ri5H2kAHL7sk1J1sqFZ7hAa
	4cM7lgLFvqjRAPEpFSFNlhTt6g6Fa1zgCzDJl+JVFuw==
X-Gm-Gg: ASbGncu0ZcVrCk00vZ8jaKJButag8QxLwd23tX70vqaVYJ1YI9icgZxPBpUBri7TuvC
	OjyS6jGUuSd45wcBmDftMD1f4NTnQKQ+KeFmqvttXjirmLilSFtV/Ss5x7XPDfiiK/GzDdEAvgs
	jSmAV8IAyt03NcppuxjfD+Ls8ONRUF1ZNO767VeVYS1EwTaXywHmL2LoofWe6B/AufSbmIujtv0
	qnglb2jzX7na6kL
X-Google-Smtp-Source: AGHT+IGeGmVh1iUNjv0FS+p5OGgAJSDw8wtHxZUJDzpWlckzaiRoFpBbLnvjd7wozfAnhZJNzyKKXYePs5Pqdj4L88E=
X-Received: by 2002:a05:620a:a10c:b0:7ec:7a3:8376 with SMTP id
 af79cd13be357-7ec07a38426mr2536339485a.30.1756480890408; Fri, 29 Aug 2025
 08:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com> <20250825-rk3588-hdmi-cec-v3-2-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-2-95324fb22592@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:21:18 +0200
X-Gm-Features: Ac12FXytZj_E6GvxXMIzP02g9SBaLQPs3U8ehFPd5hZi21QBz_4X9pHHnSFdqno
Message-ID: <CAPj87rN55DOhWeCU1o0=rOkGbrP4M8v+a6xeB5eboLdCiJ-vzw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/bridge: dw-hdmi-qp: Fixup timer base setup
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_082131_826912_0D945C45 
X-CRM114-Status: GOOD (  13.00  )
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

Hi Cristian,

On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> @@ -1255,6 +1254,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
>                 return ERR_PTR(-ENODEV);
>         }
>
> +       if (!plat_data->ref_clk_rate) {
> +               dev_err(dev, "Missing ref_clk rate\n");
> +               return ERR_PTR(-ENODEV);
> +       }

This introduces another bisect cliff, as the Rockchip integration
isn't added until patch 5/6, meaning together with the previous patch
the driver isn't usable between patches 1-5. It would be most sensible
I think to keep a default until the users have been fixed up. But
maybe a better sequence for this series would be:
* dev_err_probe() cleanup (easy, no dependencies)
* add refclk to plat_data (populated but unused)
* use refclk instead of hardcoded frequency in bridge driver, make it mandatory
* add CEC IRQ to plat_data (populated but unused)
* add CEC support to driver, probably make it not mandatory to provide
CEC IRQ in DT since it doesn't seem required for correct operation?
* enable CEC in defconfig

Cheers,
Daniel

