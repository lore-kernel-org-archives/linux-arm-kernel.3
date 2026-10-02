Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EB7CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 12:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=; b=vB86NsnsukSkOprhi0FCP2lntV
	rqZSpaZ5aZ0i9x5tT6oHuaNCNyqWaZLkY7b6ErmE0+i8OdOf1Qby9B8xNZUHhmVETFldu3nEm7WYV
	RigMags43kpL9/0km1bHuswLW5nsiQ6D5HHg+/JQG52kSD3P2g0TS0yyh5Shnk5HYy6j6Rb6iMypp
	tqBijZ7K9SrhQvfa14LraI3zeoRCLKl5gb8Qcd3AEeJr/kYw+W3aeFCCJa7pR9j+l8NkGixLpZkP0
	Dlx3KA9BRJf+N0Z/IYmfgB7pko3yhHXrAJP5OuokzGJWFyS8Om4Xf2eS2QLCYOSvKOeV5EDsIQ6ss
	s9WmnakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcaL-0000000BbFl-0odK;
	Fri, 02 Oct 2026 12:41:57 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcaJ-0000000BbFE-0umY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 12:41:56 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6af7e6620c4so2136185a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 05:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790944913; cv=none;
        d=google.com; s=arc-20260327;
        b=q2ahoc7DXk2H0NeJ8//YvfhyvTM1rCsjiIuTQQK8IbM1fs0Dgy/CRVs1BLqQTv0HMA
         dP9p2/S54WIkycryoACbN5RCm0bRpVGjA0nyNfVGGAwGfjGRBL8MiKwiiXOcSqHZsTfD
         gNS9kVPkXixO8N0w+vDn4SKclMh7mqVhuhcwBm5NNu7QJa2rQ5JDJVhUwxBE7vZqgTie
         0K5c4negswLh08GHTTKYUvvQ+CcyQMFQISGqSHJo0XdkVDf9lXHWOVmYILLRwEcYtweh
         KQQ9yrUjBF2tOtPsNZRZV3DGhv48H1Dczw021Uph0iRukIMzAi/R3KfRPA9Khv9dLTy1
         fjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        fh=IFjkNsaBv9JVCItoJ9bnvjI1p15/q/zY/bHZHkgWfDs=;
        b=ZQA+QWDBzjmH1lMmQnRDjw1QyY8m1BJ12Xq7VMPeT23zVsRAfWCr1UXTMiUOJx4Rur
         m56r1iGIR7oHHMSH5K1Ru2ZxZcoi5+X2YWQOd14OrugWeLASIDfNYrdeXonSVN3KlL9M
         rBcDPtX1lVaAdCR5NVjgVsFl+YYyfJJLTWNxQsyoDgk56u7lOheTm72f2S5LadAM1Q/T
         +4QvbqzeNKDtCtBaoM4EV5nfaRuRUZyrVuPEDaFuCBcc77UdvyBhUliJ6iY4o5tPTD7p
         f2iglGAbJIaY7rDBX5DY0qcui5pnY4MrJ9s43de/D23JzKRBSYWNF/c/EmqorL/xMC26
         oJ4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790944913; x=1791549713; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        b=WrzdUrPcjURCRNdXci+I5RW9D22r1vU1XW4ac/pMSiS9w2TUgo+4Ot2OuvZX9RyKL8
         zZpFktE4FuCAztlzgOLMBT25girVZ76Rz+td9R+NADO18NWnuu0URp9dDSQkg+R5YOy5
         PZdji4oGiRCIFpL4Jz3KHsSEHcBJ/MKo2cpthrNaqlDlasW/3zTNgej1yrS/dcIFs9os
         T3NDbiKbs4eCtRIKzrkAyFoXX3yLrPZUhxk7k9lIzhYlFrDy9F92cPMBEqpOcNN94ZMQ
         VqNZedyH+FQ/llbgUv8XkjzGGc4ujTsNUJ5tvt+NgBcC41nspvxsvBgmjqvS9mARe5vG
         hicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944913; x=1791549713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        b=ZN0BnfIITehS3e7pUOTwP/TW8jzisfjHEXWbolC/ro+cOpD2Ljzm3QuRzxNoFFg232
         KJWdUYY5Hn3Q5Qwi4qRQWc1Nw+02OgKUeVZLI2MtJrC4AUf7iczCRPQnNaS2gp+jK62k
         jcwRzy63ZX9n3En66FLML91pw6DVSraPmzRDPf6sRCYJJhm1r0lrbL9LEveLQvjpzRK5
         /+R7TkmH+EXTAfHIbnQ0Eh7H2kpUePuQ5Pvop8eWc/MlNpdOZjjcrUV4OXnjzY4Wjbz2
         un/ziav265tXRWbRwf+Nu2zbnOJqvEzG+fU73iC9gajJ3GVXnxXlS/t2fIBSMUXevWZc
         JIPw==
X-Forwarded-Encrypted: i=1; AKwUvBzfFrz17oNo+Y4Ed5pOxM+BUJJx+aUJkHu7Yn9mLYJlQEirHqzQcyjziGuphAN92l/mNs+aIC5T82rQbx9QkLdc@lists.infradead.org
X-Gm-Message-State: AFq9FYJjfKigaCbJC+baEL4WDUHAhYyAXyPGCTnV25rL6X/4kCpBc2Ki
	NzuxxVGKugBxLDlh8GPGJtgy4tv2NIJHiKn5n6uZhr64HKoLC+hRkVk/zc/67D9zFFaHYifxTw1
	gy2WMQC/fBf2W6jKT8qv3eIBcT+g/t9FAR5/BmLPTqA==
X-Gm-Gg: AYBFou1lLubJK31a06ZSuO5+kCneColOpZ3ENUEMA+77/V32IAg6cpwUYqGOihwiw9R
	k/1hFS1emNxMbMP1OMtJGR9w+YVKubbZjMO1k6ZY4GiDThz0NhVhOdaP5MPjE7ByYwFe6cEXqDp
	UKb61y99Scv4uyUi8gddDlLlS7cFS+HqSHAAFWg36QxY5jZffzwuOs3+wPWC/pEZM374tnG9Omi
	/l0xUWcOyb9+y8ZV+56SyhyOpV9Pu/ioV/zFWcxD2sWnJFP2Yfbm482Z2zHL5eQiQy2Qb370v0i
	22mrWmvu1ZSnJc3A8l7Dt7zh6w941SsvchOZT5yi/of+WE8aSUACTkTgwbX2YnqQBjFoSyP9yhn
	/w3DriPAwcCiyVg==
X-Received: by 2002:a05:6402:5113:b0:6aa:f1d2:ddbf with SMTP id
 4fb4d7f45d1cf-6af9e335ebemr1728168a12.35.1790944912779; Fri, 02 Oct 2026
 05:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org> <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 13:41:41 +0100
X-Gm-Features: AclHuK_QyQlit6GQkvv90porbL6_8NAwZ9GwGxUXMwJD_qPCIZbSMtNOl5zyftM
Message-ID: <CADrjBPrm0o5scen0vk2ZiCzGW6kdTWsciPvA9K7JW_yb+Mp8PA@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: exynos850: add PMU interrupt
 generation node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Henrik Grimler <henrik@grimler.se>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_054155_301800_2B1B4AA8 
X-CRM114-Status: GOOD (  20.90  )
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

Hi Alexey,

On Wed, 30 Sept 2026 at 01:13, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Add pmu_intr_gen node for Exynos850. This hw block is required
> for different power management routines like CPU hotplug and
> different sleep and idle states.
> Also reference this node from main PMU node.
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..803fc127d895 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -231,6 +231,7 @@ gic: interrupt-controller@12a01000 {
>                 pmu_system_controller: system-controller@11860000 {
>                         compatible = "samsung,exynos850-pmu", "syscon";
>                         reg = <0x11860000 0x10000>;
> +                       google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
>
>                         poweroff: syscon-poweroff {
>                                 compatible = "syscon-poweroff";
> @@ -248,6 +249,11 @@ reboot: syscon-reboot {
>                         };
>                 };
>
> +               pmu_intr_gen: syscon@11870000 {
> +                       compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
> +                       reg = <0x11870000 0x10000>;
> +               };
> +

Since you are now creating your own custom regmap in exynos-pmu you
should drop the syscon compatible here. That should avoid syscon.c
ever creating an MMIO regmap (with the wrong spinlock). I've copied
some of the commit text from my commit
a21d38b5e209c60e73f81e467cc53ad57b5d4080 below for the rationale
behind this.

   arm64: dts: exynos: gs101: remove syscon compatible from pmu node

    Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
    "syscon" compatible") it is possible to register a regmap without the
    syscon compatible in the node.

    As mentioned in that commit, it's not correct to claim we are compatible
    with syscon, as a MMIO regmap created by syscon won't work. Removing the
    syscon compatible means syscon driver won't ever create a mmio regmap.

    Note this isn't usually an issue today as exynos-pmu runs at an early
    initcall so the custom regmap will have been registered first. However
    changes proposed in [1] will bring -EPROBE_DEFER support to syscon allowing
    this mechanism to be more robust, especially in highly modularized systems.

    Technically this is a ABI break but no other platforms are
    affected. Additionally (with the benefit of hindsight) a MMIO syscon has
    never worked for PMU register writes, thus the ABI break is justified.

    Link: https://lore.kernel.org/lkml/aQdHmrchkmOr34r3@stanley.mountain/ [1]

Thanks,

Peter

