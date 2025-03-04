Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9924FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO9TuQysPVXSNgTHSKKO6bMSv3oEPwJYy9fwcHSFYVs=; b=5F+Ae8jCsDGP+Hs1BgwGbpmV4o
	0nGLRxnBKT1MaXhOqK2gZ/OHjPXmJB/JxN8EEsK5JMdAAO6Oo9EocwLM35ZpjhygJpQI8jUeSwYl7
	blPdg8gCBbOIZKSSe8J2lBvXmO5msTNSoCN/Rs0f9qeN5Vdc4JB8FflB2n9uNr4lDm4LEhP6ixwWi
	3pLXq2bcwldgNPnxPpWd3E9kdEdbhrgfgpuTGrMtgcLX8lbI51smpcqk6YL73RJycprR+NyDr+zhw
	JNuI0zNCTPR9lP76u2TpNqT18MyeMmJxgk2T104DNnuFhmCnNqzXtBsNxIhh4oGVHEqy77zrnr2r5
	5Ndq7eVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXcS-00000005xaK-3xoJ;
	Tue, 04 Mar 2025 19:07:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpW18-00000005cBB-2mKW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pO9TuQysPVXSNgTHSKKO6bMSv3oEPwJYy9fwcHSFYVs=; b=FeDEFdlGFt+CBSu9/u5mov5lOT
	eYaHAeD2Z6jUMhPJTR1O8qArinhz668DHKNhruN12VINfdNajdQgC2X7JISyEN2op0hsZZvtoFXcI
	e/P1t7EpuJmhkIhUH3cEymJnPKihgiFI/yI4GHhKnu0g5SJZBGwSUexJ6s5uSmvRzu9g/uG/8NMaY
	8BJRfsQKilvWXcZl4WLHI/ic0w9eu+5rjw7EZW4vcjilqnD0GY1rbShSOkM7i2XJivv1vDfSLaD2G
	g1Z+r2NqW2nJmUWLnblbdFhWjRTQgo9YDKbTxivgPprgQOIU3EtmEXHAYDlAyokirGIPK/9RKZJ09
	0J2BWRbg==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpW14-000000007bv-48R4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:25:17 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5495888f12eso4023008e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741109111; x=1741713911; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pO9TuQysPVXSNgTHSKKO6bMSv3oEPwJYy9fwcHSFYVs=;
        b=Fu2Ht/wkgvvkwAKc6k0KVcSZlUR26JjTrkwATgg/nGkGNL81lJYK9wlWXJbnHzfuDh
         CTSlYa6DWa5ak9Jr06Ievuvk1iWCscVD7cGRlceMAAWiQWMlA86xGhYjrZpRrx6HYXuD
         Pzln2P3AavdTNvFnE7EntQsqFkuIfnHrbBYUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741109111; x=1741713911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pO9TuQysPVXSNgTHSKKO6bMSv3oEPwJYy9fwcHSFYVs=;
        b=MmDX124zHzfMZc3VRg3aqkxxoFhs/jRXTl/Ojd67edgKSUlUtLQRY2IIQFv477X4U0
         8S9KvamJobcpD2TJrFJjkrSeETjbj2lt0NraDWcX1MiSVpTHDAEOpxx3e6vlT69128Eo
         xL3vpxFxVFgHGXbgI08zoNpfCMPOAAFeQ4Csn9/flZc87ZZGmwDYEi9VkN35cHn1ouVK
         iZpPOXaAei17EnoWhHpj8USrzM7HR1rqs9KFHXy7QOKoUVipxRAKFBo6nL6V835AKfWP
         sN6wc39K+v2U7qfqZd5XcJrmZ6t7Fgnan8San/r0izmuc3PIfKbVHkqv5IiPvAyupBWV
         grDA==
X-Forwarded-Encrypted: i=1; AJvYcCWnlSMTg1vyUfP0tbNAlYo6SzsxS2um8aqzrZAOUypGUpARZc3ohJcX18PxHbB+SqfKE/ltu6Ygzd1Iun9PM2JH@lists.infradead.org
X-Gm-Message-State: AOJu0YyI5DXljr02vKgD99X3kILEySix4Y+7yuNsV5iUT5Xqv1ESB4lY
	EUpDP1pSHtIAhWyfiiYab7YMXrDTbL85tyFMtxJpGVC2K+dyWfVwCQE+61/pWYe0+xkjfqRJ87l
	1uXaCxpDNNgRaPADS2taz/LP+vhyO7ipUIK1Y
X-Gm-Gg: ASbGncuTKZKDtF0z/oxAM6ohLad9NCHVTn4D/h95xqxWTOfUYULAaZu6wYG16VzHmNL
	auhGcFi4/AAd31lonIpnw6KYt+6cTyLphtGmtfIvK7Ev8xJORZ/rAOfTPbWFiWO/5PwH1U/CmNO
	giK0+STUpzbVrnbI7Pr5ET3dREeoQ=
X-Google-Smtp-Source: AGHT+IHsXGlr+1E/+5BzQmeRR7IpTcLSgxQ+r4Ccm6upVbIWhIAZpB3bUqteQEopWRt4HtOJcUxQR7iLrjViszzXQnE=
X-Received: by 2002:a05:6512:2316:b0:549:7c13:e88a with SMTP id
 2adb3069b0e04-5497c13ea56mr366290e87.17.1741109109796; Tue, 04 Mar 2025
 09:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-5-james.quinlan@broadcom.com> <20250304150313.ey4fky35bu6dbtxd@thinkpad>
 <CA+-6iNyuQskVNjAuX1QcLTPetbfhogGYUTOA01QwNw9YcwAdNQ@mail.gmail.com> <20250304170735.x25c65azfpd7xmwv@thinkpad>
In-Reply-To: <20250304170735.x25c65azfpd7xmwv@thinkpad>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Tue, 4 Mar 2025 12:24:56 -0500
X-Gm-Features: AQ5f1Jplo14sKp5BRKKXE4a87OhIgFKmP5-uSsM-M5QKmKCvFukbn2xkEIPrYzA
Message-ID: <CA+-6iNzvqnZB=7kRqUm5ie6245AM5ObeVmMNQ_S4AtMLD0jKQw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] PCI: brcmstb: Fix error path upon call of regulator_bulk_get()
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
	boundary="0000000000001dd278062f878ea2"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_172515_386875_FDFB3D2E 
X-CRM114-Status: GOOD (  29.06  )
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

--0000000000001dd278062f878ea2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 12:07=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Tue, Mar 04, 2025 at 11:55:05AM -0500, Jim Quinlan wrote:
> > On Tue, Mar 4, 2025 at 10:03=E2=80=AFAM Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > On Fri, Feb 14, 2025 at 12:39:32PM -0500, Jim Quinlan wrote:
> > > > If regulator_bulk_get() returns an error, no regulators are created=
 and we
> > > > need to set their number to zero.  If we do not do this and the PCI=
e
> > > > link-up fails, regulator_bulk_free() will be invoked and effect a p=
anic.
> > > >
> > > > Also print out the error value, as we cannot return an error upward=
s as
> > > > Linux will WARN on an error from add_bus().
> > > >
> > > > Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulat=
ors from DT")
> > > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > > ---
> > > >  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/co=
ntroller/pcie-brcmstb.c
> > > > index e0b20f58c604..56b49d3cae19 100644
> > > > --- a/drivers/pci/controller/pcie-brcmstb.c
> > > > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > > > @@ -1416,7 +1416,8 @@ static int brcm_pcie_add_bus(struct pci_bus *=
bus)
> > > >
> > > >               ret =3D regulator_bulk_get(dev, sr->num_supplies, sr-=
>supplies);
> > > >               if (ret) {
> > > > -                     dev_info(dev, "No regulators for downstream d=
evice\n");
> > > > +                     dev_info(dev, "Did not get regulators; err=3D=
%d\n", ret);
> > >
> > > Why is this dev_info() instead of dev_err()?
> >
> > I will change this.
> > >
> > > > +                     pcie->sr =3D NULL;
> > >
> > > Why can't you set 'pcie->sr' after successfull regulator_bulk_get()?
> >
> > Not sure I understand -- it is already set before a  successful
> > regulator_bulk_get() call.
>
> Didn't I say 'after'?

Sorry, I misinterpreted your question.  I can change it but it would
just be churn because a new commit is going to refactor this function.
However,
I can set  pcie->num_regulators "after" in the new commit.

Regards,
Jim Quinlan
Broadcom STB/CM

>
> > I set it to NULL after an unsuccessful result so the structure will
> > not be passed to subsequent calls.
> >
>
> If you set the pointer after a successful regulator_bulk_get(), you do no=
t need
> to set it to NULL for a failure.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

--0000000000001dd278062f878ea2
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
MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBl//oahUIywMH6EWVak/qqS20gjYCI
HWenNv1aKKLPxTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTAz
MDQxNzI1MTFaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzALBglghkgBZQME
AgEwDQYJKoZIhvcNAQEBBQAEggEAnoeZwicR4oe8eeP0erXB4Uz15xHyjsk+mX0q3LfYh5m0l0f1
vRHSBMp+0qWpfryn48jA9i0Mt8V3oyYwESKaIvv5x7bHKAuWhxwa5ZZnloyWNkuU0BGpQc9Do5vC
w83d9Sv7LSaeb2PvRUcaN6b/oWKbYpou1FxiN/ezVLibqxFCjDQUpBme3fgcHFtHtOsEbR03yYDh
ge5O48LyhW6yfjbcotJtI3WpUoqj4sD+eCCtE8WVzAn5E6Dc8ZArCCw+E+hLtywRgARnNT4WOm1X
inwVTNaTCaOAl+6Jjq+xIoUhZU+ZgWTiYP13m60Ly9CHdh38Rs9PpGpOd/de7SepVw==
--0000000000001dd278062f878ea2--

