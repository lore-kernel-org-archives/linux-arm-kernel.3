Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EB7FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 04:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=; b=tkovDNsWkYtqWVWIBx3MO/iPVP
	icIaEdGAVrj/+kIhGVyKm88F26rW9/BZ6z3KBimsLgdxkxoeGV+nv0MX0alEiz55Aby8Yr5KJcp3O
	Wr8Hmx8AEylBA9bObZIkHizL5FzQq1x+nQR7VUH5Fx+xYxT5jbofy8LxJvbywOaQ7nXejTsShx5XE
	PNko3dzga2uvS+Oku7+rucc2Kg16rPBuPmCuArFFGu2RFA2iQK6v/DqM0SzoI9gOAFkrXPswK5TLd
	cIaDGPUBp4hIUEPvYvzmrMbNXHb4J09mPJz951gkODULDWDdRm7kGy2S05KrD3zyXO+/9rwJM8eiD
	VjanzqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwN4-00000002uqg-2oDS;
	Wed, 29 Apr 2026 04:17:58 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwN2-00000002upK-1g3I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 04:17:57 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-38ce0ab821cso103705591fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 21:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436274; cv=none;
        d=google.com; s=arc-20240605;
        b=FFJL3iEeCvYx1CasoxkkwSPOvBOf4Oq69LYcrAExABWb/Q5XH2HRbkctapq9c4rJV9
         fKIdXWllrPTZBVgX4t7xN7GPUjSLOWSF6MlemyQv21bZBP0jDRj+9PA7X087DANOZOpO
         HUJKqrDCabale4XjbOSEgntogolboejzn4gdAdmQMdJ63i7M1j6cgff+rWI/b8aCmhTI
         YOBcQhpX+Y66pJr0VxshO7a/6XVW1ANGeytzgjZEGtpniQLqf1T4yFJzfWvxijSRteH3
         72cZQ8kveM0DRZ/2M1/MsKoJIfF5mlMnw5JO1zdeZRHxffesYh9UADYlO82MNHuJ74/g
         ta7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        fh=OXg9v7yO/KA3DQwU8vOI8MFsyi31/V+GexKhZTljU8M=;
        b=Cpk9EYpK6VceN0LkNQfFx0DKhyxAJ1ftatLMYtxw/0ciWXHWj8WzGMChxqIqBDCjB0
         NwSOAGu/xUxnAnWukeZNaBimeet0RbJmihJvoC+ZL1pW91v0dQnw9Y8wV8JI/7qStXfa
         owo7glSWfc19ctbxmhpa+B809p94r1C0bjExgA+kzvStVzVswZZ0JwHoSeGzUq5AeHoD
         5PR/bPPH4xEBH12ehymTsUmF+m9J1ZepYEMlN0zEmW+onw1Lb5mycfMEuzGtSH1JMvPA
         d2BZ5rpGnsfRWdHrqyvT6vP56F8yVUKUlLjfY8iBq0deJMp+S5MqHmskvAyU1d2pMwbC
         CEyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436274; x=1778041074; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=QXBgtZeppanZk8FGUN4wLqJ8E3U8s6E89VLTQdKRkcjDLIcpUfM1ms5qMkuGoPYqnO
         Ea0RU1iUEKiRe/7qX0wNRP65RQy5IafWnFr/JfGZE+BGuRiGgih2Z5EMCN2tGhvAytIE
         3TFRjko7mjyD2oFROAqDhUA6fsZZvPTZiXmZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436274; x=1778041074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=f2ysPb+9jjd65WdAIY9pUKK1S9K3wy0NgfcqZDlXAcfxQwh1L/x6AmM4hO7mdjFjpU
         dY7w+lv6cJloc+d0LqJ0Tl82tbk3+LYqNHCxGoVf78nU/wzInLmBbe5jdCJn/2ixpnLu
         9h6oLEuyfT2YwhAAsYAPXb1DfT/FVTWpeAuUqhxoeXjjypW1bbo9+SDHq7QDsE2XeP63
         JaCPqoXgvC45flrN2lrz6/Eo6pR3IvwexVbD8ydnA8w7TI65xspES/Y2A8jAPqxIrWui
         62uUOhJHUYb1YizT1edfhNFyxeOTeFl972PPWFZ4iSCfVjpVqpsPxVmyDWATdlPTCo4i
         mxZw==
X-Forwarded-Encrypted: i=1; AFNElJ/KQsbDVW+/ta7qQYp2ulW1xDufZvKSWRfAIx0j3gfqR9M64uintiOIB9cSu5qwZe1W6L4RvE08VBpgl2EO0Gql@lists.infradead.org
X-Gm-Message-State: AOJu0Yx70G2RopFfpsp+AuAVdfcuYOMP8G7q3fpteeuL6PdD3gvI6VNo
	ra4tcvnGKPU4fpPAEL63sS10UPg1Rxf1CkhoHhev2EwF3mbSAx+qgLWUA/oGPA+0ioCLEPHZ6EU
	RrPWMW3n/K+HQykscVjgrow46XZYtDxqAwHZtt1qi
X-Gm-Gg: AeBDiesVF7eO9kgofVpBQeHQ5IWoSUwSIliUy+3RuxxDY5BtuT5pMDpE+MWcdLbA1Nj
	l9FZAo+KuZIvo8a5TXzQiYR+pGaXSEYUD55kQLh1+tUnJ/Yf/5tahEH8WGYQTHlqdtHWLwGeE13
	7DofROcX6tYxpezNucuFsSY32w9l+Ne14QNchd2JO3sMgus3h5krLOvNCwy56BxjI3sYmXRpk/a
	v+8M29E3zR7Vsor7CvPVZmCQh1Pp5ahMOLT1Ia+2cszr/D/ZTeU6o0isMeNEjCollBu4bY7r0ck
	ZM9XOwZ9U5OvDzmkmg==
X-Received: by 2002:a05:6512:3b21:b0:5a7:46f1:d96a with SMTP id
 2adb3069b0e04-5a749cf6fd8mr890120e87.13.1777436274082; Tue, 28 Apr 2026
 21:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:42 +0900
X-Gm-Features: AVHnY4JKvPmufJ1LEj4mzB6PnqIoSu-1P7-pbmF9YGak1q31h2Rrygv9WVJBRdY
Message-ID: <CAGXv+5EPpB92d=ttP9ezOipL6=bC6WYpQakkd5L-weDjLpkrFA@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211756_465344_88EA0F59 
X-CRM114-Status: GOOD (  18.17  )
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

On Wed, Apr 29, 2026 at 1:12=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-versi=
on
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-sto=
rage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-siz=
e
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-off=
set
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
>
> The /firmware node has an empty 'ranges', but does not have
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

