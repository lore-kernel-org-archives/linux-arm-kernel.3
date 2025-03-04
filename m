Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C26C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=no+WKA4bRQSDa60x5YjSs7OON7XceXHnqTMuwkRPqt0=; b=QaUmPO1hJlPQE4tO/Y90xe9vRt
	bbLgAWCmbVgWlOOp94fVzN89r0ucNYN8/GKouBtV7dbsx9I21Q0DX3iF1mNjf3jiyD18UPXbQTCCJ
	g2hVD2lGNvGw/kbYewpmg16ZEfAQO6d0Q3OHu182wcSR+W23GoXjz3jstWeT1j0hyEFZSO+O6q+7O
	T2xdCwo33JMplmH7zZcYtQ4w8jJaccqPePp+Jb3gy5Gilggbdzqp/RSmmFnCdsa46AJgFAfrUexr2
	NxfhEZoCMgzcQAZLBIAGoBgARur/mQCFmxUT9TN1ehmheJMjAW7KIjq9vlwp0mfdzIU2yi+a4zNuq
	EZR6Hucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXfZ-00000005yD8-1b4k;
	Tue, 04 Mar 2025 19:11:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWDA-00000005fN5-0aN7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=no+WKA4bRQSDa60x5YjSs7OON7XceXHnqTMuwkRPqt0=; b=SD8cEH5Njqd2Tgr9jHcM7iozql
	jYUhlDGOUha1I8u1AIu7yUv+LN1iXpZ77pK8mhhiiJJ3vHShgi8TXGADEJ3HnPA4iP0jtkfFYTf36
	E02zO5Xhvn6L9fnLxS+g58XohzwoQzZdoke+W6xlpX+MM8Q6p4K0V+k52zv3arwewNeLlzsZDKIjM
	EyD9r2jJ1hCOFPrEzPg8U4WYn1YDz7ZunxrDcC+cskqD/tSsJo9qxZQtNfUvQzS7f9rGWnAzqhQ00
	+GLEIRZUavoPKLE6ulKzzc/pEtqLlgZ7qxRb/WmG2Pb3ETTmf7ioGJe0TePvFuICddQwU+9PTZNrM
	r6gXq3tA==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWD6-000000008Dn-3YHP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:37:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54955222959so4566455e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741109859; x=1741714659; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=no+WKA4bRQSDa60x5YjSs7OON7XceXHnqTMuwkRPqt0=;
        b=NrWkwchh/TLGL1BExYcHmmm73fi/hAahQdXYZhJJOjjtCuIgpv+RpEsLzVr/iwAHrj
         irqKWyzLRXfAnXF0nGubFp4B7RXLq59MfPZeTdMujEG7lMbCV90v6btXjCA4YWAWf4My
         SUY2z9/W67UT8atKks8QfDlxIB0jeeHyR2Nr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741109859; x=1741714659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=no+WKA4bRQSDa60x5YjSs7OON7XceXHnqTMuwkRPqt0=;
        b=D6zsR3epWyB2g+He7S4jFESASYTImatmOYGyuFrjzUQ3tJcgWu6YuyUNr/WiHfeZVs
         lCHJkmoMbfUynfZCDu3ouyVL3l+OlSMPZ1GZPHVS1YCI9DhXdRBWvssktpc5bBV7u0A4
         e7QsCd4KHFYm+nrWUdTXQ06e8XYeV/2/PM5YSMut9hz8O7ssW9AEcQU5ImBZIERI9JqK
         gK5vh51hLMPiJLNP4T9AFQxTyqProgut7bxgR07ue+VcZYTisxjfxo4CkT+hP/OCAz75
         AZEc3AZ/3pvSFwzx27wGUGj5Ti8LChjTmMUsc98oO7gXHJDyo3QOwhnTJOTfDnSwJLaI
         1RUA==
X-Forwarded-Encrypted: i=1; AJvYcCXgq4DGYIVCMRz9MNZjxUBC/Srty0rZCaRi359Mq2/KB+v0vKcJEXwFy5lBrsoBKFMGwfESTLTic63c+KV683wS@lists.infradead.org
X-Gm-Message-State: AOJu0YzCRMGyb//Nq7BHksN7bWTGZboRPW/FtYO/rCbWbqZePYudAv8s
	SajZ9O176GSjqhMwoetQrHhvFeyGBzKYSiQdPbnc3qREzIdb8+0lwI6YQYttdIcdf/7ImO8sRK5
	yYf4Ibvku9MWuW0XKQ4Wv2GzzfpUClB9FSKKZ
X-Gm-Gg: ASbGnctN7OlF9BwQ4ie1o8/usfINtUwlhWYCH231DNhhCBVGQjVy5qlN4Ua9YPH4Poo
	VChbv2ZAFN7kcpLerAjc1ADYarvrB+uqYFCLVgtAZ12VkIKemBdw2cKmwZolhxVedWnJwSElaCS
	7IP3pS1yaEfG+8NzXEyxLXuIQwg64=
X-Google-Smtp-Source: AGHT+IFCXZFFz0Qr9Bn+vPW76IXSgxIIcYhvmaG26JciGcJcXdooiPAyC0ue5u0m8xkWA6DxwQsGjXOac7XlagvPfZ8=
X-Received: by 2002:a05:6512:1597:b0:545:2c6a:ff6 with SMTP id
 2adb3069b0e04-5497d335f3bmr9845e87.16.1741109858860; Tue, 04 Mar 2025
 09:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-7-james.quinlan@broadcom.com> <20250304150838.23ca5qbhm4yrpa3h@thinkpad>
 <CA+-6iNzOWU1qLfmSiThdYXX0v5RkbUYtf52yk6KXm6yDDNRUnw@mail.gmail.com> <20250304165808.t46fh6fwpardheup@thinkpad>
In-Reply-To: <20250304165808.t46fh6fwpardheup@thinkpad>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Tue, 4 Mar 2025 12:37:26 -0500
X-Gm-Features: AQ5f1JoahOtxBk2AsgJoK_1V07TvIHoQEQtwyJ8TiLgA9gqQ9he3xCI95-EFxic
Message-ID: <CA+-6iNw2i=4KVr+VYOxacWpP7Pw0E5mDwKY1i9_6V_hjxu9neQ@mail.gmail.com>
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
	boundary="000000000000ad23e0062f87bafb"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_173741_047226_8A6FB64D 
X-CRM114-Status: GOOD (  24.85  )
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

--000000000000ad23e0062f87bafb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 11:58=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Tue, Mar 04, 2025 at 11:37:14AM -0500, Jim Quinlan wrote:
> > On Tue, Mar 4, 2025 at 10:08=E2=80=AFAM Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > On Fri, Feb 14, 2025 at 12:39:34PM -0500, Jim Quinlan wrote:
> > > > The constants EXT_CFG_DATA and EXT_CFG_INDEX vary by SOC. One of th=
e
> > > > map_bus methods used these constants, the other used different cons=
tants.
> > > > Fortunately there was no problem because the SoCs that used the lat=
ter
> > > > map_bus method all had the same register constants.
> > > >
> > > > Remove the redundant constants and adjust the code to use them.  In
> > > > addition, update EXT_CFG_DATA to use the 4k-page based config space=
 access
> > > > system, which is what the second map_bus method was already using.
> > > >
> > >
> > > What is the effect of this change? Why is it required? Sounds like it=
 got
> > > sneaked in.
> >
> > Hello,
> > There is no functional difference with this commit -- the code will
> > behave the same.  A previous commit set up the "EXT_CFG_DATA" and
> > "EXT_CFG_INDEX" constants in the offset table but one of the map_bus()
> > methods did not use them, instead it relied on old generic #define
> > constants.  This commit uses them and gets rid of the old #defines.
> >
>
> My comment was about the change that modified the offset of EXT_CFG_DATA.=
 This
> was not justified properly.

Okay, got it.  You are referring to (for example)
-      [EXT_CFG_DATA]          =3D 0x9004,
+       [EXT_CFG_DATA]          =3D 0x8000,

We have two ways of accessing the config space: (1) by writing a full
index and reading a  designated register (0x9004) and (2) by writing
the index and then reading from a 4k register region (0x8000 +
offset).  We previously used (1).  An update was made to use (2) but
instead of updating EXT_CFG_DATA from 0x9004 to 0x8000,
PCIE_EXT_CFG_DATA (0x8000) was used by the code of one of the map_bus
methods.

This commit changes the code in the offending map_bus method to use
the offset table for (2) and updates the offset table EXT_CFG_DATA to
its proper value.

If you want me to expand the commit message with the above text I can do th=
at.

Regards,
Jim Quiinlan
Broadcom STB/CM

>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

--000000000000ad23e0062f87bafb
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
MA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCDmf8zs2btLMj7lTZac0vsv+mqT2B2a
dcvRr35rLhZiSTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTAz
MDQxNzM3MzlaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0B
AQEFAASCAQBuUgpioFM3axEH1W05+trbr0KDB3oCbTZ3Kz+YkrblIVoScnq3Yo34zsPl+KdGdFRz
eBX97DfxTYEa9c6FyEHHW40sGq406YFtnfYSOf79coQml5TwlpzX2lY+HPkuAo+P+2x2n9ymCDaH
plnEaJLDSQq02ntMkAKHBVKyfXG3yWvv9MHMwryfBHu2HeRG7ClfD2doy1ezrI7h66ycvVlhSd5s
HeSzXLIPaGOemYi5WBkcjinapBC01Q0noF+a6OYsAYDgSMuy2+if6oBreCyyBIl+q6PlYTyXZeDw
ZQt4k9wdHLB8dHGWH2QWEORq25LUJGmyON4jltAcl1Spp2Ek
--000000000000ad23e0062f87bafb--

