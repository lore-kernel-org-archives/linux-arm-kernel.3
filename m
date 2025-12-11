Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B7AD41C33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWCPbxCD3yosEVNwuoAHT25gThg5MOEVsON+z6wI+Jc=; b=Yf2SAL7Qjmg5R4Y06K7V9MiGv5
	fqTT2DE+fe5R4Dxy941V4VEzLSKPIzYMp0FRPPJ811HXuMy+P4QlmBmfu4kFOVO53PrIx1Qa+7xwQ
	HCzKbm14CyceSPDgRO+SyY+RQrDVFuSlWC/fUY9CWK5K9n4VFpP0XGgqOoKSmbFxWT2HoME53hXPB
	YV/lpr3wfpAixhNOmR3vgV74Btsj7s8TiDu2uo2ki8cRXtDFkc1+JLaj1OrD7CjiD12ZDG9RjfhEq
	hXOq7YC+MO3jzHPdmKfHSfCGkaskwK9zXAdCx5pPArnO36JDUF7Hr6Ir5NpOE2MqxzED3VV8brWAD
	/m2nNw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgan-0000000GdJh-07Zw;
	Thu, 11 Dec 2025 13:20:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgaj-0000000GdJJ-41VA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:20:23 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b73545723ebso14377766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 05:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765459219; x=1766064019; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HWCPbxCD3yosEVNwuoAHT25gThg5MOEVsON+z6wI+Jc=;
        b=Q4uELQI0Fex+yM24PsYEP7x7hbe6w5Z6SGARO39ZV6U/BXiZyXZfTcSZL9SWKYF68B
         +rxCWbOICRfur/nVrKfJRwGaybevq23k2C1mQuwVlmRroJ4qT0kao9HVgEHLmw0qjohE
         z20G4Z2FzFdYb2pZJlWpbQzz+olCOahH4GVPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459219; x=1766064019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWCPbxCD3yosEVNwuoAHT25gThg5MOEVsON+z6wI+Jc=;
        b=E8LMPulJw3j6QWRT3BiIZyRVoPa1Y7GrwOK4bXRCxgk7fcrn1QvBxhONX2Z1cMVkLw
         IMYkCP8ddqRiZ5nkFCEThUJ/TU/ApACFK2f2shDjEz8RYhvsTFSczRAwQEeXcmQRbkOW
         2FFur7F8YfcQY46G326ru6BlMlEWAJ6erLLCVDGTojXdxOyAnpK0D/lG92FEWCA5iW0z
         iLKqGcHePJi0KxcdLpit46FLt18VmBLohRB6SDMlIGk4eK2MGYPJDpkLMYTwFFdjrLAR
         T9zwSv+hM+LavHDdFbfcQBbm/eu4Ti3edAxMYnXWA1XCsw5KMi6D0OdPXEphyliMkOSY
         g+9w==
X-Gm-Message-State: AOJu0YxOvWbrO40rUA8l0b7QxxcDSb41nJvChEk+4Z+PKFy5zZ7foC72
	K1sXoD+AHzyqif+uy1aIhlzWxwRcFZHSU+4y4xFqdX7n2jNAK4K7SqJCEUleOa3A0MNgM+Eh+kB
	rP3u1dWs+lggFBhueFQJVH1BdgHy+JWccYU+pJV0w
X-Gm-Gg: AY/fxX7ohSmmeL034HFywkcZzfGQyYkNwYzYA5nJsted0laYDRvfcNMqcjzql+cx1eI
	5U1da7kGSEjjsJWt6sCcqKawmlHOcrCDLu2wHUoTWz4o6P78dZUS787xinfynCN0QuX17G2C4G2
	Uk9mJxit/ZedyLdnWSav+Qw7ZJBxyzbSBvRRBZekYHDeedjjDaw6tMb0Xt2u7v+/ekowzg9y3BO
	+Z7+TkKWALs4wWcbxIExWhleoflV42eZHX1Ema6+FfcZIe6MApdxBny8r/WG0573DWvTA==
X-Google-Smtp-Source: AGHT+IEk/AbVScdyFfQKpRnrBz4VwZJZUL1zdFkq3AIjj5PEiZ2Nkj7Md27LcGXBasj6MhV5H/tk9Cm63QQ7rc9c6Pk=
X-Received: by 2002:a17:907:7250:b0:b79:e58e:e9b7 with SMTP id
 a640c23a62f3a-b7ce848de51mr612797866b.35.1765459219490; Thu, 11 Dec 2025
 05:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20251119181333.991099-1-sjg@chromium.org> <20251119181333.991099-5-sjg@chromium.org>
 <f0211065-bca2-4a5b-9b97-66397deac20a@pengutronix.de>
In-Reply-To: <f0211065-bca2-4a5b-9b97-66397deac20a@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 11 Dec 2025 06:20:07 -0700
X-Gm-Features: AQt7F2rwDpSoWIprHmc_3bNxzueVWDlrkOhe69EXIDAEW19irs90YWsqHEgtmxE
Message-ID: <CAFLszTiiXU5X+7H6zE6sNrCtS5ocCHnEjoYe6cOr2WcdjBz4fw@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] scripts/make_fit: Provide a way to add built modules
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_052022_102192_70F74DB1 
X-CRM114-Status: GOOD (  53.91  )
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

Hi Ahmad,

On Wed, 26 Nov 2025 at 04:09, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Simon,
>
> On 11/19/25 7:13 PM, Simon Glass wrote:
> > Provide arguments to support building a ramdisk from a directory tree of
> > modules. This is a convenient way to try out a kernel with its modules.
> >
> > This makes use usr/gen_initramfs.sh where it can be found. Failing that
> > it uses the cpio tool rather than attempting to use a python module or
> > our own code. The list of modules is provided in a file.
>
> I don't think the fallback is a good idea. This script is part of the
> kernel tree and usr/gen_initramfs.sh is as well, so we shouldn't
> duplicate the logic. With a dependency on gen_init_cpio (See my
> modules-cpio-pkg patch), we should always have the script and the
> executable available and it's fine to throw an error if it's not.

For now I would like to leave it in, since it works. I mentioned the
trouble I had trying to depend on a target which depends on an install
target. But once your patch goes in I can try again with the targets
and see if I can make it work.

>
> Thanks for putting in the work!

Cheers! It has certainly been an effort :-)

Regards,
Simon

>
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > ---
> > Note: The approach of depending on modules_install caused build problems
> > as mentioned in the cover letter.
> >
> > I dropped the review tag from Nicolas Schier since there are quite a few
> > changes in this version.
> >
> > Changes in v6:
> > - Using the modules.order file instead of 'find'
> > - Use gen_initramfs.sh where available
> >
> > Changes in v4:
> > - Provide the list of modules from the Makefile
> > - Reduce verbosity (don't print every module filename)
> >
> > Changes in v3:
> > - Add a way to add built modules into the FIT
> >
> >  scripts/make_fit.py | 127 +++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 119 insertions(+), 8 deletions(-)
> >
> > diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> > index 1a74a9dcd85e..9dfef11fc4b3 100755
> > --- a/scripts/make_fit.py
> > +++ b/scripts/make_fit.py
> > @@ -13,11 +13,17 @@ Usage:
> >          -r /boot/initrd.img-6.14.0-27-generic @arch/arm64/boot/dts/dtbs-list
> >          -E -c gzip
> >
> > +    # Build with modules ramdisk instead of external ramdisk:
> > +    make_fit.py -A arm64 -n 'Linux-6.17' -O linux
> > +        -o arch/arm64/boot/image.fit -k /tmp/kern/arch/arm64/boot/image.itk
> > +        -m module1.ko module2.ko module3.ko @arch/arm64/boot/dts/dtbs-list
> > +
> >  Creates a FIT containing the supplied kernel, an optional ramdisk, and a set of
> >  devicetree files, either specified individually or listed in a file (with an
> >  '@' prefix).
> >
> >  Use -r to specify an existing ramdisk/initrd file.
> > +Use -m to build a ramdisk from specified kernel module files.
> >
> >  Use -E to generate an external FIT (where the data is placed after the
> >  FIT data structure). This allows parsing of the data without loading
> > @@ -38,6 +44,7 @@ as U-Boot, Linuxboot, Tianocore, etc.
> >  import argparse
> >  import collections
> >  import os
> > +import shutil
> >  import subprocess
> >  import sys
> >  import tempfile
> > @@ -83,8 +90,14 @@ def parse_args():
> >            help='Specifies the operating system')
> >      parser.add_argument('-k', '--kernel', type=str, required=True,
> >            help='Specifies the (uncompressed) kernel input file (.itk)')
> > -    parser.add_argument('-r', '--ramdisk', type=str,
> > +
> > +    # Create mutually exclusive group for ramdisk options
> > +    rd_group = parser.add_mutually_exclusive_group()
> > +    rd_group.add_argument('-r', '--ramdisk', type=str,
> >            help='Specifies the ramdisk/initrd input file')
> > +    rd_group.add_argument('-m', '--modules', type=str, nargs='+',
> > +          help='List of module filenames to include in ramdisk')
> > +
> >      parser.add_argument('-v', '--verbose', action='store_true',
> >                          help='Enable verbose output')
> >      parser.add_argument('dtbs', type=str, nargs='*',
> > @@ -240,6 +253,89 @@ def output_dtb(fsw, seq, fname, arch, compress):
> >          fsw.property('data', compressed)
> >
> >
> > +def find_gen_initramfs():
> > +    """Find the gen_initramfs.sh script
> > +
> > +    Looks for usr/gen_initramfs.sh relative to the current directory,
> > +    or in the source directory if running from a build directory.
> > +
> > +    Returns:
> > +        str: Path to gen_initramfs.sh if found, None otherwise
> > +    """
> > +    path = 'usr/gen_initramfs.sh'
> > +    if not os.path.exists(path):
> > +        srctree = os.environ.get('srctree')
> > +        if not srctree:
> > +            return None
> > +        path = os.path.join(srctree, path)
> > +        if not os.path.exists(path):
> > +            return None
> > +
> > +    return path
> > +
> > +
> > +def build_ramdisk(args, tmpdir):
> > +    """Build a cpio ramdisk containing kernel modules
> > +
> > +    Similar to mkinitramfs, this creates a compressed cpio-archive containing
> > +    the kernel modules for the current kernel version.
> > +
> > +    Args:
> > +        args (Namespace): Program arguments
> > +        tmpdir (str): Temporary directory to use for modules installation
> > +
> > +    Returns:
> > +        tuple:
> > +            bytes: Compressed cpio data containing modules
> > +            int: total uncompressed size
> > +    """
> > +    suppress = None if args.verbose else subprocess.DEVNULL
> > +
> > +    if args.verbose:
> > +        print(f'Copying {len(args.modules)} modules to ramdisk')
> > +
> > +    # Create output-directory structure
> > +    outdir = os.path.join(tmpdir, 'initramfs')
> > +    modules_dir = os.path.join(outdir, 'usr', 'lib', 'modules')
> > +    os.makedirs(modules_dir, exist_ok=True)
> > +
> > +    # Copy in the specified modules, renaming .o to .ko
> > +    for module in args.modules:
> > +        name, ext = os.path.splitext(module)
> > +        dest = name + '.ko' if ext == '.o' else module
> > +
> > +        # Preserve directory structure under modules_dir
> > +        dest_path = os.path.join(modules_dir, dest)
> > +        os.makedirs(os.path.dirname(dest_path), exist_ok=True)
> > +        shutil.copy2(module, dest_path)
> > +
> > +    if args.verbose:
> > +        print(f'Creating cpio archive from {outdir}')
> > +
> > +    with tempfile.NamedTemporaryFile() as cpio_file:
> > +        # Use gen_initramfs.sh to create the cpio archive if possible
> > +        gen_initramfs = find_gen_initramfs()
> > +        if gen_initramfs:
> > +            subprocess.run([gen_initramfs, '-o', cpio_file.name, outdir],
> > +                           check=True, stdout=suppress, stderr=suppress)
> > +        else:
> > +            # Change to initramfs directory and create cpio archive
> > +            with subprocess.Popen(['find', '.', '-print0'], cwd=outdir,
> > +                                  stdout=subprocess.PIPE) as find:
> > +                with subprocess.Popen(['cpio', '-o', '-0', '-H', 'newc'],
> > +                                      stdin=find.stdout, stdout=cpio_file,
> > +                                      stderr=suppress, cwd=outdir) as cpio:
> > +                    find.stdout.close()
> > +                    cpio.wait()
> > +                    find.wait()
> > +
> > +        cpio_file.seek(0)  # Reset to beginning for reading
> > +        if args.verbose:
> > +            print('Reading ramdisk...' if args.compress == 'none' else
> > +                  f'Compressing ramdisk with {args.compress}...')
> > +        return compress_data(cpio_file, args.compress), cpio_file.tell()
>
> I don't think the fallback is a good idea as it duplicates logic we have
> elsewhere. Just t
>
> > +
> > +
> >  def process_dtb(fname, args):
> >      """Process an input DTB, decomposing it if requested and is possible
> >
> > @@ -318,11 +414,12 @@ def _process_dtbs(args, fsw, entries, fdts):
> >      return seq, size
> >
> >
> > -def build_fit(args):
> > +def build_fit(args, tmpdir):
> >      """Build the FIT from the provided files and arguments
> >
> >      Args:
> >          args (Namespace): Program arguments
> > +        tmpdir (str): Temporary directory for any temporary files
> >
> >      Returns:
> >          tuple:
> > @@ -344,20 +441,29 @@ def build_fit(args):
> >
> >      # Handle the ramdisk if provided. Compression is not supported as it is
> >      # already compressed.
> > +    ramdisk_data = None
> >      if args.ramdisk:
> >          with open(args.ramdisk, 'rb') as inf:
> > -            data = inf.read()
> > -        size += len(data)
> > -        write_ramdisk(fsw, data, args)
> > +            ramdisk_data = inf.read()
> > +        size += len(ramdisk_data)
> > +    elif args.modules:
> > +        if args.verbose:
> > +            print('Building modules ramdisk...')
> > +        ramdisk_data, uncomp_size = build_ramdisk(args, tmpdir)
> > +        size += uncomp_size
> > +
> > +    if ramdisk_data:
> > +        write_ramdisk(fsw, ramdisk_data, args)
> >
> >      count, fdt_size = _process_dtbs(args, fsw, entries, fdts)
> >      size += fdt_size
> >
> > -    finish_fit(fsw, entries, bool(args.ramdisk))
> > +    finish_fit(fsw, entries, has_ramdisk=bool(ramdisk_data))
> >
> > -    # Include the kernel itself in the returned file count
> >      fdt = fsw.as_fdt()
> >      fdt.pack()
> > +
> > +    # Count FDT files, kernel, plus ramdisk if present
> >      return fdt.as_bytearray(), count + 1 + bool(args.ramdisk), size
> >
> >
> > @@ -365,7 +471,12 @@ def run_make_fit():
> >      """Run the tool's main logic"""
> >      args = parse_args()
> >
> > -    out_data, count, size = build_fit(args)
> > +    tmpdir = tempfile.mkdtemp(prefix='make_fit_')
> > +    try:
> > +        out_data, count, size = build_fit(args, tmpdir)
> > +    finally:
> > +        shutil.rmtree(tmpdir)
> > +
> >      with open(args.output, 'wb') as outf:
> >          outf.write(out_data)
> >
>
> --
> Pengutronix e.K.                  |                             |
> Steuerwalder Str. 21              | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |
>

