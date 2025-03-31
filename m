Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D633BC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ffgl1EJ78XV8Ww8+yzDw7A3vtP3rI2eTTBEDeOFpPo=; b=Vv6R13kGHCAG04
	LM3edv0BI3ArzmtNqNTVRWn029nA+VpDNCw+2wyAjItU2Kz4u9SBrSXFjnEpXcGWYhpi/GpFsvBt/
	dTgQtn4/U1Wuw4TlHhxqfbppmmUrhJKtuWB96LoR55ChpARwTt9wiT0Z4VSExvwMv831Cp+9F7fqB
	FfR1xtgjeblp5TLDeVxY6AOzO7cJhlvHIFEhImd7eGOHpuM7ek3n8Krr+wn35J95xZfvnAA7x+TFz
	GOsQ5MAa7BkVLsXMEPHfxA2IwX5oZLg9LALNRi0jp3tl45PJj0U9UvtJ80JtIy23u8KNwzaP7xcZ+
	uP2D7yIkAg8KX4DBvvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHH8-00000000rMo-1STt;
	Mon, 31 Mar 2025 15:42:10 +0000
Received: from mail-lf1-f51.google.com ([209.85.167.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzH0y-00000000mDX-2cfO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 15:25:30 +0000
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549963b5551so4720187e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434724; x=1744039524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ffgl1EJ78XV8Ww8+yzDw7A3vtP3rI2eTTBEDeOFpPo=;
        b=EZUOHcLbHlPd0JEHXXodom+7eQ262DivsDJY53zFnaGXXWElR1XGjnSJWDzexz6vxC
         SMJzLXDH8b3/eQ81tQkcJxbQ6wNEPVYe3yuJyppHAKUOh/usZImd3ItVHwmnX/Vo7IMg
         MAIcZ7DcNYFMUuleBDurYHSooigGqm7Mu8wdllNrend/zLeMdW3bRqgdBONZTYkuBLpp
         1AaVHU+vhqzn2m4OHj0dv/5X3Pg4fT0hNnT8Nn/yPJLViCg2PWKdwMHeFjEE+t2+fWF5
         O4ZJaG7U9unucoK66jnc0TrKMt4qFZ58a01q+DziKTfypyVyb5yQYOBPXDrpNeVUPHYN
         ymvA==
X-Forwarded-Encrypted: i=1; AJvYcCWlMrOSOKgjFZMdmL8nyR3robZM26TnclEfVrtZte16dSXB6QrDTyVgXX8C6a/sSM7XnO5+wAsMds6y9nSKYSLR@lists.infradead.org
X-Gm-Message-State: AOJu0YyPLtHarDoxg8a4OUGTGdkLKqu4vEDa/K71pYWtBsVwJSFpktfw
	+4FOeWeAZrU6c0/w4o+YoBDzFS0wat6PzCt4H8fRxkgqnamqrCo/IiesYHrO
X-Gm-Gg: ASbGnctiGiWkrLOEZqO5Xtlac4b9koBVVEDS9MG7e5GeXypqX7dHhukTgFGEd3U6WR7
	1VGUzsYE0RJuMvpXx7aSq3QvaLKXUSxDSGeUrdPmhUYIf9QHnbwG1bkcrLAa1aBhfdFdpht1DAz
	8PnB3qPjHHb7iWGiiqJrQpEoBck5kGk+2LhDzOGCwaeE4dsWIc3jEFGIBvUMLCVPrV0aE55trfX
	z9ptzvxiwPqMSWcaEFyr1oAL4f1P/hfVWLcAluudDrumu+OCoLWKUB6BsFiGJlUu0dsTuE+c309
	kXWxLlUNPRMg1HBbt3Kh+wquo09olTciDhgDvq7ik4UEGAymxBEs2yX5V2v7mMc/lc8475pHJ0M
	toqMVi46i0ce/
X-Google-Smtp-Source: AGHT+IEK8KM5LKw/XblcHLGSb2zlXiSgM93NAMRQjfOyjcArES0IiMgeqjtaav8n5bAHEkP+LWS8sQ==
X-Received: by 2002:a05:6512:ea7:b0:549:8f21:bc0f with SMTP id 2adb3069b0e04-54b10ecadfbmr2529745e87.30.1743434723998;
        Mon, 31 Mar 2025 08:25:23 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0959fd16sm1183358e87.215.2025.03.31.08.25.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:25:23 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30613802a04so46916831fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 08:25:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOjWPN3hPU2fh4MXY27GFqlGD73KZb10J+Rv9yQEcteAljrj9keRTO+EU3oZtOtSN1Tn2Gh6eE5B5fqZu1ys3R@lists.infradead.org
X-Received: by 2002:a2e:9a0a:0:b0:30b:b987:b676 with SMTP id
 38308e7fff4ca-30de021a5e7mr27500301fa.2.1743434723282; Mon, 31 Mar 2025
 08:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20241220120038.3137248-1-pbrobinson@gmail.com>
 <20241220120038.3137248-2-pbrobinson@gmail.com> <CAGb2v66enf0ybbyW3tW_YRdJB0=aOsXidm_bNHh=wdmm+HPBuw@mail.gmail.com>
 <CALeDE9MEBn+Sdi6VDPwv8KNqTGa3sUsvBWUStzg9eOTDCVi82Q@mail.gmail.com>
In-Reply-To: <CALeDE9MEBn+Sdi6VDPwv8KNqTGa3sUsvBWUStzg9eOTDCVi82Q@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 31 Mar 2025 23:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v65sanUAiMNm+Brpm+p+r5PoEJe5cU6-3ES2w4+7BDUK+w@mail.gmail.com>
X-Gm-Features: AQ5f1JqaknCpQUGEiJLOOM81wDYjjstnDdXE6imvYdtIgyUSyVJlVKvFRiCt9rM
Message-ID: <CAGb2v65sanUAiMNm+Brpm+p+r5PoEJe5cU6-3ES2w4+7BDUK+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_082528_665420_6D6496E4 
X-CRM114-Status: GOOD (  24.45  )
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

On Mon, Mar 31, 2025 at 11:16=E2=80=AFPM Peter Robinson <pbrobinson@gmail.c=
om> wrote:
>
> Hi Chen-Yu,
>
> Apologies for the delayed reply, preparing an update, comment inline.
>
> On Sun, 22 Dec 2024 at 17:19, Chen-Yu Tsai <wens@csie.org> wrote:
>>
>> On Fri, Dec 20, 2024 at 8:00=E2=80=AFPM Peter Robinson <pbrobinson@gmail=
.com> wrote:
>> >
>> > This adds all the pin mappings on the WiFi/BT header on
>> > the original Pine64. They're disabled by default as the
>> > modules don't ship by default. This includes, where they
>> > haven't been already, UART1 for BT and mmc1 for WiFi.
>> >
>> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> > ---
>> >  .../boot/dts/allwinner/sun50i-a64-pine64.dts    | 17 ++++++++++++++++=
+
>> >  1 file changed, 17 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arc=
h/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> > index 09e71fd60785..f04f0f1badc4 100644
>> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> > @@ -35,6 +35,11 @@ hdmi_con_in: endpoint {
>> >                         };
>> >                 };
>> >         };
>> > +
>> > +       wifi_pwrseq: pwrseq {
>> > +               compatible =3D "mmc-pwrseq-simple";
>> > +               reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 *=
/
>> > +       };
>> >  };
>> >
>> >  &codec {
>> > @@ -124,6 +129,17 @@ &mmc0 {
>> >         status =3D "okay";
>> >  };
>> >
>> > +/* On Wifi/BT connector */
>> > +&mmc1 {
>> > +       pinctrl-names =3D "default";
>> > +       pinctrl-0 =3D <&mmc1_pins>;
>> > +       vmmc-supply =3D <&reg_dldo4>;
>> > +       vqmmc-supply =3D <&reg_eldo1>;
>> > +       mmc-pwrseq =3D <&wifi_pwrseq>;
>> > +       bus-width =3D <4>;
>> > +       non-removable;
>>
>> Please also add an explicit 'status =3D "disabled"', like what is done
>> for the uart below.
>
>
> So the status is disabled already because it's disabled in sun50i-a64.dts=
i, as is the uart1 actually, so in both cases it's not actually needed and =
will then just be set to okay in the overlay, do you still wanted it explic=
itly, else I'll drop the unneded uart one too.

I know they are disabled by default, so yes I still want to see them
explicitly disabled at the board level.


ChenYu


> Peter
>
>>
>> ChenYu
>>
>> > +};
>> > +
>> >  &ohci0 {
>> >         status =3D "okay";
>> >  };
>> > @@ -286,6 +302,7 @@ &uart0 {
>> >  &uart1 {
>> >         pinctrl-names =3D "default";
>> >         pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
>> > +       uart-has-rtscts;
>> >         status =3D "disabled";
>> >  };
>> >
>> > --
>> > 2.47.1
>> >
>> >

