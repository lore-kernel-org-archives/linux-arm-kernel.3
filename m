Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2D5CCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 06:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rF4eMVmZqF08Uiy4ZG4pr/6crlsmzGRDhN+59lsH5Y=; b=dt7R+bVj7MCLGdu0VL+nIMor67
	b7wNeLSrLKlOq2QhPtKkiMeRA0gHMU/uhg2bZt65zN5O5CHk/JDZghhraWSfWTKyJpt7t9ZS/GQdR
	lv2ruUEd3LLxETexRitXQFTbmOs+iPZ47PkzlDAARM18eHGRJf5xs+LpjmIl0FmejGKWe2Z4SmK06
	rIJmYq8rx81TLnoRl9UIlqSr+bKvwRQTU0RyhlURlvUjaTFdwMlxY+woRNeQMcXluSgDinwuP8Ut9
	jv6JuAxTNpfl/wgimAJ+Eyn9Ca5RIYVS5EGjTKul/yo1QUHLeKrvadlEa1UWUwmkVQhbD0PQHjWGK
	f5SzFxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELuj-00000003YGJ-2Q1t;
	Thu, 30 Oct 2025 06:13:37 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELuf-00000003YEk-3og0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 06:13:36 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-63d97bcb898so1282170d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 23:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761804813; x=1762409613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rF4eMVmZqF08Uiy4ZG4pr/6crlsmzGRDhN+59lsH5Y=;
        b=TX3xJby++aGCECtaHz4SV/8lfACyE/d27kQBaQg19otCag1NXPP+5/poB6v6w5s25J
         Vk7lz731lcn2tN4eXHsxzJ588yolFrUXmPE+TAt/U+kPXhrNM5g5ytLYvUeIVButn33D
         mbLa+7ZCTecml+U1omK/gXHqCG4qOAT0REM+q3GBQcUbBSLYAtT0lFdekeIMG2rb8lb3
         1fMu3d65hRtTJrK3R5TOVylyb9UkgQghfUl8AMLr+izkZJeOV/bPlGJRnMNwhyTEoAh9
         +Kum1KsTHY6kqOeNx1G0wQMrcqzLNhSbNbY5pZ6ImnOmHqCvQnDKgGUoDDNG04hkbH0r
         6Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761804813; x=1762409613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rF4eMVmZqF08Uiy4ZG4pr/6crlsmzGRDhN+59lsH5Y=;
        b=ZJit/aqFMWjV1Zyy3T4maDuTGk9e8yO6ofCytnRptmBhKLiGQSA3Q72pOhliQHqbIi
         07aDnCjn/VdwkeZVS+mELfEjmdRaJiQW3ysIc4iKjxa1QmR5rL157GXl4vTop8TUZFLC
         uAw8JYPB+aldhia6z5gGM6nkrKkfGp4J1asI39cor58uQ7gLrSVxHYwjnIghwX4xzVmG
         y64QhQNezXTs1iE91F96m+hzW4RjXux29FZm2wFFlkG9Pqw/pWDuJB3mMVt7vU/52iOj
         C9kHbkEzjtcNmT/eydLsVpskGvFC3yGFMDmm5K+L69BXkb8yE+yT7F6rWpo3swROUsWO
         tGjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRwTc66dPlTPbf+LQwHEnM6tfSLuxDBrUQvxiSdXAlwe1XKolo4oCccZGjxZUzaz7HNvVG7pLRLRaD1yzCSdRo@lists.infradead.org
X-Gm-Message-State: AOJu0YwcdXSBUw0CWmYeJ/bSDqG0OtRvML+tEKLMFA50C9A8ijVTt2TE
	WT0nTwAMhRXUhNtzf0z23NXeqAGdn1PhPgvveuxADxO3xx0c969bsdOAaqq5cfJgoJM2dgJ0Qwc
	oXxKba9rmV8oexqLroVO4MktufonAGzQ=
X-Gm-Gg: ASbGncvFFZ/dC+Wtj8vtZeVOU0364F0DKnJ2Ri08xpuDCUrzBBN5KVS2uXvwWuvo1rk
	g99FYkRtKg3oQ7gdXMvO0oYu12zihABn47iuWdrMuN/kU5ORDzvWcPVNs0y8gD4eSp71i2yAktQ
	U17vMPaXhalXP1ptohCoNl2GYHNsUTUObqY28RQwC1ln3NE9aEH5yx2XwWycxjT/xQAUahoNZe8
	1mKChDs9obLm5zd3HHIxKHUMa2eb76ARRat+X2OkkPgybIdaQnJBc918muwYS+wG1nWTQ==
X-Google-Smtp-Source: AGHT+IGNukfCrjaksH3Umzb+6A3Q6R4gH1hMz3jAmphM+O0AwBZJ/TjCDOWOuiqRoFX9uHUrvtIVlMk1omsejKcgRqU=
X-Received: by 2002:a05:690e:14c6:b0:63e:2b9e:1462 with SMTP id
 956f58d0204a3-63f829a66admr1708439d50.22.1761804812638; Wed, 29 Oct 2025
 23:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251029071435.88-1-kernel@airkyi.com> <20251029071435.88-11-kernel@airkyi.com>
 <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com> <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
 <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com>
 <C6253E8254C80B0F+839b71d0-1bd8-40b7-9515-7ce4a1eb8673@airkyi.com>
 <CAL411-pULVu4AYybW9oW7kmr4M_kJhdytgBjLPb4y6w_2dj+0w@mail.gmail.com> <7853bbf0-34e5-4880-a2f4-2d73f25cd5e6@rock-chips.com>
In-Reply-To: <7853bbf0-34e5-4880-a2f4-2d73f25cd5e6@rock-chips.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Thu, 30 Oct 2025 14:13:21 +0800
X-Gm-Features: AWmQ_bnKM651Al7hBqe9TPet6QHNgDQAymVR1zTv3jbaP-L2YDnRDbwZ2qTLHzg
Message-ID: <CAL411-rFK0o_cxBO_yJFHWurGFKxZGxw6=kpqxRipMetJskTaQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Frank Wang <frank.wang@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_231333_964952_C6D82264 
X-CRM114-Status: GOOD (  29.03  )
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

On Thu, Oct 30, 2025 at 11:14=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chip=
s.com> wrote:
>
> On 10/30/2025 10:50 AM, Peter Chen wrote:
>
> >>> Okay.  My question is basic: USB2 PHY supplies DP/DM, and the DP/DM i=
s
> >>> short for Type-C connector,
> >>> and no control is needed for Type-C application.
> >>> Why is there a remote-endpoint connection between USB2 PHY and Type-C=
 connector?
> >>   From the perspective of Type-C, this should not be added.  Is the ap=
proach in v2 correct [0] ?
> >>
> > Have you tried debugging based on upstream code?
>
> Yes, I have tried both the v2 and v8 approaches, and both can work.
>
>
> > v2 is correct, but the dts needs to improve.
> > - There is a remote-endpoint connection for USB role switch between
> > Type-C connector
> > device and USB controller device
> > - There is a remote-endpoint connection for orientation and lane config=
uration
> > between Type-C connector device and USB/DP PHY device.
>
> In v8 patch5, we implemented typec_mux and typec_switch in the USB/DP PHY=
.
>
> I think the current remote-endpoint connections are all child node of the=
 USB/DP PHY. That is:
>
>
> &tcphy0_dp {
>      mode-switch;
>      ...
> };
>
>
> &tcphy0_usb3 {
>      orientation-switch;
>      ...
> };
>
>
> Does this still need to be improved? Thank you.
>

Hi Chaoyi,

There are two questions I have still not seen the answer to:
- Why USB2 PHY is related to your Type-C patch?
- How does the USB role switch event notify the USB controller driver, eg d=
wc3?

Peter
>
> >
> > Peter
> >
> >> [0]: https://lore.kernel.org/all/20250715112456.101-6-kernel@airkyi.co=
m/
> >>
> >> Or is the following approach correct?
> >>
> >>
> >> port@0 {
> >>       reg =3D <0>;
> >>
> >>       usbc_hs: endpoint {
> >>           remote-endpoint =3D <&tcphy0>;
> >>       };
> >> };
> >>
> >> port@1 {
> >>       reg =3D <1>;
> >>
> >>       usbc_ss: endpoint {
> >>           remote-endpoint =3D <&tcphy0>;
> >>       };
> >> };
> >>
> >> port@2 {
> >>       reg =3D <2>;
> >>
> >>       usbc_dp: endpoint {
> >>           remote-endpoint =3D <&tcphy0_typec_dp>;
> >>       };
> >> };
> >>
> >>
> >>>>>>> +                               port@1 {
> >>>>>>> +                                       reg =3D <1>;
> >>>>>>> +
> >>>>>>> +                                       usbc_ss: endpoint {
> >>>>>>> + remote-endpoint =3D <&tcphy0_typec_ss>;
> >>>>>>> +                                       };
> >>>>>>> +                               };
> >>>>>>> +
> >>>>>>> +                               port@2 {
> >>>>>>> +                                       reg =3D <2>;
> >>>>>>> +
> >>>>>>> +                                       usbc_dp: endpoint {
> >>>>>>> + remote-endpoint =3D <&tcphy0_typec_dp>;
> >>>>>>> +                                       };
> >>>>>>> +                               };
> >>>>>>> +                       };
> >>>>>>> +               };
> >>>>>>> +       };
> >>>>>>> +};
> >>>>>>> +
> >>>>>> .....
> >>>>>>>     &u2phy0 {
> >>>>>>>            status =3D "okay";
> >>>>>>> +
> >>>>>>> +       port {
> >>>>>>> +               u2phy0_typec_hs: endpoint {
> >>>>>>> +                       remote-endpoint =3D <&usbc_hs>;
> >>>>>>> +               };
> >>>>>>> +       };
> >>>>>>>     };
> >>>>>>>
> >>>>>> There is no switch and mux, how to co-work with Type-C?
> >>>>> I checked the phy-rockchip-inno-usb2.c but did not find any switch =
or mux. Does this mean that we need to implement them? Thank you.
> >>>> Wait a minute, actually we have multiple hardware interfaces, one of=
 which is Type-C, eventually connected to USBDPPHY, and the other is micro-=
usb connected to U2PHY.
> >>> I assume the Micro-USB connector does not use Type-C/PD IC, is it
> >>> right? Does it relate to this patch?
> >>>
> >>> Best regards,
> >>> Peter
> >>>
> >
> --
> Best,
> Chaoyi
>

