Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B1CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnJu3tNx6PFynXYk1/Woga2+QSGZXsPiestKM7hs3xI=; b=GOyiHmbJBF12EV1XdOzegOTRjx
	IdpezDVatxRoln/+0dGr/nHwG9eXoXinsU1GwxX05n2PvcDyGoEj2P2bXw5/rIGv7nWxUA89XZLTG
	3GSln3Ud74pHH+QM82REAFg2Lb1zx8RXfDThvVI0b6Gg0MPvtLztqEW30DMeGzUC/5q8SbdOcWGnR
	aVOdGk3+dBbiRc+WZ0Q8VFyEc7nMzE6/QzFceSHawpNGH3xv/B7EBYairQJtNb2zqZ/bbwv9rE8si
	ho7Fi2jz6TPNoptvVIGPb3pWtQvayGIrcVsC0XfMlMHuhNyabSQng5jslFTou2iRAfHpK5LLQfOK+
	xk4c7P9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7uC-00000009cGo-0znz;
	Mon, 16 Dec 2024 10:00:48 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7t5-00000009c0y-2ery
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 09:59:40 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3022c61557cso41282281fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 01:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734343178; x=1734947978; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FnJu3tNx6PFynXYk1/Woga2+QSGZXsPiestKM7hs3xI=;
        b=fsC+j7GAOGaI0q4NtcQphiO0AetZ0U3a8avPg2eFTO528fE3DQ6PxXeoC03g+g0nf/
         6u9qrYaZvwP++3xrxkO9klwXR2WUk6ZUcVK+wEM2B3a+06JyiY3maqCALVYoQ4gAhg/u
         6b5417mmynfC8M1PatXy3aGredVGqMi6Bg45JO3yIGh4L5Kyk4J8NhU0rf3vPlsAtMwQ
         wVXzxDfjZJjuWB5418SIzgQa9XI+HFoYQZe9kwuxif7MompV8PE/ac7s0vMx1HEK3P/L
         T2PGcLyPeCQfMjtCmPEB/ffyuIakC3Esv+L0NZEr8H0tJmq27u4HjJF56tVXbFGPXzLY
         mung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734343178; x=1734947978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnJu3tNx6PFynXYk1/Woga2+QSGZXsPiestKM7hs3xI=;
        b=pISr8p1tNeKR/M2fDW9gR2NsAwSrPxypSQlATazFb+2htpFe+kidwN/77PwyqvIaRz
         cEwFS3mvVehSc5/KFQlHNK1XqzgcSKbtnCmuzL9xXQsWUjr1pjawd1W9B6qNQk3WxMFf
         Wo/uQMLtXRsI5MQ53bIfE2cYdtf1HyOaQz5bFLnSg4KmXquGfvKdd2SMfNa9PmO1g836
         a9oqoJ4sOPMBdmbxUbOa/rO1ooyE9F7rdryBR4rYDZ5TCKLS0uq9MaosxnVMPBXcbNPg
         vsa5KHkY7fOi/SEvBuWeq267Ee8F0apWYRRYF+K7MGoGdViVLlWDUYfpCrtlxn6VBNYd
         D17w==
X-Forwarded-Encrypted: i=1; AJvYcCVzO4XnYbVtcsbeDqleY6aqhjk7zPckIKVlmfvXlfNe7LMjQSyE5ERcDiQe70FpDNli5023P1WUdyMiUYMAZdZH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd8O4/c1suLrihNY5wkBAJlIpk+Z79NSVnYDRvV1xntc2CsLl1
	zN0pdkPiaxxITcd4+lftPp2ahGp+maSBhgK03JD4tGXROtHM9ZaXLGcZc3UI+fY=
X-Gm-Gg: ASbGncuIh58UKJWW+82ndUvVZuErJixfByf/A4vN+9HUsFaW6BFl2omeHAyt/a9jE00
	DJnHZI0X3ymwNAxLIGmWlGcroR/ozOti0Xe1piH3ErCz8yzkz4KcfJpPX6PjDbvSPzZxeSp4Duj
	xGMEkSOwVqx4nqgveHXowthaE0akvsXxhI0cBi2B4Qe0Hj94prtxnJJ+aNIG5C6Mr+UV5rzpkBr
	4jglM96G2wnYCUEK61rhWQOsKcVu4beNCeQMJLtbWJvT0wk0Im7ijV7biLW8OuWjkuFTGUnpMjP
	RtwoA7N5EfmkcUmWnu1USB0aMqDbAMy0hk8d
X-Google-Smtp-Source: AGHT+IGzuyIoz4RW4zE50l9A5GROziEsvDO7/q2gt1gPF1DlZnBaj2q1Sy1bt91ZKI974j+OroEhRg==
X-Received: by 2002:a2e:a9a8:0:b0:2ff:8e69:77ef with SMTP id 38308e7fff4ca-302544230e1mr44031131fa.1.1734343177585;
        Mon, 16 Dec 2024 01:59:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a5a75sm8674571fa.99.2024.12.16.01.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 01:59:36 -0800 (PST)
Date: Mon, 16 Dec 2024 11:59:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v7 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing
 optional properties
Message-ID: <75aewnwpb6y73gqlrqmelzeia7bdar5ihm3ety5gfjaqalkuby@gwv4xjpomoit>
References: <20241216085410.1968634-1-andrej.picej@norik.com>
 <20241216085410.1968634-3-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216085410.1968634-3-andrej.picej@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_015939_729549_4D1DA7A5 
X-CRM114-Status: GOOD (  23.31  )
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

On Mon, Dec 16, 2024 at 09:54:09AM +0100, Andrej Picej wrote:
> Add a optional properties to change LVDS output voltage. This should not
> be static as this depends mainly on the connected display voltage
> requirement. We have three properties:
> - "ti,lvds-termination-ohms", which sets near end termination,
> - "ti,lvds-vod-swing-data-microvolt" and
> - "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
> output voltage for data and clock lanes. They are defined as an array
> with min and max values. The appropriate bitfield will be set if
> selected constraints can be met.
> 
> If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
> end termination will be used. Selecting only one:
> "ti,lvds-vod-swing-data-microvolt" or
> "ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
> constraint for only data/clock lanes will be met. Setting both is
> recommended.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
> Changes in v7:
> - decrement refcount of the endpoint in all error cases,
> - add spaces to improve the readability of the long if statement conditions in
> sn65dsi83_select_lvds_vod_swing.
> Changes in v6:
> - rework termination resistor logic, default is now set by resistor value, not
> reg value,
> - move setting lvds_vod_swing_conf to default value of 0x1 inside if statement
> which checks if both properties are not set
> Changes in v5:
> - specify default values in sn65dsi83_parse_lvds_endpoint,
> - move sn65dsi83_parse_lvds_endpoint for channel B up, outside if,
> Changes in v4:
> - fix typo in commit message bitfiled -> bitfield
> - use arrays (lvds_vod_swing_conf and lvds_term_conf) in private data, instead
> of separate variables for channel A/B
> - add more checks on return value of "of_property_read_u32_array"
> Changes in v3:
> - use microvolts for default array values 1000 mV -> 1000000 uV.
> Changes in v2:
> - use datasheet tables to get the proper configuration
> - since major change was done change the authorship to myself
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 145 +++++++++++++++++++++++++-
>  1 file changed, 142 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

