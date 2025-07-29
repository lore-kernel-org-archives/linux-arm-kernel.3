Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9758BC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 01:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTE78ChE+vquBrI5YrDGqyKJDHj33kW+vj6Lk06X/sU=; b=E2g23nLn6yHQcF9U0gaSWa6Dh4
	rQJ4uXJ2UhP6sSKrOKAsrjkGlag6snXG62QjLxdGGhmPbsCjmg0j+kPw9D5RsWTnUxyf9VOqoojE+
	EtjnW4FOAuvYThn1W4D5NUXXCLbcEnhUoDI3FM8sjRZlNDJQZVsLYVdHGyWefWwGIvY4qHdXXKp+w
	qE+HC8N7BMDZIJQp+SwlRRvMZWzn7tafX6ANrlg2vRskxql09Niy8wuctwPq/bnB6s/SaoDf5W144
	Wxbx7ZkDpm68Nd4rq9DSq3DVNezkNghSpG2JnloacB59cp4p7BUFt8l7H4TZlY+ejN+i4EZQB6D5W
	o+f6CefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZNe-0000000FiiN-3XMx;
	Tue, 29 Jul 2025 01:43:50 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZLC-0000000FiTA-0HMD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 01:41:19 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-886b2fdba07so1480845241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 18:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753753276; x=1754358076; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTE78ChE+vquBrI5YrDGqyKJDHj33kW+vj6Lk06X/sU=;
        b=Q2gj2hyVNZOUzOjgsSUZGxufXxmnTJuSt02x1da1dIaosN1g7ZKqfho/yBfo5Pucyp
         F6snHy9to1uGY0cjQy8G2wljYhBE5I9sBDWDCYK+7Sl6Sjqy3725bGLruo98X+1IXBIJ
         Krt0TB3aaTmnZKj/tKd/Wpva1HzjY1ifIHuqqjV1ejmLoyOPaL3Ft9qGgNeYjU2ejKW2
         8umM6xSqwh1KxMjkeAvi2rPiIxQlzhRXDmfWTUJyoFbCJdpZtQihvDlek6dmIykmZn00
         p3+xMw5DHTNWcNnLUJ1hGarShmIAyBwCZfJGnP3i0bafRWYb9DY0paCRIJgfgVXlCbmZ
         v1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753753276; x=1754358076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTE78ChE+vquBrI5YrDGqyKJDHj33kW+vj6Lk06X/sU=;
        b=BWmSr+mwoKxWT/byTTpSti1rcW3Z6NdiX1nzLgTLfAlMThYPUbRagXzJAW1Ly1hr7Y
         9yBbscEafcC24/lwkzSpHmKRTXtI/LMOuwzyy2PZMGwDVVI9ZtzhQXLB6kkvhHhqlg+k
         HiAUz8BpfwyMBtElrcedOloOEbx2gL3D+x4pNLmOTRrGheXF3j7CvqZUTLAYtjlQutFr
         6tldQqB8UF/k7dm+H9DSARWoRtkCYlBgEZGb0kg95EffR0HN/FWCdiZRbNX0hxh4C7RO
         aVRlUl+fjxi0rxstfcysy18XVTod2BwOq5mf4WUE5Glcj52A4DTEu9kQyvzIjdfZNqwe
         hP6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhAmtyKfcdi/346pXTyth6SyfBYzyueHcSLEVPiuT+DlFSlJGFOG6pmwx+ZQ6xp1x/mMLJZ70OeIl78u93k5pd@lists.infradead.org
X-Gm-Message-State: AOJu0YzTiBUvDQOkxmciYYy3oI6XfcmfLtcBeFMtguD4i5UP4cS8ONrP
	wcyHgK+hSpbNmNxLeRMKlGd+kGTHr7vYbqRz4MYilqMB3PYp6Watmftdc8lIhFHysA5tBFugpMg
	nUvPg57nNOnvISc6lDvVypvV+zX9ql88=
X-Gm-Gg: ASbGncvz7b8QUHEGt6ZdxNc9vd7EPl6bN/fQfmyDacugj7zEstRIezeYhmhvt+/kKWT
	6LYa8LtXGxCwGKLB+zv2IxC1fS1kt7dgUQTnSOaC/Jcc3ZbbJXZe/DBJLxDoCT34Vy3V6dwjJ4+
	LISlhUnxNQUSNBHA5yypMHPmx+cN7rf+oHCss4nsLThrDWWQItGpLXhCxzVFCsnip8zamSx0rI6
	2uLQA==
X-Google-Smtp-Source: AGHT+IH5sSaz4kLWBjYQ8xg5A6GoRN5L+Q3qFpxAbI0in2TfAspkDTFwyyOI/F2e9j59D50tjfOZG4mczSkStSE5wG4=
X-Received: by 2002:a05:6102:8024:b0:4fa:d2c:4fe with SMTP id
 ada2fe7eead31-4fa3fef74c9mr6797567137.26.1753753276427; Mon, 28 Jul 2025
 18:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
In-Reply-To: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 10:40:34 +0900
X-Gm-Features: Ac12FXy-Uc3aIGD_z-2Hmjo9PpVFm9Hawvq4wg2d1-g_c1M1SQ84nY0S7pRIJwA
Message-ID: <CAAQKjZOLZw7e1G56i29b28L0NwOM=P4eZtcNAp2vFpe3ck958A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Samsung Exynos 7870 DECON driver support
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_184118_106051_95F589E6 
X-CRM114-Status: GOOD (  19.70  )
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

Hi  Kaustabh Chakraborty,

This patch series has been merged into the exynos-drm-next branch.

Thanks,
Inki Dae

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 2:30, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> This patch series aims at adding support for Exynos7870's DECON in the
> Exynos7 DECON driver. It introduces a driver data struct so that support
> for DECON on other SoCs can be added to it in the future.
>
> It also fixes a few bugs in the driver, such as functions receiving bad
> pointers.
>
> Tested on Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2
> Core (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte).
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v4:
> - Drop applied patch [v2 3/3].
> - Correct documentation of port dt property.
> - Add documentation of memory-region.
> - Remove redundant ctx->suspended completely.
> - Link to v3: https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b4=
56f88cfea@disroot.org
>
> Changes in v3:
> - Add a new commit documenting iommus and ports dt properties.
> - Link to v2: https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c=
1d21c8057@disroot.org
>
> Changes in v2:
> - Add a new commit to prevent an occasional panic under circumstances.
> - Rewrite and redo [v1 2/6] to be a more sensible commit.
> - Link to v1: https://lore.kernel.org/r/20240919-exynosdrm-decon-v1-0-6c5=
861c1cb04@disroot.org
>
> ---
> Kaustabh Chakraborty (2):
>       dt-bindings: display: samsung,exynos7-decon: document iommus, memor=
y-region, and ports
>       drm/exynos: exynos7_drm_decon: remove ctx->suspended
>
>  .../display/samsung/samsung,exynos7-decon.yaml     | 21 +++++++++++++
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c         | 36 ----------------=
------
>  2 files changed, 21 insertions(+), 36 deletions(-)
> ---
> base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> change-id: 20240917-exynosdrm-decon-4c228dd1d2bf
>
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>
>

