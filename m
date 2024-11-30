Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E13D735FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 11:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/Pf8loTaik8LYCta5Jf2Zin0SqS3BgDup0y9NRq4n4=; b=e5c9kGmaHxnz5yGeYqHEg13wLB
	Qa0MJYeC/0s/8H4qcL2t2JGcfR1pLXwLNL8iyCL1bD63ofEwlmGnfwfNjksr/fLV+AmwzsN/JIHTo
	15Jewy7f0mp3RQz0+9ZptKc23B9rIytrTz+Qcoqlbe5R705CxBok+nGPsSFhoiBgkbGx+E0yshR1f
	zlPFyTmGJErRnMsec4EvbxlO1wThC0Em5ytsYImymRqqPJcArLonAQ0lExdnIEStKoY1i3ffA6NIe
	4O5lxDXxg0LlCejaKuG4kfHxBRepdzuoV8jQgqgRG37FN7otXuABzxpGBzZYEoNpbT8g1yno5qHqC
	7gU0yOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHLoD-00000001yKd-0uLH;
	Sat, 30 Nov 2024 11:38:45 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHLmP-00000001y4R-2z4q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 11:36:54 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53ddb99e9dcso2661323e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 03:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732966611; x=1733571411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/Pf8loTaik8LYCta5Jf2Zin0SqS3BgDup0y9NRq4n4=;
        b=IZfk6RfPu1m64Eb1FV6NAnycY5VrpOzY+VV8s64SdYBBcjw7kpmyNdKQjjRWIJ5axx
         pLZ/bWtJYj6wh3Ib5PtfFjDtFBFFLtzUPgEqBw1qeHaN80WmgqAmuV6j/FG0SUvFUhZ1
         RsFrQTdMsg7znNBNCtqss6PJnJxwCmpPK6bv5kK47xv0lRoG/gxri1P2Ua0uphi7CkQK
         uWutNipF4P10s3L+26ebJvHYZC2Pl1yCrb2a1/59DA5DAPGP0eut9gC6eB3i94MkoErH
         AZfTuj/5VVCi3rbqlF7ff63ttBs7Ww1tDKq+y5DpjKxBEENpdaTfqY9ddecLlC+t7N5R
         0ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732966611; x=1733571411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/Pf8loTaik8LYCta5Jf2Zin0SqS3BgDup0y9NRq4n4=;
        b=s4JrbffOQrhfFsWULAG4LAvNCWT/6oFysS2HruI5XL0EY5UjnQoFqmWD4jQRs5UGom
         Sp3hNgkJS1IAeDgRC0iGNBPWfa6fLegxnYUDClIlGGDcHDhz4m0lp/cAA5zPEarpn8H2
         6YepPSOAkyYjLYaLiGBoWMglug9safOyywz9Njntc6QQyPh8+aMHFVfIwq1bTIYCwT7S
         U4lHI2SB6+6H6TWGefX6/2uFGPNkrPEvfz63GtSnRjNeRDdtAHgSrNBgnUVkmGvuDCkO
         uuqk+Gc5vfI+1TuyZ8lEQuPTWXncda4KoptGIMOPASewobYNmdhz4Bv9/9i16uu13Khl
         U/EA==
X-Forwarded-Encrypted: i=1; AJvYcCUggkRFXSyGqqbSVk/PRN6xYJKtctC/Pwg18Q70Hq3h9QyZJ/aYuccTLY3s1fcsWfkRZnMGwpEBY0jMOaUan7N+@lists.infradead.org
X-Gm-Message-State: AOJu0YwDj2hZJPySorzMsqtDrgjYdRUjgktZ+xGlTDWFYFp7wBVamYRL
	Woz68B/mAeahXy3nvKopeq7Mqr+Wod6z1Q/fhFzzinX//i3YLup/nfj+t4kfkxM=
X-Gm-Gg: ASbGnctgTXT65TScwOTPvCn6kRhF/1K1+ccl6CWXmF7cqmqh6I8sXk+dTAEdhxqYeug
	m+0s7Zyqh5c9XdkVT95EIY/VZEYLEn91fffzTLlEvBBA5/tvm/waxKKNs5O88q27HlMjurV8Vlr
	gHWycXYULGzTz9uPGykORaWFUBEWohWFQ35rkTpc4CcCxm6S9RmH9mScNLOs3n+vIkhS7DPMpQA
	bw/SzPKWNw5JkqOwjzDyTu+hmGFeKxu+cnKOP2F0E1ynCWY+whx32SS8SULDkAIUlU+jTS82F7l
	wNlrXPorh2oPtEJfeyUVc9TNNyM0fw==
X-Google-Smtp-Source: AGHT+IGIIEiDb6qXnTmJUVDYgM6wgGw7GPagKQ9KPPyyX5Q/cb5H82b2qn+Ew6KeyuYbpTeKoPB4zw==
X-Received: by 2002:a05:6512:3f1f:b0:53d:d3ff:77f6 with SMTP id 2adb3069b0e04-53df010900cmr9945955e87.46.1732966611547;
        Sat, 30 Nov 2024 03:36:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649f71asm754516e87.244.2024.11.30.03.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 03:36:50 -0800 (PST)
Date: Sat, 30 Nov 2024 13:36:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: Add a panel driver for the Summit
 display
Message-ID: <qowuzrx7s76r3soelwcvlbnksvstlpdind5xxejuqeeohjzsbh@evmuvvzxp3qh>
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
 <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
 <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_033653_787841_3EE0315A 
X-CRM114-Status: GOOD (  14.14  )
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

On Sat, Nov 30, 2024 at 12:15:25PM +0100, Sasha Finkelstein wrote:
> On Sat, 30 Nov 2024 at 10:29, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > > +
> > > +static int summit_resume(struct device *dev)
> > > +{
> > > +     return summit_set_brightness(dev);
> >
> > Doesn't the generic code already handle that for you?
> 
> Apparently not, I have commented out the pm ops, entered sleep
> and the display stayed on.

Please add BL_CORE_SUSPENDRESUME option to the backlight device.
But interestingly enough, none of the panels set that flag.

-- 
With best wishes
Dmitry

