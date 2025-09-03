Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD67CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tv/e5+QmWiSB8PrnuSDhZ46U1TqYFEGl3buUo+cKFiE=; b=dAvn+IvHop0gA9jEN6qPOmUP0m
	MhyVeIzE3ZGsPZOvUeZpj0FejlCl5Bu/E3+sBiUImHvFwWaxhVKF1CqQ7rRKJ+FBzyuefQ5qKAs89
	yh/NjlVZaIWCDuvsMRV3Ux7FA6MOpWToP7KwdBsS6VT8GlGyHWkVavhLzhGx7FTzCt6cXq4mMXq1p
	YNuvajA5TmTV3YtuIHSAZr2dBLXGjcVqFPfYBRiy0eGStXm+CDz6CCnK5DRxa/fxcHXlXPJdiXcdx
	ss/8mNCTgLugfJneKJu1IzkPMBefeIkNoapmjk8dA+hTXeKQ2Ndo28I+kgAq7/pSV0M417v/1j2Rd
	kFcUKNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzRn-00000008GoL-2EZF;
	Thu, 04 Sep 2025 02:11:35 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utx34-00000007vD0-0BlV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 23:37:55 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f74c6d316so456284e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 16:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756942671; x=1757547471; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv/e5+QmWiSB8PrnuSDhZ46U1TqYFEGl3buUo+cKFiE=;
        b=YyESsCHrgmF1GuGqb+yhHY8uSOrPWKTcKVu/q2Z+v8pMH++R55wFjsRkR8pgk1e1qe
         kjMLyBzP+hy2R3vOydJOxZValXr/fnS7b8oKqyxcUjMAcvJMRnGWKOsfVH0XoIduygXu
         UrSWBVgNH5rDhrwnC2n92pfKmwjiYSKfOf1r4sY9X9VYxkEvQKMHqM6nH8Jf1Hsbg+H7
         HE/aX41Eqt7cxE778kzhnPkhtGx43XUnmkLbfcax+dPJug/stt5aunEbLjiG8IGVCZMo
         km99BzWO36QeGuc7/KvdVPHaFQjNvMEogFNZdXnmE6Bos28w+ARDtPZ+JAo67g/8Orw2
         LWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756942671; x=1757547471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv/e5+QmWiSB8PrnuSDhZ46U1TqYFEGl3buUo+cKFiE=;
        b=YMI7dV1p+5CTfDgY4irF+9wymP/icSWg6y2j+0NvL8NdqQH77n3xKjFCc7xGbAVXTd
         L45NpoChWav1kJUyf3I2UxueHdqJq1MHusClgPNtVSQbc/ntHYgQ4Kub4DFfbfRHyx5w
         sZH+inRptm6Y3h3fXZwr6KS9GTENR0LnuM93OczFk8NGLCTBckNRaKE4ozY4Iddqu8dH
         Z0yeV0tgPTPgum0ST4HxzaSK0jYOxyd5amsAHGAFu36faQTu3VaoRzfMbFnkLUqfo7dC
         WYcJAu2O69KfKaFSTwTISBaW9z7j7kqf0Jb/eyxcIF43PY4+QfQvBuXpMQRqpm2etbv5
         FBvg==
X-Forwarded-Encrypted: i=1; AJvYcCVln6dventp58RuEwM7ERc/hUmKfyUdpObc6S2Vf08t/KjdENpNEnG9OvAuukYBx8RPFAMFihLqtVhsEtY4R6gU@lists.infradead.org
X-Gm-Message-State: AOJu0YxtYwLb0uEaROi2eZU5YEWNhUL2SEqmg5MpN352QNtloY8/s1QS
	kcSIciktTCdsyzY55+zc0j9DBt7e222XIdhxcnpfetPDa+9riG/V4ndJLOlG8E0iyv78otHi+OW
	4WsI1l+1QqBmnyEOL5TGRatQMn4PcZck=
X-Gm-Gg: ASbGncuw4eHXS+gUIaoQdhKkJVIP69fGsDl15G/e28L6sxzUZ5EnVZdqhkFHPgb2lCD
	Z9IAjPF7URWHJzChqmdosavspkly85u+AeudvcbNX3Y6ZuD6bERNBki0Ad6/925Htm0qXiGjE1S
	g3v9xeaec1aRWejMK546RbPD78jDAf6q1oCYZuuZ92RX5Dnfjn3layNWj92QEjcQpVZqGOt69LY
	1fz8aHlk4VuERfvF6S9U8JeVi/2tQx/PyHSWu6khx6OVeL2qQ==
X-Google-Smtp-Source: AGHT+IFYFXtX+tu/KEl7pQSY71FNh6F7y1XpLJcTeG502OgoDXb/vUP+HRDx37HC/Vxfaeu0jNJZux+/9gdjOo9o0+E=
X-Received: by 2002:a05:651c:221a:b0:338:164:905c with SMTP id
 38308e7fff4ca-3380164ae7bmr15568211fa.40.1756942671236; Wed, 03 Sep 2025
 16:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250903-imx6_dts_warning-v1-0-1e883d72e790@nxp.com> <20250903-imx6_dts_warning-v1-5-1e883d72e790@nxp.com>
In-Reply-To: <20250903-imx6_dts_warning-v1-5-1e883d72e790@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 3 Sep 2025 20:37:39 -0300
X-Gm-Features: Ac12FXyZOBrMIjlst-APzm8-fpvaAVU9IDxp1yLvwRyOjk9Sn4UouD6F8_4boGQ
Message-ID: <CAOMZO5AGv2ykKmL631A6O2yas-1ffmFaZdHFGMxrFx93G9t8XA@mail.gmail.com>
Subject: Re: [PATCH 05/16] ARM: dts: imx6qdl-aristainetos2: rename
 ethernet-phy to ethernet-phy@0
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hs@nabladev.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_163754_084222_5FE23547 
X-CRM114-Status: GOOD (  10.25  )
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

Hi Frank,

Thanks for working on this series.

On Wed, Sep 3, 2025 at 5:20=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Rename ethernet-phy to ethernet-phy@0 to fix below CHECK_DTB warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dtb: ethernet@2188000 =
(fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-ph=
y' was unexpected)
....

> -               ethphy: ethernet-phy {
> +               ethphy: ethernet-phy@0 {
>                         compatible =3D "ethernet-phy-ieee802.3-c22";
> +                       reg =3D <0>;

Are you sure the Ethernet PHY is actually at address 0?

The board schematics are often needed to get this information.

I'm adding Heiko on CC in case he can confirm.

