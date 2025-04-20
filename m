Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49983C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 02:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qg2wv8GF6M7XRIb44nhP/CauCw9/Jy21/AsV6h0SZts=; b=S3JEcRUqfMTOwn
	mKaVaE1DMZTpECtPH1C3aSRI4+5MvWHgFw5PjJXtYljJxSpl1EWjArK/tbNBH1tVYvYjtKrn+mjC/
	2rSjGSbAwaTEamNg5GVWCAjzUruGJofJm/I+mWnQIZ3GRmldCQ3OiNJefqWFsg1SvC5iVUJHLWnug
	P5QHNZYqSpIomj7Lem4w6RmGvNH3U5UR/fVXvWKfm9t6qwMBze16A/N6noBufIe2Q87eayFVnNx37
	nVQKgsyqEKVmdeablxVenyOz0a9/C+rcwq/KYxbi3eQrv7YS6OcSnFsIiNGSlx9FOoYW/dLF/vdF1
	L3HMdHiSzm407pt+0wiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6KKo-000000025cm-3HaE;
	Sun, 20 Apr 2025 02:23:06 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6KIv-000000025Wy-35ZO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 02:21:11 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so2854327e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 19:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745115666; x=1745720466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qg2wv8GF6M7XRIb44nhP/CauCw9/Jy21/AsV6h0SZts=;
        b=J7+lPK+zrAgoyAvJPFpswDAN86WpE6nrIvne6Fa1r9o4AGV5tE6Udwki6f4O+CpoDo
         7qLyZgKKSH/9mJGbXUJAVD9ZZkhSc9QplAVm3jObH69jJQ6zRmDLmhTtI803WcfwhgLm
         yOjvMfpe6qW2SL3huqKTtAxCot6ZWMnZOBER9Td5A4nq4LfkzRE61faCMqDuHeZnLmAu
         akSozR/HA3Z2TEpGDrIdk564HiI70aXzr9PK5JYfAUxPKR12qkLjEnQQWh/g14QI6dGI
         1efpy2OYdT1rL+2pWrflDaixtLprf6+TEnJEk0mnFs2CQTvJuLFHHj4nRiqk4JhVskY+
         jlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoE8Uwobqn57YZzaXjTorYUBGYonbNee5tnT2dpQwcWclZD87E3QTVNkxXKe7ZQVPuPyx2yzHMuoT5hQRGizoo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Wo6oEOCgcPJHQ2v3K/J6AbH8JNszlzTtleA19Rl3tHnB70AO
	LQcmf2dZQ6pBSYH11otJCWHFRXOAqsNT9qPmctJRN4h5RJxayAnKwRkvrUJ9
X-Gm-Gg: ASbGncvF3d08crCfQ0B61CNPtvBDCETegm3YiogYMk2IRe9H0gnxqXlgIlpw3D01mGs
	+Lu9nt9t3BZa7qyBjQh89gv9RXTlTfaqo9tD/hcVcHuChAgQJgM5+TY/7T+MtacvtjgtdOJyuj/
	2Uz0Iid2c3e0xnV+R5jhP6BVjk9ti2eNPRmQFPwiL3ZDHL+kGlC8W+ks3T4YoAGFwF7G6MSyyJO
	dcbo9OGHOg3X7N+5InvDvraTkuV17j9ft7nJ1ptk1a3dZc7mJooaf0cKRtw+B5XmBNeADTsGiMf
	TwGjGpCshy7bw5uwHlphUtWANMRib6gjMPclOsuzb3I1v0+r6s3jq1iyYMlFeWCYNR/Yk4/WWQ=
	=
X-Google-Smtp-Source: AGHT+IGyb6dOM9j6eFTz8AI1t7X1E7HfGNxYM7ZCDLlWxyAZyVqX6zuvT2C5gDNQPjpOb3XTuB0kZA==
X-Received: by 2002:a05:6512:3b84:b0:549:b0fa:6733 with SMTP id 2adb3069b0e04-54d6e6627c6mr2057870e87.37.1745115665625;
        Sat, 19 Apr 2025 19:21:05 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540c34sm572283e87.61.2025.04.19.19.21.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 19:21:05 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30beedb99c9so26147441fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 19:21:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBM0EcpvOMVGrJ2jUbPDtBvEF3JNKw0FI0J0MwJXKiRMs5tAfHbO0tnji3WxSGGARTytQHM6tpiNkxAe/fpURt@lists.infradead.org
X-Received: by 2002:a2e:a547:0:b0:30d:b49d:7fb7 with SMTP id
 38308e7fff4ca-310904db02bmr22991831fa.16.1745115664872; Sat, 19 Apr 2025
 19:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250419160051.677485-1-pbrobinson@gmail.com> <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org> <CALeDE9M_c7556sTdTC37Ce5vzLC2E8SV_P-J2CtFiUksdM_71Q@mail.gmail.com>
 <9380495a5dd09c6ab08e0a8cd315bf45@manjaro.org> <CAGb2v65s8d_jA3JveqTWUUGkXrAs6mBuNTwP1DahfLNz+x8sRQ@mail.gmail.com>
 <20b11baa25be196ec3e46144f11cb334@manjaro.org>
In-Reply-To: <20b11baa25be196ec3e46144f11cb334@manjaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 20 Apr 2025 10:20:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v66bui3Ddhteaz577okxAZjvW6q0KdK0rV6p5T4L15MZ_Q@mail.gmail.com>
X-Gm-Features: ATxdqUE0Ykt6DxMi0bwj0hRXcKnJZa21RBLZvuOPQ2qQ1O91XX1328QXUi7RSJQ
Message-ID: <CAGb2v66bui3Ddhteaz577okxAZjvW6q0KdK0rV6p5T4L15MZ_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
To: Dragan Simic <dsimic@manjaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_192109_780033_C9B7F5E1 
X-CRM114-Status: GOOD (  32.87  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Apr 20, 2025 at 10:13=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Chen-Yu,
>
> On 2025-04-20 03:59, Chen-Yu Tsai wrote:
> > On Sun, Apr 20, 2025 at 3:57=E2=80=AFAM Dragan Simic <dsimic@manjaro.or=
g>
> > wrote:
> >>
> >> On 2025-04-19 21:26, Peter Robinson wrote:
> >> > On Sat, 19 Apr 2025 at 19:25, Dragan Simic <dsimic@manjaro.org> wrot=
e:
> >> >> On 2025-04-19 18:00, Peter Robinson wrote:
> >> >>> This adds all the pin mappings on the WiFi/BT header on
> >> >>> the SoPine baseboard/A64-LTS. They're disabled by default
> >> >>> as the modules don't ship by default. This includes, where
> >> >>> they haven't been already, UART1 for BT and mmc1 for WiFi.
> >> >>
> >> >> The patch subject should be improved a bit, to include
> >> >> "Baseboard" as well.  Having just "SoPine" is a bit too
> >> >> vague, and it should actually be written as "SOPINE"
> >> >> at all places in the prose.
> >> >>
> >> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >> >>> ---
> >> >>> .../allwinner/sun50i-a64-sopine-baseboard.dts | 25
> >> >> +++++++++++++++++++
> >> >>> 1 file changed, 25 insertions(+)
> >> >>>
> >> >>> diff --git
> >> >>> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >> >>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >> >>> index be2347c8f267..64d696f110ee 100644
> >> >>> ---
> >> >> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >> >>> +++
> >> >> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >> >>> @@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
> >> >>> regulator-min-microvolt =3D <1800000>;
> >> >>> regulator-max-microvolt =3D <1800000>;
> >> >>> };
> >> >>> +
> >> >>> +     wifi_pwrseq: pwrseq {
> >> >>> +             compatible =3D "mmc-pwrseq-simple";
> >> >>> +             reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2
> >> >> */
> >> >>> +     };
> >> >>
> >> >> Is there a reason why the status of this node isn't set to
> >> >> "disabled"?  Or even better, why don't we move this node
> >> >> entirely into the proposed DT overlay?
> >> >>
> >> >> The required reset procedure actually depends on what's
> >> >> found on the add-on module, so it should belong to the DT
> >> >> overlay that defines the add-on module.
> >> >
> >> > But the pin itself is pinned out through the header on the device.
> >>
> >> Good point.  On second thought, the right approach should be
> >> to reserve the reset pin through pinctrl additions to the
> >> board dts files, but to move the "mmc-pwrseq-simple" nodes
> >> to the proposed add-on overlays.
>
> Actually, s/overlays/overlay/
>
> >>
> >> You can have a look at rk3399-pinebook-pro.dts for an example
> >> of such a pinctrl definition and its use.
> >
> > For sunxi, we don't add pinctrl nodes for GPIO usage.
>
> I see, thanks for the note.  In that case, I'd still suggest
> that the "mmc-pwrseq-simple" nodes are moved to the proposed
> add-on overlay, because that's where they belong to.
>
> In theory, some add-on module may actually not need resetting,
> so defining that should belong to what defines the specific
> add-on module, which is the add-on overlay.

I agree.

> >> >>> };
> >> >>>
> >> >>> &ac_power_supply {
> >> >>> @@ -103,6 +108,18 @@ ext_rgmii_phy: ethernet-phy@1 {
> >> >>> };
> >> >>> };
> >> >>>
> >> >>> +/* On Wifi/BT connector */
> >> >>> +&mmc1 {
> >> >>> +     pinctrl-names =3D "default";
> >> >>> +     pinctrl-0 =3D <&mmc1_pins>;
> >> >>> +     vmmc-supply =3D <&reg_dldo4>;
> >> >>> +     vqmmc-supply =3D <&reg_eldo1>;
> >> >>> +     mmc-pwrseq =3D <&wifi_pwrseq>;
> >> >>
> >> >> Of course, the "mmc-pwrseq" property would then also be moved
> >> >> to the DT overlay that defines the add-on module.
> >> >>
> >> >>> +     bus-width =3D <4>;
> >> >>> +     non-removable;
> >> >>> +     status =3D "disabled";
> >> >>> +};
> >> >>> +
> >> >>> &mmc2 {
> >> >>> pinctrl-names =3D "default";
> >> >>> pinctrl-0 =3D <&mmc2_pins>;
> >> >>> @@ -175,6 +192,14 @@ &uart0 {
> >> >>> status =3D "okay";
> >> >>> };
> >> >>>
> >> >>> +/* On Wifi/BT connector, with RTS/CTS */
> >> >>> +&uart1 {
> >> >>> +     pinctrl-names =3D "default";
> >> >>> +     pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> >> >>> +     uart-has-rtscts;
> >> >>> +     status =3D "disabled";
> >> >>> +};
> >> >>> +
> >> >>> /* On Pi-2 connector */
> >> >>> &uart2 {
> >> >>> pinctrl-names =3D "default";
>

