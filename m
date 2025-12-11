Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B14D41C36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrEZrghrc2EX7rimqehQ8Km0GewP4FP/AwInEozlUrg=; b=jb60Ew2/6Gh5eO99durtNZu3CX
	dUCxtyW3MfLI2HONsn1XJ4pF84mobSj2r6iuSqfKdlMLYz8bLCKuFIDT/mNNawcwqAge9Nr/GQpaV
	7d35l3HXx1HN2SN5B+x63M/Qn4MMTZ6057cPAc/Q2iQiGJO8klwNzxQdgXuV2K1pUZfjlEvNgbDI8
	7WsKU8PUSvu5fCakjseCP/9SvqInbLoFe6lz5IqdU0CwZFX1NhhkUk6ShPZRoA2hIG5E3EA4c70e2
	IwbpnE2dclo2e/c3rPtKfmL2/vkfQCtB7b6mWItAzh6DwneSeVDxbvsb/MpVq8y0VS9HsDn46lo5y
	ytZWOBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGw-0000000Ggsu-0s14;
	Thu, 11 Dec 2025 14:03:58 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGt-0000000Ggqe-3i80
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:03:57 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7c6d13986f8so109873a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765461834; x=1766066634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrEZrghrc2EX7rimqehQ8Km0GewP4FP/AwInEozlUrg=;
        b=Pn/qZax/WWIRSx2D39Fx7ZSvD6mmxJYPcOOrLPSkfLDlZsjpYU0ZVFXpEyfyN1gwb3
         240fxV12AgvtLBhmfgNlO2lb1Lnsyf/haiGiLrvM8EeEVnGNW3DQ+O0yxWu1bhkoyT25
         yrMs4m7hUSd5o98dwoY840NB1mRKgx2wuHlG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461834; x=1766066634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YrEZrghrc2EX7rimqehQ8Km0GewP4FP/AwInEozlUrg=;
        b=sqTFa7NFtsIISINGePD/HSXxjpYr3T1/0v26GY1exatZsb0C25hM1IDB2gkfMBsYGR
         2cOja9MKm9eewLBS7MeGfway3WhQ2Aiisi7SDGRC4yYw15D4MzAS4DXBGToRIFB16mON
         HphlzZjlxzn5GhX5niWeOF5plSDaYmrUw79H6EJpCmRP4m6lmR9sIJJSi1tg2QXc3388
         YoSjjb3uwB2cjAiXl40TIMJdbeq2Bp5iiPJFc/0nwKNkLuy82JLJHson0k5ixfDcqzhc
         x7+mUxTq2pGzS4vozxB9SHNlC2LJhVaYOaOeyp7BwpOv6HxFY+ZcR1ZuS6QmdiqxRXnI
         WJWA==
X-Gm-Message-State: AOJu0Yznbrk2NTQ8RBzOuBBYmwo9QzP+FOxdJY2u8OJ5OvbPTE6DQWPZ
	hk1tG6pgSyJLZ57r0OvpHFpI83yDJscKj2Cl+Wu5u1IUFuNE7JX5+qL7LZg4M14Q6nSPCprMSSk
	Re68=
X-Gm-Gg: AY/fxX6GrO6RXihzg65aw5edWUIG69p0Wwbg2TNDhy1OVrYoHbnJY6g/vUr9W45/PMN
	5bVNNicNimw3++sJMS7l1Ae6GoNtwDu1tuuH8i4cFZhfBUZKLTQIJsTdXYBSnhPrPS+Put6qYCH
	jKDQvRF3pkgqaQhZn0MAtaLRy0Yw2R0yDVLEBfSpk2y5ap7TfNrFouecl0hO5pX+bMKiGiLAkuz
	49EPbZ93m1e2oML6+cD7B2GktfEMaiOlxxSKJF9DVRs4ODrDCkV+iXy6vIUuQslotkdFheJG+9c
	hGk8Wge8LXxwToII+IxKZ8rOEXoyyQ3x5n4tPrP7y8B3oolkg1+IcSFLAHFWEOKNu2Uxxq/xmz8
	LnC19fxq9Zwn0jhzDDSXGK5sMWDrfWU2OykSwSNZ1sXCYBwc3nvZcVpU96/PyQJF4cTtSjcmHWk
	zw7Y0h
X-Google-Smtp-Source: AGHT+IGdhTYXa00yC9lHlR47tVgHZ0qHU5gLHDx5CEQuAyMBzVTh1Mkta8Jby7+utQw5FLyd4TFLDg==
X-Received: by 2002:a05:6808:c2bf:b0:43f:68b:acb3 with SMTP id 5614622812f47-4559befdfa3mr681670b6e.17.1765461833902;
        Thu, 11 Dec 2025 06:03:53 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598d6e789sm1130030b6e.22.2025.12.11.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:03:52 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] scripts/make_fit: Compress dtbs in parallel
Date: Thu, 11 Dec 2025 07:03:03 -0700
Message-ID: <20251211140309.1910613-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211140309.1910613-1-sjg@chromium.org>
References: <20251211140309.1910613-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_060355_938177_4779BAB7 
X-CRM114-Status: GOOD (  15.06  )
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

kbuild: Allow adding modules into the FIT ramdisk

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 scripts/make_fit.py | 56 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index defb87f223d7..e923cc8b05b7 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -37,6 +37,7 @@ as U-Boot, Linuxboot, Tianocore, etc.
 
 import argparse
 import collections
+import multiprocessing
 import os
 import subprocess
 import sys
@@ -225,15 +226,31 @@ def compress_data(inf, compress):
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
@@ -241,9 +258,10 @@ def output_dtb(fsw, seq, fname, arch, compress):
         fsw.property_string('arch', arch)
         fsw.property_string('compression', compress)
 
-        with open(fname, 'rb') as inf:
-            compressed = compress_data(inf, compress)
-        fsw.property('data', compressed)
+        if data is None:
+            with open(fname, 'rb') as inf:
+                data = compress_data(inf, compress)
+        fsw.property('data', data)
 
 
 def process_dtb(fname, args):
@@ -300,6 +318,11 @@ def _process_dtbs(args, fsw, entries, fdts):
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
@@ -311,11 +334,32 @@ def _process_dtbs(args, fsw, entries, fdts):
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


