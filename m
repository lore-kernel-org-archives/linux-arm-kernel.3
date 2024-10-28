Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1400D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMxl3S3T78M4ZDclpZfWNpG18/6HovRsXKrq1tEEQMc=; b=ObTYTftbJRsymWx/DZciG0kc1w
	pRbYrA9ta+YFV3us7bbHbvpIH3tcg1yqpdu1La+WiELNGKVius0MrZPyspJtghw1qZCIdntwPU5K4
	+I4dUsrCndu8C6MTEmjcB5ftacWawLmHcWM7hFk0EHMP7Zy8vV/Tfg6SnWrqY9iJRUdNyufiy1ecq
	fzc68Xxf01afssaupURzjFUSBbQgokNvBwAH8u6zbgf7nzEzMeBmY0QSCEAo+3sMnf2pkUVYv/Gru
	8JASeb5qYmMkjg+ibsEEOV8MObdJgi8aJISQZgDQHtfg/d7DWvmPtuvECS+YTYZOY1uKBav56AnIO
	nl8wybaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MGs-0000000AGzd-4BuA;
	Mon, 28 Oct 2024 09:42:47 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5LwF-0000000ADPy-1t5s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:21:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539d9fffea1so3769839e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730107286; x=1730712086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMxl3S3T78M4ZDclpZfWNpG18/6HovRsXKrq1tEEQMc=;
        b=fXU7QvsVIC/r0wuzlneEYZMWtC4ebWIDitnxQH7KizdPJRiVxX2vlxPOXMZfBTQe67
         O3PXzwxsE/zR2oP+8HAIhLBjfPPjyctASJSL1TsP+JfzOxZq0DUyNjIiToTOuj4TRwdq
         1w+E6OPm2bfOUBhugrWEZuG/BfftZRM0+qh+8zKbEjWvQ8q5ey2b1Qx9f2wanILZ6dGg
         NhlA087/pmP3rtsiFyLNp48HST5pHXIXyhSgV+j+YDFuKlLGs9vNDAoK2ZoI7uHlDD6o
         jpL/IpNnVP5oGqPH1NPHK0/xhHvmX5YMH9obeLkZ1F4Dz1FakiVniCpTbPrPOZNerQ4O
         Gt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107286; x=1730712086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMxl3S3T78M4ZDclpZfWNpG18/6HovRsXKrq1tEEQMc=;
        b=mErdhVrCSnclzY/wlgRj551a5C79F2W1DsPe0X4ue4FiL5MmxM6Xi6PtEeC7MiVLpR
         M8M5rY/frOGrcnKy1hpcWIp0OM1mUM6eCMY2UgdEx2ApVJrGjIGTi2vnN0dvBmVTTuQ0
         vijz7do7LuDhlRZUiI+bJUQCnbMZUIR71o2BsaPuNOLM23x+yXQVecJ8XIOolLDG9TW9
         vP/1Mk00UXUKT26QkalN9E3vHJhpY48nNsPlr02z0gxnWCB01CxtsH2HNHfnVhv4IpWA
         40ZSxYbpsMapo+FFh+Ebkmelr7cBrzdcxXa0cuo/oWnheINPTzY2kV4KwzctskCPK/YQ
         1/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVetAWVLZDZCDPHGMyCKWhY6zvlf6TYvc0hy7rSCZBxVBQ5G55Or9uAfCMkk1v4gZWF8d3WGXdZyFqi/VETPLBU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0b/WBAVwV3CNKKU+HY2hntHu0s1z1ixkygPC8ozU7mMcdRGNG
	HO6KAozL5DN+UB7nv3KBlR5HbZ5GJtFbsjq0RF2h7lZA4dyoJkEHtDZZUhrwguI=
X-Google-Smtp-Source: AGHT+IFLri/jKsB1rbBwLcG+4d/hkJZCTM08WJqeMH6Xd736MsKNNG7MWeqbuGnrpaHJPvqDTjFhqw==
X-Received: by 2002:a05:6512:2256:b0:539:edea:9ed9 with SMTP id 2adb3069b0e04-53b348ec028mr2877777e87.1.1730107285683;
        Mon, 28 Oct 2024 02:21:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9ecasm1026060e87.218.2024.10.28.02.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:21:25 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:21:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 13/13] MAINTAINERS: Add maintainer for ITE IT6263
 driver
Message-ID: <izlahf3rnobapkvaxvq2lpyz6vsurdhkhnigzogstljpupn37x@3a7ziz63n2zt>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-14-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-14-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022127_513059_BFA4B5A0 
X-CRM114-Status: GOOD (  10.59  )
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

On Mon, Oct 28, 2024 at 10:37:40AM +0800, Liu Ying wrote:
> Add myself as the maintainer of ITE IT6263 LVDS TO HDMI BRIDGE DRIVER.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4:
> * No change.
> 
> v3:
> * No change.
> 
> v2:
> * New patch.  (Maxime)
> 
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

