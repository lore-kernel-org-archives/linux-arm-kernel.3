Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162B4C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkqxBKG8Qf6FiNEdeYYpYgDqec2n3GJdXjk7zy/AcfA=; b=gZM03zyNSX1GvtCpQyJNOa1IcN
	oGAVkPEnx+rfdYYWy3xk37c5weLENH3rwTvWW6hV8qEr4KTiAv3Xuy4rXIYf2dVGiPPON/rJuQA5/
	O05B0nmZKpKqfj9Z1vPFQePDy6ncJGWpMiCwpHr5XpaUGJZvClk45Bane3tEODhWEDbQc/QJ+Z47S
	/d0bHa7Cf+yXH2jWaFdR/KHPThqjXHDDmcRg4T8rcxgZG7OZwgdPR+BcG7i0DI408LDY+JdjdOhnF
	VR8hDOSXp7EM17LZ7lFh4G23awdOgnDNuyaYdocOL6vG9DbrkwslK36++wdBep6WC51jWDa8cMlrD
	zyyEzkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFkK-00000002bdk-2U4J;
	Tue, 04 Mar 2025 00:02:52 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFik-00000002bRt-1PVm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:01:15 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so2687404e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741046472; x=1741651272; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nkqxBKG8Qf6FiNEdeYYpYgDqec2n3GJdXjk7zy/AcfA=;
        b=Wt1ZnJE4Zw4y4hHUzCdbsmdEKDxgTu0A/rwwRBJYgcnj053ovIJwuiuwnJ/RmRCImo
         HlqZWDdKyoOHtLVRlakN78Bnnl0CfrarAAhVhvZ4E4hP9yN0iQcePjAyRHkVHK3Zm1ZY
         wEx/x/F+7Fb0Rl415E7krYxyvwlr6Jrd4vwJ8xvt/lrk00gvfaEzjLsNxwf7PexzRKfh
         z72zVWYozH0kNt32TiKKiTwmc5eyK/JrovtyNTxaQmfJosTg329rFSJk3eB++ACJ3AqA
         uhNRnPJUtilWCEs2Gm2btejSlxO6ZmmOG8x4T0U0A7B9m4tcTrJBaLhivui3JbX8MMbF
         rkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741046472; x=1741651272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkqxBKG8Qf6FiNEdeYYpYgDqec2n3GJdXjk7zy/AcfA=;
        b=OLPy21ULh3dLpGHf1HUFDN9z0VC7KLsPsRBPCrpoA9ivyU5ga3b1Tr/0qxu2Sn8a9a
         b5vZRtS7FxaTLckI3XJgR+GdvY/I6JxW1Bm5sPsHY7fo/snR+IllysvZeXFe2KGPM9LA
         Toy1ymO/sA5ZkcufmgQy4nHbqZNegG/Lu/D/Ocs/E354hWn0cc3t7CCzoGWN7+MZl7Gs
         aHB5aDwmktVEp9MiOK1g1QSoVw1VMgOIrQnEpfFE94ix9S1WArUiy+rCIh6rHYOl8Luk
         gpXK4ClWVDsuuZdxSNvQSuMV/TaRfK+OsEIRU5jpF1FnRDMbjc+8372BdKmgv2ZzqEbS
         X1jg==
X-Forwarded-Encrypted: i=1; AJvYcCUFLUE8o8O5sLggu889r25tYs3TFzYXY1yg6y9GtX0ytavj0O943J+774RHKc9yl663bJ53jPsoF4j80bZRKmcT@lists.infradead.org
X-Gm-Message-State: AOJu0YwPo0TJqOouWZKOjxCJnNi958H2lM5lqHv/CgnhZc9k/sJb7zO0
	JNnByssVfwYkuTpsl/nMDe3npWANbOBQnq61pFbF9pANxNscT707gObul0nn94U=
X-Gm-Gg: ASbGnctVvxtYgpKU5cqZwr9BVHNFi9SDl/S1V7FfaWNwQB81IIAJMUhMiMX43AMJwd2
	UJRc+N2i7AL2SYRmXIo0GEgy8qhxZNerLL3wqhh9bjPpvDSwJLFl0xMDsqkpCQGLthQZDjhF3dA
	BSsoNPyceVq+1TgkGT6gzGtKUD4dGJ5hMj9tIHV0jtusGTOVv1PaLapuTIuXaAOZY1MC5T9vZim
	fiKpyRwK+rWyS5osGPCgVZ/8Bkm8xjuqlYwNwAhmuRoxPKmQcPhNV9rmnkRELA+Eou7bY7KRcwp
	KpLHuox8KfX52OGJG+pvJTF5dXzCswgLAOjpA5T1XBQHl8UgwFWUrU5QZdcX40hjZoeUXNwQtx2
	Swu/reooOTmtfZSQuYGlAUZLl
X-Google-Smtp-Source: AGHT+IGAn6gM1TyoFfcxy1mqC0F4XhADSkCvoUeeALC8/A3I1KfzwKl6LMwy2iUWuocM+y/26k7tHw==
X-Received: by 2002:a05:6512:234f:b0:549:6451:7ea0 with SMTP id 2adb3069b0e04-54964517fb8mr2749118e87.19.1741046471766;
        Mon, 03 Mar 2025 16:01:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443cd03dsm1427182e87.244.2025.03.03.16.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 16:01:10 -0800 (PST)
Date: Tue, 4 Mar 2025 02:01:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
Message-ID: <dn7zskhxgdgr25nvbnsjyn5brc3yoc446dxz3vqgbiwoccvlcr@5l6f4byj53fo>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
 <Z8XcH7xoDC7TA7ZC@blossom>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8XcH7xoDC7TA7ZC@blossom>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_160114_385772_0BF7B7A9 
X-CRM114-Status: GOOD (  17.00  )
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

On Mon, Mar 03, 2025 at 11:43:11AM -0500, Alyssa Rosenzweig wrote:
> > > Sasha Finkelstein (5):
> > >        dt-bindings: display: Add Apple pre-DCP display controller
> > >        drm: adp: Add Apple Display Pipe driver
> > >        drm: panel: Add a panel driver for the Summit display
> > >        arm64: dts: apple: Add touchbar screen nodes
> > >        MAINTAINERS: Add entries for touchbar display driver
> > > 
> > >   .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
> > >   .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
> > >   .../bindings/display/panel/apple,summit.yaml       |  58 ++
> > >   MAINTAINERS                                        |  16 +
> > >   arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
> > >   arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
> > >   arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
> > >   arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
> > >   drivers/gpu/drm/Kconfig                            |   2 +
> > >   drivers/gpu/drm/Makefile                           |   1 +
> > >   drivers/gpu/drm/adp/Kconfig                        |  17 +
> > >   drivers/gpu/drm/adp/Makefile                       |   5 +
> > >   drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
> > >   drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
> > >   drivers/gpu/drm/panel/Kconfig                      |   9 +
> > >   drivers/gpu/drm/panel/Makefile                     |   1 +
> > >   drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
> > >   17 files changed, 1489 insertions(+)
> > > ---
> > > base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> > > change-id: 20241124-adpdrm-25fce3dd8a71
> > > 
> > > 
> > 
> > All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?
> 
> I'm planning to do so today, just need to get dim setup first :)

Nice! As a heads up, it would be really-really nice if you can send any
kind of 'applied' message. If you are using 'dim b4-shazam', then
'b4 ty -a' might do that for you. Otherwise just a simple 'hey, applied'
email is useful enough.

-- 
With best wishes
Dmitry

