Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA18BC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE506qyM+xSDVLQ18Cv32kLGdbyz+6FYOgoc9bYH4MI=; b=HSSEzV11A/VRpKAjU0EvW6NkZt
	UM4WDNHgwYxe0qPTU4TQcjUEh5NcP/EIESMCvIpIpfh93WLLMK0+a64K2b+yHtk+UjbIpeYr97sCl
	DQ2xJN4TrnlJZSTCpWwD2ukViDQ38h5utJbS9//9q8z440OhnLuWM42CL/rzU99LyALQYr4NhCdsQ
	lEwPTsat2D//6Va64kLZ98T+lDGDhJ7mGJ6DxDpdoSxRbAizrFS1qd85VaHv0E1+0gkuIxsbkLL7N
	NxFuyRBNc8Ml8J8p7FwbmUzDMEVlRiEnxXrJgvTe3BUssMrCdecYMVhDpo+EH24IxZqYVbCnNFR4s
	tmKByq+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OLR-0000000Clrt-2r5V;
	Wed, 09 Sep 2026 19:52:33 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OLP-0000000ClrW-1rtc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:52:32 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43daa8f4so8842987b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 12:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788983549; cv=none;
        d=google.com; s=arc-20260327;
        b=UGCb75IntI79tlB71YytyEO7SN0u/3bthtpIQ3fetkfsEQbGX9Tg2lT2O/cSD59qBe
         UrM3R8AC/Bt2+zc0Bx2fASUFx2F0LMjdHdWHF/YID7MTzaGkiemzA8xzYqVbMTaZeU8S
         yn2Cb9E+09HWpJGYir3iigIQ00u9YIExaDmQQwks5rXYFOQIw9LXkrRgD4vDZC9lTDbZ
         3vMvM4YD6ITKyQRKc7KnHqIiu00D2S1WS9Aj9Q1HYTDQWqQ7y0J/tWeKa4jjCoavcjUu
         n32dCOKLziyNy4tjJbLiK+4Z71SuK14xsuqvqE2e5gjJG+VXWwQkqrqBCSrhKx+gBWzg
         tjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JE506qyM+xSDVLQ18Cv32kLGdbyz+6FYOgoc9bYH4MI=;
        fh=BPoCmAOZAZcUQrKDxcoAJy/26g7TecCd/gTxLBIZRp8=;
        b=ma+R6bz9F88/FiRJpYZAIrUug0lItyt8jro2PBAN+o0PKvzWdirnfYdzD9V1oNtYzg
         4fkK57GeaP6Q3hoaWlk07eGvKwD4SEEu8VJBbTLai820cxfRXyWfZ8R4pV56xZTFf21F
         w0U0Tmmy5SZQcTYWF1eK504oJxS23xY5ewUANItVuTZsxHA6dUngFixn/2j0bekpmoA6
         vPq6Wpoq+QPab9BEC5MXe3mA0eST3q+tK+Ux+dy7K44117dzN1UG2/5nflgS+++4u8P2
         QAWVKr5t87eFB8/MFbXgqCShGCJN+8R7iyb69CK+aKgXiYA+QaJNL6Cot2K98OoHTd4d
         odsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788983549; x=1789588349; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JE506qyM+xSDVLQ18Cv32kLGdbyz+6FYOgoc9bYH4MI=;
        b=CG3bwjzdSP3uE/MNTtME+fRoTt+BOdkeSzF96SJ2D2trP/qtl54yw+OQG9ccTyjj1M
         3wqgrxzWy9FTfZJGg4UwNigRc2DEWfXcchIBQlG14GlpsAursicShPYZMY/Vwg4vwusa
         L1drNdkDA4iMeNPuYa5MDRyHG9VkCuIUZwQD7VDAtYHIjLdFBrsC1Da6QcWOYa/q0QBC
         x3+nYDpJe2CFy43jk1LYFa9vVFCIFCJj6JdfMaC6E0xwLaNR9VOY9zEEW+ZBa+YW+PVa
         QXa2CCBvdmifhPSkONK0hJrkcNZxo4SJQtvQZ4KUtFFPrbC+cHdoV8QCCAFzaVXGq6Gq
         q3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788983549; x=1789588349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JE506qyM+xSDVLQ18Cv32kLGdbyz+6FYOgoc9bYH4MI=;
        b=MmfweMqr5pGfDn8v54WUI1za2isXl0tankm9TmWvzt047lvUSgWn8d5VS2lFS1p0mb
         3dEf5gpB/lzGKGL0MDOmA1WNzi21WtKukkMS2TCOZKWCjRuIQfCGplj4ZtxQzyiTlYRN
         wfvhRBJyj9DJhC4uxtRbCEPFBKLtH7M62T4SsGJaBWwda9rjM4B56tg4jr35dtE4RAws
         VpZASWo3jd/HFKvpLbhmMl/c7dgsPnm4upfLYL6aMpvKN7c12n6l8U0Bh5lqs+XUU2Jy
         3HLgz1PfMzs6r7KQ0KVXhzHYv9RV7Au9GAgQQZ3+Bl1e858XBdKfKCzPkNHtbtggwvT0
         Mmxw==
X-Forwarded-Encrypted: i=1; AKwUvBxwUddd2K1UnuAJyYpgaCCxJ+ZUl3169wQHt5xrlS0RLvG1syMNeMyyOPZiRYQ54/g3JAlhA98wd3254SD48iXV@lists.infradead.org
X-Gm-Message-State: AFuF++n4kP7707R3DhS2EePKskFtmYvVnOQmJG8raxvroEetbZPnn/+5
	S8hhlng348yzaR/HATL++NaMr6L7ulnBiwyV4gnSsbcdseJ9j0w3QlV9UnFx3/Exn2oxuDbSiA4
	QLcA8JrA/i6MG+WJMyx6xMRUNa1GqNwTyYhTp8NwVog==
X-Gm-Gg: AYBFou0URR+H05ZAUR+8YyZ9APSKQ+Zvz6KWyrynRsSWnAIBlA8V/AqwPCSfFvVOPqW
	36x4lCSMbmm2POW9BnQYdSQuSyAAa5cNv/EYaSyL9Z7y7d2tOIGzMMeLzQD/1b9TRsU7fxcLnD5
	1YiF5XDq9K3A63YlNMQF0LTYqYyxbfEJ1th6PAviXpVTrTARntHhM2gO1gtcS2DXbQpleNydBXN
	+lSpzRseyPjPrDHVt1TiU4V+ydPhjXA5n9R7th9bSQwNyMEKiALnHU+Lkoz4xhCRGzyi3OQgTQr
	9DHoIAHiDH4DPMb+5pT8TTRvjc2t+9T/1IOEROb9KKCPhL+HXGMF5Yi2fqH3nzGBTq+TLFLp2Rp
	8xYOqQ/ReuvmVkg==
X-Received: by 2002:a05:690c:31a:b0:87c:a15f:b667 with SMTP id
 00721157ae682-88153e6779amr21225247b3.19.1788983549289; Wed, 09 Sep 2026
 12:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260909194450.183693-1-tturner@lineageos.org> <20260909194450.183693-3-tturner@lineageos.org>
In-Reply-To: <20260909194450.183693-3-tturner@lineageos.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 9 Sep 2026 14:52:16 -0500
X-Gm-Features: AcwNN1XFLGvzp87hqDe4D94_SRB5dZ_z-E3RMUBPTQ90wJSi_XkiyxbHOQTg3Lw
Message-ID: <CAPLW+4=sHV_xOfhDkfZ-TXUaY+BcmHRn25x+YGcmz8Kar6d-gg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: exynos: Add GPU/Mali Bifrost node to Exynos850
To: Thomas Turner <tturner@lineageos.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas_turner@talktalk.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_125231_511968_82E835ED 
X-CRM114-Status: GOOD (  28.70  )
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

On Wed, Sep 9, 2026 at 2:45=E2=80=AFPM Thomas Turner <tturner@lineageos.org=
> wrote:
>
> Add nodes for GPU (Mali Bifrost) to Exynos850. Does not provide support
> for temperature throttling, DVFS, power domains, governor support,
> boosting and voltage control. Once PMIC is properly implemented, support
> will hopefully increase. However, the panfrost driver probes, the
> Mali-G52 GPU initializes and the core clock is set-up.
>
> Testing for this patch was done on a device not currently supported by
> linux, the Galaxy A21s. After enabling this node for that device
> locally, I was able to test and confirm basic GPU functionality. As of
> now, this patch has no users which have tested GPU capabilities and so
> the node has been set to "disabled".
>
> Here are some logs I pulled:
>
> panfrost 11500000.gpu: clock rate =3D 377000000
> panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,0000=
0400
> panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x=
00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
> panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0
>
> OpenGL core profile vendor: Mesa
> OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
> OpenGL core profile shading language version: 1.40
> OpenGL compatibility profile vendor: Mesa
> OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
> OpenGL compatibility profile shading language version: 1.40
> OpenGL ES profile vendor: Mesa
> OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
> OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10
>
> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> Changes in v4:
>   - Add Reviewed-and-tested-by tag
>

If adding the tags is the only change in v4 patch series, there was no
need to submit v4. When maintainers apply your patches they collect
all tags from the latest patch version themselves. So you only need to
collect the tags from the previous version review if you want to
submit the next version for some actual reasons (not just for merely
collecting the tags). Sorry if I forgot to explain it clearly.

> Changes in v3:
>   - Re-word commit message to be less ambiguous
>   - Provide some logs in the commit message
>   - Add a blank line before status property
>
> Changes in v2:
>   - Add a patch addressing the samsung,exynos850-mali compatible string
>
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f..721b2b2c4ffb 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -310,6 +310,19 @@ cmu_g3d: clock-controller@11400000 {
>                         clock-names =3D "oscclk", "dout_g3d_switch";
>                 };
>
> +               gpu: gpu@11500000 {
> +                       compatible =3D "samsung,exynos850-mali", "arm,mal=
i-bifrost";
> +                       reg =3D <0x11500000 0x5000>;
> +                       interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "job", "mmu", "gpu";
> +                       clocks =3D <&cmu_g3d CLK_GOUT_G3D_GPU_CLK>;
> +                       clock-names =3D "core";
> +
> +                       status =3D "disabled";
> +               };
> +
>                 cmu_apm: clock-controller@11800000 {
>                         compatible =3D "samsung,exynos850-cmu-apm";
>                         reg =3D <0x11800000 0x8000>;
> --
> 2.47.3
>

