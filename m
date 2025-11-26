Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F348CD1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfWLfDsS81XOeuUIdJSJmQRGBZVt18fuPL8YQoVguAI=; b=vNEfYhfmKPhkTmb3/0IZTUonvY
	7rcYKItMJqvh4eyzfQk7TKKC6OR1SnhGzZnjvskm6/5b8c2hy9r5V7091jXvORNYEeZzQugJUxdp0
	aabh03kMlEfSa3xheHB7E09+laGPD/le5UJV8ZQdLCVFEEdax9bE7da1K3/7tJ00m2BLMuisfZGlb
	GEvVax0GXvgOg4kZAkndckw5kUkBQob5ZW7G/fx6TVpNYdGniK7W0afFXWOrxDIlQdy+FGx5+ujxy
	qUlgydcT6NZ/U8GJvVDyEw7eeW5yqW/xJ7Yso7KA8VXuNeRBaOsG+tWiiNZwJQj+tFNw3Gy+/lK2G
	A3lUhzSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODCj-0000000Eqg2-480m;
	Wed, 26 Nov 2025 10:56:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODCh-0000000Eqfh-43Nf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:56:57 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vODCg-0005W9-Dg; Wed, 26 Nov 2025 11:56:54 +0100
Message-ID: <7fdf869d-d2c8-4694-8f06-db1a32e817da@pengutronix.de>
Date: Wed, 26 Nov 2025 11:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] scripts/make_fit: Support an initial ramdisk
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>,
 =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
 Chen-Yu Tsai <wenst@chromium.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-3-sjg@chromium.org>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20251119181333.991099-3-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_025656_036440_8A3494EC 
X-CRM114-Status: GOOD (  26.68  )
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



On 11/19/25 7:13 PM, Simon Glass wrote:
> FIT (Flat Image Tree) allows a ramdisk to be included in each
> configuration. Add support for this to the script.
> 
> This feature is not available via 'make image.fit' since the ramdisk
> likely needs to be built separately anyway, e.g. using modules from
> the kernel build. A later patch in this series provides support for
> doing that.
> 
> Note that the uncompressed size is not correct when a ramdisk is used,
> since it is too expensive to decompress the ramdisk.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

With load address removed:

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> +    with fsw.add_node('ramdisk'):> +
fsw.property_string('description', 'Ramdisk')
> +        fsw.property_string('type', 'ramdisk')
> +        fsw.property_string('arch', args.arch)
> +        fsw.property_string('os', args.os)
> +        fsw.property('data', data)

The spec reads as if a compression = "none" is mandatory for ramdisks:

If the data is compressed but it should not be uncompressed by the
loader (e.g. compressed ramdisk <pair: ramdisk; compressed), this should
also be set to “none”.

Thoughts?

> +        fsw.property_u32('load', 0)

0 is a valid SDRAM address on many SoCs. I think this should be dropped.

> +
> +
> +def finish_fit(fsw, entries, has_ramdisk=False):
>      """Finish the FIT ready for use
>  
>      Writes the /configurations node and subnodes
> @@ -143,6 +168,7 @@ def finish_fit(fsw, entries):
>          entries (list of tuple): List of configurations:
>              str: Description of model
>              str: Compatible stringlist
> +        has_ramdisk (bool): True if a ramdisk is included in the FIT
>      """
>      fsw.end_node()
>      seq = 0
> @@ -154,6 +180,8 @@ def finish_fit(fsw, entries):
>                  fsw.property_string('description', model)
>                  fsw.property('fdt', bytes(''.join(f'fdt-{x}\x00' for x in files), "ascii"))
>                  fsw.property_string('kernel', 'kernel')
> +                if has_ramdisk:
> +                    fsw.property_string('ramdisk', 'ramdisk')
>      fsw.end_node()
>  
>  
> @@ -274,6 +302,14 @@ def build_fit(args):
>      size += os.path.getsize(args.kernel)
>      write_kernel(fsw, comp_data, args)
>  
> +    # Handle the ramdisk if provided. Compression is not supported as it is
> +    # already compressed.
> +    if args.ramdisk:
> +        with open(args.ramdisk, 'rb') as inf:
> +            data = inf.read()
> +        size += len(data)
> +        write_ramdisk(fsw, data, args)
> +
>      for fname in args.dtbs:
>          # Ignore non-DTB (*.dtb) files
>          if os.path.splitext(fname)[1] != '.dtb':
> @@ -296,12 +332,12 @@ def build_fit(args):
>  
>          entries.append([model, compat, files_seq])
>  
> -    finish_fit(fsw, entries)
> +    finish_fit(fsw, entries, bool(args.ramdisk))
>  
>      # Include the kernel itself in the returned file count
>      fdt = fsw.as_fdt()
>      fdt.pack()
> -    return fdt.as_bytearray(), seq + 1, size
> +    return fdt.as_bytearray(), seq + 1 + bool(args.ramdisk), size
>  
>  
>  def run_make_fit():

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


