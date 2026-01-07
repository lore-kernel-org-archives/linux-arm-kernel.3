Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E959CF6BF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhnBpr7196+FOJUvDq4alYkgMDcX0xTE5ToCjAvUb4M=; b=qUrj2ZkqU4XpU4D/80Sm3Fk7xm
	urMrJpwBy9SCySnP6/w/akeBHG9txtEqdEeU5beY2PIuLpHkSViRv7clZ6Q1DMts37qVx6ZXm130+
	umBtnP9KLtnPYtfYLEdnFTy5FqypJIw6vtYuYFKdr4z9e9bc6au6Eh8flMSl0iCa514r7T40MdK3m
	nHDKB0TZI12whrUKm0sGJed3l1zgM5kFuEHf8nBK8wHTKDU62c5igmJFQN1F5kFc3A8yK/FaXVTVm
	AGE8sSBVLN+SCpXxZjOr1LjnwkdPA09zzTPLYNFePLZNPAyOlOKp9GMy9lBuO4Pa+Y67V+RIpuXxx
	yNveGwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOTR-0000000ELSC-2WaV;
	Wed, 07 Jan 2026 08:00:57 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOTP-0000000ELRR-3wIs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:00:57 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59b6f52eea8so431709e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 00:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767772852; x=1768377652; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VhnBpr7196+FOJUvDq4alYkgMDcX0xTE5ToCjAvUb4M=;
        b=mQA7tmp3Gz1r0LROzZZclJW/QroOuaJh+xUF/1ENKsPxobBZr5iY5QEQqC9rblrSIv
         nt0xD1DtIjTf+dASMBZJKj1Jibj9uuPPn3ZbPLzrn5NPkC8q+CKqs/0QwJ36mslEguYY
         XFpSwwy0NQrgQ+8QKFFSlcNEhVD8Svnzff+eX3rv8tRdbKCK2Z5jFhGZ25v4LYVR6441
         qjj3OZvhO0DFVQrijHrdxu2Hx65IPxk77IZgo0ZD1sgMN9XEjraZcg+V0/Mv1yMyJ7Z1
         JFZT2Nq8mAsZbAL5OU4C7Xs/aHl/9sOt760kCtK++sFQGHSM0MdRcNtze1drbH59jBq9
         LULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767772852; x=1768377652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhnBpr7196+FOJUvDq4alYkgMDcX0xTE5ToCjAvUb4M=;
        b=Jt5zP8+X1ilcv32GjBrJThnSKMCb5u+Cww7NnSLDjjEuPIrRekRz8NMoBjtT2w3NRR
         HKkSNoj1Lm+rg/bEhj0ht5HSbtpfmh5I6VupaYipNOp8UPpjDVTtTdv50QrQMAmmhq16
         70sG2eLmHWld9kjVB/xNTJUCFB6f0+9dz4V43l/A0kQXmAhn0puErC5UzJHS+0UVT1qn
         vZ03N1orHf91tzpm7fbaZuB3/FyzpFIIbaZbgfmPedgGuuH9ce+ccbJ3KmSNHnJSVi99
         XJXSu6ptXwyZdx/oXZjH2qGWDpNFKNy26h25DLXjwzip6pwjkxboX9gMjJ38wXdBptov
         hw/w==
X-Forwarded-Encrypted: i=1; AJvYcCW/6ANnX6cEhCgBITew4dsVkTE6gpgWd4tOST+I/6JMuN80xeMxOQ8IOoE8NLaZTJQLaJEW2PDvVg9+Y8EBWfkQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzUp56e8LdvaijQfwG+konN4Xu2sevX05mDJdCPuaR2wlruaav+
	wS5WgfVoq835Uj5Lemi34qJAIj7ecjjLtJ9FV+UzdFPVK/ZroXo39ym9Yj3R7lHEz7s=
X-Gm-Gg: AY/fxX66NAdgm8vjYzp5PgfR8R7EGURQ00Mf/MxOQ+eQ0ZHv52y5RynhGtwdHqCDh+R
	c4S2I0Kx7tJBBaLD/1kP+tPU9CT5HSV/odwEV9/Cm/vF2KaNplHa3JY7S/BUlS5pAYBZ1YT5ieh
	eMf+5gnFi5HZFMA51eVKeqh/SSsbXRM3WQAwPBh3Q2tK7IP13o5ZlXMe10vuzq8006mJP5m0Jpz
	ijJ1NHMOiWZZD9lQA2uVEl5kObkPBBdKZFA7eQYTeSzVpXhXqCQw2zUAmWWVizd+OhbZIRnZb5y
	2L2YZlOgRg/mYVlFNJ884HUO4vLmNPYOGGxlXp3QiDLBoQ9HD9Zqp57IkpNfBdU8LlqxSOlGnD+
	Izy1MqWyNsRAtckeacqPqgqveko3CS/N/WXjETSMt/XprRcEUNC/FoNWJ0takgYJiRkbYzlEtto
	pmuHuCyREdMUjELKugb6O1Tgp8SQc6l0+g44tK7RJHc2zt1jlWtSjPTVA=
X-Google-Smtp-Source: AGHT+IGP9An1nYsAtOO925vmyDQ8zlULnKIWzpU5EiZN7i69pmtbFARTzBugqgf6PV60tIxYNMlI5A==
X-Received: by 2002:a05:6512:131e:b0:59b:2670:aa5 with SMTP id 2adb3069b0e04-59b6f0420c0mr461240e87.37.1767772851534;
        Wed, 07 Jan 2026 00:00:51 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea814sm1150596e87.12.2026.01.07.00.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:00:50 -0800 (PST)
Date: Wed, 7 Jan 2026 10:00:48 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Bill Mills <bill.mills@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup
 on AMD KV260
Message-ID: <aV4SsKZ5eiayh18n@nuoska>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
 <aUVFUx55XTjb_2nO@nuoska>
 <aUkIQjKpd3MhNHjk@nuoska>
 <5f570a3b-7bee-43e0-9a36-3d106984fec6@suse.de>
 <3d214bf3-6b52-4942-95d9-0504fa6f5877@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d214bf3-6b52-4942-95d9-0504fa6f5877@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_000056_023122_0B307872 
X-CRM114-Status: GOOD (  37.48  )
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

On Tue, Jan 06, 2026 at 10:29:37AM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 06/01/2026 09:41, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 22.12.25 um 09:58 schrieb Mikko Rapeli:
> >> Hi,
> >>
> >> On Fri, Dec 19, 2025 at 02:30:11PM +0200, Mikko Rapeli wrote:
> >>> On Fri, Dec 19, 2025 at 01:59:14PM +0200, Tomi Valkeinen wrote:
> >>>> On 05/12/2025 14:37, Mikko Rapeli wrote:
> >>>>> Currently on default yocto images Xorg fails to start on AMD KV260
> >>>>> because 24/32 color depth gets detected but does not actually work.
> >>>>>
> >>>>> These two patches fix the issue and now 16 bpp gets detected
> >>>>> and Xorg starts and draws on external HDMI display using
> >>>>> kernel.org based linux-yocto kernel.
> >>>>>
> >>>>> Anatoliy Klymenko (1):
> >>>>>    drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
> >>>>>
> >>>>> Mikko Rapeli (1):
> >>>>>    drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
> >>>>>
> >>>>>   drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
> >>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>
> >>>> Did you notice the few already sent serieses on the list where the
> >>>> topic
> >>>> has been discussed?
> >>>> [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
> >>>> [PATCH 0/3] drm: zynqmp: Make the video plane primary
> >>> Oh I wasn't aware of these.
> >>>
> >>>> Or is there something else on KV260 that messes up the 24 bit color?
> >>> These look very similar and likely fix the X11 startup. I will give them
> >>> a try.
> >> Right, now I've tested:
> >>
> >>   * these patches from Anatoliy and me to help X11 use 16bpp mode by
> >> default
> >>     and removes the need to manually setup Xorg for 16bpp
> >>   * "drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888" which enables
> >> the X11 default
> >>     24bpp to work, no need to set Xorg config to 16bpp
> >>   * "drm: zynqmp: Make the video plane primary" which also fixes the
> >> X11 default
> >>     24bpp to work, no need to set Xorg config to 16bpp
> >>
> >> All of these fix HDMI graphics output on AMD KV260 board with yocto
> >> genericarm64 machine
> >> and core-image-sato image which includes Xorg. The graphics rendering
> >> is still
> >> very slow but I think that is a different problem.
> >>
> >> I guess the last series from Sean Anderson is moving forward so I'll
> >> reply to that thread separately.
> > 
> > Just want to say that the series here improves xlnx and makes it a
> > 'better' driver. IMHO the changes should be merged independently from
> > what happens with the other series.
> I might be missing something, but I don't think I fully agree. Yes, the
> userspace doesn't seem to be able to cope with the current upstream
> driver behavior (even if it's not wrong as such, afaics), so in that
> sense this series is better. But I don't think (almost) anyone really
> wants to use RGB565 if XRGB8888 is an option? And that's what the other
> series is trying to achieve, and that series conflicts with this one.
> 
> So I'd rather try to get a conclusion on Sean's series (or the other one
> from Mike). If that effort fails, we could go with this series as a backup.

I did testing of all three different patch series'es on AMD KV260 and
did not find any performance difference between them. The Xorg
rendering is still very slow to an external HDMI display.

I don't have an opinion on the graphics formats but just want something
out to a display by default. I think there is a lot more to fix to get
the performance into usable state.

Cheers,

-Mikko

