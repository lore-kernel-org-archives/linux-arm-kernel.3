Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1A5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 11:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYia6bkOtOvm8zyMUkFTLmAVFFk1rfM5TLia+8wKurw=; b=irN2K5PCQXRoK+XNZ0SODrLJGA
	o3cRTgXic+B0AcJjPyX/dtO2i7/sO4k/QWImGWKR+a3aovywBAKbbkpNZaSXfscgz3Jei7PBUwGYc
	urKEQ2f93eidStOIoLcrIRpNAEcm/qCQy61xdxq3mo5CKxZVSspewMFgJqoDEBIThcxfa/2GCO35z
	lXj8jZJ3shAKjg9ZeS+GGwEgQ2sm9rXhh/TyJEm8Gf6FHXe5yA5zSrgMKRMOgsoGAYIwOGUEC/fbs
	R0so+tYhSS5Da2EvXf/Y4DlxbM4Ab1fL0cBx3nHC2yGa2wFiBW58OmDTybxDAg1maO3eVkkJnaprv
	XM8g4MbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVS4-0000000DDbE-3drk;
	Tue, 17 Dec 2024 11:09:20 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVQd-0000000DDNL-1O0G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:07:52 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-540215984f0so5825354e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734433670; x=1735038470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYia6bkOtOvm8zyMUkFTLmAVFFk1rfM5TLia+8wKurw=;
        b=wSof8217BsqzVb5riG2K6d4IU6K73Z5HH+NjVtDoHaGw0HjZjeMK6lu+4dURJ/lXlB
         f5UvtIcGKZlVIAUg/1VEmlUiAdDKNyh3CqHBZJ0SSR6xqLO2u7XHUksa4yBMHOw/0VGh
         T+He5iKRTzRzllC88tSVK6MrhgfZPin/UD7aABVvdMmADd6isPg6w9fZZgnaT5g+JVVd
         xutdx6hPxSZTFv6LGjpwDo7+OdUWr7hCgbCUyZtC178ojF9LHmHJhU3UY1R/Vg6o1iGm
         vdI2Fwrb8I/dG0XQ4Pq/M+P1dUDfQi6ONBCbY9UTovhBSM0ZlxZJqPLLhssuEgg9xgaL
         mpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433670; x=1735038470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYia6bkOtOvm8zyMUkFTLmAVFFk1rfM5TLia+8wKurw=;
        b=ohbwsb6vsv2G1kRHSUNNiC7z28Bu9jqJOOTWfM09o+ZmKglbe5ONDnaE4D7A2KY1yV
         CYMe3DS5SaZom6/B6VO7lbNG8Sek0GwuUyv/7BhOoflJKtwFnvskYhibgaB1zPRkwRLw
         Ezjwq75sCSZst1kPJoFc8v/jRZFU1/Q/uGXc0DU+v5+2K2BQ4dJTKvfha9X/dScMkfMt
         srLPMM5DB2zH8bYyXgeHiAiMwq2GSRq5o8d85vWId1tLM/PNlhNEz0WPun80bg5pd8Uv
         cS7shk363VHCkT6S2kLm76L2AO6dthOu/USMv3/TDrIaMEF2D+PuIPL9OVSMQE2DggIZ
         yzBA==
X-Forwarded-Encrypted: i=1; AJvYcCUvtHVcSeUubLj/jX5JPIPm3nFxswHT3yhujJWSkQTWLJSp/moRSf9xbEGtpeEyjGa1JfHAPC4fOAEocIC/CyN/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/WKj/fAUtbb8tHvYNgvV3hHHSjmmHrVQkhnltevp9An7Bw8Xi
	8lNLCpqnxfuufPR7a0DK1H4OQNFQXcls4vos1TtT0MSPTETf2R7sL/7rbXe/5Vc=
X-Gm-Gg: ASbGncsHRZe96BwoneRNV896N2x6h93M/eA8t0VER1o7Bbk4fj3STZNznMo5PihOOA0
	ZUtLXtSadkvQ06ZUHJdjE2I2erEzUBu6ul4SzMb8JkBjm+lEaU6Ez7sDm43a+aiRFvQaffVlK3+
	gouF3aH590+0Fc3e4/UGCCTwQs2OiqQ2VSlI1pWQsotwcZkG7JqK7NujiHw2Lv5sMH9MWZrJkYU
	juVHlaH+UafyL0U/u4FrO2nwatkgEU8yX+1+uEmlKKAOSX/LlFgIIAGXVrz5KWCvEz2oJWt4ITd
	5tppKubRKWrDuUT6mBXf/NqlWaILMuUS6Usl
X-Google-Smtp-Source: AGHT+IF9wRRafyTuXG62lAlU9PV2hBrxozyuUj5pTu0s/yHqf/P45mfDC//C58CWkkxQbTLd1cCzgA==
X-Received: by 2002:a05:6512:4012:b0:53f:22f5:afdb with SMTP id 2adb3069b0e04-540905958a8mr5350614e87.35.1734433669649;
        Tue, 17 Dec 2024 03:07:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9db5sm1122725e87.88.2024.12.17.03.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:07:48 -0800 (PST)
Date: Tue, 17 Dec 2024 13:07:45 +0200
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
Subject: Re: [PATCH v20 2/9] drm: bridge: cadence: Update mhdp8546 mailbox
 access functions
Message-ID: <z4cmwy6vh6nncq445hvm23n4ar4quciemvcj5zvofevulyofx6@w266vucwqv7s>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <74bc3f2ff56348afd9d773589236ddf06dc3d45c.1734340233.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74bc3f2ff56348afd9d773589236ddf06dc3d45c.1734340233.git.Sandor.yu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_030751_374584_28D0207D 
X-CRM114-Status: GOOD (  14.84  )
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

On Tue, Dec 17, 2024 at 02:51:44PM +0800, Sandor Yu wrote:
> Basic mailbox access functions are removed, they are replaced by
> mailbox helper functions:
> - cdns_mhdp_mailbox_send()
> - cdns_mhdp_mailbox_send_recv()
> - cdns_mhdp_mailbox_send_recv_multi()
> - cdns_mhdp_secure_mailbox_send()
> - cdns_mhdp_secure_mailbox_send_recv()
> - cdns_mhdp_secure_mailbox_send_recv_multi()
> 
> All MHDP commands that need to be passed through the mailbox
> have been rewritten using these new helper functions.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v19->v20:
> - remove mhdp helper functions from the patch.
> 
> v18->v19:
> - Use guard(mutex)
> - Add kerneldocs for all new APIs.
> - Detail comments for mailbox access specific case.
> - Remove cdns_mhdp_dp_reg_write() because it is not needed by driver now.
> 
> v17->v18:
> - Create three ordinary mailbox access APIs
>     cdns_mhdp_mailbox_send
>     cdns_mhdp_mailbox_send_recv
>     cdns_mhdp_mailbox_send_recv_multi
> - Create three secure mailbox access APIs
>     cdns_mhdp_secure_mailbox_send
>     cdns_mhdp_secure_mailbox_send_recv
>     cdns_mhdp_secure_mailbox_send_recv_multi
> - MHDP8546 DP and HDCP commands that need access mailbox are rewrited
>   with above 6 API functions.
> 
> v16->v17:
> - Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
> 
> v12->v16:
>  *No change.
> 
>  drivers/gpu/drm/bridge/cadence/Kconfig        |   1 +
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 487 +++---------------
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  47 +-
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 212 +-------
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  18 +-
>  5 files changed, 104 insertions(+), 661 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

