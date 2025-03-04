Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AD2C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=so7Fj0aJbtW7FjAEZfX7I9fd+t9rjO9Y9RTQ2+ojZdE=; b=Do23feJ0pcYXRcacFWtVRt8lVl
	g546PCYY6ZaD7l93Jyf8enksWLYWesJPbuavxpNOJWGfpRPxR4VFukzkR3CYInWYO+Tm+FL+xwfNk
	5Nr5zsicYE9dHaT1jsG+t4LOTshETV2CwEZZeoE63kKNEj+NrRw8gKeqIK4SRWKJqTpOR9ijbWvEb
	gj+NXCMbXil/PywTc9efMm3d3cPw9cFGXthYlKBQRfPu4hkdqSCom0kyN8GY2iTL5XcLBRQXWIKw1
	p2QBKaYMcbgy6Bc6jW6+j6OGhcg/w5bEi9q4kbLvr2oNw4yguBt4ROCogT6OS8jfCaJFycrGlbnwd
	trzwnURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUgJ-00000005KBo-1v36;
	Tue, 04 Mar 2025 15:59:43 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTaj-0000000545V-3YpI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:49:56 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30bb184ab24so24589551fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 06:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741099791; x=1741704591; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=so7Fj0aJbtW7FjAEZfX7I9fd+t9rjO9Y9RTQ2+ojZdE=;
        b=dyKd72iffsUX/E6AZmbUHryHU2Pk7KM11AzqjR6QGKdosTyEnoXbWy/7eu6L+OWyVR
         QHGKdJYhLFLPEa8fkaon4/I+3GG9gAyCKuejQxxzGOxwXgYX08Bxc9YLCa7erHtJVjee
         IeBNMHBWlWEl7w3wuUCzbZGLPAK3DZScp7Y9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741099791; x=1741704591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=so7Fj0aJbtW7FjAEZfX7I9fd+t9rjO9Y9RTQ2+ojZdE=;
        b=Lo75UiiWD4zVHpJg39ldkwniMOytnswRZ5K3G3drP0cHxt9ofC9ylCoXKc+WJUJcfF
         7B9ZsrcQTgnCBQFamES/RnNyeMVvGmqXaxNQ6v7BqB2iGlzCZEYkIrnLxDc9hApcqfKl
         eckFbhPFdKsYw8MCPjGeH2jDo7RfgjjbJSV41UwliDGTNZXN2vujn9O1Cm26m9wyvDQt
         ErJqqAJl+aA9usPE2iGNnpd84YobswRNAZ29JQ6ZLiuhew3YijxI06xOxmgfamVDbDvY
         KTiDi3uTDap6fnZUk+nmoc1Y4xhmj25I+9zxhU8OCkes3Y4fbqG+9y32tAEnv0CLFm5c
         dFhw==
X-Forwarded-Encrypted: i=1; AJvYcCVn+7EWrMwCgxcART42AqS5lHPmKDaxUDlq/rv5bHEXGYT+J172ufInZRINKXs1QhOgjVtvruZ/16DOPQ1aCuIi@lists.infradead.org
X-Gm-Message-State: AOJu0YwF25aq/8tnjChX4Kc+yiVRH5iPR9UtPR83lssa0kdo+f9SQmLi
	0siO5Aj1LfoM51w656Dg22+7/7XykX2uO992Wv8Dtppto+FYR9Z91mPJnZoQugOaAAI1GMeifdd
	xKlsoc9VnzT3XF8nDJEPaNVb389MJHweQr7Ec
X-Gm-Gg: ASbGncv/S+6vb6d4/McnLaAgV3tnsvohE5rrbQ28Mxjb9hCqU/of4JRviQa8t+0Oyez
	dMK2BELTOjZbgxMRBTjNquf24lsWDYgj127zR2BywNi26YubyyUuZgV+lvtlGYdWNW2NUC40MgC
	llHqyvmtaz2kQyuusIDFMHGQV3Nqw=
X-Google-Smtp-Source: AGHT+IHT8xHIWz+CS+B5AAIuL0QVtzKBELXi0oZfqO7wx4AboX3Wol6OSm8Jwyi5CLhlIV069PNfoKDRZJ75ye1NquU=
X-Received: by 2002:a2e:bc12:0:b0:30b:cd68:b6a9 with SMTP id
 38308e7fff4ca-30bcd68b99amr9825951fa.11.1741099790679; Tue, 04 Mar 2025
 06:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20250214173944.47506-5-james.quinlan@broadcom.com> <20250303184011.GA172021@bhelgaas>
In-Reply-To: <20250303184011.GA172021@bhelgaas>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Tue, 4 Mar 2025 09:49:36 -0500
X-Gm-Features: AQ5f1JoZGguPAuGjSIp2xcULmnzh0Lid1o8GOqyc1c0urPUti-NPnDDD--wsp1M
Message-ID: <CA+-6iNwsCzf30a0vbgStqA+DCyBnk3bGwoXNv0UNYOThE1Us6Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] PCI: brcmstb: Fix error path upon call of regulator_bulk_get()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, Stanimir Varbanov <svarbanov@suse.de>, 
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000090ab4e062f8562ff"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_064953_914487_35E6E0D7 
X-CRM114-Status: GOOD (  22.64  )
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

--00000000000090ab4e062f8562ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 1:40=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Fri, Feb 14, 2025 at 12:39:32PM -0500, Jim Quinlan wrote:
> > If regulator_bulk_get() returns an error, no regulators are created and=
 we
> > need to set their number to zero.  If we do not do this and the PCIe
> > link-up fails, regulator_bulk_free() will be invoked and effect a panic=
.
> >
> > Also print out the error value, as we cannot return an error upwards as
> > Linux will WARN on an error from add_bus().
> >
> > Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators =
from DT")
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
> >  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/contro=
ller/pcie-brcmstb.c
> > index e0b20f58c604..56b49d3cae19 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > @@ -1416,7 +1416,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
> >
> >               ret =3D regulator_bulk_get(dev, sr->num_supplies, sr->sup=
plies);
> >               if (ret) {
> > -                     dev_info(dev, "No regulators for downstream devic=
e\n");
> > +                     dev_info(dev, "Did not get regulators; err=3D%d\n=
", ret);
> > +                     pcie->sr =3D NULL;
>
> Is alloc_subdev_regulators() buying us something useful?  It seems
> like it would be simpler to have:
>
>   struct brcm_pcie {
>     ...
>     struct regulator_bulk_data supplies[3];
>     ...
>   };
>
> I think that's what most callers of devm_regulator_bulk_get() do.

Ack.

Jim Quinlan
Broadcom STB/CM
>
> >                       goto no_regulators;
> >               }
> >
> > --
> > 2.43.0
> >

--00000000000090ab4e062f8562ff
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
MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCDtTiW3sw7DVcyKucvCWyYuM05ZktTK
vq5MxzAEF/qYhjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTAz
MDQxNDQ5NTFaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzALBglghkgBZQME
AgEwDQYJKoZIhvcNAQEBBQAEggEAR4/n6oh2wRkMrA7ESlGO4iDG30e/MkKh0hzsae0ZYKGwh9Zg
ludz9cXFwVhxViBNp1I8assfeOeUTNhLI4F90Rw5BSouml7kxTUpjS/hPSWNpilaoNbEAtU68LIY
PJRMvsN1AR8/qW3npFb7jyeLMr3963Z/J7pbVtHXKA+AeF2eV7Sz2vIf/Q77lKobMWoPMNJwNPmW
7IGuWSEJkGjZw9hcEov6Cfb0xsSJoqOYjvM4SUcpDFvnsxXA+DdWgxsfcK3esGyk1YADxanrrBvc
jVrFl4K7teainGrikaSHaPOd7WGCx8VzYFTInRZeO3t3AeZAvr4bUzYclYHSPx0jrQ==
--00000000000090ab4e062f8562ff--

