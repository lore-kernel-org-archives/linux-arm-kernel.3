Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09473CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 22:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMiDIY52UoB4SEHrqIHAI8W0lIFp4W3Ju4asakLGWk4=; b=3bG8aaV4fnEVYFssRCNO5kP7O4
	ojLuZ+PbJUVabtJwQJVQVskxWbf1DMpckVLv86AkAIj28Iggt5EfgBVd2WIuQYYozNO1x4gVYsds7
	Lbt2DpZDmHrF/L/bgpusmXIbdP8cj4JqNaEXluy0boDqT/LSEjcMaVPOvMm/O4Wji0d6UPwYJKS6L
	xJyFLyLtkCPVj8blldGO1j5yyXV5nG7f9vAcP0trxENxaD7yxvd4DfwZalf5RD1DE5qCZl7yMRjQS
	bBtm5xrX0yKH3z8jkMNH9sVCpUXm0XB7zMYor6cST4j1kZMFx99+iH/dX0spvqa6+/rf1zLDECCVv
	OkHYRNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLO-0000000BfZc-11CE;
	Mon, 22 Sep 2025 22:49:16 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLE-0000000BfTA-32eI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 22:49:05 +0000
Received: by mail-ot1-x343.google.com with SMTP id 46e09a7af769-75871cd9228so4343611a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 15:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758581342; x=1759186142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMiDIY52UoB4SEHrqIHAI8W0lIFp4W3Ju4asakLGWk4=;
        b=DOim8d+JdhL6ybsx0rjuxy3lkgNIWcd8vUQ4qcIHZ5KZCmJHwt2qn8HxK/vXAGZ879
         og+FvaVZsWIzfdXLh2qXt+Gh9YAufIjib8B+a1N/H40+IGnFe9aohmDkZMYfoYFL5HJK
         335MfXpspB9faaW6lVApJBxuu7G69YLnY6p9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581342; x=1759186142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMiDIY52UoB4SEHrqIHAI8W0lIFp4W3Ju4asakLGWk4=;
        b=U34HQDzK59lVZWQHWnU81is19J5lAHNq1VVOaAIU2Yt/ep96m4/Q2F5+gelU+7tQuu
         aeNcP9gC/6PfhpBUKiY4TQquQLorXbm8YHU17aB1W4il7HS3HNGszNHWTQfAWURiHnK8
         iz6cPizE8/qQyiPeFVuCFi5hJzYgPpGnf2PHh1GKmBEzJ0xwBGJiRuHmE2hnx8o7Cd3v
         fb9m6UXRnhIjGniTbLmi4CtHeN8ZbxHh36JHUTuClKBZGy2+kL+7fZ2IcygiYujI38VX
         QicizaOZSWYs7yafKeHDKauPM3MMz5Pzkq4DTmGLSDKNeSKINJKNPMaLowG5akIDygyH
         z4pw==
X-Gm-Message-State: AOJu0Yw3Q+y2GFYkfiw3OqVhyw/pYHHo4LC2RTg2zQtjlPUcgeWtlxtj
	foeVlQ7cTvHSeG/6O+zn9THZdmKpvsISWeMzYO/yqj2C6maMr4ddeCyGBufXOEXyah9aLUZBc9n
	t/Olf86JL
X-Gm-Gg: ASbGnctHIvpbsAnW2/74Uv8Dw9c3JFAI5m+0NSRTXviPGW6pQqhuB8yO6uLG4tFLoiF
	97iLMVdJDM+cYLJOhEm5bTi0MN71umTyaVd6M6Y2aVaWKQNuBBTb1z3b/42Yj9vIxEarAUn7Ljs
	FkBMvN8r0U9mMbrXV9A6zFh3RMd+5zlbquWExdfph3tzfSiEQKOFxJzgsXcnNUt6PfiIlB0e1YM
	Gyd+iP2W3OKSTUAazbw8TUCR0XRhCoJYFRyURSja1TMX7MvT00RopcflIL3R+Q3bRNOGsoaQuwl
	ESwGiTm0BMbIceopyl66fq8+04sfOFn2viKi3S/6Ej7GJUsRFA6olDUq00VtagAnY+AABPlwSmY
	5kPHLaLVf4RepNSQ7wGw=
X-Google-Smtp-Source: AGHT+IELkYRIiEfD82xOSZSrywDsY6Xir8/x0TZEJvnVleHUVMeFwuyt2iM9byrl8oeZdRzuuOxJtw==
X-Received: by 2002:a05:6830:6086:b0:745:a2e5:6c9e with SMTP id 46e09a7af769-79154b2625dmr239987a34.18.1758581342572;
        Mon, 22 Sep 2025 15:49:02 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-78780383017sm1167244a34.37.2025.09.22.15.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 15:49:01 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] scripts/make_fit: Provide a way to add built modules
Date: Mon, 22 Sep 2025 16:48:31 -0600
Message-ID: <20250922224835.1918759-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922224835.1918759-1-sjg@chromium.org>
References: <20250922224835.1918759-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_154904_780593_CFBF38EB 
X-CRM114-Status: GOOD (  23.05  )
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

Provide arguments to support building a ramdisk from a directory tree of
modules. This is a convenient way to try out a kernel with its modules.

This makes use of the cpio tool rather than attempting to use a python
module or our own code. It also uses 'find' since os.walk() was found to
be quite cumbersome.

Signed-off-by: Simon Glass <sjg@chromium.org>
Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---

(no changes since v1)

 scripts/make_fit.py | 127 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 119 insertions(+), 8 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 1a74a9dcd85e..57667ac9ca3b 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -13,11 +13,17 @@ Usage:
         -r /boot/initrd.img-6.14.0-27-generic @arch/arm64/boot/dts/dtbs-list
         -E -c gzip
 
+    # Build with modules ramdisk instead of external ramdisk:
+    make_fit.py -A arm64 -n 'Linux-6.17' -O linux
+        -o arch/arm64/boot/image.fit -k /tmp/kern/arch/arm64/boot/image.itk
+        -m -B /path/to/build/dir @arch/arm64/boot/dts/dtbs-list
+
 Creates a FIT containing the supplied kernel, an optional ramdisk, and a set of
 devicetree files, either specified individually or listed in a file (with an
 '@' prefix).
 
 Use -r to specify an existing ramdisk/initrd file.
+Use -m to build a ramdisk from kernel modules (similar to mkinitramfs).
 
 Use -E to generate an external FIT (where the data is placed after the
 FIT data structure). This allows parsing of the data without loading
@@ -38,6 +44,7 @@ as U-Boot, Linuxboot, Tianocore, etc.
 import argparse
 import collections
 import os
+import shutil
 import subprocess
 import sys
 import tempfile
@@ -83,8 +90,18 @@ def parse_args():
           help='Specifies the operating system')
     parser.add_argument('-k', '--kernel', type=str, required=True,
           help='Specifies the (uncompressed) kernel input file (.itk)')
-    parser.add_argument('-r', '--ramdisk', type=str,
+
+    # Create mutually exclusive group for ramdisk options
+    rd_group = parser.add_mutually_exclusive_group()
+    rd_group.add_argument('-r', '--ramdisk', type=str,
           help='Specifies the ramdisk/initrd input file')
+    rd_group.add_argument('-m', '--modules-ramdisk', action='store_true',
+          help='Build ramdisk from kernel modules (like mkinitramfs)')
+
+    parser.add_argument('-p', '--path', type=str,
+          help='Path where modules are installed (default: temp directory)')
+    parser.add_argument('-B', '--build-dir', type=str,
+          help='Build directory for out-of-tree builds (O= parameter to make)')
     parser.add_argument('-v', '--verbose', action='store_true',
                         help='Enable verbose output')
     parser.add_argument('dtbs', type=str, nargs='*',
@@ -240,6 +257,85 @@ def output_dtb(fsw, seq, fname, arch, compress):
         fsw.property('data', compressed)
 
 
+def build_ramdisk(args, tmpdir):
+    """Build a cpio ramdisk containing kernel modules
+
+    Similar to mkinitramfs, this creates a compressed cpio-archive containing
+    the kernel modules for the current kernel version.
+
+    Args:
+        args (Namespace): Program arguments
+        tmpdir (str): Temporary directory to use for modules installation
+
+    Returns:
+        tuple:
+            bytes: Compressed cpio data containing modules
+            int: total uncompressed size
+    """
+    suppress = None if args.verbose else subprocess.DEVNULL
+    # Use provided tmpdir or custom install path
+    if args.path:
+        mod_path = args.path
+    else:
+        mod_path = os.path.join(tmpdir, 'modules_install')
+        os.makedirs(mod_path, exist_ok=True)
+
+    if args.verbose:
+        print(f'Installing modules to {mod_path}')
+
+    cmd = ['make', '-s', '-j']
+
+    # It seems that the only way to prevent a 'jobserver unavailable' warning
+    # is to remove it from the makeflags
+    env = os.environ.copy()
+    makeflags = env.get('MAKEFLAGS', '')
+    env['MAKEFLAGS'] = ' '.join(f for f in makeflags.split()
+                                if not f.startswith('--jobserver-auth'))
+
+    if args.build_dir:
+        cmd.append(f'O={args.build_dir}')
+    cmd.extend(['INSTALL_MOD_PATH=' + mod_path, 'modules_install'])
+    subprocess.check_call(cmd, cwd=os.getcwd(), stdout=suppress, env=env)
+
+    # Find the modules directory that was created (e.g. due to dirty tree)
+    base_dir = os.path.join(mod_path, 'lib', 'modules')
+    if not os.path.exists(base_dir):
+        raise ValueError(f'Modules base directory {base_dir} not found')
+    dirs = [d for d in os.listdir(base_dir)
+            if os.path.isdir(os.path.join(base_dir, d))]
+    if not dirs:
+        raise ValueError(f'No module directories found in {base_dir}')
+    if len(dirs) > 1:
+        raise ValueError(f'Must have only one module directory in {base_dir}')
+
+    # Create initramfs-style directory structure (usr/lib/modules instead of
+    # lib/modules) and move modules into it
+    outdir = os.path.join(tmpdir, 'initramfs')
+    new_dir = os.path.join(outdir, 'usr', 'lib', 'modules')
+    os.makedirs(new_dir, exist_ok=True)
+    shutil.move(os.path.join(base_dir, dirs[0]), os.path.join(new_dir, dirs[0]))
+
+    if args.verbose:
+        print(f'Creating cpio archive from {outdir}')
+
+    with tempfile.NamedTemporaryFile() as cpio_file:
+        # Change to initramfs directory and create cpio archive
+        with subprocess.Popen(['find', '.', '-print0'], cwd=outdir,
+                              stdout=subprocess.PIPE) as find:
+            with subprocess.Popen(['cpio', '-o', '-0', '-H', 'newc'],
+                                  stdin=find.stdout, stdout=cpio_file,
+                                  stderr=suppress, cwd=outdir) as cpio:
+                find.stdout.close()
+                cpio.wait()
+                find.wait()
+
+                if cpio.returncode != 0:
+                    raise RuntimeError('Failed to create cpio archive')
+
+        cpio_file.seek(0)  # Reset to beginning for reading
+        return compress_data(cpio_file, args.compress), cpio_file.tell()
+
+
 def process_dtb(fname, args):
     """Process an input DTB, decomposing it if requested and is possible
 
@@ -318,11 +414,12 @@ def _process_dtbs(args, fsw, entries, fdts):
     return seq, size
 
 
-def build_fit(args):
+def build_fit(args, tmpdir):
     """Build the FIT from the provided files and arguments
 
     Args:
         args (Namespace): Program arguments
+        tmpdir (str): Temporary directory for any temporary files
 
     Returns:
         tuple:
@@ -344,20 +441,29 @@ def build_fit(args):
 
     # Handle the ramdisk if provided. Compression is not supported as it is
     # already compressed.
+    ramdisk_data = None
     if args.ramdisk:
         with open(args.ramdisk, 'rb') as inf:
-            data = inf.read()
-        size += len(data)
-        write_ramdisk(fsw, data, args)
+            ramdisk_data = inf.read()
+        size += len(ramdisk_data)
+    elif args.modules_ramdisk:
+        if args.verbose:
+            print('Building modules ramdisk...')
+        ramdisk_data, uncomp_size = build_ramdisk(args, tmpdir)
+        size += uncomp_size
+
+    if ramdisk_data:
+        write_ramdisk(fsw, ramdisk_data, args)
 
     count, fdt_size = _process_dtbs(args, fsw, entries, fdts)
     size += fdt_size
 
-    finish_fit(fsw, entries, bool(args.ramdisk))
+    finish_fit(fsw, entries, has_ramdisk=bool(ramdisk_data))
 
-    # Include the kernel itself in the returned file count
     fdt = fsw.as_fdt()
     fdt.pack()
+
+    # Count FDT files, kernel, plus ramdisk if present
     return fdt.as_bytearray(), count + 1 + bool(args.ramdisk), size
 
 
@@ -365,7 +471,12 @@ def run_make_fit():
     """Run the tool's main logic"""
     args = parse_args()
 
-    out_data, count, size = build_fit(args)
+    tmpdir = tempfile.mkdtemp(prefix='make_fit_')
+    try:
+        out_data, count, size = build_fit(args, tmpdir)
+    finally:
+        shutil.rmtree(tmpdir)
+
     with open(args.output, 'wb') as outf:
         outf.write(out_data)
 
-- 
2.43.0

base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
branch: fita3

