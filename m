Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19EAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fC+WrWOR85gW9hia9JCW0PkNCD1tKeSVtHoNVPYOmPI=; b=XxbweRd9/MTRL/VyHLLkShnqKN
	cbTphdnXE4isGbOWXJwOnxXpOytuMrAhthAhihd4Cfgv5ek0nNQE2i+chlJbj5XC7GZ/xW6DC+YLz
	p9uFsDePrsTN5J8j/XCAAh5PU12cB3UAsKFNW30K3XP+FsXa4Qqphh7ceK1KMU2G82T/1LQKifOYn
	JDZliH2rLbEQPMFBvdAaApTDjOJOlWD+NjKShwCjv2VxBWyLBbyxovUaJhaJwRcx3dFS5Rjye7bYL
	1Q0VmGSa5Y0EVzLJr66pizEgMlop+9sBpqGWqcvLwmWMJD7iZaFqs5V/36uOFfyAcpgaRXzuCGvC6
	4EThOFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWhu-00000005m6L-0vMh;
	Tue, 04 Mar 2025 18:09:30 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVGr-00000005SSM-0tqS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:37:30 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5495078cd59so4627867e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741106247; x=1741711047; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fC+WrWOR85gW9hia9JCW0PkNCD1tKeSVtHoNVPYOmPI=;
        b=A3cF4xsZ4X58qC2Xs4QMylnUu2zP5MYBtIYHo3RwIaCGSsDCnsUTpehKW4j2yLMOXR
         ps7A8lq0IZ8x2BysC4zZ4g6LQswmlBpaGS3UQCmKuLHC+z2cPqpsHU2NizaRR9juOGDL
         7fuUGPviel8tDzGwtptDQOm+ycW5A9oOcEGnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106247; x=1741711047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fC+WrWOR85gW9hia9JCW0PkNCD1tKeSVtHoNVPYOmPI=;
        b=FpFBw7YrZKhsH44tvSGivUJcD2tFBoe0r2oUn5HHPAV4CPxsjYTu2EOqOyk9vVS5x9
         xwbkvHTeLNGe477i/ZU16Uy4Wl6PMGWSwdBU/3LJsupm2693bVwNZyp0vEyKcX2yPwDS
         6BxMiP9TF1K84Y5DxNqvIfJhk815p3DoX7rnPq1sMudBNM7Z1K89gY4KwQ4VxZ1OlI89
         sEZZtjm1uURruho9AyUTCzJWFXfx3w09RWvJi02+ToQGU8IhGfE+t2M1C4D4ypRSoiMZ
         KpiwMcfZMswVRgpQANo1zxqsIrlt9935NG8I8ZWrvhAKBb1Mn+an2TnqyDFUXdHixEo0
         noMg==
X-Forwarded-Encrypted: i=1; AJvYcCVnUAzxoo8LMkbL33uHzUklnuAQTGmiAGZoEyBFz0LeDrF/5JMyfyZwP5tL40TVP9ZqWP/8UIHn7ETL9HIEs1JD@lists.infradead.org
X-Gm-Message-State: AOJu0YwHfkLaOHD0oRlxMJ1tSLIVz8krdqz45l9iAA9Yq7VPsnuh+34r
	9kBbrV2VJ9dpCW2hm+ijUVlPo/SLumBhuwtwGpsf7FkqeWAPQd3ViTIhWMZFCQQoVRYn1r6O4ir
	AojLO98U1EQLbt1PjsCHYBP8P42XBZb8GrPf4
X-Gm-Gg: ASbGncv3S4sKlQ8Vaa+tSPET9AW8FxXYUNg99xa/3ipv3f2TlAxvPNAqDTVj1hUtYLv
	maoJbeKjyw0i4PIlBCv9xUa0Cq6XWdKxakmn0BGs1YNT0O3zI462wmYGhG16GiuTf44bYX1z+Do
	vsejKIwkqwZoyCv79ah4J5HQFaLtk=
X-Google-Smtp-Source: AGHT+IHEb3b277xqRqJp1ckXeMWGDMg96uWTLb8EGKjCHmqIIwAU2IJecSHrorpEE4OQnRbhgkR81FtwP8+B3es+W0U=
X-Received: by 2002:ac2:499d:0:b0:549:5769:6adc with SMTP id
 2adb3069b0e04-54957696d10mr3992327e87.2.1741106247262; Tue, 04 Mar 2025
 08:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-7-james.quinlan@broadcom.com> <20250304150838.23ca5qbhm4yrpa3h@thinkpad>
In-Reply-To: <20250304150838.23ca5qbhm4yrpa3h@thinkpad>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Tue, 4 Mar 2025 11:37:14 -0500
X-Gm-Features: AQ5f1JoW5XA69R5P5HEW4xQGcq_X8yLC_V13WSo-ryXSh-szOfdBDP--_8F-yck
Message-ID: <CA+-6iNzOWU1qLfmSiThdYXX0v5RkbUYtf52yk6KXm6yDDNRUnw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] PCI: brcmstb: Use same constant table for config
 space access
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, Stanimir Varbanov <svarbanov@suse.de>, 
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006933e4062f86e347"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_083729_252741_66DBBE85 
X-CRM114-Status: GOOD (  28.27  )
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

--0000000000006933e4062f86e347
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 10:08=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Fri, Feb 14, 2025 at 12:39:34PM -0500, Jim Quinlan wrote:
> > The constants EXT_CFG_DATA and EXT_CFG_INDEX vary by SOC. One of the
> > map_bus methods used these constants, the other used different constant=
s.
> > Fortunately there was no problem because the SoCs that used the latter
> > map_bus method all had the same register constants.
> >
> > Remove the redundant constants and adjust the code to use them.  In
> > addition, update EXT_CFG_DATA to use the 4k-page based config space acc=
ess
> > system, which is what the second map_bus method was already using.
> >
>
> What is the effect of this change? Why is it required? Sounds like it got
> sneaked in.

Hello,
There is no functional difference with this commit -- the code will
behave the same.  A previous commit set up the "EXT_CFG_DATA" and
"EXT_CFG_INDEX" constants in the offset table but one of the map_bus()
methods did not use them, instead it relied on old generic #define
constants.  This commit uses them and gets rid of the old #defines.

I didn't add a "Fixes" line because there is no functional change but
I can if you want.

Regards,
Jim Quinlan
Broadcom STB/CM

>
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
> >  drivers/pci/controller/pcie-brcmstb.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/contro=
ller/pcie-brcmstb.c
> > index e1059e3365bd..923ac1a03f85 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > @@ -150,9 +150,6 @@
> >  #define  MSI_INT_MASK_SET            0x10
> >  #define  MSI_INT_MASK_CLR            0x14
> >
> > -#define PCIE_EXT_CFG_DATA                            0x8000
> > -#define PCIE_EXT_CFG_INDEX                           0x9000
> > -
> >  #define  PCIE_RGR1_SW_INIT_1_PERST_MASK                      0x1
> >  #define  PCIE_RGR1_SW_INIT_1_PERST_SHIFT             0x0
> >
> > @@ -727,8 +724,8 @@ static void __iomem *brcm_pcie_map_bus(struct pci_b=
us *bus,
> >
> >       /* For devices, write to the config space index register */
> >       idx =3D PCIE_ECAM_OFFSET(bus->number, devfn, 0);
> > -     writel(idx, pcie->base + PCIE_EXT_CFG_INDEX);
> > -     return base + PCIE_EXT_CFG_DATA + PCIE_ECAM_REG(where);
> > +     writel(idx, base + IDX_ADDR(pcie));
> > +     return base + DATA_ADDR(pcie) + PCIE_ECAM_REG(where);
> >  }
> >
> >  static void __iomem *brcm7425_pcie_map_bus(struct pci_bus *bus,
> > @@ -1711,7 +1708,7 @@ static void brcm_pcie_remove(struct platform_devi=
ce *pdev)
> >  static const int pcie_offsets[] =3D {
> >       [RGR1_SW_INIT_1]        =3D 0x9210,
> >       [EXT_CFG_INDEX]         =3D 0x9000,
> > -     [EXT_CFG_DATA]          =3D 0x9004,
> > +     [EXT_CFG_DATA]          =3D 0x8000,
> >       [PCIE_HARD_DEBUG]       =3D 0x4204,
> >       [PCIE_INTR2_CPU_BASE]   =3D 0x4300,
> >  };
> > @@ -1719,7 +1716,7 @@ static const int pcie_offsets[] =3D {
> >  static const int pcie_offsets_bcm7278[] =3D {
> >       [RGR1_SW_INIT_1]        =3D 0xc010,
> >       [EXT_CFG_INDEX]         =3D 0x9000,
> > -     [EXT_CFG_DATA]          =3D 0x9004,
> > +     [EXT_CFG_DATA]          =3D 0x8000,
> >       [PCIE_HARD_DEBUG]       =3D 0x4204,
> >       [PCIE_INTR2_CPU_BASE]   =3D 0x4300,
> >  };
> > @@ -1733,8 +1730,9 @@ static const int pcie_offsets_bcm7425[] =3D {
> >  };
> >
> >  static const int pcie_offsets_bcm7712[] =3D {
> > +     [RGR1_SW_INIT_1]        =3D 0x9210,
> >       [EXT_CFG_INDEX]         =3D 0x9000,
> > -     [EXT_CFG_DATA]          =3D 0x9004,
> > +     [EXT_CFG_DATA]          =3D 0x8000,
> >       [PCIE_HARD_DEBUG]       =3D 0x4304,
> >       [PCIE_INTR2_CPU_BASE]   =3D 0x4400,
> >  };
> > --
> > 2.43.0
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

--0000000000006933e4062f86e347
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
mOAplh6h3nMZUZxBguxG3g2p3iD4EgibUYneEzqOQafIQB/naf2uetKb8y9jKgWJxq2Y4y8Jqg2u
uVIO1AyOJjWwqdgN+QhuIlat+qZd03P48Gim9ZPEMDUCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJQYDVR0R
BB4wHIEaamFtZXMucXVpbmxhbkBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYD
VR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFGx/E27aeGBP2eJktrILxlhK
z8f6MA0GCSqGSIb3DQEBCwUAA4IBAQBdQQukiELsPfse49X4QNy/UN43dPUw0I1asiQ8wye3nAuD
b3GFmf3SZKlgxBTdWJoaNmmUFW2H3HWOoQBnTeedLtV9M2Tb9vOKMncQD1f9hvWZR6LnZpjBIlKe
+R+v6CLF07qYmBI6olvOY/Rsv9QpW9W8qZYk+2RkWHz/fR5N5YldKlJHP0NDT4Wjc5fEzV+mZC8A
AlT80qiuCVv+IQP08ovEVSLPhUp8i1pwsHT9atbWOfXQjbq1B/ditFIbPzwmwJPuGUc7n7vpmtxB
75sSFMj27j4JXl5W9vORgHR2YzuPBzfzDJU1ul0DIofSWVF6E1dx4tZohRED1Yl/T/ZGMYICbTCC
AmkCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UE
AxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMSO43VW7D5NP1X/KD
MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCClhG6MzNY6mGOktkUm/RNVlbGvThVK
IK6zb+Hm5tgnZzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTAz
MDQxNjM3MjdaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzALBglghkgBZQME
AgEwDQYJKoZIhvcNAQEBBQAEggEASgxgNllxtglxds2W0y4hiS1iyUqcdT57Abpo2FAHg4IQFpwP
d31QIR7HvbwWUzGaUQ3MHdSFixYZ3+zXJ6ILztZ2DA2jooV88spLsS9RNTzHbPlCHDQICbw2FJg8
rugJbIq2crRE2ZdT0pOQXttMpN8iEobOARwaBNbYi5WHOPQ5xj12jAcJkXjexisjNohvo97KL260
kZ248gy+zI08MEyQCM4+yWk8o619TBZXdreiCiQOfGcVgm3NRUI26GkGz0XQRFWnL2CFjFC99oM/
/cPQQsv47lJr18gzEKK6qWnbdeLgi2AueRlwdTY2jpi97XPox9rEZ9Ewnq5zWgPFVw==
--0000000000006933e4062f86e347--

