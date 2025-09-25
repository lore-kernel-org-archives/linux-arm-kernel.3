Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B579CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8W+NyuwxgKwaKsVZSDxyZ0f6RLCujo0SRdWVYp7oN0=; b=uVsum4AEFCvbGpvspWlMrK+NXZ
	QuqSgTgL+N4pKLKsjJ5gPb3USBfzl9nNpoe4o4RnYyurGe41rI/0jUAUTfj8l1eC8DBqsPzi71N/3
	wtpTkh2OxRc85tZGESEr09FKUOSPf32HL3HNqUPwhuGARwgS5bSxHvgraqWksY9l4Wz6lAajCibDL
	M+tyNPvwh9jtQb60QlnmWeB7MPvBQAfesTNoGctnT4WR/WReyhZsjocf41Y/HvtUONLjhjCAC2Fb4
	EUKwAIxbQueaXsGN9dUlK6w5P8u40d4w41PjH52DkX2bnzF9ELYlJ8RZlk8h+u8OacGKmLjbAK20a
	LhW6q/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gde-00000006ovF-1ozq;
	Thu, 25 Sep 2025 07:43:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gdb-00000006osv-38jU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 07:43:37 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1v1gdY-000457-7b; Thu, 25 Sep 2025 09:43:32 +0200
Message-ID: <2d737cec-8cfa-4a72-9028-4601c3e51185@pengutronix.de>
Date: Thu, 25 Sep 2025 09:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] scripts/make_fit: Provide a way to add built
 modules
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>,
 =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-kernel@vger.kernel.org, "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <20250922224835.1918759-1-sjg@chromium.org>
 <20250922224835.1918759-4-sjg@chromium.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20250922224835.1918759-4-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_004335_798368_BB8AE75B 
X-CRM114-Status: GOOD (  30.47  )
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

Hello Simon,

Thanks for looking into this!

On 9/23/25 12:48 AM, Simon Glass wrote:
> +def build_ramdisk(args, tmpdir):
> +    """Build a cpio ramdisk containing kernel modules
> +
> +    Similar to mkinitramfs, this creates a compressed cpio-archive containing
> +    the kernel modules for the current kernel version.
> +
> +    Args:
> +        args (Namespace): Program arguments
> +        tmpdir (str): Temporary directory to use for modules installation
> +
> +    Returns:
> +        tuple:
> +            bytes: Compressed cpio data containing modules
> +            int: total uncompressed size
> +    """
> +    suppress = None if args.verbose else subprocess.DEVNULL
> +    # Use provided tmpdir or custom install path
> +    if args.path:
> +        mod_path = args.path
> +    else:
> +        mod_path = os.path.join(tmpdir, 'modules_install')
> +        os.makedirs(mod_path, exist_ok=True)
> +
> +    if args.verbose:
> +        print(f'Installing modules to {mod_path}')
> +
> +    cmd = ['make', '-s', '-j']

Executing `make image.fit FIT_MODULES=1` in a fresh build will result in
a python stack trace, because image.fit only has dependencies for the
kernel image and the device trees, but none for the modules.

Even with that added, I don't think it's a good idea to have make call a
script only for it to call make again.

Instead, there should probably be a modules.cpio.gz make target or
similar in its own right and image.fit should depend on it if
FIT_MODULES is set.

Thanks,
Ahmad

> +
> +    # It seems that the only way to prevent a 'jobserver unavailable' warning
> +    # is to remove it from the makeflags
> +    env = os.environ.copy()
> +    makeflags = env.get('MAKEFLAGS', '')
> +    env['MAKEFLAGS'] = ' '.join(f for f in makeflags.split()
> +                                if not f.startswith('--jobserver-auth'))
> +
> +    if args.build_dir:
> +        cmd.append(f'O={args.build_dir}')
> +    cmd.extend(['INSTALL_MOD_PATH=' + mod_path, 'modules_install'])
> +    subprocess.check_call(cmd, cwd=os.getcwd(), stdout=suppress, env=env)
> +
> +    # Find the modules directory that was created (e.g. due to dirty tree)
> +    base_dir = os.path.join(mod_path, 'lib', 'modules')
> +    if not os.path.exists(base_dir):
> +        raise ValueError(f'Modules base directory {base_dir} not found')
> +    dirs = [d for d in os.listdir(base_dir)
> +            if os.path.isdir(os.path.join(base_dir, d))]
> +    if not dirs:
> +        raise ValueError(f'No module directories found in {base_dir}')
> +    if len(dirs) > 1:
> +        raise ValueError(f'Must have only one module directory in {base_dir}')
> +
> +    # Create initramfs-style directory structure (usr/lib/modules instead of
> +    # lib/modules) and move modules into it
> +    outdir = os.path.join(tmpdir, 'initramfs')
> +    new_dir = os.path.join(outdir, 'usr', 'lib', 'modules')
> +    os.makedirs(new_dir, exist_ok=True)
> +    shutil.move(os.path.join(base_dir, dirs[0]), os.path.join(new_dir, dirs[0]))
> +
> +    if args.verbose:
> +        print(f'Creating cpio archive from {outdir}')
> +
> +    with tempfile.NamedTemporaryFile() as cpio_file:
> +        # Change to initramfs directory and create cpio archive
> +        with subprocess.Popen(['find', '.', '-print0'], cwd=outdir,
> +                              stdout=subprocess.PIPE) as find:
> +            with subprocess.Popen(['cpio', '-o', '-0', '-H', 'newc'],
> +                                  stdin=find.stdout, stdout=cpio_file,
> +                                  stderr=suppress, cwd=outdir) as cpio:
> +                find.stdout.close()
> +                cpio.wait()
> +                find.wait()
> +
> +                if cpio.returncode != 0:
> +                    raise RuntimeError('Failed to create cpio archive')
> +
> +        cpio_file.seek(0)  # Reset to beginning for reading
> +        return compress_data(cpio_file, args.compress), cpio_file.tell()
> +
> +
>  def process_dtb(fname, args):
>      """Process an input DTB, decomposing it if requested and is possible
>  
> @@ -318,11 +414,12 @@ def _process_dtbs(args, fsw, entries, fdts):
>      return seq, size
>  
>  
> -def build_fit(args):
> +def build_fit(args, tmpdir):
>      """Build the FIT from the provided files and arguments
>  
>      Args:
>          args (Namespace): Program arguments
> +        tmpdir (str): Temporary directory for any temporary files
>  
>      Returns:
>          tuple:
> @@ -344,20 +441,29 @@ def build_fit(args):
>  
>      # Handle the ramdisk if provided. Compression is not supported as it is
>      # already compressed.
> +    ramdisk_data = None
>      if args.ramdisk:
>          with open(args.ramdisk, 'rb') as inf:
> -            data = inf.read()
> -        size += len(data)
> -        write_ramdisk(fsw, data, args)
> +            ramdisk_data = inf.read()
> +        size += len(ramdisk_data)
> +    elif args.modules_ramdisk:
> +        if args.verbose:
> +            print('Building modules ramdisk...')
> +        ramdisk_data, uncomp_size = build_ramdisk(args, tmpdir)
> +        size += uncomp_size
> +
> +    if ramdisk_data:
> +        write_ramdisk(fsw, ramdisk_data, args)
>  
>      count, fdt_size = _process_dtbs(args, fsw, entries, fdts)
>      size += fdt_size
>  
> -    finish_fit(fsw, entries, bool(args.ramdisk))
> +    finish_fit(fsw, entries, has_ramdisk=bool(ramdisk_data))
>  
> -    # Include the kernel itself in the returned file count
>      fdt = fsw.as_fdt()
>      fdt.pack()
> +
> +    # Count FDT files, kernel, plus ramdisk if present
>      return fdt.as_bytearray(), count + 1 + bool(args.ramdisk), size
>  
>  
> @@ -365,7 +471,12 @@ def run_make_fit():
>      """Run the tool's main logic"""
>      args = parse_args()
>  
> -    out_data, count, size = build_fit(args)
> +    tmpdir = tempfile.mkdtemp(prefix='make_fit_')
> +    try:
> +        out_data, count, size = build_fit(args, tmpdir)
> +    finally:
> +        shutil.rmtree(tmpdir)
> +
>      with open(args.output, 'wb') as outf:
>          outf.write(out_data)
>  

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


