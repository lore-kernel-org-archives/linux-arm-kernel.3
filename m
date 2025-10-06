Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A81CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mH/MC1pzhxx8vZYlOptz8tbIP9fL5hh6dB1cSmfVr7E=; b=G5lKYRw5FFDmVawVWgbcQkdjRi
	2Htgky8ZAvL+o6N++rC0oQMHAaz1GKuXlpv1uaFthXUkqOdgwlMiPJXzM81TBn4kLGIZGGWACd3Tn
	Ov+yFJnPISz73M00Ck5mpaA7JfCF1uEmmgYcpl27LtwfQUN4e/6MvuyWS02pDO5pSYxHkDgbEqvU/
	EJM0+ffmALYipGIoDial9S1mvPHU1pnFyaKRDIoJEsr8K42X0l3qxWH3zZooYONq7ECoKEugGrYkM
	t2d0DG+Iz8BKJICLrJK5M8VfGNbib8uEAbVMDuUHxs3sN6Q3DFu57mlQDccFGN8r8pd1wF8G0xvIZ
	P6uFQkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEE-00000000xuc-3Mw2;
	Mon, 06 Oct 2025 23:02:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEC-00000000xrx-0ws5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:02:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-637e74e9104so5673853a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791766; x=1760396566; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mH/MC1pzhxx8vZYlOptz8tbIP9fL5hh6dB1cSmfVr7E=;
        b=aQelTGo1+raSa3gZySarqYyPMk1Nx4XcEqbtq9wdRF0nBnmErwCJYSb2GLTyi0yZTY
         73Mk5YrtAdCOtBvnpLUnLc6vxe5IzNs8uvfl0K9oiUDtbWtK1YmOiCPfEN7ZC4gTjKbK
         ORcFLt4OJIfcTnRBeeFGO24k7xC00u8K0BC2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791766; x=1760396566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH/MC1pzhxx8vZYlOptz8tbIP9fL5hh6dB1cSmfVr7E=;
        b=T8KIyomR/K1gGnxvDKo/39Y9hMfbTcOlXki9gucELkKWePpwyUP+PBbjBHfoH4QhfF
         KLX/4A9Vnu7gDUO1w/V/1aWqovDQLW1279Bky87i50Or3AWkgncB7LIb/HDWrUXifqWf
         GzFVvedGHwKxXAVeTNSjr6LHrgL8GriVwuYFSrgblwGpPfT8JW46viQg0jLqUCPnkqqR
         lkIlTiKkC7D4ZS38Rcrd9xT9M1rQ66SHTIn/C081LDlL1y21opJ+8SUi56W3OcduGK+S
         YnvMZZ6g/1KcNw4B72arRcKZogyV1ydvufNQV6Uqr5ZrjkrtfAXcAWnQ5Jd7lQsX7SuM
         kb1g==
X-Gm-Message-State: AOJu0YzuJ+anPl9RKVecQ9nEV6ieL+8MgztN5CVLOR355DPdWf1lG3kL
	/i3AhOn5bGUDBBZXncSszh8wO21LEFdxo/cMN56SLluf2lezpJ1l9s1pfveltdl1AdnE4B0oOmo
	xtp9mQJO7zvr8gSOtDoU3dlpxKnxRWlzCUhK05Y44
X-Gm-Gg: ASbGncumTfoop4RQ2BKYT2vrFoZk+y7GRwfVW/Z2Lvqar93vMa+HElv220KeHaE3MEN
	gY7KLe3Rpg9/9FLUb/KTO+mRFJ7Z9vMainlSwHMMI9b0hpdhMICb2EYGcv4k6koDKgMvVISDS32
	RHCnJ4VD7ZHszKlRLvWh6EAKTvhe8wSBU5YKAQQZmHAsQ7D32RVC6y9GRb3J0B+m8lKUO0byaPD
	a+shEjb/LnxZSfLXohtPqH9CFKuD0/8
X-Google-Smtp-Source: AGHT+IG9b5sf6TP4aq93x598FsC5zWPM2H6szWgkH/POv77Qg71Luo9rBf4URFhYAsGgiDICi3PLSs2LdTOktZnVHwE=
X-Received: by 2002:a05:6402:51c6:b0:637:e3a2:7678 with SMTP id
 4fb4d7f45d1cf-639348db491mr15446272a12.9.1759791766314; Mon, 06 Oct 2025
 16:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250922224835.1918759-1-sjg@chromium.org> <20250922224835.1918759-4-sjg@chromium.org>
 <2d737cec-8cfa-4a72-9028-4601c3e51185@pengutronix.de>
In-Reply-To: <2d737cec-8cfa-4a72-9028-4601c3e51185@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 6 Oct 2025 17:02:34 -0600
X-Gm-Features: AS18NWAJHrlgSbZsucRXEt_5TZCGk2ZtPNiXa9XkHUg202E3D0tlCLJ12e5C43Y
Message-ID: <CAFLszTgDs3Ofh3sc89PArS_-AY4MbDonmper3XDAHJmLLZ6YKw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] scripts/make_fit: Provide a way to add built modules
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, Nicolas Schier <nicolas@fjasle.eu>, 
	Tom Rini <trini@konsulko.com>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_160248_306331_F9EEF70E 
X-CRM114-Status: GOOD (  37.70  )
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

On Thu, 25 Sept 2025 at 01:43, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Simon,
>
> Thanks for looking into this!
>
> On 9/23/25 12:48 AM, Simon Glass wrote:
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
> > +    # Use provided tmpdir or custom install path
> > +    if args.path:
> > +        mod_path = args.path
> > +    else:
> > +        mod_path = os.path.join(tmpdir, 'modules_install')
> > +        os.makedirs(mod_path, exist_ok=True)
> > +
> > +    if args.verbose:
> > +        print(f'Installing modules to {mod_path}')
> > +
> > +    cmd = ['make', '-s', '-j']
>
> Executing `make image.fit FIT_MODULES=1` in a fresh build will result in
> a python stack trace, because image.fit only has dependencies for the
> kernel image and the device trees, but none for the modules.
>
> Even with that added, I don't think it's a good idea to have make call a
> script only for it to call make again.

Yes I don't like that either.

>
> Instead, there should probably be a modules.cpio.gz make target or
> similar in its own right and image.fit should depend on it if
> FIT_MODULES is set.

That seems better. I'll give it a try.

>
> Thanks,
> Ahmad
>
> > +
> > +    # It seems that the only way to prevent a 'jobserver unavailable' warning
> > +    # is to remove it from the makeflags
> > +    env = os.environ.copy()
> > +    makeflags = env.get('MAKEFLAGS', '')
> > +    env['MAKEFLAGS'] = ' '.join(f for f in makeflags.split()
> > +                                if not f.startswith('--jobserver-auth'))
> > +
> > +    if args.build_dir:
> > +        cmd.append(f'O={args.build_dir}')
> > +    cmd.extend(['INSTALL_MOD_PATH=' + mod_path, 'modules_install'])
> > +    subprocess.check_call(cmd, cwd=os.getcwd(), stdout=suppress, env=env)
> > +
> > +    # Find the modules directory that was created (e.g. due to dirty tree)
> > +    base_dir = os.path.join(mod_path, 'lib', 'modules')
> > +    if not os.path.exists(base_dir):
> > +        raise ValueError(f'Modules base directory {base_dir} not found')
> > +    dirs = [d for d in os.listdir(base_dir)
> > +            if os.path.isdir(os.path.join(base_dir, d))]
> > +    if not dirs:
> > +        raise ValueError(f'No module directories found in {base_dir}')
> > +    if len(dirs) > 1:
> > +        raise ValueError(f'Must have only one module directory in {base_dir}')
> > +
> > +    # Create initramfs-style directory structure (usr/lib/modules instead of
> > +    # lib/modules) and move modules into it
> > +    outdir = os.path.join(tmpdir, 'initramfs')
> > +    new_dir = os.path.join(outdir, 'usr', 'lib', 'modules')
> > +    os.makedirs(new_dir, exist_ok=True)
> > +    shutil.move(os.path.join(base_dir, dirs[0]), os.path.join(new_dir, dirs[0]))
> > +
> > +    if args.verbose:
> > +        print(f'Creating cpio archive from {outdir}')
> > +
> > +    with tempfile.NamedTemporaryFile() as cpio_file:
> > +        # Change to initramfs directory and create cpio archive
> > +        with subprocess.Popen(['find', '.', '-print0'], cwd=outdir,
> > +                              stdout=subprocess.PIPE) as find:
> > +            with subprocess.Popen(['cpio', '-o', '-0', '-H', 'newc'],
> > +                                  stdin=find.stdout, stdout=cpio_file,
> > +                                  stderr=suppress, cwd=outdir) as cpio:
> > +                find.stdout.close()
> > +                cpio.wait()
> > +                find.wait()
> > +
> > +                if cpio.returncode != 0:
> > +                    raise RuntimeError('Failed to create cpio archive')
> > +
> > +        cpio_file.seek(0)  # Reset to beginning for reading
> > +        return compress_data(cpio_file, args.compress), cpio_file.tell()
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
> > +    elif args.modules_ramdisk:
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

Regards,
Simon

