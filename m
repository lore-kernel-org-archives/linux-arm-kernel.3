Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF1EFD88D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 01:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWZp1dAqVPQSaHrep/yDn/qvo1iogNLvOQo/Z4cwLac=; b=ZielmivZhcMev7JecV6PgSZzmn
	0jbawU3vllirqyhl2x6rauy1QEFe3l0yhnWttRT3coO+1+brtzxQtc6t9LkOxDjrZfbgWkyyQtE9Y
	vDUV3E32arFJULA4fiPy4i4yO4G4bd7nvXrAINL5+kX/1P1wNQMCKk2Sai1AiqKe83WLciXflAwJK
	zpTHDpWx2ARS7GbxUEtU7dcaNrNEf2Ery7u5+oCHMaUlmG8crozLQM+dbR+M9QR547bV0AMvOLuGl
	eeTFJ3ZwbXmFgAiQKE3HBpTOVT3KZ++29VmKX3tXkdUuoN2tUkC2t5ItRaP/HhNS4n/+rrn/BTf0n
	xDjnNZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08Od-0000000AV4I-0t4T;
	Wed, 11 Mar 2026 01:29:59 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08Oa-0000000AV3b-3KMy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 01:29:58 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-509134ab2d2so28416581cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 18:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773192595; cv=none;
        d=google.com; s=arc-20240605;
        b=EMQ0wjEPRdZxwACkItQRKUs/o9RTC3xVHcWb1UdeI/ALy3gJ6OeieIEeQf1/ltf/EJ
         fD+sWsjvj16JrFtOn3xHZ9HdnI+osJuPwyeSNvzjGxr/5ju8zHYc66Emr9RPx8O8Jj9A
         JN7tr0vJBvaFWhN/Gg+02zgNsyHG9cz5dk9OdUVN+63LRvDIRdSEnKQUJJ+SKZSUwP5i
         xDr55SXZlf9zDoISyRJ1wF+/1rQJMb4dj3ZhvZEuV2MJk5E8T4EWrzfcKvfb+piiq6SN
         TvF54RcGyQoc4NSIMbgxpsVI7JqYkZwn1th/7KPWQrGyDFkqre3Sp/9XKBpPK/JycyP3
         wP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sWZp1dAqVPQSaHrep/yDn/qvo1iogNLvOQo/Z4cwLac=;
        fh=y0vT/AjYMx7KWTzjK67WtkOjR9aKMJI0JgRLhgWemeg=;
        b=OCQ6XQPyzR9kl2sQXKAsEPlo0/1Dpf4/MET+BoF2hKL+wiTeQ9F+WEjgW3ett/tFRO
         TJ3TdHUfQ1zyM9j2+8dPKIto1dTECBCqdVFeYXsFAL7ThW5W+rBtRd1efX+ZdgSFtE2u
         pOA0PeUuw307Eqfes+3dNovMvW/DNHz0o95/9B9lHocyu/UHhKdnAj3nCuWj4c9uZ1sJ
         WfcJSnl+y6nLwk8ixkH13t6PvO7FFNyL/q5vMwyeQJNUcQRVMW70h9jt6EKcdyGTDNHj
         7nEk26h4ewycV1cy1WmRXRkcyl1bWvYEGYJCzsOxEoL6bNkBAlHLQplgzcIv5QV+tAPh
         cDsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1773192595; x=1773797395; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWZp1dAqVPQSaHrep/yDn/qvo1iogNLvOQo/Z4cwLac=;
        b=f+jGzcSqatXkHPQcQBmtNfyjQROZMBxzH5zdAc77nEFxlC6X1/lTWgqCUgTfd5w2Ax
         nWxqmD8Emaqxx33IJbSPQOLuXgrNKrYfx89RoOBFAvkFYJbVkUFiFMUTqQ1dZ6k9OLts
         d+qwDNEatvqsdbrvxpG+aYP1sbLm2CGGsRwMQ2j1gBBPSW5SVEOI2y3xJ4qF+Sae1V4Y
         TVTkv5lHhJldWRdpGGFbY1Feoxo0Kwd9HgXoJIdZuN2Kfv8WFrPG6jtGL88RuGdGcPtV
         UJ0hLHAYE91Oq/BkLnJuGS64dc6nEBIHj37xbm6UOQhMfDg4tJxSRojrSVt+UysSIZHc
         dcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192595; x=1773797395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sWZp1dAqVPQSaHrep/yDn/qvo1iogNLvOQo/Z4cwLac=;
        b=KTg8+Al6hdVejEVJmFKs34vbFzK7L/62fUK18IkCjVg3IbPWbLHgmFaqsRjrrmzu/B
         rGu30N9ynkClueuwbFKr02K9Ol4Tt4oJadR45/eF5uDXnqKgJgdwiHoFhAvPb3VyiMxj
         ZRi2ylH/cezTE1a0JABT4nGjfojj9UtmaR+jPKHAJLqTMtyGlwnK6VxqlGTh6/TUq+2L
         pWXVspGRRl0CI0Wz84nzvqseKyvUjBA0kuERJD3J3QxiBRO6yb79T0M5bgpW3cyPDPxT
         0yxPqheeYtPyrJLZa06uxOtl6dCastF5bDBCA8kuiSN2f3wXypa2FfBcrrrFbKTCqIsV
         RaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWABDMnob+nWjeZUzapQz1Aiqe0IeeIPdDepXjzgci94C6lIOm823lMOs2AksG/r3npKpSOwNOdnSZR64MGvbul@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9JW4zcAeCyUseOge/Rmhdmy9to/3G4gQZRKBbkqEbxmocNIfb
	HZrxLp/2eOaQdfaUBWleOtPB7Y3ufBrr1n67cSZHDQ0BVuZpG6+0wOIRaSyyCsIwthp87gEHscH
	dsghVitWSFiqgCb0VHZP4cRRj8O5cZDLZnSWsbH4IfQ==
X-Gm-Gg: ATEYQzwp+Mw3I3KAOKbm4X6PnM1qrOvpjWM8mFxHKr/PjlTifQEuoq80zCfPkEGUewl
	hzEbsmAqwoNnwG65DhcaMpRsedev+DEEscq5ZNpjV3008Uq643Idaz06zwH6OVlo2lawuJmhB35
	DBo4yFptFYudG1+QQJxW9/wWmCcWi91vuV2vs/uY3/LxgnPH0J0AEXQU9wsLr0I3lZ8CU1iOFu8
	gNpVnDxfXOe3kZ+sAX3d8BVkxYY2qwyrQfSZgWoUxECRWem1QXR0asacI7Zk4w4e17/JzX19h/x
	zJDZLfEnB7BayiO6Z/ovLXP7tYnHPzNELzL9/yL/gGoNMmJek3vfJXhKaeTJVjC5Y3lvOf9XXXl
	KgdhrqA==
X-Received: by 2002:a05:622a:1351:b0:508:faa5:451a with SMTP id
 d75a77b69052e-50939f5295dmr9948661cf.13.1773192594678; Tue, 10 Mar 2026
 18:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260310031002.3921234-1-dennis@ausil.us> <20260310031002.3921234-4-dennis@ausil.us>
 <CALWfF7KD1=U-gC4wC9M49kEYD3ijcfr+XSmMeh_-zAvjO2JVoQ@mail.gmail.com>
In-Reply-To: <CALWfF7KD1=U-gC4wC9M49kEYD3ijcfr+XSmMeh_-zAvjO2JVoQ@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Tue, 10 Mar 2026 20:29:43 -0500
X-Gm-Features: AaiRm50D0OtMAsh0hit8iP6ZIxcfOA-A_ofh3hQyy_97B35SnBk_C_vdM7fTNJU
Message-ID: <CAABkxwtz7KjVJpSzYhUWGyEym5k4d3NJq65OS_E3NCnrNUBTZw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Alexey Charkov <alchark@gmail.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Michael Riesch <michael.riesch@collabora.com>, 
	Mykola Kvach <xakep.amatop@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_182956_863257_C5CF9BA5 
X-CRM114-Status: GOOD (  12.31  )
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

On Tue, Mar 10, 2026 at 7:20=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com> w=
rote:
>
> <snip>
> > +
> > +       vcc5v0_otg: regulator-vcc5v0-otg {
> > +               compatible =3D "regulator-fixed";
> > +               enable-active-high;
> > +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> > +               regulator-always-on;
> > +               regulator-boot-on;
> regulator-always-on and regulator-boot-on does not seem right.
>
> Why were these added? The vendor did not have them.
> https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65da2b7=
b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro=
.dts#L216-L226
>
> Was this mistakenly taken from the regulator usb 20 which is powering
> the onboard usb2.0 hub?
> https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65da2b7=
b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro=
.dts#L111-L119

It may have been a missreading of the schematic, but it was added to
get power to the USB3 port. before I added it devices plugged into the
USB 3 port would not power on

Dennis
> > +               regulator-max-microvolt =3D <5000000>;
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-name =3D "vcc5v0_otg";
> > +               vin-supply =3D <&vcc5v0_sys>;
> > +       };
>
> <snip>
>
>
> Jimmy

