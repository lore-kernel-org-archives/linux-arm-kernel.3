Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50042C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 04:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Yp8+sGL3lRpm7HC5BKRhWpXDbqCyYKzOoJSMIzIH6A=; b=eOOKtCh5guaCz3Y+3o9mIjusCN
	YzALkKigxFoJngILPs7aJwev1HRqU6vnPH/jm0S089yo5PZFIQQwtqRpYTG+UW6ZHDrcW0S6Ezn3p
	kIbOABcmikg3Daq1TL9noNBd+QQ5q1gMSZJV8mvnM+AeDBSNu2rJKc2DQPUDHytRY1Gm1gBGsM0N+
	oRAj/1dZjKqHzxjFeEZWx1LFJwJmyRonIe52G/zo2UQp+zr38l4jwzjbW7zSCbhLXIRY7n90LzbgO
	2TwEpmuLixt4VKZIHaxt3UEllL3ptI9gpmR/gfC+73wxIFcOQO7CGxpD2I2inFiIiRkfKTyVEmGM+
	IYoQXZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhhni-00000004zEc-17E2;
	Fri, 01 Aug 2025 04:55:26 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhhl8-00000004z4d-03FK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 04:52:47 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7e6783335a2so125714485a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 21:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754023963; x=1754628763; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Yp8+sGL3lRpm7HC5BKRhWpXDbqCyYKzOoJSMIzIH6A=;
        b=QHvVrQbCU17/DmsDyZrVjTsYcyGLl0ttOvxkfwJfM+13H0Zd+YItacPRQwM3ztB8JY
         SgGxM5xIFd/aThzeaGSJ2YSeL9TB3rHbZh8GKYhHU+ApdjzQZT82iEObZPoWRUb9wSra
         0gNWCLxgq9UMphMq2dsdEpPGuPZOy12mg3t0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754023963; x=1754628763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Yp8+sGL3lRpm7HC5BKRhWpXDbqCyYKzOoJSMIzIH6A=;
        b=NnAIOLxZbTVpRNjVmV4e6oJxgrHidh/RX0FVi7T2dn0n+NOMpUVypNkMv9315VaBtl
         A6H14Qv+iBThwL4yTy6cjWLw0IiBRrU/p2FIFahQTAP9s0A/aVjrQEfxb8Nv4bJZkTLg
         Rm0qhHJQjYcQsXm3yHX3RdPJBz2+Gdl++jdgPGiO10g8knyiXgw62yZMXtrk1b4REoip
         /0ky4gXICf7cgm22Gr7QB0W2rDoHKV8Jb7YsxPhqAaTd0OXD7NXKkLz4X3/yYYXdykFm
         b6MDl3yvEZ9K88gyBJbKOZAwifrprxnm8MYB/R3/xxZNpRgbEs33CwKIp0Z+uJsnDzPJ
         38Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWZsyhnzSh27UzoQL+mOOKjQ8TDgC+AEaQUTUTImLzkkyVZWFpbxk6FSL/3I1e8oS/4bLmZL4qn+bEab0tKncIT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy728xui03kC/MhhnNxjfzHRhm7K9P5Cqoyxl6/iNN3iqAbUjq/
	Tq1gSCPmHGLSXoZuii8F9JjXlxCcFV6xSCzg+LrjJSvN4r981YKDLBMDfZkPsA03keGpdgESYwu
	aKoQ=
X-Gm-Gg: ASbGnctuVC0IXLUPsCxkuycTr639IIQn/dyYIEoWkVo/poPouuIrZOZDQlywikXi8Bi
	h/cD2eaeXtvwsp3B2QDNGOrjNkGS/JtfmxcUAtYwxZGfc2ZatPKF+CIhs0CfnjmNavxsiNUgBEh
	fpl+3Uuz64BYiQIVxdkYRfxL0XYogqyqQr5NVT6vJ3f3AQBSA3V14FnMivVQCPXq3ZOhQaGHSfV
	Q+R3cjVcJY7CU6VnO44qnuj6FkfzJr3XqSY8jZRZ5IKHEvaZHLTr/sg/46STSI3ASVCBbh2eBBx
	xKHMTW9hx6DRAwh59FVLBOVXuRTqK9SGoZ8+ZsBvH2fzxRw8X7o6TrXA3EuZp/g/V1nAUK0k2Fb
	Qb1PtGncAHkvNEzOLWNrs0HJGcfusCYVcW9jd704CYcRH9ToSopvTvb3zINWFUZUuGZjK4fhA
X-Google-Smtp-Source: AGHT+IGnE8VWt7/wCa4FpFHbfzTIvhR/LYvScxoe2ICggheiWxiFTDgpfnjy7OVjtKoeEVJV3ErXoA==
X-Received: by 2002:a05:620a:430a:b0:7d4:57b7:bc12 with SMTP id af79cd13be357-7e66ef78e57mr1605315185a.10.1754023962627;
        Thu, 31 Jul 2025 21:52:42 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f75a610sm173174685a.87.2025.07.31.21.52.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 21:52:42 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4aef6114494so15816131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 21:52:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVF8fY5HBocCY9EeBfYpXC+fDActRIjJubpX54/ORFd80+87tfX/8gUn1TSadEg4zNlosvwTGr8qz9U3wb++SyP@lists.infradead.org
X-Received: by 2002:a05:6122:521a:20b0:539:345c:f229 with SMTP id
 71dfb90a1353d-539345cfaf8mr2385080e0c.6.1754023496106; Thu, 31 Jul 2025
 21:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAC=S1njcFhyY6+dT2MHU02ZsLDq+k_vAVv==bWuoGt3KA18PHg@mail.gmail.com>
 <20250731101441.142132-1-laura.nao@collabora.com>
In-Reply-To: <20250731101441.142132-1-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 1 Aug 2025 12:44:19 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngjmk8-C0H2Nii4NXE3wsL1dYLQp-PXafG0=oaOVsYgmA@mail.gmail.com>
X-Gm-Features: Ac12FXx2cQ8dN2cbGqrj1qjUfxVx4elX2aD-gscg8zxkv2Gb7ghx-fdTpW8_Hzc
Message-ID: <CAC=S1ngjmk8-C0H2Nii4NXE3wsL1dYLQp-PXafG0=oaOVsYgmA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] thermal/drivers/mediatek/lvts: Add support for ATP mode
To: Laura Nao <laura.nao@collabora.com>
Cc: andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	arnd@arndb.de, bchihi@baylibre.com, colin.i.king@gmail.com, 
	conor+dt@kernel.org, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, 
	kernel@collabora.com, krzk+dt@kernel.org, lala.lin@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, nfraprado@collabora.com, 
	rafael@kernel.org, robh@kernel.org, rui.zhang@intel.com, srini@kernel.org, 
	u.kleine-koenig@baylibre.com, wenst@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_215246_065231_25C26EAA 
X-CRM114-Status: GOOD (  21.71  )
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

On Thu, Jul 31, 2025 at 6:15=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Hi Fei,
>
> On 7/31/25 06:25, Fei Shao wrote:
> > On Wed, Jul 30, 2025 at 11:40=E2=80=AFPM Laura Nao <laura.nao@collabora=
.com> wrote:
> >>
> >> MT8196/MT6991 uses ATP (Abnormal Temperature Prevention) mode to detec=
t
> >> abnormal temperature conditions, which involves reading temperature da=
ta
> >> from a dedicated set of registers separate from the ones used for
> >> immediate and filtered modes.
> >>
> >> Add support for ATP mode and its relative registers to ensure accurate
> >> temperature readings and proper thermal management on MT8196/MT6991
> >> devices.
> >>
> >> While at it, convert mode defines to enum.
> >>
> >> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> >
> > It's not visible in this patch, but a heads-up that I see
> > lvts_ctrl_start() also depends on whether lvts is in immediate mode. I
> > wonder if anything is needed there for ATP mode e.g. a new
> > sensor_atp_bitmap.
> > Feel free to ignore if this is a false alarm.
> >
>
> Thanks for the heads up - the bitmap for ATP mode is the same as
> sensor_filt_bitmap, so the function is already working as intended.

Acknowledged, thanks for the clarification.

Reviewed-by: Fei Shao <fshao@chromium.org>

>
> Best,
>
> Laura
>
> > Regards,
> > Fei
>

