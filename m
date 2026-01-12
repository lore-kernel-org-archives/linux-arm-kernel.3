Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EF3D2504A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUxvknvL2YWQXQwD+7waJKw0gxMOdm8B3byZUil/7ag=; b=P76b6LUGT8FB62J+qHAdvkyLUJ
	kzlFgeJ4MJSahMEu0J9Uc3mFuZ8+bQZLOnljAJ4oMIRea1VEZ7VoBCbCVRl9FkxiF/NH4IWabKZNq
	mNJVfATbjIMQ+HN5eZWGYZBMtoLr+CujCTdx+H8816nvdleLbcBUO3EvPZtTlXOQnPEdrhiK1WZRK
	2FG2fneeObuST8v1IfnOXCr5euaFeFZXerN1A59YS9fvnfbbtN+yK51jT6JnAdnqRyk3rvgszUUKS
	FUdxlAoA2y8mThNkUTNo8W4eaCDLzE8o0QvQAjprRK/fNIXiFIztBDZv2bKgU2Wx5ACc2CHdasxuV
	L15waHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDCq-00000004yni-0Jsl;
	Mon, 12 Jan 2026 08:23:20 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDCn-00000004ymp-2aes
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 08:23:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-598f8136a24so6575643e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 00:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768206195; x=1768810995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUxvknvL2YWQXQwD+7waJKw0gxMOdm8B3byZUil/7ag=;
        b=HQ8LXHJDKR4WE9w20qWGFtpN6FaRRDhfdBg9gVwUjZQjCxsOJlHU7L9qvkUsWZUMAl
         4n2ieScdl+PWx8hFXafTOOUYshbzmXVA0fGkfHffblnUQGMrtysGDEEvSS9kGcE9wrBH
         8cp0ETAm5MuCJlAlSm8ORfFf7XG6x8OWscYLCc7gAIaztrWgv9DvIsJMXhmwJY9FoD4s
         Rrzvr5L8u2OgfLq3F3j8BOoSISunE3Z42EiBMCOIhEjMDL5p8D5NEWo83F/V/MfY22sR
         eHbbr8tz+fn7rwU1Vkq8p2CqUOYNadT5+lQSv8g4Qun6fgDgvGS9t55Dk4CTBsdgdBXc
         q7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206195; x=1768810995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUxvknvL2YWQXQwD+7waJKw0gxMOdm8B3byZUil/7ag=;
        b=LMyzjeQWQhclEkDb/QaQr9RpR3n18Kh3ftKePEUZVwouhucRobgfDBR/qBIeRV9htG
         ab3RDl4wYQF45yCXGJkMNqHqBeCzm8W950lTB3SOgFY5MG5fGHYx7gUQrUWmM2nHgUC1
         RFLX2yZFPEqCSIbWjJLi+lQ9fXe1CW7CO27uDS/HJQCeqB9/G9Oyd0cJne9egA2yrW2d
         YxUpAJQO16IncfljVYc9Tfv7vhLnyB9dtYpsPTjQ8MNoJvehIDu3HctOuMCYbIhKtg2E
         F6s6nDa1aHPCw2Rm3HnAlJM5fcOo4JySPnHwxjFQ4Kt2y9bK5036qCQgApu4yFBEK+hf
         sd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCULHTx3N5mEaZfQ+mzCLnYCzxUYyqNXWg4ySrnUmHXKj9YybDieaBCyOS/71YiLOzovF5XsiusjKlzpxe4F+aLC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0MKN2mowyuu/BtxF21BacAY5jz040BNi7GvOxy27gN0v597q6
	1HczK3aVfffNOjOHZVbeblERT2nHDIFwmGmAYYAwCyhVmFx3fmQc18ll06Z70QhX/Quf5rAMW+D
	yucI/8f5PUq+/UV+A1Lzrl1QSA0nD4buBjI5o4yOErw==
X-Gm-Gg: AY/fxX7k7QSAq7pV51iud++8gWVztGvW7zt/+CBxp9QE5oR/t5jHq0uZmOglUhGkkm/
	q8y2FLjdaD1r8eqGaBlRI2o/En9Dh73eM+4l9RCC+ecYr0pAnqI2+T9bqNB70BBJy/GuH8O3zGp
	dEHhVBB3f4X9rbvQCWN496eZcnrCr9gtJk4qr1uu9IbINTqwViGsCPHX2g4DLxCTRGqMtgUH3wi
	25IZhNyNdzSg+wZfRDJLhT4eGdwkZxN8KYtOzY554yacS3Cmcox1D0feXt0FQZRmEbg0+rozCpw
	En7WFGsuDHa0hKHyi/WdsORBisjQ
X-Google-Smtp-Source: AGHT+IE6p5/ZrwPp+xuSiOG+gGKacHGFDX09xl3BGCerXqWsyT2ieGJ7KPUjbuzOn9UrLQbKiZi7jmfAYVy4hhdoJck=
X-Received: by 2002:a05:6512:3e0a:b0:59b:8505:51e5 with SMTP id
 2adb3069b0e04-59b8505529amr2306172e87.37.1768206194825; Mon, 12 Jan 2026
 00:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20251031104846.119503-1-marco.crivellari@suse.com> <176798671267.3432512.10099163174587731077.b4-ty@sntech.de>
In-Reply-To: <176798671267.3432512.10099163174587731077.b4-ty@sntech.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 12 Jan 2026 09:23:03 +0100
X-Gm-Features: AZwV_Qjx9rLgKQcPZeKegbP8uvfJGRMynbrqihioo2kQ-eL10Lfla26TS98jxTs
Message-ID: <CAAofZF7K3XokopS99UuizraGzF-=haLxYhDeBdmzELJtYvgTVA@mail.gmail.com>
Subject: Re: [PATCH 0/2] rename system_wq and system_unbound_wq
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_002317_684208_70945DEA 
X-CRM114-Status: UNSURE (   8.10  )
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

On Fri, Jan 9, 2026 at 8:25=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wro=
te:
> [...]
>
> Applied, thanks!
>
> [1/2] drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
>       commit: 0650f4909af2bafe49322c91dd8dd0f68abfdf4f
> [2/2] drm/rockchip: replace use of system_wq with system_percpu_wq
>       commit: ab8559d44de5750e03778c42311aec8dd41a61f5

Thank you!

--=20

Marco Crivellari

L3 Support Engineer

