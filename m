Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A484D1268C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 11:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbPFk8wJiQvrTCXjlYgvumUQ0j3KXfVkR1pWzQFIBYw=; b=rgU48qnd5p2qNtVMUt693OtDQK
	Xs+u6onJG5sYwtEgylHO/pZt3NjwwiKqgg/GOIKaeYjBXHEbR0Dn779MCN93m8/J+4MXZaYG37d3n
	HyYb4jbWJY/eWJenwDdeKhmF7vC1jMAhKYheLeHhooaZfTARObk8RWVhLKcSrL65Ob/yX4b9cv8IE
	QbM3KYMyoZ4cx1uinySE9NWGUYiRWc+LTyvghNuLkZqkgo8KQJKqo7WjAIUTihRIFP7TBX0WL5ZCM
	pCgpgFdc6THrmim/fSje43/sq0QjNgo4DZ5GKpRLx6oFMInTW4SwYKXoqb6Cf6Iy8eEdtkYMgatun
	S2qbYGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HjM-0000000Gran-3xm5;
	Tue, 05 Nov 2024 11:28:17 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Hhd-0000000Gr8e-2AHR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 11:26:30 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e30eca40c44so4713978276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 03:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730805987; x=1731410787; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbPFk8wJiQvrTCXjlYgvumUQ0j3KXfVkR1pWzQFIBYw=;
        b=LOr4YH1g4+l7Y59kzEsh1AVHtsUzJDVu87uABHlFdNqqZvOGCYZkDBFiCJMlE3SDLM
         2xKVZtjJfSNMEftbTvayCDp3KagCgXJxQAAF5w6gaZMMClGHFsoz9qHD5L3EGRxkmizm
         JSdzJ2IqFGeiYDGDb7q3nUHFP5NU4avZhrAPkZ2IExW77Mu+8MrB+gAt4Ph3IC8W7mJ+
         GDoZVsWFcJuDfd2Jfr+lobgWyuzShEgNvXFI1D1gMb0ptc6T4id+aPu97eMZh/TagYYn
         7K0dMsNMfuK9Kbpj8iojl+E7/wiKhhQB9Nor4Bo7I1j79JkWuKz0QNHhJ2qnu/CZnT2r
         87dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805987; x=1731410787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbPFk8wJiQvrTCXjlYgvumUQ0j3KXfVkR1pWzQFIBYw=;
        b=GhjyTKKXs1jhpwqmSzTCP9eIykzoo6YNPy0baW648KAJ1MoOiC5xsYt/Lk1DBqYrE+
         VrhhGpJrXBv2xRPReTtXVglhmBtOpMnwPzYgLhvvuXXpjUrPRQVZa+hcRycuB6+Fpbvw
         y2UGne5CBFdfOnqy4p843eh4AOLpRGN5unhCGQPIsfx4JidDj1vX4VFXts+H5W1D88sU
         mynykG9mGKNMyF/UYJchnjQvHSWsc2StAEwMUp3Ie31Yu6epnKnWxaWNOa0zX/uGmXjj
         euRMvPDnPNCn2FCeGvZCBuKgxis3jj9j7aYGtHTRaqJ/+3ze8wPuhvVm5VHmQQz2ney/
         G8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXUSiucOogVMw7wIddeYTvWwuFtCl1E+ufOxKtgNl8MXiaXel3mQbbTMsyNlKUG5z+yyj8qpaq0MEH4mwJH8YgT@lists.infradead.org
X-Gm-Message-State: AOJu0YyEPpnykEtBoA0HBDpDFl2hQ4W3YLZv4GEOiUr3L9n6o8Jd3W2Y
	/uodSYPRd0FfBFT0tSbjblOYLGd1ZO7kUbCrfHmAQDNZiplCFXjW49lVEpYAhFu4K/tstj3Duws
	9PHjpP49ranT7LXRieg78pu7/gNfbql4l/StoaQ==
X-Google-Smtp-Source: AGHT+IHwht1pfSwQlaqWWbyXJaYST2v470nqEkV0Y3tMwYWqipVeiUaNoITHKiBik6whym2zw0rsn51UBBneR8aGa1Y=
X-Received: by 2002:a05:690c:fd0:b0:6ea:8d6f:b1bf with SMTP id
 00721157ae682-6ea8d6fb48amr78680707b3.0.1730805987251; Tue, 05 Nov 2024
 03:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20241028023740.19732-1-victor.liu@nxp.com> <20241028023740.19732-5-victor.liu@nxp.com>
 <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
In-Reply-To: <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Nov 2024 11:26:16 +0000
Message-ID: <CAA8EJpoaLnw46DUaZ+z-YSkbdk-f45-dKMjoQWu16zaC6i-H-w@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,
 JEIDA}
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, 
	nfraprado@collabora.com, thierry.reding@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de, 
	biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_032629_573795_E71A6117 
X-CRM114-Status: GOOD (  11.20  )
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

On Tue, 5 Nov 2024 at 10:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ying,
>
> On Mon, Oct 28, 2024 at 10:37:31AM +0800, Liu Ying wrote:
> > Add two media bus formats that identify 30-bit RGB pixels transmitted
> > by a LVDS link with five differential data pairs, serialized into 7
> > time slots, using standard SPWG/VESA or JEIDA data mapping.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> It's fine to merge this via another tree, too.

Thank you!


-- 
With best wishes
Dmitry

