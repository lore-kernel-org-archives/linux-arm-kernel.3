Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AEDD74954
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 03:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9iHB+TnDUm4jF2fdOU5XWejl3GGCTCDW+b12N/hHY0=; b=UXNKAQ4kinSqFB+ReEWRZRh8B3
	C6+ROVcIUsKFxKG5/2+SSRqitBj2U0IW/7JUDJ3AQGGR993wSBxEaWQewgEZYufyyEVCRmgc6rIRT
	NDmgcwMdCcb7d2vU0pgvnKGIY0BHn80UjAZ/uCcohDzsfepQ05Sl9hOb1d2eHveSp5kFmqEQ/RRQZ
	ysra/uKqa8B+71LWMdpTR1y3SNB1/S01KNFF8Ju0VRB5I4kq1NJc8bpvrIwg8/qzFs0iaJ1mM9wNz
	zfd6UJ7CKyDGrK8Dbrb7o3ZtX/9PwfNXfLOiJL9a2Jz01XUONYjtwSOa95Z5iVKGsMZTAdS4vUt8p
	YOpJZWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zI4-0000000GanV-0cqJ;
	Wed, 30 Oct 2024 03:22:36 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zGQ-0000000GadJ-3fxs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 03:20:56 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6e5fadb5e23so55273437b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 20:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730258453; x=1730863253; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T9iHB+TnDUm4jF2fdOU5XWejl3GGCTCDW+b12N/hHY0=;
        b=blYCb1+2KFSA/haCcZixCQB2MI9OqChPquv+cyepcDoUWDL/5OaFKvW40mTXbz1zvh
         YZWBJtDwkyb+zK+B2LRP6MFo+yifVcob3k+7ONP2JFKI/GQIlwrz0zd/XYnt2k3OKxPZ
         ONflPQltVU4Di8bAAFeKBQy+Uw8bsRmqz4VDxaUm0AnSfZux2XAwsSnGXGjpvcixja5m
         ++OzMdXEAoUS6U914r7s1mR+3VDwvcVV/EQZD+7eDlgy87slBzLEE2PrYvlEpmGiEehv
         aCDiktB27FTOPTVHHcX4kDDgVJ/rnAhIt5Ybr9dJ3H8kedV64SzcVEoCXj/O/w9kAS2S
         dlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730258453; x=1730863253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9iHB+TnDUm4jF2fdOU5XWejl3GGCTCDW+b12N/hHY0=;
        b=qQQextDVGxo1zzdA4r1hrpgIH+nHLTlnyvejZTEyJs5RPcML0o1f3Lm6gdsaSeA6i1
         grsNGmDZXPGhIfGTGet7riO8Fg1L71e+M4wJFcnEGjY4Es3pSYUsYwNjY1flBBPx/IKO
         1P4mphplCGhsGTjMl3d/hC9gYgxL8L0Ntq0H0QlNWgJlQDwify8pv4Qw7lz1rvN8kqpx
         LBLxyQIG2uXn/B3r8M4p4kr8bXn9ZrY1lArp4RRPanInZZk110nRA2t2ZmUStrRtJuKN
         3lwuKEkuPoh/g2zWUXFCG0aG+ymsGm2DP2SKX7DhZ8D1yUn80XcrFCthx8tuu79TGpws
         Ghfg==
X-Forwarded-Encrypted: i=1; AJvYcCVPdknR3NpJd7y7ooCcWnAb+oaz9vzGXfK4BBonDj51+6SM1CGi9MpSUJcHxuisDgsBmj/24S/OKX+Ue9J74xom@lists.infradead.org
X-Gm-Message-State: AOJu0YwRx71QQGvTwUAQwfRNixOuaTA91nVMEBoesWu6sE34FGNpRFXR
	z/RUHrKPmzDyTpn9Wh4LnTucpZ3E5Y0iHEbSbW+QNiLmkhbIwglz5LzhxF61M8p5sHcX9kqBNYG
	FnneAj2QVRDjaGNy0ti4LIH+9PaznWWjhZgagncdUwe7AsOwB
X-Google-Smtp-Source: AGHT+IFP18Fs2tm+rkcoRcGuOjeKCtHmaRhumXjK8HFzyE2dMFMrDGTjZVI7r8/PZwnSMuCmogkovvlmIbOEJH7HW6w=
X-Received: by 2002:a05:690c:6402:b0:6e3:32e2:ecbf with SMTP id
 00721157ae682-6e9d89951a7mr151053517b3.24.1730258453510; Tue, 29 Oct 2024
 20:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241028023740.19732-1-victor.liu@nxp.com> <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
 <TY3PR01MB11346F956733032EC10E997AF864A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5ycxltnw3vhik3iype6ncuh4nelwwtom745o5dlf32qyiqh5bv@yjj5l6kb2psm> <1e8526e5-d9b7-42ac-9db3-13b42ccc4fbe@nxp.com>
In-Reply-To: <1e8526e5-d9b7-42ac-9db3-13b42ccc4fbe@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Oct 2024 05:16:30 +0200
Message-ID: <CAA8EJppAnfiVqNYN6CxaU1Q5fMwDgWhSsPU9qQz7KHb6px=grA@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
To: Liu Ying <victor.liu@nxp.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, 
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, 
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "arnd@arndb.de" <arnd@arndb.de>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"sam@ravnborg.org" <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_202054_943879_FA45F2D5 
X-CRM114-Status: GOOD (  32.34  )
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

On Tue, 29 Oct 2024 at 04:41, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 10/28/2024, Dmitry Baryshkov wrote:
> > On Mon, Oct 28, 2024 at 11:12:00AM +0000, Biju Das wrote:
> >> Hi Dmitry, Liu,
> >>
> >>> -----Original Message-----
> >>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> Sent: 28 October 2024 10:20
> >>> Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
> >>>
> >>> Hi,
> >>>
> >>> On Mon, 28 Oct 2024 at 04:37, Liu Ying <victor.liu@nxp.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> >>>> i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >>>> the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> >>>> function.  IT6263 product link can be found at [1].
> >>>>
> >>>> Patch 1 is a preparation patch to allow display mode of an existing
> >>>> panel to pass the added mode validation logic in patch 3.
> >>>>
> >>>> Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
> >>>> the next non-panel bridge, that is the IT6263 in this case.
> >>>>
> >>>> Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver
> >>>> against "ldb" clock so that it can filter out unsupported display
> >>>> modes read from EDID.
> >>>>
> >>>> Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support, as
> >>>> they are supported by IT6263(with LVDS data bit reversed order).
> >>>>
> >>>> Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.
> >>>>
> >>>> Patch 6 supports getting dual-link LVDS pixel order for the sink side
> >>>> as needed by IT6263 driver.
> >>>>
> >>>> Patch 7 documents jeida-30 and vesa-30 data mappings in
> >>>> lvds-data-mapping.yaml, as needed by IT6263 DT binding.
> >>>>
> >>>> Patch 8 extracts common dual-link LVDS display properties into new
> >>>> lvds-dual-ports.yaml so that IT6263 DT binding can reference it.
> >>>>
> >>>> Patch 9 adds DT binding for IT6263.
> >>>>
> >>>> Patch 10 adds IT6263 bridge driver.  Only video output is supported.
> >>>>
> >>>> Patch 11 adds DT overlays to support NXP adapter cards[2][3] with
> >>>> IT6263 populated.
> >>>>
> >>>> Patch 12 enables the IT6263 bridge driver in defconfig.
> >>>>
> >>>> Patch 13 updates MAINTAINERS to add maintainer for IT6263 driver.
> >>>
> >>> This has pretty complicated structure from the merging point of view.
> >>>
> >>> I propose we take patches 6, 8, 9 (without 30-bit formats, they can be dropped while applying), 11, 12
> >>> (?) and 13 through drm-misc in one batch (once DT maintainers review the binding parts). This looks
> >>> like a minimal set, having no extra dependencies.
> >>
> >>>
> >>> The second set might be 4, 5 + new patch, re-adding 30-bit formats to
> >>> IT6263 binding (no driver changes are necessary). This can go in separately, after an Ack from media
> >>> maintainers.
> >>>
> >>> Of course both sets can go together if linux-media maintainers reacts quickly and ack merging media-
> >>> formats patch through drm-misc tree.
>
> I'm fine with merging the two sets through drm-misc tree as long
> as linux-media and dri-devel maintainers accept this.  Up to them.
>
> >>>
> >>> The rest of the patches don't have such strong dependencies and go in once ready / reviewed.
> >>>
> >>> WDYT?
> >>
> >> I guess, 6,8,9(without 30-bit formats), 10, 12 and 13.
> >>
> >> 11 may have dependency on 1, 2 and 3 as it is SoC specific.
> >
> > Yes, of course, 10, not 11.
> >
> >> Then 4, 5 + new patch, re-adding 30-bit formats to IT6263 binding.
>
> I think it would be good to directly support 30-bit formats in
> IT6263 DT binding, not re-add them to it.  This way, we'll have one
> version of the binding, not two.  So, a better first set would
> contain patch 6, 7(one existing A-b from Krzysztof), 8, 9, 10, 12
> and 13.

I'm not sure that 7 can go without an ack from linux-media maintainers.

-- 
With best wishes
Dmitry

