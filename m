Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1743EDEBED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 19:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8n8435Zr1khu5rLcpa1RouqYs6DNDPzPkSmUCRdtj8=; b=KdQk/4nlLhGjfj+8B0PfUTo9Tn
	RSEg9hYx3bjLKjlKXOPVr3uvMi48R5M58XYkJdZZNtg+RWPsvKqUimDXPUAIthipsFHEvj7F/opx9
	0fOc6IX/wUVZVKzsdKJDz2Bay4EVYWsBNx1DHHWPG507b7jrCBcaawracZlvsh++fQLikbXdOjT6H
	fv9kpul7OHSsNaTWNTGXzhNZT8I3D7MWDuAj+vzOkAObV5+ifQzgEwuyUtcsQVBHKJBwBgzfWR+Ar
	GlNEmaQcMen2Uk9vRWHaqFRePqO5fw5SFVvCnzTjzlLXCrKt86RBAytN14dYekmPpzGlHKhM6e3ID
	iJ9H4rYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVeG-0000000FpiH-449v;
	Tue, 03 Mar 2026 19:43:16 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVeE-0000000Fpha-1AgM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 19:43:15 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-899e85736e2so32971846d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 11:43:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772566993; cv=none;
        d=google.com; s=arc-20240605;
        b=L228DfnVpN8S4Hqipaita1rWiIVOQYqB1c7j4O+QkI+OAJUP3h4P0qLDo567/e9tRE
         9RGy+hbX/DS7ue1bN1acWHvPGMccNGJXhOE6p7DXwUV0s0MbA+4xAMyhyhepHPIVd0ew
         RqRA9MBMN5hxeans19sp7qokyGeQ03d2EYi9se5OBAyVO1hKn4MB0nkrgjuZ60CQQJjp
         nh4IeUgIuNXLUXo1jmPw7Vz0tmWNa0v8fDvOSzrftOCvLJ+suAmoSwrhM1YAdfNj4rLX
         GaDHEJWZmOj2yRJUKqzNlBz1MuiVHV2UK4TCX3jNs3IgLeeHdzoVN1srGb6birb7EmWL
         d8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L8n8435Zr1khu5rLcpa1RouqYs6DNDPzPkSmUCRdtj8=;
        fh=DvEkGH0md656TYs+sLD7LAtGYvFZJOuTpCyN1P40/5g=;
        b=ZzrWlCXIUwP+uUpHAxNmc7cSdoG8HRVk7QIqQW7vddL+HySVVQ9K1U22EAWeDbOoAe
         zvgHfz916qIM4FxI3Rkf2c0Ky5h7rRyOWjvCZJ8M7xiQGXWFP6lCQx54CBqtmtnKY/ZR
         1O+EcGHAjTpkCv2Y5pGZeSjyyd84v7ljlgU+hs2Pq296hkN/rCQPFs98DjrmpvoITYMF
         xBT8HP+mv+9CE6YmPMj97vdFhvx+DD6lPlQ5o46LWZvrWwg8EhIr+vQjtuXW8kXZJpXE
         RvGZ6ixSMkc4YgE5hmajIKa8QS7GzvlZaAn6Y9HIKcWN3PlD0zD8GxVNzmcQB8Po6ZWj
         t9tQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1772566993; x=1773171793; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8n8435Zr1khu5rLcpa1RouqYs6DNDPzPkSmUCRdtj8=;
        b=bhoJcWTxZX0il9HX6zExB0HO81u3zxP3wEfxVHlTkUaTCK1y2LudWvgHttFcKLdyey
         b8JPHXXLfXyA/9/Tq0kJg2iyXwkBLzkS41k7zFfuEH6c+akt5hCimale3p+kFwWKH+YS
         ARdM96V7VvwYJgKkxxW/c8n3ZyieAX+Y0y5gvDWSQQ0hGPUth7gI71MY1zFVYtQGebmc
         Dfwd1qLhwP0pzmqjTuq6q6zSK7gQjvAQxwgTPnaN4FktY5UspMXQoTpnho78uMvA6/Gf
         tM5jr5QrjxXmdKuN4oBI9VWerPGan0dIeKUrqQVodOY0AIoqzaMuFddyQ1JRv5E9vNKi
         I6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772566993; x=1773171793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L8n8435Zr1khu5rLcpa1RouqYs6DNDPzPkSmUCRdtj8=;
        b=FYvy9v21YUpSSNNgCi1WRYPrGopOPrPmb2KJSAlt0cXQeEH74qeu9Oo6rsn7KKbttI
         3TS7YGMbdDEpWRj1ZLPOV9Z48MWI4pvbFLp2EOkW6Mqa8SakfZ3upZLZfZQpATUoZNw6
         IHnc07COv4tS8/9VgqoQuT6u4C6exBcr1++txdaU7pj81O2C3mpoc/6JU1oGP2g6BVyh
         tu1zx6toqoe9iS+4CpSLYv//rBCaxQFS1+OTOZsxuTwWfFTUef53+vDF4dkGR8b1VQpt
         Pvn6ufPEd4Joav5jp9I1KLEa/UHjRc+olArxTCLVCZbOTrvDFoCDWnc1k4XpS45Q4Htz
         l3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcuYR+kDMoP01ehYUOcosOwMnJSESOOpZqhNph8f8XK7kkEy2TNd+dzQTGnCX0DS+7SY/dE7e2U2WbQUOV5kq0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3lqcXQmOOPUVTbASqs1rWPaaVF8r0/tLOURyC+GHy9qHprAmz
	rkAsnmSaIhPx/LSrEO24oJkNtsm6X0YlXjQyZ4yVBVAEZ9WC0zlFZdW8WBSapAe+Y9/+GQ59LcN
	/mbzVZmgoDR/ZhiKO7Mv9gTBrncOWdYr65hZSqPHpSQ==
X-Gm-Gg: ATEYQzx2jQ+yi8AZHdJWyVS6uxMH+a+fQryx+Jppozi1UBIkg87fw2Qz8b5J8Fkmro7
	jrGF+e6sOgjLVBGCCkfTHO7R60nFUA1CUvWc1Ul5FG9qNuN3VPcGux0Eo+mKitcLjL4VZOrj7gJ
	/GHGnhMGOG++WFoyYMHxfWCc/+3nus3fPpjK5OYAtG6FOyLEFnOfEW006vxz/UfDoB/4pD9Ri4A
	AedQO8D5zB2BZczqgGoCDsH9BKRfprbdc4XaBgK2n+u53un89L9pBBLjZAlobnU3w5D/ArMVLUB
	sOwtdDU3dlBzs2CR8SuoT4DkYoiy7Lb6lNB/KDV18E6WHlHl7OOdD0QCMUv4nyNKEHoZ28Q=
X-Received: by 2002:ad4:5aa7:0:b0:89a:e8:d188 with SMTP id 6a1803df08f44-89a0a8d7188mr45825626d6.20.1772566992620;
 Tue, 03 Mar 2026 11:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20260228205418.2944620-1-dennis@ausil.us> <20260228205418.2944620-3-dennis@ausil.us>
 <CALWfF7LZV07x7zAgufE_aa58s7x6e_ODAM2LgZqjbEakDticpA@mail.gmail.com>
In-Reply-To: <CALWfF7LZV07x7zAgufE_aa58s7x6e_ODAM2LgZqjbEakDticpA@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Tue, 3 Mar 2026 13:43:01 -0600
X-Gm-Features: AaiRm52nwTc5WYofSGOqwEBnZSvdAzLbNGmLH2WcJSTdxX_MUmE39dck-KQ4XU0
Message-ID: <CAABkxwsJ2ZnytCcHEvXWzNkjwzNThoTR23FAeHJLdf4JjXJEMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_114314_334122_9034B8FD 
X-CRM114-Status: GOOD (  12.52  )
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

On Mon, Mar 2, 2026 at 11:57=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com> w=
rote:
>
> Hi Dennis,
>
> Some curiosities below,
>
> On Sat, Feb 28, 2026 at 2:54=E2=80=AFPM <dennis@ausil.us> wrote:
> <snip>
> > +
> > +       /* Pro uses gpio-leds instead; pwm0 LED is not wired up */
> > +       /delete-node/ pwm-leds;
> <snip>
> > +
> > +       gpio-leds {
> > +               compatible =3D "gpio-leds";
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&leds_rgb>;
> > +
> > +               blue-led {
> > +                       color =3D <LED_COLOR_ID_BLUE>;
> > +                       function =3D LED_FUNCTION_STATUS;
> > +                       gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
> How come you decided gpio-leds instead of pwm-leds for this? GPIO1 C6
> is muxed with PWM15_IR_M2

the downstream dts uses gpio-leds  the GPIO comes from the schematic

> > +                       linux,default-trigger =3D "heartbeat";
> > +               };
> > +
> > +               green-led {
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_ACTIVITY;
> > +                       gpios =3D <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
> How come you decided gpio-leds instead of pwm-leds for this? GPIO1 C2
> is muxed with PWM3_IR_M2.

Again, the downstream dts uses gpio-leds

Dennis

> > +                       linux,default-trigger =3D "mmc0";
> > +               };
> > +       };
>
> Jimmy

