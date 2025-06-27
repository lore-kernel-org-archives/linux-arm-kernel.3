Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04298C7EE3A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3qFR7cfAS/X16LAzwLj/wNbMxrS9YVqLflPC6mFUYo=; b=qcVesgvjwyoaH0R6B6IPqpKOIF
	CY1hrke3FiarfZFbesPBkOtdqx6pXkVUUvnZHhr/Oies2EAnYVNKbAKGdMnNtA96JaUwAQVsSbmBO
	6SYMfX0cBaAp2OzI+uNWY3hPwYkuAMWWsrfzWgiVAIzuVm+H8Os4gqOg5f+wsy7s1TNLCg37iuc4p
	4AWOojUjYWUqtV4MmVm+pPGlLjGg3l3p4jMxbYzigrP5G22FRrRcSq1VqQtphqdEr/0Lx72pINJzf
	Y8lib5y5kC99o8MRLATy4KBKzrb+A0bxe4sPJLSmOPKy31dp9LdPfRiSzWimojoGgpVBmRtiM7nWr
	6xJkI0lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7eg-0000000EYvh-2PTD;
	Fri, 27 Jun 2025 11:54:06 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV67b-0000000EESg-401E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:15:53 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-87f74a28a86so1218374241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751019351; x=1751624151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3qFR7cfAS/X16LAzwLj/wNbMxrS9YVqLflPC6mFUYo=;
        b=cxCTETRSc0MKVhbKaiCO4SWFFq4rkqlkUwSzTIQWoe+POkNnhnvEFqSPA8W9K3Ulmv
         UuaFnd8LBZ3r9K/ry+LY27VGlJK3NmukUZTWG5W2OWUjkr/h3dQoeoObs9SIuJOqJUqs
         prGSFNvsFKX9nktAJ4ylR+bMd3CrYhGJHvlGjOVar/Wkt3Hy7ywxcC1FEYuBjycGql+C
         1QmRqPonO9lnjWLMRAr53zw3Z/gRlmiFK8nLMijS0NebAyZtPV5V+j5JvE5AKhyJD0LY
         sift2jAIX3U4PllhQoq6QLZQrqSEI/cM0t9ucOSdVW8sjpZL/JH+KUa53L+795zsothh
         zS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019351; x=1751624151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3qFR7cfAS/X16LAzwLj/wNbMxrS9YVqLflPC6mFUYo=;
        b=SWch4r6JXxP3DjLuqrYHcFaoxBTF6m5dha7yXhCSDA0MCLSE2217zzHEL/c2RGGxyh
         GgGiEwsDZsPPAt1Z8/GjyAwHpWP0AGf2beVDbVhARMzNyo7lPvCq1xqXVStzWo4iahHU
         e3gB3YkVitEllByC3/dobdEWqKQTa7HcqVoqm/C9s3C2N4bQyoF2i7t+9NtzFzEIiiSd
         neZ9mSwf9OC6ZD2mHChBidHofX7+YahypK/I3kgdhOn7DY9KxzdBZbim7XaZ0/A/7hHg
         FQXlwzn7L4gASY1ZHgSdpE06dxYIyM6gBbQd9EKxzGBxMYTKPBiOyucleRyU3AqHhnC+
         9yhg==
X-Forwarded-Encrypted: i=1; AJvYcCUfIkTnyBj+us+8WuPIrzgAG95VtAMDObsKkf4C8URWiztsQS9e7ReUqSXSzRXfY5vu4wIsWcIm8FgHvkkhcqPo@lists.infradead.org
X-Gm-Message-State: AOJu0YzBIKp2roZU1yIb8a66XRDnMGW+kGXxy+BnLzxKok1vDa/7vk75
	My0SW/YU+EaUaglGnYoVuBJ6iyIq+ZUrhyIWBU7dYdjovzrDAgq6Vh7lMfgc/5TsQWXYBdiSO0U
	j45gSYLrRJ84wotNxiMF36fC7dqAhWO0=
X-Gm-Gg: ASbGncuuYSpzZ4pU5m/jMD0dZ2dpkTMZNxT5Z1fiYPKIqpyi6AzyVFfG1fwRCpnRBmt
	lv50AWAIDFJlHI0PF+k494UNUK+eIyp1xrxUsfuuPtY7ief40f9zySq8OKMoJZ7ImctUCtgHbmf
	X7iS1d7S6BDEV/b6DmYuy4KWOQyjLdkcV7CkXOAIxWdg==
X-Google-Smtp-Source: AGHT+IF+zTXlE8TphxlFmfZTtMV7oCo6MYa180Y0AG9PxdjoTKxOQADyJ71mo4br1mdkRgwuFP5aO2OpnO/3e6XLJPA=
X-Received: by 2002:a05:6102:440e:b0:4c5:4591:ffda with SMTP id
 ada2fe7eead31-4ee4f78a70fmr1764599137.21.1751019350729; Fri, 27 Jun 2025
 03:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org> <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
 <20250627-garrulous-cuddly-flamingo-b4ebcf@krzk-bin>
In-Reply-To: <20250627-garrulous-cuddly-flamingo-b4ebcf@krzk-bin>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 19:15:12 +0900
X-Gm-Features: Ac12FXzHboYrFxSlMZbUjKMAban_KcR6H0q7HqOUTH-xXDeKHhkBse3ecLJumpQ
Message-ID: <CAAQKjZO4grfoT=NYATNV5JojYgOyD=WwH4DgFTVcXEagXoFf8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_031551_990123_1314D413 
X-CRM114-Status: GOOD (  12.08  )
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

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 4:51, K=
rzysztof Kozlowski <krzk@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Jun 27, 2025 at 02:02:37PM +0900, Inki Dae wrote:
> > 2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:2=
1, Kaustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:
> > >
> > > Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> > > - May optionally require an IOMMU to initialize a display region.
> > > - May require a port connection to another block, say an MIC or a DSI
> > >   master.
> > >
> > > Document these bindings in the devicetree schema.
> >
> > Applied.
>
> Please wait for DT review, giving us few hours is not enough. Please
> drop the patchset, needs fixes.

Got it. Reverted.

Thanks,
Inki Dae

>
> Best regards,
> Krzysztof
>

