Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45AFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OD+X45tEcJlBdC/J0SYz6rElauTzJ8yxsrx3XyxIFb0=; b=Wm5zSPDM5yZWqHmE84U6sf41Lr
	1KXcLUz7/DgWBCOyH6hT3x2MXOscBGaJFktrdGYHTHlH1MBpooNfTfvip+mDQ/yX6fPA0qQZExwhd
	xT1KQrRBfIj8HkYLdtjqYlgdGp2djpdq11IDMAH4+2SUBqjqAu9CVW7ET+I9ZQwgTAaZrWI/Q3s//
	bKFrlusJrkwAg7LlFHMpeEpY2lcfoMfvOeqGdPJJ+JYngjZJDQj9iR5dweA0hKwlrKANz5ROQd2Gh
	ojBqpxpxydNYWzUWjsVgq563DZlL+E5HuXRkRNBMflGKhnZgjSKKxAxxj+BMRtXVEsVOWVXwyeJZ8
	YtGO5cSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwo4-0000000HAB1-1GsO;
	Wed, 18 Dec 2024 16:21:52 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwmw-0000000HA0k-2YSo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 16:20:45 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-540201cfedbso6640006e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734538840; x=1735143640; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OD+X45tEcJlBdC/J0SYz6rElauTzJ8yxsrx3XyxIFb0=;
        b=ANnbuDqByLFMlU6Y5+/zU3vrfVcNOwzYTNbeVbZ2eNLwPYa3LLCR5J5XWT9eEcE41/
         cN+yArymzdCmmDf6BLZRtLawX+NNAwh71i8HpWYyyT9ODkbHzQYxdXL/dEQwPhf67BHQ
         WTtFNcysmaWRNpQi8esF2QNUI2kImluOzctlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734538840; x=1735143640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OD+X45tEcJlBdC/J0SYz6rElauTzJ8yxsrx3XyxIFb0=;
        b=H2ki7wbVXvehDhAoYQwchgtxUxFSOIXPcUa0xJKYwa2vUdN1LNfG94cwK9wyCe1OA3
         FJ1rX7DtyQ0u9MTEYWelOze43pUZLoX7bhQg9vB1t9rMBex+upuf5xzOcqaWLvWxKvMP
         XdPQk+CGJ1fgTaW4Gbvx0K2ZZ7Q+r3C3934PujkatpwdxX3QN6DBDe/Voe3aXqxY6HCL
         YRzeJH+zpBPU5056V1Ef/FHcr0yHMekBS/+FZ/oqOUzo/u1h5459wwM8ui2Jw6+6rRxP
         f/rsRuUPzQSQakqUeTorCm34O2v/3qbZuql7b45d1ZkNJWKmThG3MjTlSkFLNJSMX8f1
         +qvQ==
X-Forwarded-Encrypted: i=1; AJvYcCULZbfD/y/csfuY4EwKO97KJIhCLJ2GBn/TmdNDZn46Mjy8poqq218XdiqaKTZBG1lO0e3gaL0+z70R6Wnn1UIz@lists.infradead.org
X-Gm-Message-State: AOJu0YzSaP5acZoXj0GLGnbHrBsU1mvIpSaDHZj60azTd3Rg6iWWfgLA
	l6kksUzopYqujeXOLsftvqVeeJsur0W/RaAlL71s7tAAbjFeedHhkabkg1ukZW2hQxbJ2Fj35f4
	9VFbesG+hihaCRIr9tX9qvGSeI0RFjTCj5363
X-Gm-Gg: ASbGnctmTqWrC2vgeXKrEmXseN9C9mg0vknFQ6Y5PSrWMPbBraYkxIseVGImklRC7Nj
	MwW0wiS3tKb6kW6NdzkA7X6hstsMH+w2YomEZJgQ=
X-Google-Smtp-Source: AGHT+IHPR12/buKMZ0hHVlYG+m7Psb/jp38L07d6lQgBRaffV8bsiA/VtiLkBrTXSIr1xkOGNxKVNTd4vBeI9TVWsiw=
X-Received: by 2002:a05:6512:3996:b0:540:5253:966e with SMTP id
 2adb3069b0e04-541ed901567mr1278594e87.44.1734538839568; Wed, 18 Dec 2024
 08:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20241025124515.14066-1-svarbanov@suse.de> <20241025124515.14066-7-svarbanov@suse.de>
 <f0a734d9-6bf6-4d28-b30b-99b6be9f62dc@broadcom.com> <ab136131-a306-4344-adaf-904e3b32326e@suse.de>
In-Reply-To: <ab136131-a306-4344-adaf-904e3b32326e@suse.de>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 18 Dec 2024 11:20:26 -0500
Message-ID: <CA+-6iNytvANeUb3ugW0q3B18MTNwnJps_yggonKRjXh_sTWHmA@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] PCI: brcmstb: Enable external MSI-X if available
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006839e006298dcba0"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_082042_731454_9812B709 
X-CRM114-Status: GOOD (  25.62  )
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

--0000000000006839e006298dcba0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 9:54=E2=80=AFAM Stanimir Varbanov <svarbanov@suse.d=
e> wrote:
>
> Hi Jim,
>
> Thanks for comments!
>
> On 12/11/24 10:01 PM, James Quinlan wrote:
> > On 10/25/24 08:45, Stanimir Varbanov wrote:
> >> On RPi5 there is an external MIP MSI-X interrupt controller
> >> which can handle up to 64 interrupts.
> >>
> >> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> >> ---
> >> v3 -> v4:
> >>   - no changes.
> >>
> >>   drivers/pci/controller/pcie-brcmstb.c | 63 +++++++++++++++++++++++++=
--
> >>   1 file changed, 59 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/
> >> controller/pcie-brcmstb.c
> >> index c01462b07eea..af01a7915c94 100644
> >> --- a/drivers/pci/controller/pcie-brcmstb.c
> >> +++ b/drivers/pci/controller/pcie-brcmstb.c
> >> @@ -1318,6 +1318,52 @@ static int brcm_pcie_start_link(struct
> >> brcm_pcie *pcie)
> >>       return 0;
> >>   }
> >>   +static int brcm_pcie_enable_external_msix(struct brcm_pcie *pcie,
> >> +                      struct device_node *msi_np)
> >> +{
> >> +    struct inbound_win inbound_wins[PCIE_BRCM_MAX_INBOUND_WINS];
> >> +    u64 msi_pci_addr, msi_phys_addr;
> >> +    struct resource r;
> >> +    int mip_bar, ret;
> >> +    u32 val, reg;
> >> +
> >> +    ret =3D of_property_read_reg(msi_np, 1, &msi_pci_addr, NULL);
> >> +    if (ret)
> >> +        return ret;
> >> +
> >> +    ret =3D of_address_to_resource(msi_np, 0, &r);
> >> +    if (ret)
> >> +        return ret;
> >> +
> >> +    msi_phys_addr =3D r.start;
> >> +
> >> +    /* Find free inbound window for MIP access */
> >> +    mip_bar =3D brcm_pcie_get_inbound_wins(pcie, inbound_wins);
> >> +    if (mip_bar < 0)
> >> +        return mip_bar;
> >> +
> >> +    mip_bar +=3D 1;
> >> +    reg =3D brcm_bar_reg_offset(mip_bar);
> >> +
> >> +    val =3D lower_32_bits(msi_pci_addr);
> >> +    val |=3D brcm_pcie_encode_ibar_size(SZ_4K);
> >> +    writel(val, pcie->base + reg);
> >> +
> >> +    val =3D upper_32_bits(msi_pci_addr);
> >> +    writel(val, pcie->base + reg + 4);
> >> +
> >> +    reg =3D brcm_ubus_reg_offset(mip_bar);
> >> +
> >> +    val =3D lower_32_bits(msi_phys_addr);
> >> +    val |=3D PCIE_MISC_UBUS_BAR1_CONFIG_REMAP_ACCESS_EN_MASK;
> >> +    writel(val, pcie->base + reg);
> >> +
> >> +    val =3D upper_32_bits(msi_phys_addr);
> >> +    writel(val, pcie->base + reg + 4);
> >
> > Hi Stan,
> >
> > It looks like all this is doing is setting up an identity-mapped inboun=
d
> > window, is that correct?  If so, couldn't you get the same effect by
> > adding an identity-mapped dma-range in the PCIe DT node?
>
> Yes, that approach could work, I verified it.
>
> Do you want me to drop this patch from the series and make the relevant
> changes in PCIe dma-ranges properties?
>
Hi Stan,

Yes please, that was what I was hoping for -- the less code the
better, assuming everything still works :-)

Thanks & regards,
Jim Quinlan
Broadcom STB/CM

> ~Stan
>
>
>

--0000000000006839e006298dcba0
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
MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBFED7/qjrkPTzucAY7hjTJNrRD+6+F
nyPLFdKyQbzBOjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNDEy
MTgxNjIwNDBaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzALBglghkgBZQME
AgEwDQYJKoZIhvcNAQEBBQAEggEAcL5nW3j7McrTrwLnVFCNqj0JPbjzTEBlo3oMFk6EEL4o41MC
yURD/0xnl6G0cDb4NTCX1/uIaCSD+zWOVzPm+NABhkYepgDA82CSDd2ip08w7wuM6paOA97mep0g
CSHXGLttSdoqGmSKnJsurJ+VfXaGmSKynTkBTq2sp3kUMapwObjrToj2OtMT12PIIT6jWy764Yv1
SdPC3c0woFRcDI1nnRe3SW2FzdIK7W5USaf08uICc30KNRIuXzZYol8ZWSrOV+rlsAef7K1O/Xzc
kpkdmliwxmMFK+V5GyswfGP5zHtm/KOzZEC/NpUVfAjJZWMT7DCm1+H9ru4dZi76MA==
--0000000000006839e006298dcba0--

