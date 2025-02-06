Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B4C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMgEDamR1mlvCD+hhoqV5zZHpvgl0Bcy/8ZKtfg2QtI=; b=cKGYQkBylTYpnY1Poha6jVrTvc
	8QFyWww2IJSbjipPrb2rBsnFvvQCq46GeQPIa6+QDLwmCNFlkJrSnh9j7y1fWUH6I2pBakJWvnNGu
	cqHczRa2+LWzpNFjkAa2ZX97FKx74irgAoQCIWus5VmgT8r6i0omoEn21pQ9KDtcUAr7OOKprhbkP
	vPSnTX+5bjcrqlX8GFCBbL4x2o3u78XiSTC7KzrJMHIL0OBjgvxxA3vYvxI1dsBGA21wMul68v4CP
	cKtkY2zULPerG5RJ43/0THDBL4vaSjBFRWlC8pdyf6EmExiiRToVJurs/MPsyx8SqEYSYeCLYOqQX
	kdTHI1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg780-00000007IOQ-41ta;
	Thu, 06 Feb 2025 19:01:33 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Wr-00000007AbB-0uPI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:23:10 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401c52000dso1275788e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738866187; x=1739470987; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mMgEDamR1mlvCD+hhoqV5zZHpvgl0Bcy/8ZKtfg2QtI=;
        b=KSeEjMakLhlZ7toTcfgrS8vBNCf/OMeT9B8aO8RnOivW8ad8sfnScBCKZK4NRy4Xz8
         LCOkcb20Nc484ZZWXOozgAUaU6mQvNsnvlLbC2YYjkMOo76cd9K3Ohxg+aOFg7rwllvb
         B+1ax3a092fK12+Ic0y5Vvbl15gp+B8V3fXy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866187; x=1739470987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMgEDamR1mlvCD+hhoqV5zZHpvgl0Bcy/8ZKtfg2QtI=;
        b=KhaXufcMX5U4IelY+39h81nOCIJHzPU82GuX6Z5fh8bcqiTf5KTEZvDUtfhCJX0eR/
         jxLOOxaVZcV7fML3aK19PuFCvKqD2WoRz+0/8gUG3310ElPHkpmyYD9KzUKfRzX0fdFW
         QiQff46kZuqa4G/k8VOjICkWx9kXOuDw9ROlixIcjDUVRACsYgtl0wRj01gnzgfvsoNO
         JoWNBxwEMnMfTTHfYgbCLZhnL7qbUL8xnGPnya+FBFLwnEmnpfJwdgMW2BkvwWbuHUe4
         BCo3ZDEt6vlwoAQvVJ7hm+/hFYoV1aC0xG8hY01br+HTlz1gA6GAp8PxUsfc7q3V+vLt
         ygjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDpFrZGmRcYMTckCkT7dKrGOOWtM0JpTzK2VUPHxuavayghtoS0dZpDTzLG5Krn8071IcsvwJF6/eyU/P/waaB@lists.infradead.org
X-Gm-Message-State: AOJu0YyonwIrNSRQe5i3NhXaFpIb7I4nGJM9AQ+AmE/IxMTB4GxYwfyF
	syVTXjO8Bn1KiTvsdbAidCYh+e92vaGY97uN9q3VV9gdgKFr2qy79QBN+UwR7b68mzB95HUjI7z
	4/7D7UxNThFMrlpa1AaTbSQMCwSIjl38RsLdI
X-Gm-Gg: ASbGncu8r8wkoP8ss44k+B/tExWSUCVsZnD+TJP/PvsEIHGCIiUYRe+F1p2n9xiWBpi
	3gr5+mwUWbpj1TV/Ld04HYeGI9cqw6lDC5mEX40fxMn2qkOq2w87eIZ/Xn8238hANyPzbXyqR7g
	==
X-Google-Smtp-Source: AGHT+IHi45XGnqX4UCmHmYEXTyMJIB46zws7U31zlWlfnvQXRYTq6GAaiEPh+osfqQE8zZtk5vst6LTN7WXrkMMPnKU=
X-Received: by 2002:a05:6512:318f:b0:544:b5:7487 with SMTP id
 2adb3069b0e04-54405a17a44mr2833383e87.17.1738866187202; Thu, 06 Feb 2025
 10:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20250205191213.29202-3-james.quinlan@broadcom.com> <20250206172935.GA990026@bhelgaas>
In-Reply-To: <20250206172935.GA990026@bhelgaas>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 6 Feb 2025 13:22:54 -0500
X-Gm-Features: AWEUYZlUMeWB20WhMn5B_gHFzQh42jgGcqDP6fch1EzD4_oaIIn7aQjExWD8WrY
Message-ID: <CA+-6iNwws3On9-VJ-vF55o5LwKYpOHtfRYLtoQ5=bh7uGTfYkg@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] PCI: brcmstb: Fix error path upon call of regulator_bulk_get()
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
	boundary="0000000000006cf8b5062d7d5532"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_102309_267004_4BD110E3 
X-CRM114-Status: GOOD (  30.96  )
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

--0000000000006cf8b5062d7d5532
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 12:29=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Wed, Feb 05, 2025 at 02:12:02PM -0500, Jim Quinlan wrote:
> > If regulator_bulk_get() returns an error, no regulators are
> > created and we need to set their number to zero.  If we do
> > not do this and the PCIe link-up fails, regulator_bulk_free()
> > will be invoked and effect a panic.
> >
> > Also print out the error value, as we cannot return an error
> > upwards as Linux will WARN on an error from add_bus().
>
> Wrap all these commit logs to fill 75 columns.  No point in leaving
> unused space when most things are formatted to fill 80ish columns or
> more.
ack
>
> > Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators =
from DT")
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
> >  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/contro=
ller/pcie-brcmstb.c
> > index f8fc3d620ee2..bf919467cbcd 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > @@ -1417,7 +1417,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
> >
> >               ret =3D regulator_bulk_get(dev, sr->num_supplies, sr->sup=
plies);
> >               if (ret) {
> > -                     dev_info(dev, "No regulators for downstream devic=
e\n");
> > +                     dev_info(dev, "Did not get regulators; err=3D%d\n=
", ret);
> > +                     sr->num_supplies =3D 0;
> >                       goto no_regulators;
>
> I think it might have been better if we could do the
> regulator_bulk_get() separately, before pci_host_probe(), so that if
> this error happens, we can deal with it more easily.

Hi Bjorn,

Keep in mind that brcm_pcie_add_bus() cannot return a non-zero error
code, as it will get a WARN() from the caller if it does.

Would you  accept deallocating the "sr" array and setting it to NULL
like the following error condition does?  In that way we would not be
invoking any regulator_bulk_xxxx() functions with nr=3D=3D0.  I'm really
wary of moving things around...

>
> Setting num_supplies =3D 0 is an unusual way of handling this error, and
> if this pattern of managing PCIe regulators spreads to other drivers,
> we might trip over this again.
Understood.
>
> Not asking for a redesign here, and maybe it wouldn't even be
> possible, but it kind of fits with thinking about splitting Root Port
> support from the Root Complex/host bridge support.

IIRC there was a submission having custom/modified port drivers owning
regulators, but I don't think it got accepted.  FWIW, we were
considering  switching to that.

Regards,
Jim Quinlan
Broadcom STB/CM

>
> Bjorn

--0000000000006cf8b5062d7d5532
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
MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCgZzsC3VOqsHE0KWAhLhZy0CRYLwru
xuG1ZHEsrqcZUjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTAy
MDYxODIzMDdaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzALBglghkgBZQME
AgEwDQYJKoZIhvcNAQEBBQAEggEAcz9IOOntn6Nc2+COHv5rCC7OnMuT6jiKNfV+qBdUvSuiNQfe
f5cejJIDd33747YbAS+znx8LLmTKar+Gp89b9ghBVdRTXqPLl5gPYnfD2QIun6AxDG0KO3Ha8Ptz
xtfkAMdscDgGg/UGpKGTkvdXYLZpVo3yzfv0r6CtLW5H24HR/dD38KEPwr4luh/lFjEoBVPB0HBg
IrrCCKpISnfsEBAeCsF4PvLv0WPnYqTbDtpBOez0VxK+pFLkOwHgyyge5NPXHdPzpy51II9QkQdO
P1YY6yNMlaxFRLjQGKOm5eXhShCf1YuCBWNyzLkDaXcd4v2JWgQHpgXcAultfiLSLg==
--0000000000006cf8b5062d7d5532--

