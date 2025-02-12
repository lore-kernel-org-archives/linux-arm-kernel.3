Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D059C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUxNo4sdmWLVTWOH02xXE+iuTiw7pWWtDZzrPFzNKj4=; b=IgJgO4NRLuYqjvHdZTEdPoJjVK
	sAHq9XGkhqIQpbpbLECTW2l5Z6u5b++WQVzoH205kaNGSlM6jIAE24HRQMf2j5lQeKIhraU39uxxe
	4dM9jWfRb1wvCvA8Bayrf6VcNqaLf2mb49Or0qzLWZJiRVadWDHu6p3caH3Euhmqq5+cS0yx5IDX5
	/QBwEBnaj9fKnUVL1nkKHPtVdzcELUxuSUSLOWkSopDiHlB45TfYcaRdk6/l+NHhZGVKa4NlUCN3J
	d50jzEjulrx+Yog/y5+oXpev0jbHCIwB5tproAl4dVJC73gr5S7HtEjl6nVnQWe2L61Xb5e2S6Ciu
	O61UNq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti16U-00000005mcR-1VPe;
	Wed, 12 Feb 2025 00:59:50 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti124-00000005lmC-2e62
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:55:17 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-308edbc368cso28575991fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 16:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739321715; x=1739926515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mUxNo4sdmWLVTWOH02xXE+iuTiw7pWWtDZzrPFzNKj4=;
        b=QsEGSrF3MuN18NcKImjzdX8MABF8nPyMR1Cdl8NiMsufhUpz2kZWJqkGC9/xYg57ML
         w20bZRGB2LOMN67SOKJLmuzA1MCYqVTFD6JzGbFyCJGUu4OV4UIACdc/UD+0+FHEHTSr
         HH79sAotBT7Mh1mPYbMmDTUyMNxZr5dnNG4jgUhnbcAV+ZoDPNjTtmSkIVNEfEaeWqHb
         47ATokMrIqpwAU9uNtANHrr9czuz5rmyfzLRaII/TbTvCkTlEoEqO/8uj3si55VhwkEe
         uY0oMRT5HvUkSZrbDcS/VNWTp4+2i7TUtoA0ZagKE9SV3ryd3XUhaRTaDa1D+HyyV3+h
         R5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321715; x=1739926515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUxNo4sdmWLVTWOH02xXE+iuTiw7pWWtDZzrPFzNKj4=;
        b=JRMYY355f5TIbBAXloIAF0SbtC5eOcwxPbN91nUHRjbXKrULjATmeS2RADjj2A3NuS
         9TnQ4DakU/ObNHJbNOIAVYA0gzYX9EAIsauEfNKf0h6byovcGyCe4cUHb3+YhrK94tvX
         ueh7weGpKrcuDaLC3n2GE/18InIdXbiuFTRAKyUr4yEtg6lnNY/YSgKu9UX9QmVJqSks
         LoSWI/rjkbj16kJCDI7A9EvDK16uVuitMryQ78z0VY8F4q0htIRwMDdcGFHY3qiHWWgf
         R6gIg5rU7WJ1NLvppx05r+KIwPcDnKKbvQSnDZXZySt94ryaDTYrmAIm5wDYXH3tVvTu
         qWOg==
X-Forwarded-Encrypted: i=1; AJvYcCUJSBdDx1ge6U/0a0ToUBn2vFeZ5O025ndtqcIUyz8Lg7wIlQWBoEPQKfGUOz25VRI2x44BpMRmwx16tSXZE4yF@lists.infradead.org
X-Gm-Message-State: AOJu0YxHAXwQ46cRpD+4nSPEvmDjcpc+rL6ROz3/uZNVipWu3Oockqpe
	j2NhS41Cr6t0DxtYSS3fl0r+kH4oKxxzSxWJxMamgiGyP/bVrD3xf5uncBYIEw8=
X-Gm-Gg: ASbGncsFavvgiZ17q1z8t3gbQXYdwB4i+2ZsE6RX2uRoRTIkCeCSOHP2GP2q9WnbFV0
	8mCfD1rrnPDTf7JPAbI8B4qWnfbJHujsHPOrsVw2347Wiv2hfhTNsAOzUTUnTIV9E7FgaHIAOC7
	zGCQo5NMIQ5Igb+6Ovog3hANAl4y7pPa83qhVSBkCLky2ysjdhM8E1kY0vcp4THJT7s7rPMxUI2
	x4Si8467GOWkDmWFo23m/aITpzEepjVRVmPEeF3aQuGLhC5uLdVXdLCADPgefRG14qunf+OC3xT
	UMW+yRiuey5jfDEeH2ewv+UsUFTSprKrFtxI1WE8xn0I5/qVLxeuyN/JDKDdYVAAnPBGwU4=
X-Google-Smtp-Source: AGHT+IGs0cV1u4iegcMKrjuoero2v6sW5UX43WNEwXp7nEN1CqXaDi6DN+1s0QUOAJhNgTLw4fuguQ==
X-Received: by 2002:a2e:a985:0:b0:308:e54d:61a6 with SMTP id 38308e7fff4ca-309050be548mr1754521fa.34.1739321714727;
        Tue, 11 Feb 2025 16:55:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308e95f67f1sm9534311fa.48.2025.02.11.16.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:55:13 -0800 (PST)
Date: Wed, 12 Feb 2025 02:55:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <i5q5zuymhn6sy4nou22zxbolztqbq6soef2cwrdq3ey63vfugj@z3rv7zh7xhle>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210181244.0e3e9189@booty>
 <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
 <20250211-venomous-dragon-of-competition-d76bf9@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-venomous-dragon-of-competition-d76bf9@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_165516_674336_CFDEBA94 
X-CRM114-Status: GOOD (  28.02  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 11, 2025 at 09:48:31AM +0100, Maxime Ripard wrote:
> On Tue, Feb 11, 2025 at 01:14:28AM +0200, Dmitry Baryshkov wrote:
> > On Mon, Feb 10, 2025 at 06:12:44PM +0100, Luca Ceresoli wrote:
> > > Hi Maxime, Dmitry
> > > 
> > > On Fri, 7 Feb 2025 21:54:06 +0200
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > 
> > > > > > +/* Internal function (for refcounted bridges) */
> > > > > > +void __drm_bridge_free(struct kref *kref)
> > > > > > +{
> > > > > > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > > > > > +	void *container = ((void *)bridge) - bridge->container_offset;
> > > > > > +
> > > > > > +	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);  
> > > > > 
> > > > > Pointers are not really useful to track here, since they are obfuscated
> > > > > most of the time. Using the bridge device name would probably be better
> > > > > (or removing the SHOUTING DEBUG entirely :))  
> > > > 
> > > > bridge device name or bridge funcs (I opted for the latter for the
> > > > debugfs file)
> > > 
> > > These DRM_DEBUG()s proved extremely useful exactly because of the
> > > pointer. This is because when using hotplug one normally has the same
> > > device added and removed multiple times, and so the device name or
> > > bridge funcs is always the same, preventing from understanding which
> > > instance is leaking, or being freed, get, put, etc.
> > > 
> > > Do you think this is a sufficient motivation to keep it?
> > 
> > Then it should be something like %px. I found that %p is mangled.
> > What about having both device name _and_ a pointer?
> 
> No, %px must not be used there. %p is mangled but should be consistent
> across calls. But yeah, it's kind of the reason I suggested to use the
> bridge device name instead.

Then we need to extend struct drm_bridge with struct device *dev (which
I would appreciate, it will solve whole hdmi_audio_dev / CEC device /
etc story).

-- 
With best wishes
Dmitry

