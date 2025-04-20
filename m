Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA4CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 02:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuUiJAprhTfd/7N1cTCz1I/bNbyZ2dvM2pkrLYnbO14=; b=zS00i6aCERFHdZ
	u+u735BYqjP5JzGtQApLU7LjUdmHz5jrmvL/s5oQAE9LUUNJQHk9cwsuR/52mGnV9r5Wjd+EG9QNc
	HQAcGJsIVk1JAa2JpSJ2VUmh7xV53WiOQ8sgmcdNC++LKbe4f3RvbE/GKcpKT5PUqmiJwF9JNR7cl
	nz7wfubjWRgtEPY1Z4HpArOJZsQW7yQcZsXx2kFVlGM8gYUnZU0fTNzT+oYTHi3qiAoxBYtaiWiyp
	Me/1tdsZ3dCPOOmjaOeCK9F1Exb0LyAjN4HCnmNqu+DoylDJ2Y2XsCuAlPAg1nmk52UIO05EHkGxW
	6DPJxIQTJlaRIfGy2zNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6K0Y-000000024sK-0Tmr;
	Sun, 20 Apr 2025 02:02:10 +0000
Received: from mail-lj1-f181.google.com ([209.85.208.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Jyc-000000024ns-3Oc1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 02:00:12 +0000
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30db1bc464dso29561281fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 19:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745114406; x=1745719206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WuUiJAprhTfd/7N1cTCz1I/bNbyZ2dvM2pkrLYnbO14=;
        b=W6SYEQlKJspNqo/NBiBwO9Nj/0ikBDb0oVM11Xdx7r6asDJaIduutrakAcubbJI/A3
         YpTPGmd86uyzG1nk4gKpjdQZfIaim+YPiB2T9405yxdBTdsfKEUFqRGg11yhazipqkF0
         5KgS7Sy1dGBZUPeVzxMk07OHNHUWqPro+hc2LzYRpkWb1FphwreOdlXYd69lfFY7iU6F
         QLWEhCS43hIz8m/Vt9aYDHhiGx+WGe5Wksv8lTWH4YobCyk7gXJa6xqOhfeKmZDP66Iy
         5uZHbv4cz09gXBsIZm37ISSGoSBvtQeqjOkJSbzEs7VTnkYkLvdjOhb1Es0lNjCp1wn/
         tHPw==
X-Forwarded-Encrypted: i=1; AJvYcCVKhrhQ9s91nnvisV/+PG88cYQD8vhdhdgKGNXs1s9ePMs0PErpc+t+cTl/jbVqWEMYIjwYAOaSaOGw0kvTkM14@lists.infradead.org
X-Gm-Message-State: AOJu0YwpCcNDkuU5A2HddY48JH8xZzCdHm4fk1b35sfUwPDN84FnE73Q
	8HZJDHcoxdcHFzBuMz5q2NPOZdH3zIk+yfkBMxLsHKcEjN6cEOUSWw2XWcSc
X-Gm-Gg: ASbGnctqyTUulnqj4ddDrXqrOTri8zz6SJS0XB4MrNalB5K4jy46igsNBJWXbYUJRpn
	EZxhNSvMBS81iuwvg9S9NuW6w6IGuPPmP+B9NBgABuOoCiRJLzNl1yz1NtEeihbKX00uBQt/zvd
	5mWehnXdiBiWi59xHhgTcFdoyL+9dr1Ro/y1as6i9v4YClWTwLgNK8Jvpcv1b/l3nSFFyFM5B/n
	7CPGJ4rLrMj67uQYJl73k29yAu5OJO8Ze2lf1rxTQhYXm0/neJG7SgAUmjHQM5+5uPzreFsr/4s
	u6/72lv48eDGUAMRkhvJN6Da/h23GuH9bQOPmKhiZ32POMa3h4yIYw06a/q+cAq3b9vFcg==
X-Google-Smtp-Source: AGHT+IFLbuLjQyDTcZ/XL3724YMTaYxJ1x7Edq3xs/hX5ROgr7t6jw3L3jAsvjkXoUCetqmYzmG05A==
X-Received: by 2002:a05:651c:b0c:b0:30d:b89d:aafd with SMTP id 38308e7fff4ca-3109054f1bamr17626541fa.31.1745114405300;
        Sat, 19 Apr 2025 19:00:05 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075e91bsm7103351fa.1.2025.04.19.19.00.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 19:00:04 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54acc0cd458so3528659e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 19:00:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFOK9yP80/8gwIbahZo5x65T5DSv2LunQMNnr+ornhR18et1zGhwSQoqjgKvFvvZirJf/aKPRpa9bpF1+NFiw4@lists.infradead.org
X-Received: by 2002:a05:6512:308f:b0:549:7d6d:3db5 with SMTP id
 2adb3069b0e04-54d6e634e96mr1867868e87.25.1745114403930; Sat, 19 Apr 2025
 19:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250419160051.677485-1-pbrobinson@gmail.com> <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org> <CALeDE9M_c7556sTdTC37Ce5vzLC2E8SV_P-J2CtFiUksdM_71Q@mail.gmail.com>
 <9380495a5dd09c6ab08e0a8cd315bf45@manjaro.org>
In-Reply-To: <9380495a5dd09c6ab08e0a8cd315bf45@manjaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 20 Apr 2025 09:59:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v65s8d_jA3JveqTWUUGkXrAs6mBuNTwP1DahfLNz+x8sRQ@mail.gmail.com>
X-Gm-Features: ATxdqUGNwcZRn9djcXgz8WhuVq93RxzgStGeSJRbMh_1bf7iGfQQ1FrDXrf-rrs
Message-ID: <CAGb2v65s8d_jA3JveqTWUUGkXrAs6mBuNTwP1DahfLNz+x8sRQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250419_190010_855480_E1348471 
X-CRM114-Status: GOOD (  28.46  )
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

On Sun, Apr 20, 2025 at 3:57=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> On 2025-04-19 21:26, Peter Robinson wrote:
> > On Sat, 19 Apr 2025 at 19:25, Dragan Simic <dsimic@manjaro.org> wrote:
> >> On 2025-04-19 18:00, Peter Robinson wrote:
> >>> This adds all the pin mappings on the WiFi/BT header on
> >>> the SoPine baseboard/A64-LTS. They're disabled by default
> >>> as the modules don't ship by default. This includes, where
> >>> they haven't been already, UART1 for BT and mmc1 for WiFi.
> >>
> >> The patch subject should be improved a bit, to include
> >> "Baseboard" as well.  Having just "SoPine" is a bit too
> >> vague, and it should actually be written as "SOPINE"
> >> at all places in the prose.
> >>
> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >>> ---
> >>> .../allwinner/sun50i-a64-sopine-baseboard.dts | 25
> >> +++++++++++++++++++
> >>> 1 file changed, 25 insertions(+)
> >>>
> >>> diff --git
> >>> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >>> index be2347c8f267..64d696f110ee 100644
> >>> ---
> >> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >>> +++
> >> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >>> @@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
> >>> regulator-min-microvolt =3D <1800000>;
> >>> regulator-max-microvolt =3D <1800000>;
> >>> };
> >>> +
> >>> +     wifi_pwrseq: pwrseq {
> >>> +             compatible =3D "mmc-pwrseq-simple";
> >>> +             reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2
> >> */
> >>> +     };
> >>
> >> Is there a reason why the status of this node isn't set to
> >> "disabled"?  Or even better, why don't we move this node
> >> entirely into the proposed DT overlay?
> >>
> >> The required reset procedure actually depends on what's
> >> found on the add-on module, so it should belong to the DT
> >> overlay that defines the add-on module.
> >
> > But the pin itself is pinned out through the header on the device.
>
> Good point.  On second thought, the right approach should be
> to reserve the reset pin through pinctrl additions to the
> board dts files, but to move the "mmc-pwrseq-simple" nodes
> to the proposed add-on overlays.
>
> You can have a look at rk3399-pinebook-pro.dts for an example
> of such a pinctrl definition and its use.

For sunxi, we don't add pinctrl nodes for GPIO usage.

ChenYu

> >>> };
> >>>
> >>> &ac_power_supply {
> >>> @@ -103,6 +108,18 @@ ext_rgmii_phy: ethernet-phy@1 {
> >>> };
> >>> };
> >>>
> >>> +/* On Wifi/BT connector */
> >>> +&mmc1 {
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&mmc1_pins>;
> >>> +     vmmc-supply =3D <&reg_dldo4>;
> >>> +     vqmmc-supply =3D <&reg_eldo1>;
> >>> +     mmc-pwrseq =3D <&wifi_pwrseq>;
> >>
> >> Of course, the "mmc-pwrseq" property would then also be moved
> >> to the DT overlay that defines the add-on module.
> >>
> >>> +     bus-width =3D <4>;
> >>> +     non-removable;
> >>> +     status =3D "disabled";
> >>> +};
> >>> +
> >>> &mmc2 {
> >>> pinctrl-names =3D "default";
> >>> pinctrl-0 =3D <&mmc2_pins>;
> >>> @@ -175,6 +192,14 @@ &uart0 {
> >>> status =3D "okay";
> >>> };
> >>>
> >>> +/* On Wifi/BT connector, with RTS/CTS */
> >>> +&uart1 {
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> >>> +     uart-has-rtscts;
> >>> +     status =3D "disabled";
> >>> +};
> >>> +
> >>> /* On Pi-2 connector */
> >>> &uart2 {
> >>> pinctrl-names =3D "default";

