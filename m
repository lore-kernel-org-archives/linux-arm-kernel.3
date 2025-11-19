Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E2ACF58C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zF1Pzd7Y25nbnANuZLJhVbfb7fwymTpO79JMBdCEa0k=; b=artLW4+yjxJyf/s3OVNMnO1w+F
	6zA6mUDm6WBQ5T5jwEaoLcVGikUsrTXICY0nf8fLq5xnePihXWFp53jozm/SSKgvVK5CgQn7MG5X/
	syZkQqs4MZ/g1pCiaeoyGTk3CsAt9DaNDzA6oueLRa8XrtKKAltyRIirsiCESPP3PKuQMTdvjc9gY
	PAGBWkHZU4/wHfIq9y05Gj/YTWmJa1wCk+iQ8RodQcnST25HCBYBT2CRumnzrhBHJOWVphN2Z/5IR
	hH4KOInp8l/lXKtddboTtYpBM7OvcixlicWkkcMATYzfyy3EraInFi+5iolcu8yrrVNhMfFJBXtG+
	F+54d0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmh8-00000004Tj0-37dQ;
	Wed, 19 Nov 2025 18:14:18 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmh3-00000004Tdd-083W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:14:14 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-9491ba846b2so83651139f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576051; x=1764180851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zF1Pzd7Y25nbnANuZLJhVbfb7fwymTpO79JMBdCEa0k=;
        b=c6q5x1kP8Bo7Iy+sg+PxVP5O59LkHz9PZ9QMALgNY4BMqnlgEl6WQAX/FqR/nvNL5u
         wzL+pamO4qg7E3LYykpuVaiRq/vXfgw7V04IPnqqkMmBIB0Vbc84EwtSbBtgK3/lDca3
         mxxPxmX+bXUNWbJKl0ndqEHCJGIwjdZrmYsm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576051; x=1764180851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zF1Pzd7Y25nbnANuZLJhVbfb7fwymTpO79JMBdCEa0k=;
        b=Imwqq3hmeMwCETfTbsOo6QaYEzDS8UcTXfYFSTjoCSu8zSygmUT+W5Nti65fE8uZYv
         dLZC0t1+eEjjhYcmh4a6qlyOhMHbTc/gihpyK6zhWbzTNk9R3zOxGyWQu3wUKlalcsM8
         wmjCZcQsMgYq6db4nGKCmC+touDWjbcQYmkTP/bSbnoW2rxZmri+pLiwtU58kNAqI+qH
         AuoYU5ADcwJnW1+hbr6xzCE71/Zd5BpmglnI1FDR+SZ/dVXGqO7KzTavFKeusmbiQ8mh
         TEHeN4Naddz2zOQupoPK8/qXghUQvSbqUrqJMGDXc5DpMqlmLn6ILlhi/FFgOhZ8E/lS
         WFww==
X-Gm-Message-State: AOJu0YzkrlsfAbpG4yT/+YNJeh3DCGWm/360tLYItni7QVY7tRtsa16w
	LCOD7nQhn18BvkZgsbe0nRc66AkHyHUpPvZtAkj826FjRsBMsWOFf6kxKydqv/Bh67bDQIpxlXm
	tC/I=
X-Gm-Gg: ASbGncsKM2a9V6z9C3KmMlT8fNn7Vj3ks/UUFmAAbVNlRN7rKYApIrhiwX575M6TkZJ
	oBEfeGYQUxwgjFF+3wGdZv/4127lt1FYUm7UqMdGvJA5cdm59nqRG1ASK67zOqSRKNrdx2dVVZW
	K7AAwXhEkuK4KD4m2sDee/n3kanI+vcRSTPj9hgDcpKzdqAVPCOaPbIfggFfOQWGqKH68t7h+76
	4savfawkqtkAiLRe4VDznuLCZVK1kKc3hM8KJPvYGj05z5UTtcpxLBDrUAmdos9d2YXgkZ46T/z
	KDLAtdSAE6I+qNvp//3tTGOLmUw6URJy9XN3WIaQFHtQajWt9VmsdfNbYwqkaSkLDeggWWqxufc
	ugvcNHRmJ8fkMVQnaRR9FNFWzTcve8noR63y5aF3IAkNUN100S6jm/W5tWsnr6XMpZZ8wlmAgRK
	r+LfhR
X-Google-Smtp-Source: AGHT+IGXok4pX6SwDb8ES6pk1m2C6nMJbpP1DT6LiLX3sEVL1CGlpcIazdW8D38rS+pPrrxt+7nSNQ==
X-Received: by 2002:a05:6602:168a:b0:949:92c:8049 with SMTP id ca18e2360f4ac-949092c8360mr1301383839f.12.1763576050905;
        Wed, 19 Nov 2025 10:14:10 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:09 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/8] scripts/make_fit: Provide a way to add built modules
Date: Wed, 19 Nov 2025 11:13:25 -0700
Message-ID: <20251119181333.991099-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_101413_088452_636914CB 
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

Provide arguments to support building a ramdisk from a directory tree of
modules. This is a convenient way to try out a kernel with its modules.

This makes use usr/gen_initramfs.sh where it can be found. Failing that
it uses the cpio tool rather than attempting to use a python module or
our own code. The list of modules is provided in a file.

Signed-off-by: Simon Glass <sjg@chromium.org>
Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Note: The approach of depending on modules_install caused build problems
as mentioned in the cover letter.

I dropped the review tag from Nicolas Schier since there are quite a few
changes in this version.

Changes in v6:
- Using the modules.order file instead of 'find'
- Use gen_initramfs.sh where available

Changes in v4:
- Provide the list of modules from the Makefile
- Reduce verbosity (don't print every module filename)

Changes in v3:
- Add a way to add built modules into the FIT

 scripts/make_fit.py | 127 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 119 insertions(+), 8 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 1a74a9dcd85e..9dfef11fc4b3 100755
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
@@ -240,6 +253,89 @@ def output_dtb(fsw, seq, fname, arch, compress):
         fsw.property('data', compressed)
 
 
+def find_gen_initramfs():
+    """Find the gen_initramfs.sh script
+
+    Looks for usr/gen_initramfs.sh relative to the current directory,
+    or in the source directory if running from a build directory.
+
+    Returns:
+        str: Path to gen_initramfs.sh if found, None otherwise
+    """
+    path = 'usr/gen_initramfs.sh'
+    if not os.path.exists(path):
+        srctree = os.environ.get('srctree')
+        if not srctree:
+            return None
+        path = os.path.join(srctree, path)
+        if not os.path.exists(path):
+            return None
+
+    return path
+
+
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
+    # Copy in the specified modules, renaming .o to .ko
+    for module in args.modules:
+        name, ext = os.path.splitext(module)
+        dest = name + '.ko' if ext == '.o' else module
+
+        # Preserve directory structure under modules_dir
+        dest_path = os.path.join(modules_dir, dest)
+        os.makedirs(os.path.dirname(dest_path), exist_ok=True)
+        shutil.copy2(module, dest_path)
+
+    if args.verbose:
+        print(f'Creating cpio archive from {outdir}')
+
+    with tempfile.NamedTemporaryFile() as cpio_file:
+        # Use gen_initramfs.sh to create the cpio archive if possible
+        gen_initramfs = find_gen_initramfs()
+        if gen_initramfs:
+            subprocess.run([gen_initramfs, '-o', cpio_file.name, outdir],
+                           check=True, stdout=suppress, stderr=suppress)
+        else:
+            # Change to initramfs directory and create cpio archive
+            with subprocess.Popen(['find', '.', '-print0'], cwd=outdir,
+                                  stdout=subprocess.PIPE) as find:
+                with subprocess.Popen(['cpio', '-o', '-0', '-H', 'newc'],
+                                      stdin=find.stdout, stdout=cpio_file,
+                                      stderr=suppress, cwd=outdir) as cpio:
+                    find.stdout.close()
+                    cpio.wait()
+                    find.wait()
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


