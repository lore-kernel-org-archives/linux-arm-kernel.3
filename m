Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A73CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 23:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=; b=uRIa95PEDu3C3dVhyBw+fx1cUH
	0YWjiZqmjKgeUyvcMBoJ9e51wtG4nOkg5rYR1dSFrh+yiRoTzD4Sq68MTWW8xRtHxg5tt+pTzDlO4
	BkEy4Yutu+4MtEjZd1mUNHgVDAmBlFcKOnP0an9wr1EknIdATgcYg0s5DHHeVHiJYrO3AopZPLfSR
	FA+JCoC8XJpI3Nlk/DBzenmeNHe7bAmIM0eAYIFIsr5lX8tMTkCVVg03cshgxW0tZfxiifC9eXI8h
	1I+f3c2de+erZL3LyC0sD5LEzUwnz8SEcc/O1Ctu4u4UV7pklf275L3yzy0jkkukXisBFhQ1LYxUR
	zdycsvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbDe-000000068lU-0DzK;
	Thu, 30 Apr 2026 23:54:58 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbDc-000000068ji-159s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 23:54:57 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-67785ef88feso2520957a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593292; x=1778198092; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=;
        b=jCUnrRfgKnvyfjH3iwyt54UcmXDiFH4uejhKmmn5lG530q7kXN33RETCj9gmWqQjXA
         /DLtwXSSXJ6U+rhtPhvu174cIrJlCGyVbvj4Luy6rtmo4Q5IS9m8AcejVUKQpt2Xxdo6
         hzXWU/MHx9IX4eiPvgTL0h00zZufswnky7vAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593292; x=1778198092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=;
        b=Y7FNdNWAMxkndpcwBs3R76zFgEej8OUK5IpszkJeU6I9zqZehBkbBJNnoS6Ovf/ti0
         xEs+6+33mZm3PeYtSkZr74k0/A9HLeK9Q6bbNiYeWwLOAbz44gF3XjvTY3EhobI7emI+
         976x33d4DnPnb9mFryc+V39Du6nhsk1PbN+UBMDwXpvGg+g/b6VRFIdooGSWhq5L1cZN
         nKWeqE/VcEZ2MZXO8vSV/Cdu8k17qRDQXgz17WtUo8S7GKjan96q7NzY529Ml5W6cz2m
         bC1FBk4EvYqJehWNYEKEhzVVYx3qJ9eJWlSp+QkL5St0c25QAcDPUGHihH/9lt2ERcQN
         VCeg==
X-Forwarded-Encrypted: i=1; AFNElJ+DwV0tN+hDsZjSfNwLolHVX8w5rd1+EZjzpDIXbupxWueu6aXZeM4UVUs4kKtHfAofA8Ft2s80G3gmvwcqtJyT@lists.infradead.org
X-Gm-Message-State: AOJu0YyZsjWvJvRP3zB/dzOTuoxFbwqlNmEh3+q+zoTVaEjYr1qmBSbP
	N7bdmweYtoDwwCVBFtTJ/Lv4ISgyJPLc1IIGXKd5v/2g7EE8KdgwWFS7KSb5ATopzhyYLMSBsda
	vyhA2+A==
X-Gm-Gg: AeBDiescLE03uwDaarTmksTCA+qJy+V0aNmgrqkLyEdKgB42/t0z06qjSH7xJLM+MeA
	ezbT8N10s27SEeZXoJNKfOiqY7p9VyT70Ti6NTRbKoyFcHLZKnCR9CzisFoSVuT95iKrb0kH7oF
	OqEoW9pc3BVEp0+qMida6f4zh0Q36a0Tluzb/rnMCTcg/bGWE2uR048K3SX3TIIhJ3Cvo0zzadj
	zSgdCq5gamDrgW1/sm73KhMYGTEZmH3DtXCRZsmOE0p6QyeypJ94zyh8g9KghM0v2ux9KNQg+ou
	YoPrJf1HwB7JVesg4M+Au99+iqipGGSyp8eSYxfKTo4fTE1Ank/L9/hsEwrqC7IszGzqyI0KPja
	e/qeJuPLKklLbBwGXNj3O5q/zkPScMZphYNShCtMMo7nyO75KXbs4fVNbzVP5CjeesVxWaOzegb
	xTW+kNZA1BhtMbrMsZiwIcvcYieOrV5fuvEkZ1Xx+MWSxsF8Sq3iN/0dOlRD1t1t6KmQepkoZG
X-Received: by 2002:a17:907:3e9d:b0:baa:67d8:9106 with SMTP id a640c23a62f3a-bbec10faf28mr32748566b.36.1777593292255;
        Thu, 30 Apr 2026 16:54:52 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d97db6dsm47308666b.51.2026.04.30.16.54.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:47 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d7e23defbso863578f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:54:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ldtUGSsfxxTwih90+o3KRKUKFP8XgHjpQvCEA7my147lnQrqAqTNlJtZ9/EISZ3w3VPt9xKVMcBL2I4vI8XQc@lists.infradead.org
X-Received: by 2002:a05:6000:2905:b0:43f:e16f:3cc3 with SMTP id
 ffacd0b85a97d-44a88058b32mr1086350f8f.22.1777593286514; Thu, 30 Apr 2026
 16:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-5-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-5-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrPJwCC3bUJVQJGPwO3HifNOkK4tFd+xwNac_36kHvqg@mail.gmail.com>
X-Gm-Features: AVHnY4IqCV1PxHRIY-OTvaBqqWEOfyPxbcpa8ZWBIyLwROAiOEZ_SsblLMHW3zY
Message-ID: <CAD=FV=XrPJwCC3bUJVQJGPwO3HifNOkK4tFd+xwNac_36kHvqg@mail.gmail.com>
Subject: Re: [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to
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
X-CRM114-CacheID: sfid-20260430_165456_323175_21A63482 
X-CRM114-Status: GOOD (  19.42  )
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
> ---
>
>  arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
>  4 files changed, 20 insertions(+)

As per:

http://lore.kernel.org/r/afExm9HeB-FMmP4P@google.com

This patch shouldn't land.

