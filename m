Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4015D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TU2sdGJHKvD0taxHYBsyanzPD/VqU1wUV5/5j1d0+s8=; b=E5omcX3YWEw8AtT18kkm1hyfEm
	7z2HqnYmK2NRVxtSGrSCxYUl07VtIOzaySJy2CWHnaQUV1Bx07yRw2mTzFkKNq7AOEE0D5EGjbIvL
	h4/Nhzx5Bg1Q+PG53fLZPmUHvS2cI6KOAW3FAcz87QKoAT7deB0708lsUt4hWcCes4ntzp+vBIrv6
	mHzTVapFdnElliFuy+RmPwnZbbigH+0lt7EYxrQlaDY3djsBniG1Z3Y1w70PsXrc5P20b7q0X86yF
	XorLfdOQ4xwicBmCU+A9mS0Wc+0QRTpZGePBQBNrwHrbACBcW1tEZ3BBQpnzEinmvb5FsMfcIzBkW
	U6cC1eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Mt0-0000000ANey-3Xr8;
	Mon, 28 Oct 2024 10:22:10 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MrL-0000000ANJz-3DWt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:20:29 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6e35bf59cf6so48486767b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730110826; x=1730715626; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TU2sdGJHKvD0taxHYBsyanzPD/VqU1wUV5/5j1d0+s8=;
        b=kMDXcyzCRsXQSWOtqm2n2N9F0Ag6sg4k56IWQrbhNYl+9VmD+7H1lGiGWEKXZT6icl
         EjYv/faVSsF0+Jx8eqxZejOEB+cY83k0LeVkj7aNOlMHG+S7Jbse3KpO29qXOPXve43/
         mVZlqBfrmNnStp3DhGFbhHs9n9kunu5tMQViXQjZvyQcOheP5QKkUqJm7I7hzDoriqfB
         sDBFG4vE99a8xSM4MDx2TXicMpX3dRsGhGtb6keoKiT4mMeGZhWQHa8IjjVfXod4aZm/
         YvQv8HYoFgOBi7FNNTcbKG01zRrgLR6Pe5Ib7dtFJdshJLwcbL435uiNzY26NKxfgI0T
         u8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730110826; x=1730715626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TU2sdGJHKvD0taxHYBsyanzPD/VqU1wUV5/5j1d0+s8=;
        b=ODA7Wah6iqJk+Ij3SiuqisSINQAunE4qc9DC9hhL6G9FE56PPv27/ecVcH7TQyuYYc
         WluSMajzXxmsYQ+tr/F0GI8z1tE3ZM0io9GrrU7hqQA8KPjp3IUHE2NJrf1xKOG1iAXg
         zAHGRgni/599QXABukLv9/D+9UG6WaQybjX3gl4myhc9vFoBnpS2UVbSVSxsfbtQKhfk
         oW3xnGxmOG4VWKLlZDDw3YZXJ1Sc32d2rVaSKUUw5rTBC4f51rC0Ann4eJSAzSzC9u1k
         e4+aGtQ0LIURDC6I0FZ4IF4ypirussciEQNvPit+g5iW2tgv0ViC+S9X2l/5b07w5RPR
         Bkdg==
X-Forwarded-Encrypted: i=1; AJvYcCVK6X6rCN5XjTC2qH8y6sj9lLXyn5oT+Cv4+yQ+UBfl8H9in4VXxm/byo/RSk4SBiUgvgaoOSPY0M/fhxHl1wCP@lists.infradead.org
X-Gm-Message-State: AOJu0YxFjJMVR3gvhC34ITkS8zJAToCwkJkP9ej+4qvAorKoT8cFU3xc
	Q5rPROvJygsJAxPnGlw6VtFVes+RG6hey9JjpN+OyKHr5Dv65lWKo4pptEG7Ui+73mllSk97iP5
	jW7kdXys6/lpyrivnbW0QJVrYG7mWIMEd7XaMAg==
X-Google-Smtp-Source: AGHT+IHKdCACUXqx7Rdwg/Prh7fz9WsgaRfTmIR4UCFC4hi7xMX8hmTZVx47XtOQhuApr5txecXLMxKkQJeYoI3DfdM=
X-Received: by 2002:a05:690c:6303:b0:6e3:c92c:1d57 with SMTP id
 00721157ae682-6e842f91cf4mr107258157b3.2.1730110826498; Mon, 28 Oct 2024
 03:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241028023740.19732-1-victor.liu@nxp.com>
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 12:19:50 +0200
Message-ID: <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, 
	tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_032027_832659_2DC3DF7E 
X-CRM114-Status: GOOD (  20.87  )
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

Hi,

On Mon, 28 Oct 2024 at 04:37, Liu Ying <victor.liu@nxp.com> wrote:
>
> Hi,
>
> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> function.  IT6263 product link can be found at [1].
>
> Patch 1 is a preparation patch to allow display mode of an existing
> panel to pass the added mode validation logic in patch 3.
>
> Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
> the next non-panel bridge, that is the IT6263 in this case.
>
> Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver against
> "ldb" clock so that it can filter out unsupported display modes read
> from EDID.
>
> Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support, as they
> are supported by IT6263(with LVDS data bit reversed order).
>
> Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.
>
> Patch 6 supports getting dual-link LVDS pixel order for the sink side as
> needed by IT6263 driver.
>
> Patch 7 documents jeida-30 and vesa-30 data mappings in lvds-data-mapping.yaml,
> as needed by IT6263 DT binding.
>
> Patch 8 extracts common dual-link LVDS display properties into new
> lvds-dual-ports.yaml so that IT6263 DT binding can reference it.
>
> Patch 9 adds DT binding for IT6263.
>
> Patch 10 adds IT6263 bridge driver.  Only video output is supported.
>
> Patch 11 adds DT overlays to support NXP adapter cards[2][3] with IT6263
> populated.
>
> Patch 12 enables the IT6263 bridge driver in defconfig.
>
> Patch 13 updates MAINTAINERS to add maintainer for IT6263 driver.

This has pretty complicated structure from the merging point of view.

I propose we take patches 6, 8, 9 (without 30-bit formats, they can be
dropped while applying), 11, 12 (?) and 13 through drm-misc in one
batch (once DT maintainers review the binding parts). This looks like
a minimal set, having no extra dependencies.

The second set might be 4, 5 + new patch, re-adding 30-bit formats to
IT6263 binding (no driver changes are necessary). This can go in
separately, after an Ack from media maintainers.

Of course both sets can go together if linux-media maintainers reacts
quickly and ack merging media-formats patch through drm-misc tree.

The rest of the patches don't have such strong dependencies and go in
once ready / reviewed.

WDYT?

-- 
With best wishes
Dmitry

