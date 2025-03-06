Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C491C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FD81B+WVkTkRKlimjvGHAAj/n1zpdE3cSZhGJytAFVs=; b=t801+Qa4Bf1ztnPtQ2QdunNBBr
	+LLBaYhxl3zR9LSkCiBSHUyUMB7hSQGlv8D1V4AOwlb3o5AOBJoBD3ULj4kuVf5HRaBIEj2kIeIO+
	uNpiyWttDph+IZCGsC6P5GiWsWgcU3mcS/vUXoMaVaqzDxmrbLvh8QnfLtASK+YWJcVlvdpoLjKmR
	75xLMLn++YxkwGnbyTws856kfKdJetC5vLYLwLwdKMGr7YlbEDwBJ+U4CUQlpSe0C3q+JwbeYQtkY
	sY6gB7RE574kHSKnNOueSeXisEbf5NNRXp5+KIKGZpnILR5Gd/Itm3tF/gaEb+UtklKLTPup2ZUj0
	zaB8N0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEAZ-0000000BWDn-3DXS;
	Thu, 06 Mar 2025 16:33:59 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqD5z-0000000BJJY-0XMV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:25:12 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5495888f12eso967851e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 07:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741274709; x=1741879509; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FD81B+WVkTkRKlimjvGHAAj/n1zpdE3cSZhGJytAFVs=;
        b=YrORMJVe6nD69boJmieHnwnGgeGcZdGmsVQBTw8DnFMVWLtoLMewds6w+VjcqG2A/o
         jsV/UrDQkaec5QQD9w4k8Ics5Smo/4sPhYMK465aHyvesw6VqkczHl/C3XMZ08Hn6AWw
         YiDDXWK8KBS4t7t/fIl5Youu6STV1dRY4Z8y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741274709; x=1741879509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FD81B+WVkTkRKlimjvGHAAj/n1zpdE3cSZhGJytAFVs=;
        b=EGQ9B00x41ngsTbZWRxTVa7ADkO/K5NkvKBES0uTaStmQcFJ6d4yUx0NhGm753TCY5
         YFCv70Pe1/Wcu57sDs2HEyumMtuSIZg6RG7/TsZq58hMxi3VV0wCXwCTUPTCHUZ7D3Uf
         vaWr2vMCh3r6kkhrsoxHmbG0OT4BCFxq1WUokpYCL7S02pYmtrUKelC2LLGmMWQck7eu
         voGqC7eZRyOTaUiOUKtlyTvPXtqq3krI4RpX62LNI8Hv88UcFD7rTWRlVfzZBKEklaIW
         QVQKU5e0NoOUAJE0oYxyyT5pAStlIrJUl1pKT2JxjU5jr+eWouNmaAPe7wSU0fUmyguB
         +AFA==
X-Forwarded-Encrypted: i=1; AJvYcCUKyhpYosKsCShGWfZvkFqk0h09qnAVstjirXbDzBeJEeL3ri1U6NYfMckRru/22OhKiJ3GKDYwbHkax4/E9JNU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs3RkAjTz4cYF5Pxq67y6+GAhftwcXQcWkbM4agdxtk6uUyJoQ
	N00beL9UWCVWjV2x9fXrHgLKkW7yM8B1ubjWGJX0aYyAmy3+Ho/ja6GOpgHxXLyg4yYAz8Me4AG
	we+5ttV4sNkx527oEHwj98soeNaXQbwdEs62P
X-Gm-Gg: ASbGncsBck7Tu/4VZsNmO4shBIzyQUAri6cakZtIGyFhO2rWM383BTldzXF6/0Hzk65
	wWaeScp5AmAiDcbwFQSUCyGg5K84EilLuLICZj7BIF4TLwtzm42J2pt2YhJzCZNhUfCMkV2HrN5
	W+P+npiobuGZ919Fkh18xHyfnIWX0=
X-Google-Smtp-Source: AGHT+IF2yWz7i9kDki87ltokdbfYDZk0WL+drHziPfedvmVMhVFqp4MF77Rblo9zAoUdSbcuP8JebTt+Wp5PiKUygy0=
X-Received: by 2002:a05:6512:32a7:b0:549:8c86:7407 with SMTP id
 2adb3069b0e04-5498c8675b8mr794742e87.52.1741274708598; Thu, 06 Mar 2025
 07:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20250214173944.47506-5-james.quinlan@broadcom.com>
 <20250303184011.GA172021@bhelgaas> <CA+-6iNwsCzf30a0vbgStqA+DCyBnk3bGwoXNv0UNYOThE1Us6Q@mail.gmail.com>
In-Reply-To: <CA+-6iNwsCzf30a0vbgStqA+DCyBnk3bGwoXNv0UNYOThE1Us6Q@mail.gmail.com>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 6 Mar 2025 10:24:56 -0500
X-Gm-Features: AQ5f1Jq37MLMRA99pCX37UPItYXdqTq2aPqIxfJ0HUR0Zyg-xMJb8gaw-QKhCwg
Message-ID: <CA+-6iNyXeXhqzwbV+pcizpyXg-c-gihcLEtPv1s1uczdNN_VOQ@mail.gmail.com>
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
	boundary="0000000000007cbdd9062fae1c9d"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_072511_205308_0EF4A501 
X-CRM114-Status: GOOD (  24.43  )
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

--0000000000007cbdd9062fae1c9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 9:49=E2=80=AFAM Jim Quinlan <james.quinlan@broadcom.=
com> wrote:
>
> On Mon, Mar 3, 2025 at 1:40=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
> >
> > On Fri, Feb 14, 2025 at 12:39:32PM -0500, Jim Quinlan wrote:
> > > If regulator_bulk_get() returns an error, no regulators are created a=
nd we
> > > need to set their number to zero.  If we do not do this and the PCIe
> > > link-up fails, regulator_bulk_free() will be invoked and effect a pan=
ic.
> > >
> > > Also print out the error value, as we cannot return an error upwards =
as
> > > Linux will WARN on an error from add_bus().
> > >
> > > Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulator=
s from DT")
> > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > ---
> > >  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/cont=
roller/pcie-brcmstb.c
> > > index e0b20f58c604..56b49d3cae19 100644
> > > --- a/drivers/pci/controller/pcie-brcmstb.c
> > > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > > @@ -1416,7 +1416,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bu=
s)
> > >
> > >               ret =3D regulator_bulk_get(dev, sr->num_supplies, sr->s=
upplies);
> > >               if (ret) {
> > > -                     dev_info(dev, "No regulators for downstream dev=
ice\n");
> > > +                     dev_info(dev, "Did not get regulators; err=3D%d=
\n", ret);
> > > +                     pcie->sr =3D NULL;
> >
> > Is alloc_subdev_regulators() buying us something useful?  It seems
> > like it would be simpler to have:
> >
> >   struct brcm_pcie {
> >     ...
> >     struct regulator_bulk_data supplies[3];
> >     ...
> >   };
> >
> > I think that's what most callers of devm_regulator_bulk_get() do.
>
> Ack.

Hi Bjorn,

Manivannan stated that this series has already been merged.  So shall
I implement your comments with a commit sometime in the future?

Thanks,
Jim Quinlan
Broadcom STB/CM

>
> Jim Quinlan
> Broadcom STB/CM
> >
> > >                       goto no_regulators;
> > >               }
> > >
> > > --
> > > 2.43.0
> > >

--0000000000007cbdd9062fae1c9d
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
75sSFMj27j4JXl5W9vORgHR2YzuPBzfzDJU1ul0DIofSWVF6E1dx4tZohRED1Yl/T/ZGMYICYDCC
AlwCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UE
AxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMSO43VW7D5NP1X/KD
MA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCA6fnUgboztbQshQq3uCu813h9lIcpZ
VHp9TTWAPTEkajAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTAz
MDYxNTI1MDlaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0B
AQEFAASCAQB8lgVR9QlbRy4NCuJQTPEFOYgpD3wq92RP5gUFae0OAYVz4Z34eeIejWqes0E6KpL4
axrEZMFWoverjhOvA3EQFEd5FSldeiIudDdIqM7jhHrPQbWuFwDnZZGHePCOMM9fnBvf0ZTYCwyh
ZeFqHY+X4ViA0MKMA5g7v7d9z0k5bE8m02JZEDjmSFphj0KX+C+6IyRS3ntYpmgTOEKK8uQqJ4sI
d1k3XSBhtgilk5v+oS2mGpz5mJBvKOEMBu26/cab8Jax45DMqx0vUDYk3dII5EaaEpuw3AWtyE5B
ick+snBjNx21qja9wRpng6FHuRbjedhLbjlPctw83/232BRD
--0000000000007cbdd9062fae1c9d--

