Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45401CEB2D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=; b=tdGiJESueqhh2T+EFoeCFu57Ob
	BQxzrBtK6AJbGegbv/yENQkPa5lA+nuZWarkGx5guCzdJm/jbnutQ8D+s60k8mdQ9J+TnY9f+rSg5
	pCsrwg2M4lHXmeCGmNCVmxm5M1I/Ak9eqhSoWDJsmIrm5LWioXFO/MI6/NepFPw/EEmw3IxxormGM
	cM/EhFTtdYQ//4oOoDn+Bi79VzyyMjKKcGPyqz+/XyJQcDtpUfgjlXOWdfwSLYQUXgBu6rNdfRFPC
	8+DkeZp6Kw5gVITxyGXPXnAjn3YQB5R98hrxY73xr8Y6D245oEPBijswVIVX+PMpRbJR05b+2jyKC
	6923cqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKHZ5-0000000DrRH-36Z5;
	Sat, 15 Nov 2025 14:47:47 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKHZ3-0000000DrQv-1wfK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:47:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso5497859a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 06:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763218063; x=1763822863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=;
        b=gIFbPW88HiXqcykv1N4n/NT0jTgL2ebojh8ov7ffneyKUkLvFMVYzVP9tnFTBC/ndU
         PD2WoM3k4e4fUwiVCJmQHaqttiWFGqQbFj+xUJ/udQ5Lm0i5N65KZy5zXZi7f73+fyex
         27C5Jq8jX3xn4iuZhGkTvGbtgtRAPRd6CrfILZefAqrmzNLDGVZdYQiW3OeFUdAjf318
         AoQ5HzJbPr4r+S5aJPsJPymMKjCmNWNQKKJ12Uq8MgNBwnC/mNvzN706Nz779mXXypwQ
         U3v1UBMluMl5/R55loeZXJH/VjXzHzRVJfukIO5+tu/gswVad0TGveACKU6b9L8jV55J
         EIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763218063; x=1763822863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=;
        b=F7bWOaLFJv6nYcRTNZNAIS9GTQOPv9iN1mu6Aih5WGRxUWRLp59F6XEcD1VE8C0CRM
         jEO4FOdCSNyo38LQncypnN4wveabn3m8rVOKC0kek5LtnU2tTrLVZ3vGlATBikjmy5TY
         1LkZWt9HpGo4Bj888nhRm7L/U3122sprE7KqiYfmrZTaTwm0g8+dzhHBX05fZnvzImTs
         gjIhYsK7G5kEcdBWyzosk36aR0+R0VJkSVbMeOJzQMaXQR6f6i9vvl/nJU75CjrlvPMA
         7nwf7w/T+kYlWQER9WPmmQfNHvIlVmXMwyiyU30hiDG1zGg+5Df9e5Ve0lOliR1tSO4s
         uOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGdgTqi25xjoO5VkKgKkwLnOgywcOlLi38g3OocKN1AV6BnlhuNU8Q3swMk5m2mSnPsuUwlrGSINo4kgbaahJf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3xXYGZeCvHcftAOU+NnjkyL7qlqgNFOVuPPP0p0w0HzymbdLd
	W+LJdZqy+mfk170nn2mxsOeM+yLZ2oLU0UZoTSDKlZ/YYWNy8hxCLhYA
X-Gm-Gg: ASbGncuD7bManihq1oTS6R41vq5H9TS5tfaKxyEDYqr9D7hft3Pyi6uQuFM4sayo6D/
	hsCGNjMmLPgt+HpiyAmP19QavXzn4DUTSbumQ+36O6cqJj8nUKtZwlDnm3fujyOVu1MB0rk5LFt
	+cNCHQXh8jCTJPnZ4wdff433KjHFQCSp7SE4IVpFbz26Gx9tmrLvIfLRt9pY9SkfvqIj7NO/Gb6
	U5xwoVer4pC8inYNhcI7rPRviSHvjwC6LhOgsZBm4XTxiSKucjQGWnSMFbgNcbEqp+Tj+GQ8bly
	fl6D0m/MzNVnqF4WFDvmuqi2w/w9ufbfLxjKVU7JauEtiA/vypEnEwFQ0Or/yDFPsHM5CvixFkW
	GgLfAAI0jCwp3FOo7KfpgcoIlD18Uhja3xh1ZwiK2e0PZNxpMIeSxIA0h9gVMa+RVOXoV1Sc/Nt
	OGyJLOROkNx/t2h1RYVAcVlwR9QY4Ngb9XUug6cGzr6kGLv4Qu5/cJcLKYY9MDqOnIOlY0ppHUG
	k/6XQ==
X-Google-Smtp-Source: AGHT+IGrjk6XSc2vCyw9UdPnvD0sBuH/IPACkYBi6rv/j+NdjGAC/UWtwwJ0hdXjpnf0qvoLJ3aa0A==
X-Received: by 2002:a05:6402:42c8:b0:63b:ee26:546d with SMTP id 4fb4d7f45d1cf-64350e20abamr5640955a12.12.1763218063485;
        Sat, 15 Nov 2025 06:47:43 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d7335sm5917548a12.4.2025.11.15.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:47:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat, 15 Nov 2025 15:47:41 +0100
Message-ID: <2804739.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-3-jernej.skrabec@gmail.com>
 <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_064745_548824_2D3DC750 
X-CRM114-Status: GOOD (  10.65  )
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

Dne sobota, 15. november 2025 ob 15:40:27 Srednjeevropski standardni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> <jernej.skrabec@gmail.com> wrote:
> >
> > YUV formats need scaler support due to chroma upscaling, but that's not
> > yet supported in the driver. Remove them from supported list until
> > DE33 scaler is properly supported.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20
> I assume a fixes tag isn't needed because technically DE33 support isn't
> there yet?
>=20

There is no user of DE33 bindings yet, so yes.

Best regards
Jernej




