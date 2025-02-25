Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B02C19778
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btIzpaiXBm39xMpzgFyr6PPx6n79OgifTZ30SVyZSrU=; b=yjuIjxgE82HS929bgQUh+QSDzz
	aPguWPySMuxmEtNHAh4+bHlaMYXrOFuGoTOJkOQgtGnscujuDeh7PC6t8D6fIEbcDm7nMhDo6Y6xW
	94TC+LwigzrQRSvdvvstSQoKENuzHan6AnotAkf/BZ/kxwiRxchl30XgZs8jsehPGBPej8y2vsPwB
	f9fA9lcZZ5OW9XRbm1OTCOR1rHxcMm1tyWKKFqdeeOmbDs/plMDnMX9ha9XIRwq/jVIz7dNBrJQI5
	1cA/pC02zjTUv4JhPZ5qDq5DoWu57gLKTX5Q6PW+WcwV9W2SaO0/oVjMiJjPm69OMYMCMgxdqcl6F
	ay7/w2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx9-00000000Flb-1svR;
	Tue, 25 Feb 2025 16:38:39 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvAd-0000000HPJi-0hDm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:40:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-222e8d07dc6so38560125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 05:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490822; x=1741095622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btIzpaiXBm39xMpzgFyr6PPx6n79OgifTZ30SVyZSrU=;
        b=GHCYbGTycmT8le4TvNI0Sr41iBKL0GPNNKTWGZMgpvDcDzlqYUkDdZOMpVwh7Rs2kF
         qzN/WLw9WbqwKR4lvvE/lzuuF1R4X0n84Wph4a32NYzPW6bGv3WY6CqTJN1SMxxRTw4l
         Hu6b/X4RmAAZXkF/I3c2OnsICWmGRNxx+3mxuZQ/V2NlfnjjbPiM8s2tRP5M1KeqvPv7
         Dhu5Da5hfQKKMJqjEmRCYoEQ09BMIYB5vOAFMLXxNs+nsirifnSVk7CYjNHkMaZCDfDP
         +tOqJzE61zzEIUyfHLkR4agDOB5S/BkQFD1qkWNE7NtcQaa8TMCes+XNcCKNfaGrorOr
         z5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490822; x=1741095622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btIzpaiXBm39xMpzgFyr6PPx6n79OgifTZ30SVyZSrU=;
        b=SKj4moQI/DBZe+QmQ2Ynx/dlFlH9nSPlM2DvEHcPUq/IAz6r3KhWZ0m3/b3+He/xao
         U0aJUOrK609dBAfAXwnOQ6c0i6lQT+ymA4q++iqZM6REUyfiUozeWAm4yBShokZSUnrF
         tQEvPbcMChM9UsYW1DDdD4zIeL6CV7ZxdFdYlyaLZFgwBonLcjWv9cwMD+gHw8+Dd/E2
         Xo1fGV0ALZQxRG57kbmVP/6KqwFYjY8My3EBEL9AKCnzJ8BQCEGn5ermn9Noe/P+HsCL
         Q+lpL2KzEFw4y/Rr/3eZIdWSsr+sxxB5B32rRkBVhVAXNZkelpU7QxLYiKzu0W9I0m0K
         xx/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsA1PiQCwdzQeQOpOp17PkxhAvUwqY0K+vuo75w1kKjKxusVjjJZwEbFkoZ5yV56US4hIN1TS16OXfnOntLbNQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6AtQx9+n8HG2qfLtZHfq1WG7pcBej5T4IZhSHh9QtCIvgLNlG
	IXdt8q3cadnOpcwNByysGTIZRRSK2KBvrZtZK2Zp3Xh3pX0pexsEFrM1aaOYle4zhP78IRSt6aO
	DCH8zmRKbYPB/dSjvYvgH04Dz1hI=
X-Gm-Gg: ASbGncvzW3ctdhv4+EUS3XU/kL8dg24Yo3DuYyNainpBACNAPXCVIy4XoYST9ldVQzC
	aGZqQANzKqSoSCpqy3XKWpPJZcCvDP+/kvDGdYofiS8kHsyM2sbqPud7qlfBTi/0mMs2aytZXK4
	RxDD76
X-Google-Smtp-Source: AGHT+IEqvx+vLUoWU+bH7g7MTRR7upTwyq8plc/LIRpW15G1pS1TD1Y8exEPj6fQZzzsjKBHvHSHg/l/PmukuoidDeo=
X-Received: by 2002:a17:902:d4cf:b0:21f:6546:9adc with SMTP id
 d9443c01a7336-2218c3f4333mr351935475ad.13.1740490822321; Tue, 25 Feb 2025
 05:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
 <20250225102005.408773-3-daniel.baluta@nxp.com> <78e60d723c27b7fa0f03bc6a74f6ad37d6508734.camel@pengutronix.de>
In-Reply-To: <78e60d723c27b7fa0f03bc6a74f6ad37d6508734.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 25 Feb 2025 15:41:58 +0200
X-Gm-Features: AWEUYZkKeH8Ee9X0dKf1ks0eIJRo2-c4LR6sVRs9-5VD4M6vPScOpUqA3j5lyUI
Message-ID: <CAEnQRZBL+r2-CRDszK54SD_8E9=1QRKRj3_YDHsM7YetKMcs_w@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	shawnguo@kernel.org, mathieu.poirier@linaro.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_054023_204088_61423D8A 
X-CRM114-Status: GOOD (  14.78  )
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

Hello Philipp,

Thanks for your comments!

> The DAP core reset is mentioned in the commit message. Why is it
> missing here? After reading the discussion in [1], I'd expect both the
> stall and the (core) reset signal to be documented, something like:

There is no reset controller driver for DAP area yet. We manipulate
the bits directly by
remapping the DAP address space inside remoteproc driver.

See for example: drivers/remoteproc/imx_dsp_rproc.c

/* Reset function for DSP on i.MX8MP */
static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
{
=C2=BB       void __iomem *dap =3D ioremap_wc(IMX8M_DAP_DEBUG,
IMX8M_DAP_DEBUG_SIZE);
=C2=BB       int pwrctl;

=C2=BB       /* Put DSP into reset and stall */
=C2=BB       pwrctl =3D readl(dap + IMX8M_DAP_PWRCTL);
=C2=BB       pwrctl |=3D IMX8M_PWRCTL_CORERESET;
=C2=BB       writel(pwrctl, dap + IMX8M_DAP_PWRCTL);


If we agree that this is the right way to go, the next step would be
to create a new reset
controller driver for DAP area.

I want to keep this as a follow up patch in order to not compilate
this patch series even more.

<snip>

> >        memory-region =3D <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> >                        <&dsp_vdev0vring1>, <&dsp_reserved>;
> > -      fsl,dsp-ctrl =3D <&audio_blk_ctrl>;
>
> Is there nothing else in this range that will have to be controlled by
> the DSP driver in the future, such as the IMPWIRE register or the
> XOCDMODE[OCDHALTONRESET] bit?

We are internally running SOF for couple of years now and we didn't
need any of these bits.

