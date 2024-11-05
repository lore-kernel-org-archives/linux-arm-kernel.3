Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476F9D1268C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lqc3fxtDc2RwHuGGy/EVNQGz4UxO/NG1km2hGQDTiaU=; b=XV4OHesUuS/WdJCPUNtlqzyryO
	fqzB8arqRCR3msv2ZlfBq7Qau9cTrgTp5zyl14jxUL4dTYFYTn7S/2oviffMnUs/udA8iRoriwYIh
	7IrZpiy/WTqWEPZ/bsbS0LOe54yoTPvBzbewMNkHeZ7dNSOC4gN4GYWVZgHyXbneQF3d8wM0NZTVT
	Qzuh3e3E3rW9dPDj4QeduDSkucqqvdGYvKi/JSJDr8tZUP+JPChp3nfADdzIBboQl3Jn/bHVM/kIS
	Upsmnn1wkmaXaazYeYTze6UyBHYcgdl3IduoB+FcHIKODZas9OKtpq12bFyc/C6PwJAzg75aMNbjU
	MdcX+TKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Hlm-0000000GsAc-0OaQ;
	Tue, 05 Nov 2024 11:30:46 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Hk0-0000000GrnK-2Jh8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 11:28:59 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso5678029e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 03:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730806134; x=1731410934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lqc3fxtDc2RwHuGGy/EVNQGz4UxO/NG1km2hGQDTiaU=;
        b=fqkxL31iZC9dI6sM0e1liw9rIifKyGCmvjbD4+gnQsh5sOWyIlIh5lkAeiBOQ0Uouy
         765DZoWX+mjXrlGJhjl15TUd1w/HMcKxYon0t+Qx3As4W/x3FFb70nljVGys8O5x57XU
         GcyLTmwHI3kBPGgGy8ZbZphfOen7ZDEsuqS2wkQMUdVjKBBJWfV3mKbL+YlGXdIXyD+2
         3oipE9sSliGiAElW8fnKJ6OwHzawOBw8mgLIRYdt7g1OfUuAPnLsDoiIdg2Zm2lFnM+9
         uyJLb0ToV2JAoNksmA55J6fK2EAbqF5u0H5PVW5p9KCKDfnj/e85kaLtoAJkSfkrcQjW
         C9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730806134; x=1731410934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lqc3fxtDc2RwHuGGy/EVNQGz4UxO/NG1km2hGQDTiaU=;
        b=dXH9sctqiWBSqQwZmrfzXeAwz2YNFENvGHaau+JfESFnXYTwdz7brhYrYHBosWvx60
         mFsQ2KYDGPxVmrgw8KFQo4gihZ96F1B9ynOHVV+p2EQY7SFEv7wbKAtYiySJMN9hoXl/
         /iXoTuAf4Aad8hJDs6BIkspX6M2Sk+94E3ziOluV/RBSOQenunkxenxCunV5hLHUFNlY
         9z2pu4ZlFUp3+v6i2oFf8d4kZFVYO/nXbsAmtYDS4vOw1avTyApB0V0w2TgXtUub4wZc
         D19vY9A93rZYZelD907vh4CxG4z4BO6dUtFdIQhEwxykRkarMwLIoOLMB9rr3Q7Oz5Nq
         OE5g==
X-Forwarded-Encrypted: i=1; AJvYcCXsD44PfAcaWvhPiYs1oINTGHn8+csWelWV54hUHa/JMnMvrTmj5ssXOQnQ+vMDCfP4j/OLc7Z2dr3FavtirHHk@lists.infradead.org
X-Gm-Message-State: AOJu0YxMm0EXKBW5GiIMJ99fiNUtaITFrjq+2qXhl1cs4N4Uqj9ZnPX7
	Jfdjz9NluRhhI/Xms9Uhsp5qwYLL/cRLkENIh7YFYCD8l34mo1ekqCbBzU6rcWE=
X-Google-Smtp-Source: AGHT+IGazolcFL8rsDXTC+coJxYFbQY28nmJAc6aKVJwz0sBWevsWrSg6NX0J5MzQM2/Ky5L0ke0DA==
X-Received: by 2002:a05:6512:3e24:b0:539:918c:5124 with SMTP id 2adb3069b0e04-53d65df3203mr7408960e87.31.1730806134153;
        Tue, 05 Nov 2024 03:28:54 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc95957sm2098533e87.55.2024.11.05.03.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 03:28:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Liu Ying <victor.liu@nxp.com>
Cc: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_jesszhan@quicinc.com,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com,
	quic_bjorande@quicinc.com,
	geert+renesas@glider.be,
	arnd@arndb.de,
	nfraprado@collabora.com,
	thierry.reding@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	sam@ravnborg.org,
	marex@denx.de,
	biju.das.jz@bp.renesas.com
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter support
Date: Tue,  5 Nov 2024 13:28:48 +0200
Message-ID: <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_032858_005116_84C07E75 
X-CRM114-Status: GOOD (  11.90  )
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

On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> function.  IT6263 product link can be found at [1].
> 
> Patch 1 is a preparation patch to allow display mode of an existing
> panel to pass the added mode validation logic in patch 3.
> 
> [...]

Applied to drm-misc-next, thanks!

[04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
        commit: 5205b63099507a84458075c3ca7e648407e6c8cc
[05/13] drm: of: Get MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA, SPWG} LVDS data mappings
        commit: 34902c2d022f9d36b739189efae3f5fd569983fd
[06/13] drm: of: Add drm_of_lvds_get_dual_link_pixel_order_sink()
        commit: 606410292f54ef08632bdfd5c58974cf4ebc3cc9
[07/13] dt-bindings: display: lvds-data-mapping: Add 30-bit RGB pixel data mappings
        commit: e3160748780c66f32ae5e7c17373c36a4a802bc3
[08/13] dt-bindings: display: Document dual-link LVDS display common properties
        commit: 8cd4937ebfeae03a094e9115ab3286bf01498a5f
[09/13] dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
        commit: 0a86a4d1a09185cebe071136599b7da619388f7a
[10/13] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
        commit: 049723628716c7286d6265812567ef1b1ff4827e
[13/13] MAINTAINERS: Add maintainer for ITE IT6263 driver
        commit: 946f2b6a1c1383fb3a16780b425e0ddf40b3a2dd

Best regards,
-- 
With best wishes
Dmitry


