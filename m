Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A25D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZgttxRcFFeqB/7cl+AcA+CY6hyOItazptc70QLJmmE=; b=VSjsTjfY6JNv/UgvyZk4LP6HW3
	gJ8aoP2iSmLW2CJ4vn9SiehFsf/74YsqBTENU5rayFhg+kpb8dOUnmDDStRvKFyBJSz7fGVQZx0ig
	mn+SMt9lI63eCaG9epidETScH4jt9FNBXqDHMdTkcOHx2sME3/106ny61jBLDSFTbB7rjYP5XDgKo
	EGLvquiKPxuqQBbSA1Qxyyf8A2LF99rAOcy/n3AhWX4m5sDyjALLk3jxBgE4QPDgi96EDmbjBNHN0
	zicCRSj+FA+Ce6RCglgwoVn7pf5ARhBma1slxNwYNvRlfVf120GkpBtjKNvfje23UlKcslnbJ0F49
	HSp2KDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcEc-0000000DWPF-2VIF;
	Mon, 22 Dec 2025 09:29:46 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcEZ-0000000DWOU-2fDF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:29:44 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5942bac322dso4218835e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 01:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766395781; x=1767000581; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZgttxRcFFeqB/7cl+AcA+CY6hyOItazptc70QLJmmE=;
        b=kcAKCKVS98sFZ0rVOI69zIf0WIykCrsLaVsF3xzTUPFWGS/KJLs1WDgEWah7zZ5bLi
         bhBfYyIIflyDk9TI446N8Bv3JORUTUy9R9MJJ/zSprxtong3li/yxuMiqkXbHjI5gxHB
         ae08yCt2dcQrjcDRnxU7+gDukje8shKKKGUUM/Cb851tGvRf2k1EeIWzTqsaVqFDyFOP
         Bxp1QK/jg8YJCgY4iGMsoYKx2K2uyJOFSbtk1Ye5oQyvXPinZQYMFURGiKT6M/SnNegr
         y3drMGFma5COB0aqOkFbO0mkrb/vmhdzsfn5kT09//a0+96lfzFlWtXbyV+Nn3Lh4JXG
         DW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395781; x=1767000581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZgttxRcFFeqB/7cl+AcA+CY6hyOItazptc70QLJmmE=;
        b=FqoDU0XJJlHuW4VBuRlpOmZoWRsMdjggVp0na5Iqg3Vah1s9c/sX3etlaYeJEAtxSg
         enbD6Kdoz30z4s3c+yi6C7zV6617fasQfv5DA1Y2ICwwpy/nfSy8MIyp+KnqB4VjMtWH
         74hAYMJBYAum6/lDXk1aWp5pJ994CNKGbhavLTZxxo35lHOAjpC/uZWcWzZpH24ifMKr
         h6AE1J+YZdlM8ukL4NieoivQ/nOPsBrmcNSSXaSFu0xdezNDP8W0lUW2A2R8GjkcRYTn
         u8Bsp9+jeVJV+i+6iuIOaF6bZ69LvHkxDaNCd+Sdu/K0FOi6hNCD5PMJ5OBrLdMJVPbQ
         xbCA==
X-Forwarded-Encrypted: i=1; AJvYcCWQsuNooW4OXx6DS4rX1ljjAIgRU4XNWk1zeds6bNe/rlTULY32yrnNpSgoCXDI2Da+Uz4eU4snLx1iPDaPxaTv@lists.infradead.org
X-Gm-Message-State: AOJu0YzF6ZmcWRPR9O9D1UPt/uOioOpP44G1tpyvCnDTtnt+rXokC13/
	M/e1ipcy8coS3Vz6gjLA8DWIUaMEHHNSsdkji7tIjnzsxr9JecKdQWs/h0mEFm/UGGs=
X-Gm-Gg: AY/fxX7PAVzd1i3bmdnav/Frp2Q4NfvHEPNycFszDkmWDFnW3TEv+ZYwb8PEy56VzG+
	+3VRz+XBIH5LbZXI3hPCXFl/RQwZwp7vLu4RQlBx99KLyorkRM+DcaQ6nJPc4SM3t+jouvKEQuT
	Y263AJSGVGva1GCttBjK/7lQrGdFY4XWnxK/hE93ev6N8Dfdg1RaHjoAxT3XG2NiFTVZBX1OdeH
	8U6AlGbnbULROdV6BB7TpibVNz8M1Dpc6xYQFRzF86nROC0f4ZRz+GP0wvWjRsK7NFdzOc8LBnp
	zeiT9u1ml9gcSgIjcYzJbX5XC5z2RQsDfBbnf3pq+Zk05R1wag0/KAQjvCS/ZtaaxikcUsWiFi1
	8HiDp9vBZml3AWIxefFYyQnH/jFpIwURHDdx9OYW2aDxaNVjtm5srI3+l1YJV22/UrEexjhvTmL
	lClLSx4+V+Uitb8BY3+TjZc055GRm3i+yL226zMxQAbc3O
X-Google-Smtp-Source: AGHT+IHdz2Ykcd7v71aO+LxiD2YdRHpq1IyR3g8WLuuBK4cb2LhNWiokwxZAnx2kgNCjq6U0F+DU9w==
X-Received: by 2002:a05:6512:2313:b0:594:5545:b743 with SMTP id 2adb3069b0e04-59a17d3c35fmr4130445e87.27.1766395781381;
        Mon, 22 Dec 2025 01:29:41 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861ffe7sm2969593e87.87.2025.12.22.01.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 01:29:41 -0800 (PST)
Date: Mon, 22 Dec 2025 11:29:39 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Mike Looijmans <mike.looijmans@topic.nl>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 0/3] drm: zynqmp: Make the video plane primary
Message-ID: <aUkPg_VUxp0KrpWE@nuoska>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <36048dd7-796f-495d-b715-d8f65a7c2f98@suse.de>
 <24a9a9a2-ba7c-4619-96dc-4355d850561b@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24a9a9a2-ba7c-4619-96dc-4355d850561b@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_012943_755214_05308101 
X-CRM114-Status: GOOD (  17.53  )
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

On Fri, Nov 14, 2025 at 10:35:10AM -0500, Sean Anderson wrote:
> On 11/14/25 02:42, Thomas Zimmermann wrote:
> > Am 13.11.25 um 21:37 schrieb Sean Anderson:
> >> The graphics plane does not support XRGB8888, which is the default mode
> >> X uses for 24-bit color. Because of this, X must be set to use 16-bit
> >> color, which has a measurable performance penalty. Make the video plane
> >> the primary plane as it natively supports XRGB8888. An alternative
> >> approach to add XRGB8888 to the graphics plane is discussed in [1], as
> >> well as in patch 2.
> > 
> > Did you try to set drm_device.mode_config.preferred_depth = 16, like at [1]?  IIRC user space looks at this value to auto-detect the color format.
> 
> I have not tried that. But I would rather use 24-bit color for the performance boost.

I have tested preferred_depth = 16 and it works. Proposed in
https://lists.freedesktop.org/archives/dri-devel/2025-December/540189.html
but I'm also fine with 24/32 bpp, or any default which draws pixels to HDMI
on AMD KV260 and X11 without manually changing the config.

This full series also works for me on AMD KV260 running Yocto genericarm64
machine config and core-image-sato image with Xorg.

Cheers,

-Mikko

