Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5413CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 02:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49j9QrYlm4qxZHbvYSYUJsJt0aMp426fig3D6hH+fj0=; b=CGT15Hd6JB8c91AkHqDR+9cICa
	BQgh60BPAcV4jQOVN6dfG65/ILUSD7TY3MK787xFvO3lEi0ZXIf+Isz/VgkGqFAOOwxiS37rxAHZd
	S8NK1afTJVsbloAkFzL2KTo9YMkV4NuKDUeYzqIsb3GEVUhZqQ905f4yAIh2awFRFrw60Paz2LvDN
	n9XI6qmE1HQtlldbGpEGaFWDfSRRbGYOJ7qrrDD7bche9o5rcXR0iizdA21jQHxAx9mQtyLlrasuh
	o994U9KzObfmn8NNdRDsZmdsSHgvugFoDZfe7B/1uQEuOg5AVqPK11jOkoUopIPrzxHhjCRqVYXz/
	jekU3Zow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIkA-00000003OEB-33zP;
	Thu, 30 Oct 2025 02:50:30 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIk7-00000003OCo-1gxn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 02:50:29 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-71d6014810fso7068727b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 19:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761792626; x=1762397426; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=49j9QrYlm4qxZHbvYSYUJsJt0aMp426fig3D6hH+fj0=;
        b=RjFaqvbQQVIDPxnxkMUBRrFD5iXa9xILxEHh+h0XTa6Gy6j7iETuGSV7hZFhSpFb3S
         ZljjAVg3hF+yxyXL+VNrR5F/RKwlEayFTRfSfCeW+2gMqgEwMEyjZmAa/ncWm4UsFSQw
         l6riOl/vpWdsc8n480A/AryB+d8UNe1dHLvnkFTgCuwGPxZAejNd8mHJz2GZ5rsqfZhg
         5OMsQl0JmoU1eDJNa5E53rpfD3gTxZSDmIhC1wCQSoNdjszMY0GcPKsqluzz3SbRfwrv
         aTtdEvL/nqIoNXDRwCYxuKQ+1M1N67c4DMCMlBfjPy6J5Gx8jGTGvwg+p1m68Sb2jSwl
         CO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761792626; x=1762397426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49j9QrYlm4qxZHbvYSYUJsJt0aMp426fig3D6hH+fj0=;
        b=qdx9KGt9uSgIv2KqevuYUeNHuQLcNviqDcJBUi6zNbde9bJvBZz/lIEtzrb0Qp6tat
         xvG3XcLGv4+M5qmnGkz8um4MqJcMs0wmF+JmodhbRIRdF9VL8GOjKmaBqmab15xiJcIc
         J7m5qFgXwAHjyjvK9iHmFFC/tl63y7dY5h+53v54PwdhyYzt9rxKUb6HoCH1aVumDCjR
         ZGQRbHoNqI0XtlQ8EiYQubupfZFqLmBdg3xVPhnFgkJ+vAW3JA90ehPHrUJfdNev9CTt
         Ns5iAB4wfgUZ87BZ7GTjrzv0deCFcUwJ75qGssukN/SXohQ9S8UgXEyAqmVzwFofbwxA
         rzZw==
X-Forwarded-Encrypted: i=1; AJvYcCU8DdhIyXIc9E6ZKDYTgpkcFe3jajfW6hyp3e8yC6g6VOgpFKfImOzT5DgdgVeYuJ8JRadjoGikdxf4vKQlLuU4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8eaODoYSfKgyWCcl/oUoSKl6fst01TAFMKIb6sZVMVPKEmMEx
	uljCAnRXFmtu5isbDwfxqnBdz5YKdvKan0/COVVIlu6o4k8qKkGGxKgwjzHUkVdQ75MpbYFEdpj
	BC5IkP0bWM2C4ZE07du+m0zzxxSTN/5g=
X-Gm-Gg: ASbGncvIEI4AG0zdJyWuXJsKjkkWpDfjxStuBMyr+dKYBn0BP9Yb7KI3ionPcKX4Al3
	GJSpNVuHvJaWyLlD19HFd7gDl3AIz0uuguheXIeJgw/XUeRhREBf1OOKxrKnuNEoa3yxuOMEhEJ
	p+KPevk8en4Q38jT1AJGeLpwWERwV4N8P/uIW5PkUhcRgqFyygo0locA2vePpri71IjC5QZCybJ
	KBqbIIrXgrEqNxtklJal6Y2z/AXV2CZ7Z9VimiH2rCyGPvh2z/7KRM4xIFHRoGdpTrwgw==
X-Google-Smtp-Source: AGHT+IHyoJ9K1Vnf2DZwS2Kk6JM2P4IoAuduJ5ZhKYBvP2Erk/Knw6rAfD9/QlPYp3ts6NwBBaU6zsVdEYEe2Nqfv+s=
X-Received: by 2002:a05:690c:22c2:b0:784:8a26:b74 with SMTP id
 00721157ae682-78628cf728dmr50871897b3.0.1761792625956; Wed, 29 Oct 2025
 19:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251029071435.88-1-kernel@airkyi.com> <20251029071435.88-11-kernel@airkyi.com>
 <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com> <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
 <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com> <C6253E8254C80B0F+839b71d0-1bd8-40b7-9515-7ce4a1eb8673@airkyi.com>
In-Reply-To: <C6253E8254C80B0F+839b71d0-1bd8-40b7-9515-7ce4a1eb8673@airkyi.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Thu, 30 Oct 2025 10:50:15 +0800
X-Gm-Features: AWmQ_bl1mNxPmQHnKmASAzhusTRjlDlCn6q9Kp_CyHmpybtPIUgHFck3iJTK_U4
Message-ID: <CAL411-pULVu4AYybW9oW7kmr4M_kJhdytgBjLPb4y6w_2dj+0w@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_195027_458265_9A32D853 
X-CRM114-Status: GOOD (  21.82  )
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

> > Okay.  My question is basic: USB2 PHY supplies DP/DM, and the DP/DM is
> > short for Type-C connector,
> > and no control is needed for Type-C application.
> > Why is there a remote-endpoint connection between USB2 PHY and Type-C connector?
>
>  From the perspective of Type-C, this should not be added.  Is the approach in v2 correct [0] ?
>

Have you tried debugging based on upstream code?
v2 is correct, but the dts needs to improve.
- There is a remote-endpoint connection for USB role switch between
Type-C connector
device and USB controller device
- There is a remote-endpoint connection for orientation and lane configuration
between Type-C connector device and USB/DP PHY device.

Peter

> [0]: https://lore.kernel.org/all/20250715112456.101-6-kernel@airkyi.com/
>
> Or is the following approach correct?
>
>
> port@0 {
>      reg = <0>;
>
>      usbc_hs: endpoint {
>          remote-endpoint = <&tcphy0>;
>      };
> };
>
> port@1 {
>      reg = <1>;
>
>      usbc_ss: endpoint {
>          remote-endpoint = <&tcphy0>;
>      };
> };
>
> port@2 {
>      reg = <2>;
>
>      usbc_dp: endpoint {
>          remote-endpoint = <&tcphy0_typec_dp>;
>      };
> };
>
>
> >
> >>>>> +                               port@1 {
> >>>>> +                                       reg = <1>;
> >>>>> +
> >>>>> +                                       usbc_ss: endpoint {
> >>>>> + remote-endpoint = <&tcphy0_typec_ss>;
> >>>>> +                                       };
> >>>>> +                               };
> >>>>> +
> >>>>> +                               port@2 {
> >>>>> +                                       reg = <2>;
> >>>>> +
> >>>>> +                                       usbc_dp: endpoint {
> >>>>> + remote-endpoint = <&tcphy0_typec_dp>;
> >>>>> +                                       };
> >>>>> +                               };
> >>>>> +                       };
> >>>>> +               };
> >>>>> +       };
> >>>>> +};
> >>>>> +
> >>>> .....
> >>>>>    &u2phy0 {
> >>>>>           status = "okay";
> >>>>> +
> >>>>> +       port {
> >>>>> +               u2phy0_typec_hs: endpoint {
> >>>>> +                       remote-endpoint = <&usbc_hs>;
> >>>>> +               };
> >>>>> +       };
> >>>>>    };
> >>>>>
> >>>> There is no switch and mux, how to co-work with Type-C?
> >>> I checked the phy-rockchip-inno-usb2.c but did not find any switch or mux. Does this mean that we need to implement them? Thank you.
> >> Wait a minute, actually we have multiple hardware interfaces, one of which is Type-C, eventually connected to USBDPPHY, and the other is micro-usb connected to U2PHY.
> > I assume the Micro-USB connector does not use Type-C/PD IC, is it
> > right? Does it relate to this patch?
> >
> > Best regards,
> > Peter
> >
>

