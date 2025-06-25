Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF880C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBwkllZntHrOMdBT66DRk9AkwiWaHhdpaDiIk/ypMhM=; b=UiF+31Bd120yi4nE+cJ6+vO2DL
	Z+M5JLYZyKA1wM9ausaTp55QpidtEuRvv5vt+vWL8rUbalZyAJVxxhoIBjQDd+6hjgZJStSo6HBmC
	PXVsIGenU1CKH6zZD7D1hnQfkD97FHYRjeMAzECCCQoiwzrRQkuYb3J3Z4/gF8GNvnsGLEP5mTRxJ
	f7OUeAFvOr/QcYP2vTH+1CqTeDWmgNBsZIaMV/IAp1uPGe/XJx8YmsxZdbciNKzhHBCEnJv6F0qAZ
	fnhZimtEqRX3oo3AnQYXFUapZFArR+72MSVAVyxogceO7fqkjPuHR71+GualFFsB5YzazF9akAUhy
	34/l4R2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXpX-00000009yh7-2Drj;
	Wed, 25 Jun 2025 21:38:55 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUW4z-00000009mFb-1LBv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:46:47 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso2487611fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750880802; x=1751485602; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sBwkllZntHrOMdBT66DRk9AkwiWaHhdpaDiIk/ypMhM=;
        b=cTwhQtiGX8XmunzwQ5hfuGsjXTYKqq8Weo+2EfWWH8lJjHzLX1csSf150aV8vsczIP
         EXT9YiXHPOIfCfmjtvsvXeMUWRQW6mxr6CojcHYS8zuYax1IQ57jW/gFc8bsCAnNLKpu
         w3n7bvoUtmKSbhzsKTdlRg7OHRvqHOw74JwDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750880802; x=1751485602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBwkllZntHrOMdBT66DRk9AkwiWaHhdpaDiIk/ypMhM=;
        b=F9SU0xK3gXAD2Gs4AhDxW7StmFIwiLcTe5R2yglSD59OSbu3mXl9tQoNWiNEq4gmDk
         09HIql+cHyas88WZjqTFClZY0hcIBE1n52CYO390Jzwbq3P9++ZN2nKCke7zIP7DY3UJ
         PpZ5fI0ehBkxmhcKif0gUbELGajrg9nXKJkz7euP+2nMluqqYnkXVjBoC0mUw86mBX8J
         za2Wtt0h4wYX+Juxln27FX8Z/KS13/hHEk6X5KI/du9VmQfsnqotnb0SYMbY+QvTMJXy
         NZNPZJOdwqOux+sotp1LxEkiGyMOhWAO1KP5NbZPsZmI9QFfcuJBV2KXdwetOvGXhbpa
         Y4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVheno5lR7KaxsknhQlQp+PRzD+HIZaJ3usMe5GTa4t07do9nfXkqJzlIhi5Mf3BvCue+Tx5UvXTn1kY5vU9j3@lists.infradead.org
X-Gm-Message-State: AOJu0YwvRe95zzc6EpSAF4syxFJ2ZuXY5J2FaXbWM5Ryg5W+UPCencyq
	CEkpnXtMZeD1koerEI5iGqs589ba7WG5y+HoutrgRfVTCemdYI/RFvm6DC1qClib4u8adD8idxP
	eoAS2K/H+w6U2pw/UbYsLmi9zC5CZVtoVXR5Tt8co
X-Gm-Gg: ASbGnctF8nUy+88C+51Pd+DeP02fM4NnpUCieUonTW62LwXOe/ytqGKZ99Ts6FcCvTT
	YdGuGRhoEP8HfiOKzdNjem60ykcRmZ2q1AoK4ySrENZlAYvs7+ayyranUOdMxRSDj0E8GTedSKk
	ASrgJtqiZmlDsTsHqLTXMgB3sJQbCudDggRu/GQs2WURSKRceGBAb3BpI=
X-Google-Smtp-Source: AGHT+IEX/Wv8zky1sPyq3PYfiTdoTrNF0L+2QZwfiLjlF/x42QYkSdH1t/Zh97HknFzHkWgFfAFlMlexs8DY4OBLvzw=
X-Received: by 2002:a05:651c:e10:b0:32a:7979:47c3 with SMTP id
 38308e7fff4ca-32cc645ef38mr7365331fa.11.1750880802455; Wed, 25 Jun 2025
 12:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250530224035.41886-3-james.quinlan@broadcom.com> <20250624220101.GA1532842@bhelgaas>
In-Reply-To: <20250624220101.GA1532842@bhelgaas>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 25 Jun 2025 15:46:28 -0400
X-Gm-Features: Ac12FXw88vFzk7hZ-yAaLhXL6W7paLjDU_tLqtbd5x9C7ir15h0P7lj-R1RryMI
Message-ID: <CA+-6iNw8ZuJbWu3E-BYYr-xwVoHwH2jf_sQ7NrubWHR9xEr+Sg@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: brcmstb: Use "num-lanes" DT property if present
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000004e147d06386ab42b"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_124645_415638_AC277962 
X-CRM114-Status: GOOD (  22.67  )
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

--0000000000004e147d06386ab42b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 6:01=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, May 30, 2025 at 06:40:33PM -0400, Jim Quinlan wrote:
> > By default, we use automatic HW negotiation to ascertain the number of
> > lanes of the PCIe connection.  If the "num-lanes" DT property is presen=
t,
> > assume that the chip's built-in capability information is incorrect or
> > undesired, and use the specified value instead.
> >
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
> >  drivers/pci/controller/pcie-brcmstb.c | 26 +++++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/contro=
ller/pcie-brcmstb.c
> > index e19628e13898..79fc6d00b7bc 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > @@ -46,6 +46,7 @@
> >  #define  PCIE_RC_CFG_PRIV1_ID_VAL3_CLASS_CODE_MASK   0xffffff
> >
> >  #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY                    0x04dc
> > +#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK       0=
x1f0
> >  #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK 0xc00
> >
> >  #define PCIE_RC_CFG_PRIV1_ROOT_CAP                   0x4f8
>    #define  PCIE_RC_CFG_PRIV1_ROOT_CAP_L1SS_MODE_MASK      0xf8
>
> If you squint, PCIE_RC_CFG_PRIV1_LINK_CAPABILITY looks a little like
> these standard PCIe things:
>
>   #define PCI_EXP_LNKCAP          0x0c    /* Link Capabilities */
>   #define  PCI_EXP_LNKCAP_MLW     0x000003f0 /* Maximum Link Width */
>   #define  PCI_EXP_LNKCAP_ASPMS   0x00000c00 /* ASPM Support */
>
>   #define PCI_EXP_DEVCTL2         0x28    /* Device Control 2 */
>
> So I was hoping we had an opportunity to use PCI_EXP_LNKCAP_MLW and
> PCI_EXP_LNKCAP_ASPMS instead of
> PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK and
> PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK.
>
> But I guess PCIE_RC_CFG_PRIV1_LINK_CAPABILITY is probably not actually
> PCI_EXP_LNKCAP, because PCI_EXP_LNKCAP being 0x0c into a PCIe
> Capability would mean the cap started at 0x04d0, and
> PCIE_RC_CFG_PRIV1_ROOT_CAP would be at offset 0x28
> (0x04d0 + 0x28 =3D=3D 0x04f8).
>
> But offset 0x28 in a PCIe Capability would be PCI_EXP_DEVCTL2, not
> PCIE_RC_CFG_PRIV1_ROOT_CAP, and I can't squint hard enough to see
> anything related to L1SS anywhere in the PCIe Capability.
>
> So never mind ;)
Hi Bjorn,

Not only are the "priv" register offsets slightly different, the
values of the masks may be different as well.  For example,
PCI_EXP_LNKCAP_MLW  is 0x3f0 while our "priv" version is 0x1f0, as
something unrelated occupies the missing "priv" bit.

Cheers,
Jim Quinlan
Broadcom STB/CM


>
> Bjorn

--0000000000004e147d06386ab42b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQYQYJKoZIhvcNAQcCoIIQUjCCEE4CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3FMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBU0wggQ1oAMCAQICDEjuN1Vuw+TT9V/ygzANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMjE3MTNaFw0yNTA5MTAxMjE3MTNaMIGO
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFDASBgNVBAMTC0ppbSBRdWlubGFuMSkwJwYJKoZIhvcNAQkB
FhpqYW1lcy5xdWlubGFuQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAKtQZbH0dDsCEixB9shqHxmN7R0Tywh2HUGagri/LzbKgXsvGH/LjKUjwFOQwFe4EIVds/0S
hNqJNn6Z/DzcMdIAfbMJ7juijAJCzZSg8m164K+7ipfhk7SFmnv71spEVlo7tr41/DT2HvUCo93M
7Hu+D3IWHBqIg9YYs3tZzxhxXKtJW6SH7jKRz1Y94pEYplGQLM+uuPCZaARbh+i0auVCQNnxgfQ/
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
MA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCgNF0e++Frypsja2iK1W2fwRnj1wCj
M9JROjSNXRa6ITAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTA2
MjUxOTQ2NDJaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0B
AQEFAASCAQB6TABY503aqyFPLpKASVV90KFna1+pw7FoY+aF2mrW76rHjnRh+dL5E1eJyUSvYfh6
Yy+j0kbaIj/0ijFEI5g7V2uCOzL5BgiyU4Ex93fET3Yc4E78l0bLRVhSACkladwyBbkmBcOto2xv
K/glrvlX7gDo1m/92DmvLM7f69yju6NllWC16uncXiPyu734vGGHhsoIgi6T9ZEHrfuIwv9zASNy
358gomVjho5cL5YY5vZ40JKM9jr9p7pJsVF9T81ZD34FVzl1AnoJ4JK7T8K3FyYi9nAx+WrG69K8
bKt2lEtVFUi1LnadGlN3Zy0gj1LCWCnwx9ilcpodkTyFkzwy
--0000000000004e147d06386ab42b--

