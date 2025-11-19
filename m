Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2483CF58C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHy+9knFfat2mLLa5PVf4uFPqoXtGTRpTYZkU+z6PsU=; b=G6tPDMdsy/KKTGkbNO5aq3aqD9
	Ze+spdYMhrO8CiBywfz+Erj199JGGkWZDaeBH4VTnTA3Oi1cPv6KmDILOLx6RDrl9B4ZvrsrGi1pn
	jJh7OIETXbtZraAMu6wVIfiy/XVjjikYRpy2KKkc03pGrBqvXpJes2niOxBKSsUdFegtwN+hCQK1r
	H3jExIJtYnozfrt/F2/6GPU+XMlJ9xKWt7SUcup/Eni9TmgvDppMBNwsig/rSyOJxXdGGygIqpq+m
	Zu4vPmF5SZdETH7IbsiodQW+lJc+yE7sz/+/B4EEBMQwjThWSbvABOswTcvBgBdSG5U/RpgdacpCn
	WzfCEUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmhQ-00000004U53-2oxb;
	Wed, 19 Nov 2025 18:14:36 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmhF-00000004Tpw-0lIb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:14:26 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-9486696aafeso434299939f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576063; x=1764180863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHy+9knFfat2mLLa5PVf4uFPqoXtGTRpTYZkU+z6PsU=;
        b=VdQK3Y1CsuWcj6PdGEEOridWAgTTK/IRil60PEyTETzhcqlopfN9k0QXWAl/Sn718k
         EeACUcDHKIr/XSfTZ7hmewmV24P31rjRqXHl5C/lbpEGEnoCPn8DC/64Pz47D8ounwOi
         OlKS1736YcUVNI41psoDYP20ZfQ+2Nizuqw8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576063; x=1764180863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dHy+9knFfat2mLLa5PVf4uFPqoXtGTRpTYZkU+z6PsU=;
        b=XpboSslfJ+fzWYrBUjs1OIyeZxokYkXPhOn5y8iVUyQuG5wnEwADVccRK8K2ohhrMS
         /kEZL04RR29JaakpUMmSOgagnJtXl/fyhGJqGVF9wJODdAbqRDzOQbb7qA1KQYXDTgpD
         O0ETQIubQNbBq9RzVHcpEcYtUJ2IWS8Ayw5/gPiGelZriqIJfq71N7RXbd93s7Rsvno4
         arOTJQtMZQtfKljzFOuAB3ToNciVhPtx23cXz6vXuN9glwaTt7BWdAeTCpPbHsIYLTKE
         tCeUjjWypwqHWFIWZa/EOIum8nlwj2qFE4lYJEVp79mu2nyphmUKX/XOBH3FvJDySwiN
         778w==
X-Gm-Message-State: AOJu0YwMWEQBLfn+2zG8ukCRAhFATFh8Uwjr+HGhHfJz0qXL1FqVWu39
	Nlix3hZuVTyYIE7d/4vOpDNd79bthy9hR5CfnivmFXsARDpWwgoPhkWr/GAciUHGUzEvwyFCyda
	zL6Y=
X-Gm-Gg: ASbGncsZP/3KG+cJGl0kV9AItAfqXBL5PYMntbxBKCXoSZXYW+g4gU1CHeydVnRlF24
	vxSZIWeJoiZ5J/6dY2iZeI45hpt5Ewc+yR9rAccaNiqQD4ujEWl2e0sk/kJzUhhssFBS8T7glkQ
	CZL9PM74hIDHNuQFfNBqwVH5OSV6ODQM3dMBQhayW6KSq9ft4fVfWMjUWEp/1YAc6JRzG7+9JRB
	GC5p24QGCOfx+z1pj6GYMi043PDXx4rBVJRyF6kSOw7qtm19I2DUEipplqbrEM/tuWJ3H/9K24k
	cdl1E4pevSy5ZhWMITf05T2nTu3Yt3cysmwB68wgkbAOov1DfgubNpKXlNdPHC5o6H+gEpxgtq3
	wNe16+FWCkc/wHhmo6VPUGc826qdn7duyymhwJ3/9We608mCj5aLCykObCiAgniLyKUHGacn2lC
	XyBs75
X-Google-Smtp-Source: AGHT+IGaRIx4ZLtKiudNzXMDULOFDlM2zIQYOJnUxhKiqXGAH6TvITMlqEdCQfP7NTjCb2mlaYsLtg==
X-Received: by 2002:a05:6602:2b84:b0:948:a3ca:15a3 with SMTP id ca18e2360f4ac-948e0deae37mr2850382839f.18.1763576063169;
        Wed, 19 Nov 2025 10:14:23 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:21 -0800 (PST)
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
Subject: [PATCH v6 8/8] scripts/make_fit: Compress dtbs in parallel
Date: Wed, 19 Nov 2025 11:13:29 -0700
Message-ID: <20251119181333.991099-9-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_101425_230889_D7D4133A 
X-CRM114-Status: GOOD (  16.20  )
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

When there are 1500 device tree files it takes quite a while to compress
them. Do it in parallel.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 scripts/make_fit.py | 56 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 64038f17a51e..0a58b5b378b0 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -43,6 +43,7 @@ as U-Boot, Linuxboot, Tianocore, etc.
 
 import argparse
 import collections
+import multiprocessing
 import os
 import shutil
 import subprocess
@@ -237,15 +238,31 @@ def compress_data(inf, compress):
     return comp_data
 
 
-def output_dtb(fsw, seq, fname, arch, compress):
+def compress_dtb(fname, compress):
+    """Compress a single DTB file
+
+    Args:
+        fname (str): Filename containing the DTB
+        compress (str): Compression algorithm, e.g. 'gzip'
+
+    Returns:
+        tuple: (str: fname, bytes: compressed_data)
+    """
+    with open(fname, 'rb') as inf:
+        compressed = compress_data(inf, compress)
+    return fname, compressed
+
+
+def output_dtb(fsw, seq, fname, arch, compress, data=None):
     """Write out a single devicetree to the FIT
 
     Args:
         fsw (libfdt.FdtSw): Object to use for writing
         seq (int): Sequence number (1 for first)
         fname (str): Filename containing the DTB
-        arch: FIT architecture, e.g. 'arm64'
+        arch (str): FIT architecture, e.g. 'arm64'
         compress (str): Compressed algorithm, e.g. 'gzip'
+        data (bytes): Pre-compressed data (optional)
     """
     with fsw.add_node(f'fdt-{seq}'):
         fsw.property_string('description', os.path.basename(fname))
@@ -253,9 +270,10 @@ def output_dtb(fsw, seq, fname, arch, compress):
         fsw.property_string('arch', arch)
         fsw.property_string('compression', compress)
 
-        with open(fname, 'rb') as inf:
-            compressed = compress_data(inf, compress)
-        fsw.property('data', compressed)
+        if data is None:
+            with open(fname, 'rb') as inf:
+                data = compress_data(inf, compress)
+        fsw.property('data', data)
 
 
 def find_gen_initramfs():
@@ -395,6 +413,11 @@ def _process_dtbs(args, fsw, entries, fdts):
     """
     seq = 0
     size = 0
+
+    # First figure out the unique DTB files that need compression
+    todo = []
+    file_info = []  # List of (fname, model, compat, files) tuples
+
     for fname in args.dtbs:
         # Ignore non-DTB (*.dtb) files
         if os.path.splitext(fname)[1] != '.dtb':
@@ -406,11 +429,32 @@ def _process_dtbs(args, fsw, entries, fdts):
             sys.stderr.write(f'Error processing {fname}:\n')
             raise e
 
+        file_info.append((fname, model, compat, files))
+        for fn in files:
+            if fn not in fdts and fn not in todo:
+                todo.append(fn)
+
+    # Compress all DTBs in parallel
+    cache = {}
+    if todo and args.compress != 'none':
+        if args.verbose:
+            print(f'Compressing {len(todo)} DTBs...')
+
+        with multiprocessing.Pool() as pool:
+            compress_args = [(fn, args.compress) for fn in todo]
+            # unpacks each tuple, calls compress_dtb(fn, compress) in parallel
+            results = pool.starmap(compress_dtb, compress_args)
+
+        cache = dict(results)
+
+    # Now write all DTBs to the FIT using pre-compressed data
+    for fname, model, compat, files in file_info:
         for fn in files:
             if fn not in fdts:
                 seq += 1
                 size += os.path.getsize(fn)
-                output_dtb(fsw, seq, fn, args.arch, args.compress)
+                output_dtb(fsw, seq, fn, args.arch, args.compress,
+                           cache.get(fn))
                 fdts[fn] = seq
 
         files_seq = [fdts[fn] for fn in files]
-- 
2.43.0


