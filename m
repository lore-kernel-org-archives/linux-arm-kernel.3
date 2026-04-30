Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104A9CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 23:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=; b=BHE2W1h4NWsg0GAg56/zg0fSHu
	1duqWZxCxFGPOw0amLdPR5jG6aqTgC6OgmUnI3WbIi1s3+JqbWqMSrNtOUvuvo3+G5SfFyXqmwaTJ
	3LgZrn0HOioPn3radZDAV6C+dATXqt/dDysY6XdOU9mtKGGynlw02AyVm61AKKmyoSiqIwy4wKs4D
	zFUODPQN3cFpmwGPwXkdD/Z6pqivcnqt3xE/WMLFuzV7vi/KKGAauUVhQFNl2KuWtGH9fnccw3mbn
	qjwlr7uW/skK+aptQxlNVmZ522JhEZeaDpwHDHUnLGbuMM07RZgxcHsyU0mzruSPEfDRYI6hcU9zx
	pWvLhoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbDY-000000068j9-1mBg;
	Thu, 30 Apr 2026 23:54:54 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbDW-000000068hn-1bMQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 23:54:51 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-bad54961385so243995366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593285; x=1778198085; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=Lxyvnhdilo3JWl3hLZU/Dk2bl1rFhYXTwHLjtExpOKnwdMm0TI7gHHr1R5I6ehBuHW
         XiJjQApkl9ZdYNYeKK+zjKQvNIOSEpeepo/ZOoYtvClC0J5AyDGqnEyIuV+I1HHpCNeY
         zXsuxKv4AfGLvv+nSDly0+hGGSFLCR7lHnGVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593285; x=1778198085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=YfbJJ3+4CGpjajqMNHrnDSCTHjKFqO8wTcreMTviEeTNSxnqQxuT4vO4dtH3457XI1
         1FHgR9Q+PPALwJPJsLTJMYSUeEtnUYJdqmoaT+Co+qwhPzhBJQFVT238/YKlS5v0j2Gj
         z5AzINV+Yb7UrXEDk6Gzi4cg3H2O2ai3/4Hs/LxwDUK7Nf5OjxtoODWGqnHaK97miIlG
         NcgrYT2o6HyWLQHhx2pZab9cPZjZqH7/1y8XFgm5GnK7RbGKq7hsN/POUGkKOUaMtLQW
         NSs+tVVD++nTKDnBF8kOz8ldAR7b0PfPqWmVU/sQ9Nt+ez3PuOI8jwpxXHKrkojofHXB
         feIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9d1uwm9O9Hhvp68VYVx2yD7W5BHn47KrXvCgYJW8JbGnWVi7VlusWGAQfMmIVUrjo7KLx+08LeLkq0ZFsKdTT8@lists.infradead.org
X-Gm-Message-State: AOJu0YyD+9cBB2VhCF0PMj98nmvPJdBojTR5p+4KcUWwuFmFF1FHmGvU
	/3lrEZJUnvw6zfcrTRCvkp3fzONjjxcOg9cf+06Ai96oTpEaMVc43hudGW75ETfUpvDzH7p9vvy
	Qmm+2jQ==
X-Gm-Gg: AeBDieucibT6ZjREJCBWoXEVclCnuDTeSgJ3mara/5IVxhIM2GEalaGe4pRPSXC2fRO
	11HQSNPHtC7pAexUvI1MtVCGGcMCidBDIWD6cxyqelZEwqN1s+2dNr/4gOAU78uucfkCJuBVGyN
	GqiPLyZjvhgiLgTMEPzIqDWJG4YMLPe6NwJ/0+h52cwbpeNAleDWF6GtqtE98bZcTQ9K0iHSs0h
	pQ257l7eaMw/aa+DzzAuqsH3pP/KCeIZYdIOw47Mi5zL+ZsmM/MxZOefjU1qUoVbCsBiP659/In
	rc6yW6arsu/c+GpcCc6178vIVNnCAIkINRsohy0KGHxD2d0gC50ha7p36AaWNLGlzNdMCGwYoXh
	b06XLD2wHsydn379rR5PLC1Al9HMyaQAw3X4lk8uSuWo6PmDdD6nwikO2kulDZplFdo8kQ3ypNV
	X1TKpk87B54UkYAuu4CN9D8Fz8ouRIt18rQNR6Ku4e9V+ge7yYhjTemPGqVdA6MYfK3scauEKk
X-Received: by 2002:a17:907:6e8d:b0:bb8:d25d:c129 with SMTP id a640c23a62f3a-bbac46d30ccmr342304266b.3.1777593285064;
        Thu, 30 Apr 2026 16:54:45 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe69f6bad2sm50159966b.5.2026.04.30.16.54.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:44 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so12118635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:54:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+crRM5AOfm6T81+g4EtYFPBezXHztgm9ifgHMvkPMK+Jzt46d5LnV2MQDzDihnyivoPU4QltKAZQ9ldaErbsut@lists.infradead.org
X-Received: by 2002:a05:6000:2385:b0:43d:7ba4:6b5a with SMTP id
 ffacd0b85a97d-4493f814094mr7876169f8f.22.1777593281177; Thu, 30 Apr 2026
 16:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-4-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-4-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
X-Gm-Features: AVHnY4Lf_-e67ZfLDh6j0F0tOI3LrjkSTUbSwaFXekuSrX2ugdsS_RxN4nbO7Qo
Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_165450_463329_B2D8F63F 
X-CRM114-Status: GOOD (  17.61  )
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

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>

