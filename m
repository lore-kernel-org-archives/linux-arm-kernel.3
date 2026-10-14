Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85383CC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 08:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i48MIGwzBxi2do2WYXSYPbruC3HoFCZMxRU1UUDDuYs=; b=Edn+Jx7tcw4l6YZKzXvpunazn6
	2f7Ty1MoPo2X95piGHUghYTZuixYswtkco0EaMh36YBZqmPLe5bKU2ROMXL0v+BaPsFITyg2c4Q+a
	od/5wfVClMKv6Xh3bN1K6CfEecIGuy0C6s2QjcLp719rJnZ3g3ZvhNTvVDZKiQyazW7AUJjjIwqa+
	JjRhiNWI2IxjvJgH4/wNetDE83R/VL1Uc+o5+0EoxGh/ZUyTzbEwsP05MZqPoOW+5sZc76mAilpKX
	Q398WKMwGpOqTXFme8zn6Z4fUlIBgFXrlCnBVob3Vao1s9W0FA+ZMy6Puym0HAk1QXnTSpc7JzTrv
	qRv6GDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuiz-0000000EwoO-1rfN;
	Wed, 14 Oct 2026 08:52:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuix-0000000Ewnj-2CHM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 08:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i48MIGwzBxi2do2WYXSYPbruC3HoFCZMxRU1UUDDuYs=; b=dz4W6ZpZjV5nJXOm8NtoKrkD+x
	0HMU5BkF2XpTceNO08lOIWPUPKgoQyB5gLJUyaAjGCLlsFFXDOcmWdVJB4m76wDXbcRXE3jtyiYyM
	gJhhaLDDNSAbgvqz6AOBRfnXFfYHzhUMMqp/SZX99IuhejkkKFan59iHsO+AfC+goBjtuWBQAMxn2
	boWJg52TI8iGlhq62h0fs2AWiF9kP0TmEqons1y5Du4qJvsfRxLeHMASdSqRSl7fRm2CY8lHO/CYD
	owlBnn1XKz2+EWfCG5phqYvNvDIqWIMvSy4vCBuI4OyPjoOgxSFhsDuMTZms8bxH3Sp9cPHvvPzdP
	yCU6LNTg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGuiu-0000000GWno-0ig9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 08:52:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F19A4E4120B;
	Wed, 14 Oct 2026 08:52:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A2A560368;
	Wed, 14 Oct 2026 08:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAE79103286A7;
	Wed, 14 Oct 2026 10:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791967940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i48MIGwzBxi2do2WYXSYPbruC3HoFCZMxRU1UUDDuYs=;
	b=I39l4qPTZiayixscQ25oSYYL3NpbdUqY5vfY8WjlnawudFpyJfGrP7Qd2xXs+oY+HTA5L9
	HYG+p+V4eBlDcIkQ33/sT8qNfxC8TxPzOExPZE/a5dM+N52o+LuWWB8KjPTdbW+x9UMPeB
	Qhecxah11hmwDPZRaT9PiF59W4bRSzao28f6nvWfzVCtSEvWNU49ziJdfT9UvzUTpIujSw
	iU/fUi0oEKauswQ54YxEGuXjuFAKJNNr7aF6yW+3HO1ThHWX9cevyrzYYK6akFYkZC0gOW
	PhIc3r6BCCYQxX/ItYeHQdHgIF9KDMPtMIGn2ZmhijQyiPsPDfQXidzI/a9xkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <srini@kernel.org>,  <nicolas.ferre@microchip.com>,
  <alexandre.belloni@bootlin.com>,  <claudiu.beznea@tuxon.dev>,
  <linux@armlinux.org.uk>,  <richardcochran@gmail.com>,
  <linusw@kernel.org>,  <arnd@arndb.de>,  <aaro.koskinen@iki.fi>,
  <gregkh@linuxfoundation.org>,  <mathieu.dubois-briand@bootlin.com>,
  <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  <netdev@vger.kernel.org>
Subject: Re: [PATCH v8 5/8] nvmem: layouts: add Microchip/SST SFDP EUI
 layout driver
In-Reply-To: <89aa4ac1eee01e3c425c12367f1e036354787ce8.1790847519.git.manikandan.m@microchip.com>
	(Manikandan Muralidharan's message of "Wed, 14 Oct 2026 12:10:09
	+0530")
References: <cover.1790847519.git.manikandan.m@microchip.com>
	<89aa4ac1eee01e3c425c12367f1e036354787ce8.1790847519.git.manikandan.m@microchip.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 10:52:14 +0200
Message-ID: <87fqy8zmtd.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_095232_331024_1A441A4F 
X-CRM114-Status: GOOD (  20.41  )
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

Hi,

On 14/10/2026 at 12:10:09 +0530, Manikandan Muralidharan <manikandan.m@micr=
ochip.com> wrote:

> Add an NVMEM layout that exposes the factory-programmed EUI-48 identifier
> from the Microchip/SST vendor SFDP parameter table (e.g. SST26VF064BEUI)
> as a "mac-address" cell, for use as a network MAC address. The vendor
> table is located at runtime via the SFDP NVMEM device (no offset in DT),
> and a read_post_process callback reverses the LSB-first bytes into
> canonical MAC order. Binds to an "nvmem-layout" node with compatible
> "microchip,sst26vf-sfdp-eui".
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Mostly minor nits, see below.

> --- a/drivers/nvmem/layouts/Makefile
> +++ b/drivers/nvmem/layouts/Makefile
> @@ -6,4 +6,5 @@
>  obj-$(CONFIG_NVMEM_LAYOUTS) +=3D fixed-layout.o
>  obj-$(CONFIG_NVMEM_LAYOUT_SL28_VPD) +=3D sl28vpd.o
>  obj-$(CONFIG_NVMEM_LAYOUT_ONIE_TLV) +=3D onie-tlv.o
> +obj-$(CONFIG_NVMEM_LAYOUT_SST26VF_SFDP_EUI) +=3D sst26vf-sfdp-eui.o
>  obj-$(CONFIG_NVMEM_LAYOUT_U_BOOT_ENV) +=3D u-boot-env.o

Not sure this is ordered alphabetically, so in general add it at the end.

> +/* SFDP header and parameter header, as laid out on the flash. */
> +struct sfdp_header {
> +	u8 signature[4];
> +	u8 minor;
> +	u8 major;
> +	u8 nph;
> +	u8 unused;
> +};
> +
> +struct sfdp_parameter_header {
> +	u8 id_lsb;
> +	u8 minor;
> +	u8 major;
> +	u8 length;
> +	u8 parameter_table_pointer[3];
> +	u8 id_msb;
> +};
> +
> +#define SFDP_SIGNATURE			0x50444653U
> +
> +#define SFDP_PARAM_HEADER_ID(h)		(((h)->id_msb << 8) | (h)->id_lsb)
> +#define SFDP_PARAM_HEADER_PTP(h)	get_unaligned_le24((h)->parameter_table=
_pointer)
> +
> +/* Microchip (vendor) parameter table identifier: id_msb << 8 | id_lsb. =
*/

This is not relevant, we saw it just above         ^^^^^^^^^^^^^^^^^^^^^^^

> +#define SFDP_MCHP_VENDOR_ID		0x01bf
> +
> +#define SFDP_MCHP_EUI48_MARKER_OFFSET	0x60
> +#define SFDP_MCHP_EUI48_MARKER		0x30
> +#define SFDP_MCHP_EUI48_OFFSET		0x61
> +
> +static int sfdp_eui_read_post_process(void *priv, const char *id, int in=
dex,
> +				      unsigned int offset, void *buf,
> +				      size_t bytes)
> +{
> +	u8 *data =3D buf;
> +	int i;
> +
I believe the if against the length is wrong and should be inverted and
placed here:

        if (bytes !=3D ETH_ALEN)
                return -EINVAL;

Since lenght does not change, prefer to bail out early.

> +	/* SFDP stores the address least-significant octet first; reverse it. */
> +	for (i =3D 0; i < bytes / 2; i++)
> +		swap(data[i], data[bytes - 1 - i]);
> +
> +	if (bytes =3D=3D ETH_ALEN && !is_valid_ether_addr(buf))

Is bytes !=3D ETH_ALEN a valid use case?

> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int sfdp_eui_find_vendor_table(struct nvmem_device *nvmem, u32 *p=
tp)
> +{
> +	struct sfdp_parameter_header ph;
> +	struct sfdp_header hdr;
> +	int nph, i, ret;
> +
> +	ret =3D nvmem_device_read(nvmem, 0, sizeof(hdr), &hdr);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (get_unaligned_le32(hdr.signature) !=3D SFDP_SIGNATURE)
> +		return -EINVAL;
> +
> +	/* The number of parameter headers (NPH) field is zero-based. */
> +	nph =3D hdr.nph;

nph =3D hdr.nph + 1 ?

> +
> +	for (i =3D 0; i <=3D nph; i++) {

and here the usual i < nph?

> +		ret =3D nvmem_device_read(nvmem, sizeof(hdr) + i * sizeof(ph),
> +					sizeof(ph), &ph);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (SFDP_PARAM_HEADER_ID(&ph) !=3D SFDP_MCHP_VENDOR_ID)
> +			continue;
> +
> +		*ptp =3D SFDP_PARAM_HEADER_PTP(&ph);
> +		return 0;
> +	}
> +
> +	return -ENOENT;
> +}

...

> +	info.name =3D "mac-address";
> +	info.offset =3D base + SFDP_MCHP_EUI48_OFFSET;
> +	info.bytes =3D ETH_ALEN;
> +	info.np =3D of_get_child_by_name(layout_np, "mac-address");
> +	info.read_post_process =3D sfdp_eui_read_post_process;
> +
> +	ret =3D nvmem_add_one_cell(nvmem, &info);
> +	if (ret)
> +		of_node_put(info.np);
> +	else
> +		dev_dbg(dev, "exposed EUI-48 at SFDP offset 0x%x\n", info.offset);

This one is not really useful anymore.

> +
> +	of_node_put(layout_np);
> +
> +	return ret;
> +}
> +

Thanks,
Miqu=C3=A8l

