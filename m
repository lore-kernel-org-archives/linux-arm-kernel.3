Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FBCCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReTIzD0lyRGNQa5K8IAUq+EP/qION+p7p5sDaqfXvB4=; b=F8gu25tGmcNmDq0mfpNaoo9/jl
	wK8q2y97UIk0Smw19qK/Ja5I2/5VZ+Acjp2NPxqD1dPMwXqVnU1vDqOgao5RhEMNNiNFPf22DNEIT
	CEKlly0wF3bowdIGI8leunQYOyPb5MinhBJ9+XLMfBivtXOB956tqad1vGC28uE40kIy1GSO+Xz4d
	HI1LrF9lZzRc/ETUC7W9sBFaEBjbVGo+hOJTDe92AYtPLHXqGQ8gLut/yd4HNBMh1xWiwzUtlvELN
	wdD0YAu3uu1ewdMUP0Adg8VxJv3V1NTu7h2bQepPKxJGLISNt21whu++YzoUF6ON3aWsFxrsu9/YP
	9DQSPfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEI-00000000xyn-46Co;
	Mon, 06 Oct 2025 23:02:54 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEG-00000000xvf-02GU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:02:53 +0000
Received: by mail-io1-xd42.google.com with SMTP id ca18e2360f4ac-8cc0cb783ffso519659139f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791771; x=1760396571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReTIzD0lyRGNQa5K8IAUq+EP/qION+p7p5sDaqfXvB4=;
        b=bjm07Y4ekCuUdIwnnuQAgD0L8X4lKKSVW0Jr1luZku95L+pb5pnvMDGzmZEQnq7GXd
         9LCX3+5fLGSxpHEiixccN/hvitZVZmqwWVocCt6ouk7t7DnKJh5v6qSGLrWqxVGP0F3K
         UEQcvUZzShSK8rAMNSZBjAcD8pg/cNJNq6BP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791771; x=1760396571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReTIzD0lyRGNQa5K8IAUq+EP/qION+p7p5sDaqfXvB4=;
        b=GtCfiN+/c/C7oUQgzte3VgxGK7YEf+Ie+nRrRG8GBefW031r9jXjMWiE4sy7Xv7nMK
         FexF+tMCGlVxfL2xgNiQ5eUiG2COeEBXMkvuLnJ4NoGYOZgVD8FmNyvnLnlxlZQ7fsGP
         2HcKV8M6yPy/xwsij0h/YSfT5s4mMM4YnXkyh+90YfDFifXFrb8kAwLPvL983je9IxTG
         ih1A2MPV096fDABrU2Hpyxt5jBBW5kDKLCjnvZa3YuZW51L3LfFjbYjIGJum/2fGsVzi
         IZMNyTOl4hMKJyhls3wyEB2o8NPpNySKcjfJOrpqYVzo7fkWqNtdYSoexfsmPLy92H3B
         c00w==
X-Gm-Message-State: AOJu0YxrgYXUZk3O1ob4RRoan15uJwpRn8mkCg9rZqzRyA43f2fRqPXl
	8BnROTmilNmyTeAh2Bcwz48mEMUeo9D5SNixcyWxEZZKRLATVu9HyHQUlJ9pBXO60AkjfU9HOo/
	kUt/txlBZ
X-Gm-Gg: ASbGncsxPyXtBPEmhfGW4NGssVbZi8hmxPSSI3z0npp9yiC6QBEtfQXIWbmI9VOOtnv
	RVervxllc6G/PFLnbutW9C0CTFoxWyALqwlSjCVAqFbNXLZ1zCRd7z770kqvAUxHU2Car6w1OeL
	36Glp2WyEMdbUAUcMvmDLMeq5ARvpDCTTjh/VdY4aBbHM4oOzBN7gDx4PRQXYoIuXkJUSkXh8da
	J/BGrC+AEq1vUOGusAv08weUTioLnm36HfVy74Clqohrn+JECTVoLY/uIE4oX4YluE2SGV8WFU3
	9PH2Pi4Xg2H6tH3HqjfsblM47/jcQeHt1wRw8LUcTjhjg9JyjAzcEUeEv0Oji9Z13SthsVFVzvd
	b165SXJKFe9glA+2ctHbaeaIOhZBFp6Z9+xYtnIYA9o6V6b5TISXpSg==
X-Google-Smtp-Source: AGHT+IGzPBkps6pgxo+xkRUOWRdcHJniXJOS0XDhoCKSiaRXOXMx/0guokH0JJv8zRRgcQP/nPr8eQ==
X-Received: by 2002:a05:6602:2c06:b0:93b:b891:fdb2 with SMTP id ca18e2360f4ac-93bb89203f5mr871324539f.11.1759791770626;
        Mon, 06 Oct 2025 16:02:50 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec55bc7sm5422226173.69.2025.10.06.16.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:02:49 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] scripts/make_fit: Provide a way to add built modules
Date: Mon,  6 Oct 2025 17:01:55 -0600
Message-ID: <20251006230205.521341-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006230205.521341-1-sjg@chromium.org>
References: <20251006230205.521341-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_160252_062174_6E043A6C 
X-CRM114-Status: GOOD (  22.33  )
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
module or our own code. The list of modules is provided in a file.

Signed-off-by: Simon Glass <sjg@chromium.org>
Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---

Changes in v4:
- Provide the list of modules from the Makefile
- Reduce verbosity (don't print every module filename)

Changes in v3:
- Add a way to add built modules into the FIT

 scripts/make_fit.py | 98 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 8 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 1a74a9dcd85e..3db129f40b20 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -13,11 +13,17 @@ Usage:
         -r /boot/initrd.img-6.14.0-27-generic @arch/arm64/boot/dts/dtbs-list
         -E -c gzip
 
+    # Build with modules ramdisk instead of external ramdisk:
+    make_fit.py -A arm64 -n 'Linux-6.17' -O linux
+        -o arch/arm64/boot/image.fit -k /tmp/kern/arch/arm64/boot/image.itk
+        -m module1.ko module2.ko module3.ko @arch/arm64/boot/dts/dtbs-list
+
 Creates a FIT containing the supplied kernel, an optional ramdisk, and a set of
 devicetree files, either specified individually or listed in a file (with an
 '@' prefix).
 
 Use -r to specify an existing ramdisk/initrd file.
+Use -m to build a ramdisk from specified kernel module files.
 
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
@@ -83,8 +90,14 @@ def parse_args():
           help='Specifies the operating system')
     parser.add_argument('-k', '--kernel', type=str, required=True,
           help='Specifies the (uncompressed) kernel input file (.itk)')
-    parser.add_argument('-r', '--ramdisk', type=str,
+
+    # Create mutually exclusive group for ramdisk options
+    rd_group = parser.add_mutually_exclusive_group()
+    rd_group.add_argument('-r', '--ramdisk', type=str,
           help='Specifies the ramdisk/initrd input file')
+    rd_group.add_argument('-m', '--modules', type=str, nargs='+',
+          help='List of module filenames to include in ramdisk')
+
     parser.add_argument('-v', '--verbose', action='store_true',
                         help='Enable verbose output')
     parser.add_argument('dtbs', type=str, nargs='*',
@@ -240,6 +253,60 @@ def output_dtb(fsw, seq, fname, arch, compress):
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
+
+    if args.verbose:
+        print(f'Copying {len(args.modules)} modules to ramdisk')
+
+    # Create output-directory structure
+    outdir = os.path.join(tmpdir, 'initramfs')
+    modules_dir = os.path.join(outdir, 'usr', 'lib', 'modules')
+    os.makedirs(modules_dir, exist_ok=True)
+
+    # Copy in the specified modules
+    for module in args.modules:
+        dest_path = os.path.join(modules_dir, os.path.basename(module))
+        shutil.copy2(module, dest_path)
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
+        if args.verbose:
+            print('Reading ramdisk...' if args.compress == 'none' else
+                  f'Compressing ramdisk with {args.compress}...')
+        return compress_data(cpio_file, args.compress), cpio_file.tell()
+
+
 def process_dtb(fname, args):
     """Process an input DTB, decomposing it if requested and is possible
 
@@ -318,11 +385,12 @@ def _process_dtbs(args, fsw, entries, fdts):
     return seq, size
 
 
-def build_fit(args):
+def build_fit(args, tmpdir):
     """Build the FIT from the provided files and arguments
 
     Args:
         args (Namespace): Program arguments
+        tmpdir (str): Temporary directory for any temporary files
 
     Returns:
         tuple:
@@ -344,20 +412,29 @@ def build_fit(args):
 
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
+    elif args.modules:
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
 
 
@@ -365,7 +442,12 @@ def run_make_fit():
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


