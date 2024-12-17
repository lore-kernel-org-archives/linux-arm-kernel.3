Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7383AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfuoU4NCeZC6i1F3LvimU1oXmmt7Zka/LPketmVAjnQ=; b=qjjv21wEFIZHY4WXMOLyE30Ga/
	Yef/cEUv3FD1s5gHYgbfnTyfFjdf+3rpL7syKhzdBJFCM8D/9/rbaJTSKFxs2WErHHIGBanP9FP1+
	sx13Ctimg2LBJjlKlTt7sE1OS4Kr3SC2irdkVEREqDu2jmT5Vraij9tDciexj9r5182IIyKfI6Dny
	i1tSRXhaBr84EjO3mLzL2Nj2SUgJ+9pQWPPK+Kuto+vOvxIdt0OR1Y3LlCzrKjrOc2bjoq6u+Ifjn
	O2QSt4GW1YEOmD0Wz4CiEmYIIlhLwj4P+npoEtlVj5r6GDd0I+PLtn9iqSR+VlRLvPKIMuNrs8inh
	KAmxkfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVR2-0000000DDTJ-0xxW;
	Tue, 17 Dec 2024 11:08:16 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVPw-0000000DDFf-2oIt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:07:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53e3a227b82so4922556e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734433627; x=1735038427; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AfuoU4NCeZC6i1F3LvimU1oXmmt7Zka/LPketmVAjnQ=;
        b=kziX2/Y5b543SW0z+aAakPe7x9zi2rl36fnJPkizrIjH5VMySJP6UsApwfl0n5n1tn
         iJ+Q6xCUcEG6+EtFtLSDv2gsNuLdlrebti/alFCcFBAyCk/TQhDchqz7QzyNtYPWJqJQ
         8dZaGZF3TtSIMKmIUXto1AueJI83wSDXjc8qsly9wPJipZuZ1yMcB2lH70kq+ZWbFxCU
         Ty37xo64b6yhDag/mQYVcpn1mFasTcl1Fc/By/1+ppT348ix2NM3xea0BFGXFwGL4UfR
         1ZogSb1p+tlHx1We3vJJwFz2E1vqDTlCejUoPDV7aQh0MHtf3rpLP+w0fYUxVsVJMK2N
         Kbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433627; x=1735038427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfuoU4NCeZC6i1F3LvimU1oXmmt7Zka/LPketmVAjnQ=;
        b=i7AP6nzoYdD6M+6jrlaIMnSkcU+/aTDpUNhLc02RLFvzHptqMpWEsDgpmcQ5hB+9B3
         zbxQKSWPw99S+F4zah3CAP5/MpRndWoQy968rNAbIMmxI2ekkiV7da6B9ZRece8SdJgp
         2iO2uIluIW65WH6xNkVGwWv9dgDAP4lfaVumdBr8Q7Fj4n0Cr9oe78OmM4NbnvF0Oj+f
         SlgGtS7xI44W6LUs1Fghzvslr9OoDH87hE28VwPRa+n3VWTFECZ456PHi2oALFrWYHsk
         4WoJ5rF50C5uHh5SzLwRT4Pfrvric0X0tGwk/tPHzWnV9M+0H4fETyrgDVcQ3D0Tf0Xy
         nxaw==
X-Forwarded-Encrypted: i=1; AJvYcCXmDCmljCxKfzd6iqr9ETJjJHJLW4cyT5Vk5tXa/tTDm1v9m7IojTOrxlAr3Mju5tFESsd2dvq8Afe9S2M81UD+@lists.infradead.org
X-Gm-Message-State: AOJu0YzkEAgHmZTdm6RrW32z1H/QIKXuZHbIkdGm+wX/9eHjKADSjbfi
	zn2oqy+gxU9S/lIaOcHv96CsU3f2ka7kceySCHgM+Ch34Va/aLcs4JM+Cu3xqO4=
X-Gm-Gg: ASbGnctYqwn2ewgPMnFDDIDWEOdQAmSYlM3WKNKyU7rqhEy5F/iatflVogHiODrc2X8
	p935gH594mfPSS6T3N25F6Mq4c/bq8fyVPRLvOwU4lugfCsshKa1oMltcxnCBmiMriILeZ/+lyg
	Apx5JI44uZBDHZm5udq0d+0Rb1lr38J5kd5z9E079s09BLGdQIJJU2MvF0HCaIIQOXOeROE42ot
	SYBbdpMNiF9Q1Zyqpx8yBJLPJqd4nU9IkXLEeSzq12SJu+XvCYX7nA7g1iIHzUsjXdCy0W9fSO6
	TMjPFtsOSplnD9jbRD2vA201T5VwCQ5q+hc7
X-Google-Smtp-Source: AGHT+IGORYjhudTQdAvMdm8g3LCUxmZy1h6j52DQHamk5YqQ8TrNPXiGHtV+PtxV/2H4doZcZuIeCQ==
X-Received: by 2002:a05:6512:2392:b0:540:20eb:80c5 with SMTP id 2adb3069b0e04-540905a6f84mr5483487e87.37.1734433626614;
        Tue, 17 Dec 2024 03:07:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c13d69sm1118592e87.217.2024.12.17.03.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:07:05 -0800 (PST)
Date: Tue, 17 Dec 2024 13:07:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, mripard@kernel.org, 
	kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
	alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v20 1/9] soc: cadence: Create helper functions for
 Cadence MHDP
Message-ID: <rew4x4qxemig7rq4kossrn7cybihrgsizh43wnllgv2daf75gm@ziqsakm7gm56>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <7fd5d54e2594aadd66598888ddf512f3d6d30e5d.1734340233.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fd5d54e2594aadd66598888ddf512f3d6d30e5d.1734340233.git.Sandor.yu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_030708_718719_0E32B4EC 
X-CRM114-Status: GOOD (  22.34  )
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

On Tue, Dec 17, 2024 at 02:51:43PM +0800, Sandor Yu wrote:
> Cadence MHDP IP includes a firmware. Driver and firmware communicate
> through a mailbox. The basic mailbox access functions in this patch
> are derived from the DRM bridge MHDP8546 driver.
> New mailbox access functions have been created based on different mailbox
> return values and security types, making them reusable across different
> MHDP driver versions and SOCs.
> 
> These helper fucntions will be reused in both the DRM bridge driver MDHP8501
> and the i.MX8MQ HDPTX PHY driver.
> 
> Six mailbox access helper functions are introduced.
> Three for non-secure mailbox access:
>  - cdns_mhdp_mailbox_send()
>  - cdns_mhdp_mailbox_send_recv()
>  - cdns_mhdp_mailbox_send_recv_multi()
> The other three for secure mailbox access:
>  - cdns_mhdp_secure_mailbox_send()
>  - cdns_mhdp_secure_mailbox_send_recv()
>  - cdns_mhdp_secure_mailbox_send_recv_multi()
> 
> All MHDP commands that need to be passed through the mailbox
> should be rewritten using these new helper functions.
> 
> The register read/write and DP DPCD read/write command functions
> are also included in this new helper driver.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v19->v20:
> - new patch in v20.
>   The patch split from Patch #1 in v19 and move to a new folder drivers/soc/cadence

It makes it harder to review, but granted that we have already past
that, I think it's fine.

> 
> diff --git a/drivers/soc/cadence/Kconfig b/drivers/soc/cadence/Kconfig
> new file mode 100644
> index 0000000000000..b668790660fa5
> --- /dev/null
> +++ b/drivers/soc/cadence/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config CDNS_MHDP_HELPER
> +	tristate "Cadence MHDP Helper driver"

This symbol isn't supposed to be selected by the user. Please leave just
tristate without the menu entry text (the help text is fine, please keep
it).

LGTM otherwise.

> +	help
> +	  Enable Cadence MHDP helpers for mailbox, HDMI and DP.
> +	  This driver provides a foundational layer of mailbox communication for
> +	  various Cadence MHDP IP implementations, such as HDMI and DisplayPort.
> +

-- 
With best wishes
Dmitry

