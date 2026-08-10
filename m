Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04916C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZiFErJumO4f6l/jB3Vv8dc/wBPU8PfaQ8eqWXYPx/g=; b=UTHYGLmV6iiFeh3mJFEZ++Rm/b
	RmrPoHKZf8CLbV/2YzRKeeIm5Hv9VHb3VkWXFLtcrqEsYXnGeQKw3M0CjSEW+VqcCCeyHDwpZLROO
	HtJ3qW4RNCC7kPcPfunYGNvIqkVMgYnPaBQLHCfeXEwR+Z0jy6ythzS78SM3qcdOKFnjV/xwkfabM
	JkxoBryOoABDo1Yl1Fo2f53Z1PytvNZVbpT4WWb5lZlWJVAxvMG8QnNjGUq5o8uz0HZ77kwzfWMTj
	LtEQMM2B24g7RW3cHxuPw00S2bYspgWpo+f1fMBqV7F7d3q+koMkI56+itsAy5LmsIP7qxbYUS+3B
	+S8uVX+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNNJ-0000000BWmH-231U;
	Mon, 10 Aug 2026 10:36:57 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNNG-0000000BWki-1BTE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:36:56 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-480033bdcf4so921535f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 03:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786358212; cv=none;
        d=google.com; s=arc-20260327;
        b=mTIHIfrgJXjxZDdymfZOFshXAujqqvGdS/5gmj0lyvPLNRQnUvQaiHJR5AA9cg3xh2
         2MCO+VgGyseUswBjNVTPOdAK64Qu2yuk35xVkz4ZSIwTReLzERwMFojH/PLyb4Yf5SdH
         8Vz70X3+K1EWGOV2xAsqA5AqEksbVARbKKBI8tHwAR87zATJayl5dfMcpQEPOb2kssa2
         2Bbofgqz7xnClSgFfdmv6HXUgIiq02Axubb4MF0f0LYV00JiU2YXtc9oOhpHJWLTobrV
         Dg7WNXwx6zSWGITFiZ9BPprcIu5Dcq9C/oLzr5VbBgx3DRHaXYCsPWH88PxmQJNKYexy
         14ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JZiFErJumO4f6l/jB3Vv8dc/wBPU8PfaQ8eqWXYPx/g=;
        fh=eYWVnBJLmUXu2p0b+WPhzjCf5NkFnWuUdTAHeCrtW5Q=;
        b=JV6fGIvrb6DqY6olz7CiNRkXAgtr52VdpR4QpAfa+ytYNNFKty8egAlXfm7dt7hGUZ
         maBUlmRYO/GNyAYVtiqEaEZDC2R/6lwHa4lkcvYu/yvsRCuZQL9Vm+qmALaJ/3FSmzL2
         Zm+GrEAEhItx1OWmcDYkepqM96stSssqTKaMy7Su9aZwiQfCz6/5mZUPkYGKEXEm9PG9
         jv0XV/pXaxXSxKeENcojuiEOb7OytsvOAgIdhleEQ54TRk6qwXyDjGjHmc2/W7ktX9Gh
         s4d6F9BQ5J4E/AHHEENx+paAhIn5ZmYoZjqIu3+0P/1yRj3o4nq6DoMkIB/WgxHugrDh
         xRsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786358212; x=1786963012; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JZiFErJumO4f6l/jB3Vv8dc/wBPU8PfaQ8eqWXYPx/g=;
        b=WVKT6RgBZTjkQfjLWTfLyM4LgEFufJZWEci5ou/dt9EwqdIMsET76xCdA9zrMIodpL
         sJdfSQaqa5vHbTjszdl4fwFMQQZ/rGjFhyY7608vTONeztVBdEOnyvqSDgLnQJk1jeyJ
         pln7cIiExLcbIuB4O0Aeorbn28TzZJvo/X8ounu1rjzzdlfBW9hj4oXIqQszqRl5iDUs
         odH+p1m6yComMAbw1qPu/cnPX7DhMeLWteNDWKMPH6Z5v00Nn+VCXlK1qC03ZYioKRrO
         qCD0hkX9E7MmwxFYab2o7/ybyjes3wbU5FiqlxDbJJx8FrLwzEVS8wGT6QBC0B/NViqN
         sm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358212; x=1786963012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZiFErJumO4f6l/jB3Vv8dc/wBPU8PfaQ8eqWXYPx/g=;
        b=ZW4Ki54bXIM+GPrfsCapkD7//Uwj+ZAs3NFtv+TKk1+R4SNvPPD07wx9J1IiJlzUcB
         KrA2cRzNZBzZDdycoqtne9GM9VcO1kHPFYlrroImgMtvMLxZlUI91z0N1WdsNBYT9k04
         xJTjgtqkaNTTRlh0LZuLM2U5gyeZlP4YHzCeBn+C8vL6Dzi1HJxSL01H9gdvJ98qm+g4
         2OVLYdjKSp/vf0NkXlIsD0vNaXCfx6iCerg/EKIYTfhiSgfmSo1l/HCVJ6EjiN/z6Vtb
         DtlBmIgx728qeg6YJ+y03uHoWDR2gee44OYUuJB3mCRb0oScd8e2zbiYDGNe8kAA1L/z
         g0EQ==
X-Forwarded-Encrypted: i=1; AHgh+RqveH/In70mzsfqr+ScSa3GqJFtoRGs0FCsGTNmIaYSfCLahsckSbZKSUqkunCdKDVfwHLgb6VNlvI2R2g75Q8U@lists.infradead.org
X-Gm-Message-State: AOJu0YwU3ZZFGLe2RqvuPdUnkE5+/IXEeOUGKSilubClsHcjDXcHubGa
	zR/Fj+t/KLRTq2AOGjvVkyfGQScvW15jmXHQ90l9KEPNrxHvqHmIM+RVITg3LZs9mJVzV8tbsM0
	GlKynbHPl/2u5tjK151etW0o9sZPzlJqXzqvsFJJjLg==
X-Gm-Gg: AR+sD11MHC6n54ENCh6VHUvq/ll2zQ7Q/XbxvH7LNcBDFoJMkxNFFzcMkimdQUX95De
	dZO4mCorPnr5Tkt2lp5rKX2uT4W/G6v9mYS1bZzr3FEjbWQ7YwBWWwfiQeETMArjUWYDEmDbym+
	0ULKul5YzGaZFBsFxhSGdcCijXER0H80aQIIzglWEpIlbB/dL11j4ZZuimi8AXakROQQn1/wVm9
	8LP5Hdal++WB6yjao78X5JA/GjPEBvP7ZDGWD62hPJ+ob/ca1F1Eyn5uEZ/Bdo3j4jadWcnuEP2
	8W+j6gFEBADlQ1JUbOYdXdZrXaIvuP7VzoQZu5vmpcUmG9ukn6CslXPQSiRi1JnQtoIDOBScNar
	ZeGVPM5z30qJmlZNFoAL3AV9oxan+WA==
X-Received: by 2002:adf:e012:0:20b0:47f:959f:f69c with SMTP id
 ffacd0b85a97d-481455ce280mr1198921f8f.7.1786358211845; Mon, 10 Aug 2026
 03:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
 <178609182923.193353.7287772568467157519.b4-review@b4>
In-Reply-To: <178609182923.193353.7287772568467157519.b4-review@b4>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Mon, 10 Aug 2026 12:36:39 +0200
X-Gm-Features: AUfX_mzXwFrJ-NjND3MQzEP6QwRNrCstHPVctQ1cLuVCmYnxx742CiD2MW3y8Ss
Message-ID: <CAFi2wKZdJ3LxJVDqC2K79T0JhoOOWSj=ZmL9pB+Lka_aXDXatQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device driver
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	=?UTF-8?Q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_033654_444419_2AAE1EE8 
X-CRM114-Status: GOOD (  22.54  )
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

> > +
> > +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev,
> > +                                          struct aspeed_pci_bmc_dev *p=
ci_bmc_dev)
> > +{
> > +     resource_size_t bar =3D pci_resource_start(pdev, 1);
> > +     struct plat_serial8250_port *port;
> > +     u16 vuart_ioport;
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ASPEED_BMC_VUART; i++) {
> > +             port =3D &pci_bmc_dev->uart[i];
> > +
> > +             /* ASPEED BMC device shift addresses by 2 to the left */
> > +             vuart_ioport =3D vuart_port_addr[i] << 2;
> > +
> > +             port->mapbase =3D bar + vuart_ioport;
> > +             port->uartclk =3D 115200 * 16;
> > +             port->irq =3D pci_irq_vector(pdev, vuart_msi_index[i]);
> > +             port->iotype =3D UPIO_MEM32;
> > +             port->type =3D PORT_16550A;
> > +             port->flags |=3D (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXE=
D_TYPE);
> > +             port->regshift =3D 2;
> > +     }
> > +
> > +     pci_bmc_dev->cell =3D (struct mfd_cell) {
> > +             .name           =3D "serial8250",
> > +             .platform_data  =3D pci_bmc_dev->uart,
> > +             .pdata_size     =3D sizeof(pci_bmc_dev->uart),
> > +     };
>
> In the commit message you're describing that the MFD driver will be used =
for
> setting up MSI interrupts:
> > It doesn't bind the whole PCIe resource to allow each sub-driver to bin=
d the
> > needed addresses.
>
> But you're adding the UART devices here which now means that the core dri=
ver is
> doing more than MSI interrupt init.

I might have misunderstood but this is creating the UART device by
using the 'serial8250' driver.

> the core driver is doing more than MSI interrupt init.

Yes, as the core driver should add the devices with the right drivers.
I will add this in the commit message.

> Suggestion from my side would be to have an array of `mfd_cell` where you=
 define
> which devices are part of the MFD,

There is already such an array, it is a one element array as only the
VUART is done.
'struct mfd_cell cell; ' will become an real array when KCS will be
added afterwards.

This is not an 2 cell array for the 2 VUART as the 'serial8250'
manages the two VUART on its own.
From what I have researched, this was the way to add UART devices from
an MFD driver.

> and your VUART lives in another driver.
> See `ls2k-bmc-core` for example.

The UART already lives in another driver: the 'serial8250' driver.

Regards,
Gr=C3=A9goire

