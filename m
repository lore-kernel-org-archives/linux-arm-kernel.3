Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B8DD3176B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wL1RRdJvbyow0/4Gx8okr/VQzPzKmrgzOSUtxcyZLw0=; b=vB8ucO5o12nl2IDUfx4yJAqx/q
	By6c3KNGgAKAbb9tcBHocvgnvM8xUen2sCkExGZcK1cHgd3VIUKArh3jDdQmXAfLzJZ1NDHnZJEJr
	/J7rsD0//mleu+Ma572RbPBBda9f08QJwJLyD91Vs7WteTKz6ArIU41mLap4pnIwMHOjp7FPkN51R
	f9aayAR3Wa/KjjgmKi2MofCaP42qXFAM69xVNO2KYGHcYpkL0l815G15AZtBr+MP9/fOzp4i8jgYv
	sFCAR4SolHrZNFMHHn9Oq8tkuDks2hUHr1Ymb8CDM5E3HXOGqHPU4zlYuALl5G+TcKrYXaKpR6A3u
	hcr+iPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NSY-00000000ETR-1fvi;
	Tue, 05 Nov 2024 17:35:18 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NQo-00000000EG2-4521
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 17:33:32 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539f6e1f756so6089250e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 09:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730828009; x=1731432809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wL1RRdJvbyow0/4Gx8okr/VQzPzKmrgzOSUtxcyZLw0=;
        b=znZjJhgwV6jrurXiDYyS1GJ+FoV4/v04/dAJLghke2FtfL5uBMn9t+A1T8Qa/Mo1t4
         37u5YK0yxjHbqelR06oPgrWBaDt+KQ5T6TxOrmnFiFCKb4wqSvwQHpXUv5m+G73bH1ir
         IutkLdMJ83jsIzsjxL6+OUr66AszK6JRvGlRS/WMa41tv17AlppdbMaKSBtSANcrZ0PU
         0HV587KA/ZbZ3Mv2dtJuk+eEhxuoIubbsZiMibjLVGnQn8NR/P3Tlnrc1BB7F9Oa+9+W
         3SKqA+kh7ToIcT8zin/eUak+4MCssfRhJ8unIWP323M1PYoD3hrzUnefm3Umtp7x8C6o
         HIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730828009; x=1731432809;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wL1RRdJvbyow0/4Gx8okr/VQzPzKmrgzOSUtxcyZLw0=;
        b=nPbu8B2sbFW29d7J5cjlQ3Xp8w5egZg5YH55gQ0T/aySkBP7nMB6Pmlfsb2GsJziaj
         SXXUV/cm6bHSbednBk0LjBMqHSa3YorHoUyGCuGDeJiKYHsqOXKmpJgHX34uV6767dAl
         g7BxtNHRXBHGuWLeUgv7qfRnnFNsg4lEDdyx8lg89iptrmRVXXRzTCurJEpsOmXwmqCT
         0aMyleN+ZgGjqq3S8Y/knCDHuei1qx60YcVc0OBdDjjJUFVlkTR/S+0H49subMKPZ6Mz
         Bc1Kr8ch3OkdtYJCHQ/tPHfmgAX4lBEY0vQYT6XeJPNQl1jCzCJ1yeDQfNDmASL9dFmS
         7PYg==
X-Forwarded-Encrypted: i=1; AJvYcCWmrT/8rwasyOd3qt/JhlmC+K1C+tWk/Fo8+co+77DlQGg6klpVORptEosXkSEIZoxxo8TXEJsRNPrLbM13NW7U@lists.infradead.org
X-Gm-Message-State: AOJu0YxaD/wilVOWQndEjGsnoQnR1E9aFuG7BDV+gblrozvY7oUW2Zez
	I2gae36CyI3CpGxGmHdWMn1+q41QV18JfNuFA8/EypbtsyIq2lsW+Q9qoiGXMvI=
X-Google-Smtp-Source: AGHT+IGi18Sva7NE2bGd9ATSS1dZp0tYBcKab71BKwIRnXTz0bTETPbOkVUJ2V8gRDOK6fT7ixUiNA==
X-Received: by 2002:a05:6512:1307:b0:539:f886:31c6 with SMTP id 2adb3069b0e04-53b34a18f24mr19326836e87.38.1730828007874;
        Tue, 05 Nov 2024 09:33:27 -0800 (PST)
Received: from [127.0.0.1] (85-76-138-48-nat.elisa-mobile.fi. [85.76.138.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcbc3csm2221064e87.193.2024.11.05.09.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 09:33:26 -0800 (PST)
Date: Tue, 05 Nov 2024 17:33:21 +0000
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
CC: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
Subject: =?US-ASCII?Q?Re=3A_=28subset=29_=5BPATCH_v5_00/13=5D_Add_ITE?=
 =?US-ASCII?Q?_IT6263_LVDS_to_HDMI_converter_support?=
User-Agent: Thunderbird for Android
In-Reply-To: <20241105-secret-seriema-of-anger-7acfdf@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com> <173080602214.231309.12977765173766280536.b4-ty@linaro.org> <20241105-secret-seriema-of-anger-7acfdf@houat>
Message-ID: <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_093331_055962_15A00A51 
X-CRM114-Status: GOOD (  12.20  )
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

On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel=2Eorg> wrote=
:
>On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
>> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
>> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
>> > i=2EMX8MP EVK=2E  Combined with LVDS receiver and HDMI 1=2E4a transmi=
tter,
>> > the IT6263 supports LVDS input and HDMI 1=2E4 output by conversion
>> > function=2E  IT6263 product link can be found at [1]=2E
>> >=20
>> > Patch 1 is a preparation patch to allow display mode of an existing
>> > panel to pass the added mode validation logic in patch 3=2E
>> >=20
>> > [=2E=2E=2E]
>>=20
>> Applied to drm-misc-next, thanks!
>>=20
>> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
>>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
>
>Where's the immutable branch Laurent asked for?

The patch set has been picked up after getting an Ack from Sakari, before =
Laurent's email=2E I am sorry if I rushed it in=2E


>
>Maxime


