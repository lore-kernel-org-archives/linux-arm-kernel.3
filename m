Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D4DCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+0dV49Z0hZQvL1JwoyFgg+j9v/HxeFYx2d1Gt9wCQ4=; b=C/0EMMMxGDi+ghMJq+GpNrIc/0
	1UhtLcdyjJBlPcQLrDh6enGGpqook90JBXpn8xKKO3ks1TYUjZMPG3nFEHdlOaZnJkobsQfPR2gus
	4CpwSWPfdB9icMJ/D8h46COWI4pa1NPWuZL0tqU/MgfYzGEG5GV/AfXLqN+Hy6wXsYz/v/1aMqQPi
	pf9/zsOifemvOPdNDkHCc74nhyxgjT5Sc6bXg6wucRi7GJxuEVZJvJ6fFT4Iuv5wEnCcJvSd5m2WH
	B2JfcfIaQSXrEaLUcwfPi982FppJ3iH47IqJisD2RWgZlCAuduhr4LkLN/W/D5dLRX9CmsENyG2mn
	ANNr385Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2kj-00000000YQW-0F3t;
	Wed, 29 Oct 2025 09:46:01 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2kg-00000000YNk-0QIE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:45:59 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-780fe76f457so70725367b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761731156; x=1762335956; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T+0dV49Z0hZQvL1JwoyFgg+j9v/HxeFYx2d1Gt9wCQ4=;
        b=a+peMUuGxCoOvXz6HsNOPn78cLSWdz7CQzNVVx9ieT+qqaWW0UTsKDO2CAX9phlyZY
         DMjv/vgJTO582mXirCldoXVbraQXg2IcZFvpy/lL/bihElzUYqFKODhaDHNgZzxStdrj
         TlhfknfEd8nUy7MsJ6CmQ6KgQNYuO7tIpTKikbjAQuDu8aLoC1qmeR/CrpUf8jXpeQlI
         w07oQdqyLcILxk7wAMIMT7OVH6CmAE17m/RL1TyIMCuz95jVJ++A+NKFOyQV9PcJd08n
         yVtHdA69noI9y0k1qOCQFTcXqeg1vxCxXELquXwHDwvHg1JVu7B1e0805T32Tc+Q5IuX
         SoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731156; x=1762335956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+0dV49Z0hZQvL1JwoyFgg+j9v/HxeFYx2d1Gt9wCQ4=;
        b=rLsRofAaDEfMJIwDP33LjiKZzb63VSBO7fRBQA/l4Vdpehkcx2911TL3IoWUpYl3RF
         w8xBZgTS0RNE9m7ortJCT/Akjfm1OP3Gbiz4+ywKTAZmj60bLHHZHvLfwdZGwnjIzRdF
         /fQLoymt4M7czKI53ICQn6Eb/fbCafyTaARCJBANB4ywIE3ohraDDbXzOq0SPnmjyOk3
         1VpPsKkTcvcekmZqpWiaElxvW4WLCXFTc8uR1bmwLa/4BFBHSaYqz/M4b5W1IV9IIa6L
         GFNlpGjmYqq2Nyt7Ewa9Q2m0+DDJhVmEHhJgTXryAFD1pJFxvc42vgb7eWE8BmdmqFbX
         A65w==
X-Forwarded-Encrypted: i=1; AJvYcCU0S0EQizcah08vAItLupVQOk/gM0ZhW5lCJLUsXMGulPbvU/UENWdPbJqB+9880/07it2H3sLzuHKsixT+63bW@lists.infradead.org
X-Gm-Message-State: AOJu0YxDvgly6AxZyC7tRaW3g6UyB5VlaMNL0ut0OP028t5htHgTbI1y
	6CdtRBuxmnFV52NyuMeRXGpW7sZWHm6It0OdJuOd6OJuIvwlrfJeeViCAQXD9OJM3jAyvyc09AG
	g7B53BJwJeSLHnwjyRE9rHL/vpC7qsoA=
X-Gm-Gg: ASbGncvIbVGOgxQU0Kk/z0iWN08gkOHkibYG27rr1H4UfJel4yShZGw20YlAnhL+jHa
	3nmYH9HzRN9JXi6vgklfPtLJdgZxNUCw3rMNvQOzkZ/d+fzpeeK+KZPP7bB9Abh78HWweLqu23h
	oyJTEh1QOrA/eWBaC0mcuC2pW4ppgsfaL1UWa/HS3w8+kaw4B41HV7Z3efqT1/CYBf9atez1rCr
	fUsunOrUw5ps+mmEVk7yMzS2+Zz81GHX8wYrKWhCpgescPKiHOWnRxRe5lhlh3N0v0aYQ==
X-Google-Smtp-Source: AGHT+IFXTGFBQZQCvoFTcD2XW69zJNvRv2jA1skYdjLaN3X9V8WOQAc0sJLs73yBIhsOL2y0JL1ybcsga9Zkjczkf4s=
X-Received: by 2002:a05:690c:680d:b0:785:bfd8:c4ad with SMTP id
 00721157ae682-78629298707mr36580707b3.3.1761731156514; Wed, 29 Oct 2025
 02:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251029071435.88-1-kernel@airkyi.com> <20251029071435.88-11-kernel@airkyi.com>
In-Reply-To: <20251029071435.88-11-kernel@airkyi.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Wed, 29 Oct 2025 17:45:45 +0800
X-Gm-Features: AWmQ_blYmsodv_vg4uKolYRe0NzpqIhwJ3rq0FrOe8J4voY-HqIG6eRi0roVBPc
Message-ID: <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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
	Amit Sunil Dhamne <amitsd@google.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_024558_149632_151DA941 
X-CRM114-Status: GOOD (  10.30  )
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

> +&i2c4 {
> +       i2c-scl-rising-time-ns = <475>;
> +       i2c-scl-falling-time-ns = <26>;
> +       status = "okay";
> +
> +       usbc0: typec-portc@22 {
> +               compatible = "fcs,fusb302";
> +               reg = <0x22>;
> +               interrupt-parent = <&gpio1>;
> +               interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&usbc0_int>;
> +               vbus-supply = <&vbus_typec>;
> +
> +               usb_con: connector {
> +                       compatible = "usb-c-connector";
> +                       label = "USB-C";
> +                       data-role = "dual";
> +                       power-role = "dual";
> +                       try-power-role = "sink";
> +                       op-sink-microwatt = <1000000>;
> +                       sink-pdos =
> +                               <PDO_FIXED(5000, 2500, PDO_FIXED_USB_COMM)>;
> +                       source-pdos =
> +                               <PDO_FIXED(5000, 1500, PDO_FIXED_USB_COMM)>;
> +
> +                       altmodes {
> +                               displayport {
> +                                       svid = /bits/ 16 <0xff01>;
> +                                       vdo = <0x00001c46>;
> +                               };
> +                       };
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +
> +                                       usbc_hs: endpoint {
> +                                               remote-endpoint = <&u2phy0_typec_hs>;
> +                                       };
> +                               };
> +

Why USB2 PHY needs to be notified for Type-C connection?

> +                               port@1 {
> +                                       reg = <1>;
> +
> +                                       usbc_ss: endpoint {
> +                                               remote-endpoint = <&tcphy0_typec_ss>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +
> +                                       usbc_dp: endpoint {
> +                                               remote-endpoint = <&tcphy0_typec_dp>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +};
> +

.....
>
>  &u2phy0 {
>         status = "okay";
> +
> +       port {
> +               u2phy0_typec_hs: endpoint {
> +                       remote-endpoint = <&usbc_hs>;
> +               };
> +       };
>  };
>

There is no switch and mux, how to co-work with Type-C?

Best regards,
Peter

