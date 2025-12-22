Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3EAE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRoWj6fQIVZ5ec4l8AKBjpMeh7YDL/EPpVGkUu95T8Q=; b=XdtTRHHJhYg6fiCovKt9tS8pqp
	O8zBWIXskv9cyuhnjmchv6A5+K85BWIMg+uIhXgYH59tBZK0K/5zjFUFEgobbGge8G0xHB4TECMtx
	LFzQ1gJxf3i1g5prhi5kyln1oxN/vI0zLhcIw4S50ad9fyqmyCSkoLzt6n95q2Wzhy0BRzqp3kvIP
	ovfwNz20ro/r1yDL94WNqxVUds/HOJxsgImG/kvDE1hI+6utG3RTvsKEMzulW3QuP5yfJihZf33Y8
	zq4LQqtQ9fT3LEu6+Vna3iQ4zTkMrV6/bh6JlT7Bat3AvQOpiuMDjdnNH8dtk+wgDBBjr1yg4FISu
	5W5jAxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbkg-0000000DUYo-2TH1;
	Mon, 22 Dec 2025 08:58:50 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbkd-0000000DUXh-1yLJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:58:48 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59583505988so5712137e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766393925; x=1766998725; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jRoWj6fQIVZ5ec4l8AKBjpMeh7YDL/EPpVGkUu95T8Q=;
        b=Yk5XheW4wYh17EWvwjlP7+gEKpT3f+QXJRrXp0LGdsmKICKbpcNVinSASZSsufdqtr
         TISiP3EYCXCLPLdHhfKa7T2627JZN0W5XZVnN9uF6H7ybjjP60NLixEzlxpH5dUETtBE
         QymHwxWFXymktC5ogq60Aeezj+A1nungHe8YKFkTvamIeMZ7AAWg4e8HNLdaqCqZVzm0
         16ajfPLST2pXPC3fT7X3wqwiXhFXGwiVSy30wY5nNo9M9Z7hVHiFPqRa1Z8R67pb0l38
         mPV7rPAmE+MR1rBYdOg1DjCFIrmAkqY6rAlGkEcVnM5Eh4wHu9KnSfHrJuWTczlThKFN
         NB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393925; x=1766998725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRoWj6fQIVZ5ec4l8AKBjpMeh7YDL/EPpVGkUu95T8Q=;
        b=lY9Ul6xrIpMJFkGF82Km/qL7swUL40wk2Stphnzdwx7x+enlk896H7i9ZJRD/0lHRK
         PH/BQy9hu/l515dFozdLYbRT4tJCwpk2FaomD28V0J4SAcCUolgFs7Lfhw2fYFMF4kjS
         7JNtm1MVUs3mGIi5JYchvZAp0UBX6IUzl+V/ug1OYf9iZkZuVCavuxLx6xKWoDH4iSKq
         h2hyVtF5AlEEYNlc+BvmtHLoZkvmd9suUuAzz6zwLVyl0TuTmEk2TjkL3UmsD0bJQaaL
         BMbP+uliszrKl/6U/GMnGotWHEXvKINf2uBL1xekilTPQ0svnO6yqSj1QiiVxmVRQkIq
         Bxvw==
X-Forwarded-Encrypted: i=1; AJvYcCW+b3P7ypqTe6sR+Jc6M/U6DLz9ix8HMiBar1Dupc/VOO5F0yDJ1oNrkWcVa9P8xbZxsZ6xXXSQD8YVApvAtFVf@lists.infradead.org
X-Gm-Message-State: AOJu0YyJas+wnmsdvER9N3JTEmIMifbny3NjoCExCZkYqXwg/A8JzTz/
	y6F38DpF8bwSPl3wVJrIy4FfmQMl9EYc9c5/XE5nzx6j+IQquYbAMsMQ4FtqxsdAjaQ=
X-Gm-Gg: AY/fxX5EregrybeVgDDzYX/2cve2s2gbNhYxju+mITAxD9jyffu6E3SRHEIBTZrzKpC
	qFPAvnzLSAxSjxNj+HF3nsOHcbngeo21HUGkIppVVesidvX7OHCO8zkLzQfrRtYyKjEE7WYM5Fz
	KrRxak7iMUVKFHWd9H2c6HY/bsagxyCEu8e3UT5mpK22MZ82RzcW6QAYw7XXGg7UfvJv5NyLILu
	F3lqqGyxvpdh1Yx6XaX6k7BE20y6Ndkhr1JQasX7hM/kAJIGbyvzSQCr3vtQmdMz3/6mjFAQYHN
	cXRy9yOvdPCAPeIxlX1DOG9mHE7R4c7cOPsJ2sbdF7owa1KJgHjvBoL2ZA+D9LI4uyXD288R7zA
	dF8NNHlpyg+gtMOAZ/NydymtTodD1E5jkSoEHAO0xeRjuItyzIfklIm9Aa88raD/binqpreSvoV
	xsz1g7fJ1dyUr0nsCqHX755LZtonTXZXUQE3On4jLlLROO
X-Google-Smtp-Source: AGHT+IEjjr2NLFmDrfryDt5WBn7sCmpJeVOqGFgaS3Jyv/31cVGYeFCzkDxyXbjv1PH5pPRcEO8DrQ==
X-Received: by 2002:a05:6512:3e1f:b0:599:daee:12af with SMTP id 2adb3069b0e04-59a126e50bfmr4705785e87.14.1766393924759;
        Mon, 22 Dec 2025 00:58:44 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186280b1sm2936036e87.89.2025.12.22.00.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:58:44 -0800 (PST)
Date: Mon, 22 Dec 2025 10:58:42 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Bill Mills <bill.mills@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup
 on AMD KV260
Message-ID: <aUkIQjKpd3MhNHjk@nuoska>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
 <aUVFUx55XTjb_2nO@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUVFUx55XTjb_2nO@nuoska>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_005847_529604_CB6748BD 
X-CRM114-Status: GOOD (  22.32  )
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

On Fri, Dec 19, 2025 at 02:30:11PM +0200, Mikko Rapeli wrote:
> On Fri, Dec 19, 2025 at 01:59:14PM +0200, Tomi Valkeinen wrote:
> > On 05/12/2025 14:37, Mikko Rapeli wrote:
> > > Currently on default yocto images Xorg fails to start on AMD KV260
> > > because 24/32 color depth gets detected but does not actually work.
> > > 
> > > These two patches fix the issue and now 16 bpp gets detected
> > > and Xorg starts and draws on external HDMI display using
> > > kernel.org based linux-yocto kernel.
> > > 
> > > Anatoliy Klymenko (1):
> > >   drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
> > > 
> > > Mikko Rapeli (1):
> > >   drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
> > > 
> > >  drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > 
> > Did you notice the few already sent serieses on the list where the topic
> > has been discussed?
> 
> > [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
> > [PATCH 0/3] drm: zynqmp: Make the video plane primary
> 
> Oh I wasn't aware of these.
> 
> > Or is there something else on KV260 that messes up the 24 bit color?
> 
> These look very similar and likely fix the X11 startup. I will give them
> a try.

Right, now I've tested:

 * these patches from Anatoliy and me to help X11 use 16bpp mode by default
   and removes the need to manually setup Xorg for 16bpp
 * "drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888" which enables the X11 default
   24bpp to work, no need to set Xorg config to 16bpp
 * "drm: zynqmp: Make the video plane primary" which also fixes the X11 default
   24bpp to work, no need to set Xorg config to 16bpp

All of these fix HDMI graphics output on AMD KV260 board with yocto genericarm64 machine
and core-image-sato image which includes Xorg. The graphics rendering is still
very slow but I think that is a different problem.

I guess the last series from Sean Anderson is moving forward so I'll
reply to that thread separately.

Tested-by: Mikko Rapeli <mikko.rapeli@linaro.org>

Cheers,
-Mikko

