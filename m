Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24040D29C2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hF78wptD7ld1V2LGnCYp+bLK7K2nBtHmiHSnMfpqB8c=; b=r0xKhEUJCUfy2+p3K4KkpVUOeV
	D5Z/uild8kZ1TPnRqJpUnflnhdqvqlGnW+J3m2eRp812umBRNqCTJmB3GK9w3iHeE5W/ZodMbAvyg
	bNyCfQcHKs8a+qqVIzqJzK4ghZAwfcSOX+zAsacncSxtJzOkQrONE/EvpOMvoRNCb39y1Nr6tQgCN
	CrdVkkCcTNREOwB3JpqyY8H7JN7r4eIZNpBRZvMUrKJzP0ECemZ3McwSvopQOnGEvSmyE0316rcgv
	n3Uvu+t3+g4i4pyCFukIxmTa9OyXUc1IgWvd77KJYr5+OkFMgW3HzPHvfOsOq64d1cPafXhVC3tiz
	7QUQzz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpso-00000002DiJ-0MKJ;
	Mon, 19 Jan 2026 14:05:32 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpsk-00000002Dh1-0Us0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:05:28 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8c52c1d2a7bso590496185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 06:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768831525; x=1769436325; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hF78wptD7ld1V2LGnCYp+bLK7K2nBtHmiHSnMfpqB8c=;
        b=YZgBnK9ThIsjaqlWNtoBv6BwfPJB/Hup4s/o9xHcl2K7BDoWqZ9EUa7I5MFmzhoZz7
         egos695nFIPGQx+yfnOXmR8C46KO+zdvAYy2noOkdFzyaZtl3Q9rAYkT436mQabWM88K
         MY2GkTuRhUqg+TG6Qypb7bHUyNYVF73BHST5RsrhYMjwM0lEbpJ/P0YjVq3gBb3T0l0B
         mvvA0tUMaDPXkB7R2UFkmBrfFrLCgzg+zxUdkkvuFBOtkPeXCzZcaAHog/g+cHz2s0DT
         LuXTtvw2slQP41FbBCu24NwWdZ2K2RU9Ue7PCVeTOUD8HMlZ8HqWdece0OrAVRqRclos
         49wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831525; x=1769436325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hF78wptD7ld1V2LGnCYp+bLK7K2nBtHmiHSnMfpqB8c=;
        b=NeaylXJVw10ofPgIOPVLf5ZMfz/k9y0m/Te7WuusdLb1p5Y9xXppbYoq7RdL4GVHY4
         HpqbjUMVXBRa835MvDtnKZi4E/TfzOOEG651Yu65GWzJurf7dQXRkA9zDCq6jnFzx9YX
         th+2LouElYJuE5mbVNszPdqj10LYl0aD8rhpKnOow/ADTgjnhOT16dj4EAoRiadaCCQi
         p+noDnEkl3kXwZeoGqQuDaCphQlUrpE7h+0cOaaYptSuthcpry/c34AMLHIogr3RZlBf
         oO3Vw141HMUtnTkdD1mLAIfKKvP35DhBFnidmdMQi2Go8zPmECJ6fsRHYPocz7B+X/he
         ruhg==
X-Forwarded-Encrypted: i=1; AJvYcCXzJNU1H3krY3dJO7NhNnyBcFemnas7wXPFPOX3NgWf6WIWeouZ0quEFemhYaXefUyQlHfUyMjFcg89hlzcUtfb@lists.infradead.org
X-Gm-Message-State: AOJu0YwhVPuhYZ/mFHT1blBvndhyI1w2a7U8havjyxJ0eXWSZP4BRJNO
	2H9CVkavLrd/N3XzKuI3Y71uRmgsxJmd71qKASIX54FH8zZ9nkSrE1+ksbfXey5TP9xtslQTiyO
	BXCtooAdY1kbnuirlzWyraszTufCgI0F7qzPy
X-Gm-Gg: AY/fxX4XbARLLatwleDlsZXVuvh23mFuP0VnQSXtilHAlLNHxkYHxSqgFr+bGhb6tT6
	Ymubo1HJeUwJoP7guNYC8qq80+WaXSuegkaf0As+Xee7JETSPcRDog4MjGLqnmsqtEplgmyk8yL
	7xBWPK1WG1HrRiNXszMsbcD/NdHxur2647M1tfS97KiU0u2wS2KxDgSSITvN3kLz9YtN5t+MGaQ
	tYyFDy8GsoHbMcsrZlQozz6j+HcO287X8mbvjJ7+rhU2VIfPDhAmwTm0fM8K/SzauxH1JYqrwth
	vEbtCcay8JBGgIfGS1fyTRU9RTI=
X-Received: by 2002:ac8:7f54:0:b0:4f1:de87:ad90 with SMTP id
 d75a77b69052e-501982dcb8bmr201855631cf.4.1768831524345; Mon, 19 Jan 2026
 06:05:24 -0800 (PST)
MIME-Version: 1.0
References: <20260119-ufs-rst-v1-1-c8e96493948c@gmail.com> <b0904cb5-3659-41cc-8395-79eec9e82f01@cherry.de>
 <CABjd4YzJud4ZZQ_GrOOSnfEVG7wgHmPSf9w8oQhLVSx6WXgN5A@mail.gmail.com> <d3b5f622-36ec-42ea-90da-3c056e1b6461@cherry.de>
In-Reply-To: <d3b5f622-36ec-42ea-90da-3c056e1b6461@cherry.de>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 19 Jan 2026 18:05:16 +0400
X-Gm-Features: AZwV_QjYhPBrmB-HzyDxfoEaeqoxWE1URl6xYqQ4XwLXLh3YQ3UlufJql0dky0Q
Message-ID: <CABjd4YympEqbiN9-Kwv40YtaCh6bu=3PBQPyvvGgKCQbLeZmZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_060526_891013_53C3DA19 
X-CRM114-Status: GOOD (  45.24  )
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

On Mon, Jan 19, 2026 at 5:58=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Alexey,
>
> On 1/19/26 2:43 PM, Alexey Charkov wrote:
> > Hi Quentin,
> >
> > On Mon, Jan 19, 2026 at 3:08=E2=80=AFPM Quentin Schulz <quentin.schulz@=
cherry.de> wrote:
> >>
> >> Hi Alexey,
> >>
> >> On 1/19/26 10:22 AM, Alexey Charkov wrote:
> >>> Rockchip RK3576 UFS controller uses a dedicated pin to reset the conn=
ected
> >>> UFS device, which can operate either in a hardware controlled mode or=
 as a
> >>> GPIO pin.
> >>>
> >>> Power-on default is GPIO mode, but the boot ROM reconfigures it to a
> >>> hardware controlled mode if it uses UFS to load the next boot stage.
> >>>
> >>> Given that existing bindings (and rk3576.dtsi) expect a GPIO-controll=
ed
> >>> device reset, request the required pin config explicitly.
> >>>
> >>> This doesn't appear to affect Linux, but it does affect U-boot:
> >>>
> >>> Before:
> >>> =3D> md.l 0x2604b398
> >>> 2604b398: 00000011 00000000 00000000 00000000  ................
> >>> < ... snip ... >
> >>> =3D> ufs init
> >>> ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2], =
pwr[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> >>> =3D> md.l 0x2604b398
> >>> 2604b398: 00000011 00000000 00000000 00000000  ................
> >>>
> >>> After:
> >>> =3D> md.l 0x2604b398
> >>> 2604b398: 00000011 00000000 00000000 00000000  ................
> >>> < ... snip ...>
> >>> =3D> ufs init
> >>> ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2], =
pwr[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> >>> =3D> md.l 0x2604b398
> >>> 2604b398: 00000010 00000000 00000000 00000000  ................
> >>>
> >>> (0x2604b398 is the respective pin mux register, with its BIT0 driving=
 the
> >>> mode of UFS_RST: unset =3D GPIO, set =3D hardware controlled UFS_RST)
> >>>
> >>> This helps ensure that GPIO-driven device reset actually fires when t=
he
> >>> system requests it, not when whatever black box magic inside the UFSH=
C
> >>> decides to reset the flash chip.
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Fixes: c75e5e010fef ("scsi: arm64: dts: rockchip: Add UFS support for=
 RK3576 SoC")
> >>> Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
> >>> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> >>> ---
> >>> This has originally surfaced during the review of UFS patches for U-b=
oot
> >>> at [1], where it was found that the UFS reset line is not requested t=
o be
> >>> configured as GPIO but used as such. This leads in some cases to the =
UFS
> >>> driver appearing to control device resets, while in fact it is the
> >>> internal controller logic that drives the reset line (perhaps in
> >>> unexpected ways).
> >>>
> >>> Thanks Quentin Schulz for spotting this issue.
> >>>
> >>> [1] https://lore.kernel.org/u-boot/259fc358-f72b-4a24-9a71-ad90f20813=
35@cherry.de/
> >>> ---
> >>>    arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi | 7 +++++++
> >>>    arch/arm64/boot/dts/rockchip/rk3576.dtsi         | 2 +-
> >>>    2 files changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi b/arch/=
arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> >>> index 0b0851a7e4ea..20cfd3393a75 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> >>> @@ -5228,6 +5228,13 @@ ufs_rst: ufs-rst {
> >>>                                /* ufs_rstn */
> >>>                                <4 RK_PD0 1 &pcfg_pull_none>;
> >>>                };
> >>> +
> >>> +             /omit-if-no-ref/
> >>> +             ufs_rst_gpio: ufs-rst-gpio {
> >>> +                     rockchip,pins =3D
> >>> +                             /* ufs_rstn */
> >>> +                             <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>=
;
> >>
> >> The SoC default is pull-down according to the TRM. Can you check pleas=
e?
> >> For example, the Rock 4D doesn't seem to have a hardware pull-up or
> >> pull-down on the line and the UFS module only seems to have a debounce=
r
> >> (capacitor between the line and ground). So except if the chip itself
> >> has a PU/PD, this may be an issue?
> >
> > The SoC default is indeed pull-down (as stated both in the TRM and in
> > the reference schematic from RK3576 EVB1). Which I believe means that
> > the attached device should be held in a reset state until the driver
> > takes over the control of the GPIO line (which, in turn, is consistent
> > with the observed behavior when reset handling is not enabled in the
> > driver but the reset pin is in GPIO mode).
> >
> > Are you concerned that the chip might unintentionally go in or out of
> > reset between the moment the pinctrl subsystem claims the pin and the
> > moment the driver starts outputting a state it desires? This hasn't
>
> Exactly that.
>
> Imagine for some reason the driver EPROBE_DEFER, there can be a lot of
> time between the original pinconf/pinmux and the time the GPIO is
> actually driven.
>
> At the same time.. I guess it may not matter much if the UFS chip gets
> out of reset temporarily as (I assume) when the UFS controller probes
> properly, it'll do a full reset of the UFS chip via the reset GPIO.
> Don't know anything about UFS, so maybe there could be damage if the UFS
> chip gets out of reset if its supplies or IO lines are in an illegal stat=
e?
>
> > caused any observable issues in my testing, but I guess we could
> > explicitly set it to &pcfg_pull_down for more predictable behavior in
> > line with what's printed on the schematic.
> >
>
> s/schematics/TRM/
>
> I'll let Heiko decide but I would personally go for a PD to match the
> default state of the SoC according to the TRM.

Happy to make a v2 with an explicit pull-down. Will wait a bit for any
other potential feedback though.

Thanks a lot,
Alexey

