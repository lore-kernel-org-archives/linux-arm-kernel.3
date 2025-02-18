Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039D7C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 03:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSCxueoLHB/txHVHiuPd/+UkwH+GSWwoHHKB59+DFlU=; b=y47mOSy9Klr7F/FaJUziqI7EtU
	eQZEHD3jQkG4cLDJL+ub+fM0h4TOhLVzEVYhTpaK3+2xc/sYTojg97Ln67Nvx6ly1KRAohiZ/4Y2J
	G16QJvzNOTSK4xZgijjv00pbU2qd0gbpr/ttv+O+mpF+G2d+ijc6ujc+0ibFPWpvZIbNNFsszVxhR
	o61p5KGFVmgSLm7lWDRmxE/TLDRMIySHHqvK/xRNC+tNevm2+D5Dxu1Q+vBADC5XaruTZwrNbVfkV
	XIC0BzrAA//Mc4xnlS+LkbjeUAmkHmsMElnEcfM/mAaYF+aBbRzHZQriM8j6I9sIixLzoytPYKLw8
	CxmScyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkEHg-00000006cLh-2Pvt;
	Tue, 18 Feb 2025 03:28:32 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkEGC-00000006cBH-2NhD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 03:27:02 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-545fed4642aso2242361e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 19:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739849218; x=1740454018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSCxueoLHB/txHVHiuPd/+UkwH+GSWwoHHKB59+DFlU=;
        b=sGOzP7BF6xHNxCEJ3GWnLxILiyjm4LH2P0k/iMquvdcDG+avO65+lAJdkqAqgwlM2c
         oojW4EvDLbLOJ+qmyLpvV75Y7Y5D/8effzyRd/QLKaNqwhhOU1ooadcne8iPIBcT55YF
         aufjfIb/hlHTCV/qBEr2ip6QM8fwqXMySdb8VIixCeB8SSlnFmJNRmeOSimYNvpAQH6K
         GbT364bmyNZVNOSqb9bafaoZXXFZsfFiBHh8vt/0KgsqRoPJDu3FIs+jgqf/wSeHM36W
         3YuUmJl2RnC2HVh5rjuriDV1k8SGwI9igNQ0RCBmr0nC88HrdvbM7x5WESotZ6rvWSOL
         mFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739849218; x=1740454018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSCxueoLHB/txHVHiuPd/+UkwH+GSWwoHHKB59+DFlU=;
        b=oKtEOx0CUhnT65p8CRSp+kakvbkiZiYbNkPPyDTC+morO9O8F7etKQuqhHjrwvGfmz
         DoEKkSzaLb7vcwWhe93XgGHBR2migPSMQz5sLox1FJtTQOQXDChIxPeNjUS91ssXj67C
         Oi0ii8M9pnimpJpQ5k9IkqOU8Ag925Ixq2byMvf+9taSMQX/CDD3ZjZXGNXpt35if84C
         5eCJQGt9f6/TY9D57uw038pmfr+fhBQJLL8IJUFcVwhnfBNB31x+LNM4Zbs7gswHjAux
         JHBASB49gvS5cNf/tBPS35GZWsDy2NfTtn0l71huew40qwmod1zYKb417EYl68M0R2KT
         ALsA==
X-Forwarded-Encrypted: i=1; AJvYcCVZROwNNt9GIY14E6u1fPjLC8gJ54OESv2bPq6iME03uAR8KsusCsVdN+Ob5Dbrw+8FhihE3+wz0lfCFOZVipi9@lists.infradead.org
X-Gm-Message-State: AOJu0YzjRc5cyQ2VlgUUKZCn833XUzqNKuanPRMd1ojFtR2obznq2Cdm
	Ct1w33SZAscARpNfhydJONAXAcBkysGHUAOcMIUxhG9Qt9ReKqU/krnw3SDXTvA=
X-Gm-Gg: ASbGnctm1yFNAkRc2XU8t73bZsZbBvrg8DgFRVECzy8Wy6NuIPhcjFIibnIyIPaqh8R
	0WtEbGJIhrKRJHXDbIbQWWex8SNTLc1/IDAV6NtE1SbvtqGUirUQ/p4tQb4QgBKVv0badJvsUZG
	nrwArgDIM9LL2nPCINGBHmhmXr22N7LN/480yvR2POlMITb7RY9QxBcUnxDICzsPviWr8buKjTy
	Qko04wtdo1xid3Tq/JOZot5PTpWWYr4S32Z/z3Q5aLvCTZwcaBRNewXhP6u8KLc0OoO1UdpV6WW
	dtiqCdv81H3FCR87eBjtVvR5xl5O+tD3x9PVsj/bKS939JsMzKBAdHiYiS7visye/mgToxQ=
X-Google-Smtp-Source: AGHT+IEuXEdpqn4is6TUxaE/+JLqNClWKujDuBTB2tz6Yn1fQEc4M1pLzGsmXbDamEwCBtvEsM8kFA==
X-Received: by 2002:a05:6512:2342:b0:545:f4b:ed58 with SMTP id 2adb3069b0e04-5452fe47777mr4001491e87.18.1739849218533;
        Mon, 17 Feb 2025 19:26:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54595e38064sm980129e87.126.2025.02.17.19.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 19:26:57 -0800 (PST)
Date: Tue, 18 Feb 2025 05:26:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, 
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Message-ID: <naw67daoyb2lfmq4jovlwanz5niaolptwnug3c3kkrtlfoh6dd@trkctqyzvtb5>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
 <bdpw2g65uor77tijlhpabodog7haqvdcemnr3wzqkooerzuib5@hfdn5zsrbkgg>
 <7674314f-d95a-433a-81d2-ca78bc199359@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7674314f-d95a-433a-81d2-ca78bc199359@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_192700_612416_185E34F1 
X-CRM114-Status: GOOD (  16.74  )
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

On Mon, Feb 17, 2025 at 10:27:56PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 17/02/2025 22:15, Dmitry Baryshkov wrote:
> > On Wed, Feb 12, 2025 at 04:56:10PM +0200, Tomi Valkeinen wrote:
> > > Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
> > > container.
> > 
> > Is there a more common name for this format? Otherwise googling for it
> > reveals only your series.
> 
> In the cover letter I mention the gstreamer names where available (this
> particular format is not in gstreamer). AMD has these in their zynqmp
> documentation (https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/Video-Packer-Format).
> 
> XVUY2101010 is YUV444_10BPC in AMD docs.
> 
> X403 is Y444_10LE32 in gstreamer, and YV24_10BPC in AMD docs.
> 
> I'm not sure you'll have much more luck googling with those names, though
> =).

I'm asking, because include/uapi/drm/drm_fourcc.h has a pretty explicit
waiver: GL, Vulkan or other open standards. Otherwise normal
requirements apply and it's required to have an open-source usespace
implementation, etc.

-- 
With best wishes
Dmitry

