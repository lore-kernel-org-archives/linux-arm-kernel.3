Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD31AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 07:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6ie+zgxRlqbyAzxRIkAU4hEpl89kwbGUKktPQzzkS4=; b=xHNjoA5Tdfb6e+5zypn6gZOzgO
	5o0fT6iApFVwMrtnk+AJWiLs1viZ1yp149xN6vYalefufRBVqvd1VXlmFziLUMs+h/5Gy1BIbZqBO
	yMdwx79/5TTwbnAN9VqHGU/qK4dDAVFPs8Lsb75Z2GAIFK4a+sOetpb3+JnR7uufLPAKVyCNLKJ5Z
	GkAnLTJA2Iu9SniWIxIEBj2JUvtkhFxzhuSpOTd5O4a+0D1PiAkZzERWYl8/1ol4DNyEHNwLzMlhj
	OhdhlMN0JUhno5uns2+H+t6W7cSAowAwwl5MN2oWLCkQQDxHxueOyMOHlzlIriQBy9S+NL9TNY3Xs
	Nht0ymXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHg5-000000094NC-49ui;
	Sun, 05 Jul 2026 07:54:14 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHg2-000000094MQ-2fis
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 07:54:11 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7e6b5737bb2so1668640a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 00:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783238049; cv=none;
        d=google.com; s=arc-20260327;
        b=LfKiecAAqAoU6kwmUU3OvAukOHvv1rw+1QoNEWeV5aSuSdT+al1k/oboXNEmPxr1WL
         Y8as4uqK6ls5ygyWySR5ZHBrvd15UTyZKcp/AsxDzZ2+JLFtvqqsvnOJIJ7WizGhwJgD
         r02zZeKKTrJSu6DPyixzGeYeg56MwtqZ7XkNokkxAtNl3z88KlzUeCxvBvgmlfNtQW7i
         GRvh8Kvk1qc8EKLz0sDLrsqcZkQTA3AQrentwBRSjkGEZEdUxTIPvYzYsbN93kc/Y++S
         Jkgy9kZLF3FY14OYqI+6eLd6ldIT2pjoE2+MrljD7t/336RDH8YKdkI0/XDRWkmItpV9
         dC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X6ie+zgxRlqbyAzxRIkAU4hEpl89kwbGUKktPQzzkS4=;
        fh=vDu08bCAW4VT5Z9myhW8ANtr5ZP6+o7vaOhpUOacILw=;
        b=jteCu6OjdDP7L7mEWwyapRzFD4dqcuXEQ20/jwE5KBp3iT+Zmc/qm3NyrTnv7b8FaN
         KgUVuS7MxNkn6OmA4x5b27N5U0+/NZimfeKANa/t1O2XZGpFdYpSSw0N+J3rMW8/8N7Y
         cC6NjPXNUO2wmH5jTkkO39VNisaCZNrNbkDlBxB3k6ckAySvRM0lzW0Gs0hbAtZlj7jW
         GimVqKidcd6CtnEywepAZjj3cd86xXsc0rVIvR6nIXxecqJjdS6S0DtqIfuKFtGNbhB7
         CnqG6uJqR4iKMRgWAESxU7cDCJmaKOYE1M9NW5UdaptfW40FRLae35C3DgOe0eRJzZMW
         f04g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783238049; x=1783842849; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X6ie+zgxRlqbyAzxRIkAU4hEpl89kwbGUKktPQzzkS4=;
        b=Lzw+IOF46s0JfinVemutAkxdduUdqYnHgGP3Q6Nx3RozUYuD4x3mVt80PM6dp3Lgdb
         luZjItWz9kK4dIOr67NcoGcFvafvRFN2KayQ/RvklT/y0dk3+5MQN9Qy/E2QojVP+k0C
         1fLfoFaSCOEUUG8xsIAtba3eEHNHhGeY0xbNVIP7Af7xHsPZLiR/cNAJVikSfxag3t0s
         fHS/4WmCTndoDIdag1aNPz7hhJZ1OVejOJpDJKMWV9UFpc19Q8iLBPCjBzPItihi2LVv
         NSYwhHy2B4t7iwRCP9Ki0/X/mp1NHxQyApF77+FPzAWerY9mC8h2b/28SAV5jFb1fqqQ
         geYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238049; x=1783842849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6ie+zgxRlqbyAzxRIkAU4hEpl89kwbGUKktPQzzkS4=;
        b=b+kkiYzb8l49sNRnIES/+BlXxPHlptEjsDS1SzxcYcFburQrYZTZ3J2y/5sgiF9obI
         ZFf/oOAXeYSRSwEc/XuAR9rpVIyOA4560nmx87fHpR3u7Nv8po0xV/c4E2qo8+yEKUAQ
         FJAlwsdngG4Os0pOKjHkWSMyA80cztQDBuIR0iVCWn9jr3VWUhAA+k7IELvvqgAY9cGx
         uOcusWC1PVRp9mlvUW3Bf/8PAjpNb/TAoL/SUYGO9ELKGG/uUDClUKanGmGiS4ktYyoZ
         WXQFE6ioSbEl+XXOsYLqwgobPolCuST5VwafdEFxOKe0EKR2LJwZdoEO+mZNkgi1cWWl
         Q8Eg==
X-Forwarded-Encrypted: i=1; AFNElJ/X8y7Yyr/jB/DiEdG/UiUhDffkEN4zsojlxxstgfgRdJeJ+18UySqZJ0LNBgGmaGEwpgyqnA4HwGxm9Xme2Q/Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8sARDwUDuCfVFD/LEHI7euQ4BWUrTiK+M36FmCHYev7fSz6tR
	mHpTFTR4QF/l0rqTdgp4svBTABW1+Q6Ri88kHRoQHcoIBib86ZzrwAHYpNVNrsT7SVLjWJzsC/e
	q01Fqv3a6B/bsRVrP/VIhyMOoXtGFc20=
X-Gm-Gg: AfdE7cn3CS1rWdjwMioGP1FIs9twn/AZDpP0/5shKREmkB7H+o/wcjATNuwv54FH7wt
	UGeeaTGffNeD7ViDBGsWx/S8+Bk4t/hidWyFd3ASzpbMXwPf5PqmQw+otA4+3dD8NA3jojsoGWE
	Vfn+rChzGqZHN8zvjyNSfBrFIs+JBy7Zkt2B5pbJpPsAOanLAc1I83WceS6/cmloQ46sZpge+kr
	ZDH+ZCWVeb8ZEN/P5ASwMJHHqG3839+JgEwpmFPp8MXtvJ5B/iEsYCJV1Nck1qwkml6uOVQilXh
	Y+/cMCNz
X-Received: by 2002:a05:6830:c0b:b0:7eb:6891:c372 with SMTP id
 46e09a7af769-7eb7fd44f08mr3780839a34.13.1783238049452; Sun, 05 Jul 2026
 00:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com> <CAAQKjZN12OSBg+ch+xf+-uO6_Sbrtq-o8AkLdLA3mFQ_ubiLxA@mail.gmail.com>
In-Reply-To: <CAAQKjZN12OSBg+ch+xf+-uO6_Sbrtq-o8AkLdLA3mFQ_ubiLxA@mail.gmail.com>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 5 Jul 2026 09:53:55 +0200
X-Gm-Features: AVVi8Cei8vAjqwK5-A1ihBt88FWQH6IBM5O7QlOt3ukYNuXYArJIbJae9dKPeOY
Message-ID: <CAJpoHp48cXPLrwvANAt_-D-jE=DcSyodAL=p36kQw3cGtQW_fw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/exynos: DRM encoder improvements for Exynos devices
To: Inki Dae <daeinki@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_005410_681437_B2F1BADE 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

Hi Inki,

> It looks like you may have forgotten to post the v2 patch. Could you
> please check?

I think they are here:
https://lore.kernel.org/all/20260623-exynos-drm-simple-v2-1-a8d59678b7d2@gmail.com/
https://lore.kernel.org/all/20260623-exynos-drm-simple-v2-2-a8d59678b7d2@gmail.com/

If I did something wrong tell me and I will re-send them.

Thanks,
Diogo

