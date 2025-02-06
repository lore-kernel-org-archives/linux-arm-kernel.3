Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3349C02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsHP6tr5pr7nz9pUNkdjkchetJowERAmObob/BKgO9Y=; b=2ZzBJPe+vGd/Xo/rkRaOkiHVO9
	ELJSi5ZcCCOUv0OcqkqtsuJEl+rkd99/EGN6hgZTQXOmKYgTA6o3CShfVVdrpA6GK3dLJpdcgcYUC
	C3QzzdLvEz+Eu3oHLex7OSK/5IXG5uwgVnK+pX97LyxnXTb5ibM1KepkCEzjBbmO4o3XcJHuaDYFc
	9J2WYcDUmOeRioqIQyvwGb+08SBphU4PYDtx82gzS0Q5MJV9qDYZ0zcwF9fH62foWlS323Z5ar2Cg
	Izv/3FFJsh9j7In7fjw2oxuUt0lX4dHwNjxPmFJ0I5RnRE+dfeyoODqqdXgWg/3Ph0xgiiaQlv6GQ
	xvhTw0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6A8-000000074bJ-4BPr;
	Thu, 06 Feb 2025 17:59:41 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg68F-0000000749O-2O3b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 17:57:45 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401ab97206so1315979e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 09:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738864661; x=1739469461; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LsHP6tr5pr7nz9pUNkdjkchetJowERAmObob/BKgO9Y=;
        b=DaudpslScPVv1QdFcUqjRuZYVV18re0t5YKQSg0eUAAFr4kz61OfLNixCHSQ+LTbop
         dSM60e6aT2QWU6WZuZArEyVOij5f232IgqN5hyPUnxRRTJtPNHaktqRALvvUdTlcJMaa
         P4n8N9Q9BNr1C9A5N2phEO6bNZM1FczlViN88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864661; x=1739469461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsHP6tr5pr7nz9pUNkdjkchetJowERAmObob/BKgO9Y=;
        b=DC/rHNj+75QJk0rgm7YX1WivdHHvNkBVqU9ZaVSm9FkBANfeOy8HYC7cwfOxtgu2ih
         8ftNinpxHG77yMiaRLUrjU/AtqSpewQmarnb03/bb+HZ1h62L6ySuBV65aD9YzWfPdaW
         uEhCFaqURIEpyXOwD8nMWlWO5/XAmFO2VCtMuSYN7IgrallkMoeBbnk+jrjOLjA+wy1x
         55wOwqFg9JR9fbbVDYC1oJtuAr3eKkIIocSoyW5o/+28DygvnUklyg3FHmj+DWdC8bWn
         FZltunZWl6MnDY+tLmnLE1BP+iMCuGLDzGL9bJ7ANlF1Q7wcD+bRPOR3VsjKwBYL0jV+
         lDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEyQF/NzN36JYlxWYL1V0smfXrEQD+xl7il+c4KYo5kJ0YWc347bU8yoleLLy3asq8+ghZiAxiy8abTY+EDOWE@lists.infradead.org
X-Gm-Message-State: AOJu0YxbFlk9rjGhGv7frT2VZ6z0ACNdPx0aqCM/CPIoNtGbMOvyXENr
	eojyQVGWyEfQhVHmfw7jSdadmvVsFdkPoBHS5RsrIxk5YjeftEmfxjQJPCt6v5FM5qbxq6R4P9L
	KKwnBHNP9WAlK6G4HTKtC0ndOSVR+tkesiYZ+
X-Gm-Gg: ASbGnctnXiLp5OO7tRVZ9564j4kyxdwuDQfC+wTXYmeD4joz6rTH5zZTPjvthhybn3R
	YKCYXssBZKdD8bzEeQLihxNYgG0DSmRrMVXu8fYxQeav4+q2L5ISrettE6xUQFW7nxsAeLKl5tg
	==
X-Google-Smtp-Source: AGHT+IFDOTbwyJu5GlnWYlC6s/0BlVHlzHkKz+lMlBH6rOUiuQeFseUN/w+up3Jf/ABIHNGzk/GNzVnRy9L69AfraZw=
X-Received: by 2002:a05:6512:32c7:b0:53f:231e:6f92 with SMTP id
 2adb3069b0e04-54405a45714mr3365876e87.34.1738864661246; Thu, 06 Feb 2025
 09:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20250205191213.29202-4-james.quinlan@broadcom.com> <20250206173259.GA991437@bhelgaas>
In-Reply-To: <20250206173259.GA991437@bhelgaas>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 6 Feb 2025 12:57:29 -0500
X-Gm-Features: AWEUYZlAn8CKd9R6qNQhBCGf1wO9AkyQbRa60NA1T3o3i0blCM9h4jB0OQyZ0ZY
Message-ID: <CA+-6iNy9KxwZ67+PUqukou3KVZ7_VwZMRQ7tty+6yG_osaOE8g@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] PCI: brcmstb: Fix potential premature regluator disabling
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
	boundary="00000000000078980c062d7cfaab"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_095743_651614_7E901B98 
X-CRM114-Status: GOOD (  29.29  )
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

--00000000000078980c062d7cfaab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 12:33=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> In subject,
>
> s/regluator/regulator/

ack
>
>
> On Wed, Feb 05, 2025 at 02:12:03PM -0500, Jim Quinlan wrote:
> > Our system for enabling and disabling regulators is designed to work
> > only on the port driver below the root complex.  The conditions to
> > discriminate for this case should be the same when we are adding or
> > removing the bus.  Without this change the regulators may be disabled
> > prematurely when a bus further down the tree is removed.
>
> What did the user do to cause the bus to be removed?  I'm wondering if
> we turn off the power while the link is still up.  If we do, how does
> it get turned back on?  Does that require a manual rescan, and the
> scan of the child bus gets the power turned back on?

Hi Bjorn,

We only support having a regulator  for the device immediately
connected to the RC.  If the entire RC driver is unbound or rmod'd for
example, a device further down in the tree would be dismantled first
and it would turn off the regulator for the device closest to the RC.
This could cause errors during the removal of the closest device, as
it would be unable to access its registers.

Note that we do not support hotplug so there are no rescans going on
in our world.  We do have customers whose chip has several PCIe
controllers and they do unbind some of their drivers during power
critical scenarios.

The RPi folks do not use this regulator mechanism AFAICT.

Regards,
Jim Quiinlan
Broadcom STB/CM
>
>
> > Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators =
from DT")
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
> >  drivers/pci/controller/pcie-brcmstb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/contro=
ller/pcie-brcmstb.c
> > index bf919467cbcd..4f5d751cbdd7 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > @@ -1441,7 +1441,7 @@ static void brcm_pcie_remove_bus(struct pci_bus *=
bus)
> >       struct subdev_regulators *sr =3D pcie->sr;
> >       struct device *dev =3D &bus->dev;
> >
> > -     if (!sr)
> > +     if (!sr || !bus->parent || !pci_is_root_bus(bus->parent))
> >               return;
> >
> >       if (regulator_bulk_disable(sr->num_supplies, sr->supplies))
> > --
> > 2.43.0
> >

--00000000000078980c062d7cfaab
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
MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCV09PrXaem5NKwrBVWEooFxp7PrwYZ
1rC6Ni+jU0MKUTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTAy
MDYxNzU3NDFaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzALBglghkgBZQME
AgEwDQYJKoZIhvcNAQEBBQAEggEAoER2CeHQeF1twhXZGZg1HFi01ZGNQb7bhjnUOO2lAM9IeAbK
doq2Z/9Iz/rcb2Yj38b6JogqDXvasVkG271GGBk+W3Kv3ODf1KO7C9LI/nv12jpw3x+NmcVtHPHZ
Vv3ypOuJ0zLDJsIaT5TPCHLE97XXd2DWS9M0OqMTzTovr2Ata7eH7RomNL//bJE4tminDgRdVhpk
w9tQC6564rTwvbbZnHZLGHoO7juj0ZUvEYMdwCNHZr3HspUCabVtaXJcsvSe3RHL2hqjobW/wztM
vVFr4m8THSdOxnh+gaxSOhLv4b6j8ILrqiumqOAkqmrsX6WAvbirXZxdrPGuUzdheA==
--00000000000078980c062d7cfaab--

