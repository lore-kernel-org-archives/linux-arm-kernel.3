Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A631DCE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b318BeGWA3r29XTQ0vNTU6rijD9/dIK2iMOcNHHPjBE=; b=epzrNQqXAoCjUSNson36Fy+iL/
	bNWvtTmMJszfccgb2ndG3QQrGnFGv+QuWBDfBHSLxJUr/3btKKEuwVh8vaSvQsjGp3I1jjRG84mbr
	UZLmZDq88HOl8fvDVvne0jxlATvBiRjigEr2pFWQ//RP/4N6oc6Ku1H3FKcSKdZttUC+OqlrWOQQx
	z3Ws2i7FmpnRPFCy6QDwc8Fyw5lCul5rvO8/lj75ooP9angSin/g/yGmTWPslK87Uj1uQSAbLlCn7
	oBZzQKUTWKBgorK78vkdJo/81PWMgMDPoZ9A6q3K6kAWwp7BUPsKNgSOLjjSI0dlE6o90z7jUF7Jy
	teAObAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumr-0000000CN7d-1uWU;
	Fri, 14 Nov 2025 14:28:29 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumi-0000000CMy0-2cMB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:28:21 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-43470d98f77so9498055ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130499; x=1763735299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b318BeGWA3r29XTQ0vNTU6rijD9/dIK2iMOcNHHPjBE=;
        b=XHtoNCkj9Yy1ofLjmJuANofJk2YXM85xBQgqN5iV+ofo0gSZYVfrMc6reWKy7HweFP
         lvtpcta3+h7AoGUwFYtTmnL95cB/CgmGn8+uhcgxAyLANL3kRpX6IAJrKO+JW/sxGc2n
         4+Ni9gMbdIqqJO+tlSts/n/lgNFiS7hIQez7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130499; x=1763735299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b318BeGWA3r29XTQ0vNTU6rijD9/dIK2iMOcNHHPjBE=;
        b=W3ND88poSPec4+6yH+zp7MfYAqe/eu1GANrtxeJ5Osboxbhj2EaLux0QtrxpkJEdGz
         32zg41NkwBptGA6+gQ/rZPpmH6v37DWXP3JDB7T7qqh95Ohf6wfIg7SgRaN01K6UlKeb
         PbjYHkckKn3N5TnJPs9lse9JA8PpDlWqm1u+Mb1oSobDE7OJG93eqXC39/5498dCbBmA
         xFvf1vUKCcL9JBMlE0JJVctqM51rmji6/5eTbn4YS4y9+3O4J0OHO+c8kop07MM1/JX8
         yJSPW8QMfdlnPcs5GzuOLlogsq0/QXqk0kBCZGt0AO2JzJ1m1E3pg2S/4NNXTVwhgSXz
         nLpg==
X-Gm-Message-State: AOJu0YztMX0xvdfv7iG9MV6SuOULoLO7Qe5Ebkg9OPZqnTsYGcugvfVi
	rKCe2s+FzKadLKbtR/AWSfhIOYVzt3GZTxB1ojbc96Aq9OnUDpluYYFEHDD+D5COyJPm4m8wpeC
	hYvE=
X-Gm-Gg: ASbGncs30AaB48+WYQKiIQ6WI8WubagKidV1zE/mct7fWH+SpJ9oDtkEtOXprwieaUu
	b6eUs7V7Cb2yhk45JbA+twR4ou5654MR7UsX4Sz27V4tmP0oKGK0Y8asWzDgYWl9DCjnRDDuNdy
	Eg8qHbRdpBW87njN+icBEYz5UqSCljfskb7Nyk7zPBZVtL8eCi8P6hRFQPbuLbxXYKvgcMmiR+X
	EZyBnFHRd5uH1MLxMoKlI8xprSe8MTVMw3vq8Vztgt1ZO9oDu0zJSNKOlZcb4/25t++/d/Ioibg
	JB5CvSE5vONydcqB/LFH/Pbz2/TtQjSwsqk1oD4vZjHIxvSpKJC7eP/Vke58XjgCsQGyOHoQ7si
	C52WkKXrQO6qIsTBQJSBpzuEwWH9jsVNc/GZrRqfIp57Gy7Ub+d1Z+dbFKRf51S+1J94ydCLH7y
	dh+BF0
X-Google-Smtp-Source: AGHT+IEsHcIFm8dXTBDkdjl5jk0rVOZMeytOzdSeMB9ux68T/mGruUqL+yzI070U3lDQqZZhTkEkSg==
X-Received: by 2002:a05:6e02:5e8a:b0:434:96ea:ff56 with SMTP id e9e14a558f8ab-43496eb00b0mr156465ab.39.1763130498831;
        Fri, 14 Nov 2025 06:28:18 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:17 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/8] scripts/make_fit: Compress dtbs in parallel
Date: Fri, 14 Nov 2025 07:27:34 -0700
Message-ID: <20251114142741.1919072-9-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114142741.1919072-1-sjg@chromium.org>
References: <20251114142741.1919072-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_062820_676850_DFAAA920 
X-CRM114-Status: GOOD (  15.32  )
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
index 10a040f4eb83..d1af496f3a57 100755
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
 
 
 def build_ramdisk(args, tmpdir):
@@ -366,6 +384,11 @@ def _process_dtbs(args, fsw, entries, fdts):
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
@@ -377,11 +400,32 @@ def _process_dtbs(args, fsw, entries, fdts):
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


