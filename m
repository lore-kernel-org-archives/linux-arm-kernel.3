Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CDDC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pAHJkXoFZdgHisVUkzvL4I/Edqgv9mE3mnJ+Lw62oI=; b=y4cXuNkSbHomiAw01T7qV/hpZH
	2U18djHOgGAwPyEQiLyZBH5ZBHBEyE/9AW88M0nYc7qTNbgbQdAo5t6xVCKmdKnc9NMqiHlCom3Kc
	YSPq0ORaqvSvDYDndT27AEaDx+3AtKIaFoMxO96QfyF6MUfYGciFgsZx4n8KrMwpVmUpQjg+nv7J8
	yOdY8Rzop082IVhUHp4KXh19DFQoYOx5WlpMactu0tI1Lc9Hz8KK9PSbFK1cEz0VszzAKHmHCWSOT
	gQw/bL4GrX0hVqXTDXrjg45jhTrWSHmN72G6UJ4nL0X33vD2ACtZnchOrjuNncJSaWVuutIayhfnq
	1imSowNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZGUl-00000002xsj-48X8;
	Sat, 18 Jan 2025 21:36:44 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZGTU-00000002xmf-2trN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 21:35:26 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-305d843d925so27789581fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 13:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737236122; x=1737840922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4pAHJkXoFZdgHisVUkzvL4I/Edqgv9mE3mnJ+Lw62oI=;
        b=RtuMu7YfqfBzyK/ohfZD01lU/nyMRcWbgIBfr8mdL3SnEZVz34ND1BM1CRfAUofv+r
         T3r/OtZZALFZGC5BoUfz70Ng165fQ2kMjBIXzW6DXiySkC3kTrfqxVFZG57pHE5Td5ZI
         CcRgY5x8a2UcdrfJmi6PXWmqZKLeA2SlTz+2gHI2kbHBz2GO75QRMZtGFKJWOizo4D4U
         R/gH6aYjKKXWUX6/D+KmE1iIQa87+h4ILH6wdD6qLrVlK3X9/C63152rD9NPIviTyNcM
         09OjQ5acB4pZB7eDRdAv4BpprhONdqpoUaFTu+EZgHaJGJ0uFK0PFxm9UtFaq5D1ioik
         kBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737236122; x=1737840922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pAHJkXoFZdgHisVUkzvL4I/Edqgv9mE3mnJ+Lw62oI=;
        b=ruaY5L0AthEsaRys95PeGxeNZShVSI42h4jw6jQkfCXafuGlXwZNIpDNLNOc1n81mv
         TOUgZYA9o2hpjgx1pJ+nZmZAdlsOLn/EQikJNyDkIHmmIxqVLnZPh8hV4bt7p6pJ84s/
         7+9QZFaU9qo7s1+vuxWnidT1cl+C3b0cW5j97yeWqW43D/3/iK2eyJQspw4hi+zpu3na
         Nu3VHGJOFSIxgk4wQ60/NNlG6HSdXZ2chyNUBT/4eXb4FbGY/mqIDzS9UUqstVMJ6GvG
         3YLaaaAHjHv8eUeGNQQbQS4hvPNrZCGPHHVCmSUQPwTw29YvkQ3ftnRIAXVMPVJP8O0W
         gzOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHt0xyqQX5YoBQLKicVS5RPQjWe9eYVUvcrzNWtGwylKVAjKqP1VwDh/fK2hmbLaGhELoJgZmpPQOFcjYeNf0j@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm0kJ1aO+r34740JvjcZ4E9GwX/EP+1sCn36DmL+Qw889s6eTq
	q+Y2docoLVd4PWgY9ZJ7US4BdkAb8pqtTid7t4/V//2dmBT6s1D7ZNeE2Q2bc6Y=
X-Gm-Gg: ASbGnctInylkfikMv1cXa6QrAR1DnNGcEGe9twN94ooo8naItjF4FsMfvMXbMANC59t
	hGLnVUMnP6N3GURS3Jya7QTmFiOQ5shtet5W/a2LLNdcxjzlqGBggNWOLL+h0uEl464KWrT+5lA
	4AtforwEloUd8FJRcsLCB3qFdTvU/k6lXL4XmbTxnkHxablEdAI+emshiDf1E7Ec5fktuuAZ3sU
	g2jzhVpQBkH0wGSd4S6uQFcfP6MSMfcRHSOET//m0sVy2BxC7PEpTTjGUVPnEBB3UozmZTcDIWC
	7ok1TUNmsVs0d01iVZ0uSlFwuTMvL75ADxS/6WEwMf4i6xy7bA==
X-Google-Smtp-Source: AGHT+IEe70NKsSNS6vODeZanfRqTTZhK/r5j+Z3Dmevq5/rL+i3YM7BD6wYBdurTwDfOej9kcBleRw==
X-Received: by 2002:a05:651c:896:b0:300:1d45:871f with SMTP id 38308e7fff4ca-3072ca5bce5mr25037041fa.5.1737236122551;
        Sat, 18 Jan 2025 13:35:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a3308edsm9034701fa.4.2025.01.18.13.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 13:35:21 -0800 (PST)
Date: Sat, 18 Jan 2025 23:35:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <r56ycfx6eeampdduxy65v7tczwyfzgh6z64wmvivlxzt6ww2nk@6y7otqj5hoy5>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
 <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
 <20250117-neon-unicorn-of-plenty-bbe639@houat>
 <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_133524_856084_48C21065 
X-CRM114-Status: GOOD (  15.58  )
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

On Fri, Jan 17, 2025 at 03:17:32PM +0100, Sasha Finkelstein wrote:
> On Fri, 17 Jan 2025 at 11:24, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > I was thinking about using drmm_ here, as the DRM device is also created
> > > and destroyed each time. But I might be mistaken here.
> >
> > Ah, right, it makes sense then, thanks!
> > Maxime
> 
> Not sure i understand. The drm device is created in probe(), and is
> destroyed by devm.

devm on which device? The bridge's lifecycle is tied to the mipi-dsi
host lifecycle, while the drm device is managed by the display device.

> I do not see a path where it can be created/destroyed without a trip
> via probe/remove,
> and so tying the lifetime of the bridge in question to devm seems correct?

-- 
With best wishes
Dmitry

