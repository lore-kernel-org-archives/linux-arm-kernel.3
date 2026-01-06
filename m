Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D57CE9D79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8l+PMSx1dMo0V8MdT06UoUXh18bncmRY0mnlTCdtsng=; b=1WbU1zAR6HUzoU7xjb4edzVBZf
	czGgHr2Rw8DsDlci/9XzKY7SAhWDPdSknT/oQYfrtXSI/HZI6BDJwDJ8nJAlcnSRV+qcIhBl1cI3M
	pHNPU380jEVUWOnr3SUcZcf2YKQIYMFsheRn7ucUFxapLVuzUO3AxPmjyZI3Tokyc4ZEamRS2zB4J
	QRi/EjbmKQbm9UwGZl26oRLsPRC90C8R7ZaicVjKK26Sv+XHY6ZEJvlLY8p9eRv7Nveq5RtOWNSnE
	VI5iWkbV8uvizJTckmeesDBCHwoChfIX9+WHFprv3xQAmwPGf0DpjLRWnmQiGtmbxjui61zx6MouO
	HjpYgbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9v6-0000000DUQV-4BQv;
	Tue, 06 Jan 2026 16:28:33 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9v4-0000000DUOe-22RQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:28:31 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7c6da42fbd4so685690a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716908; x=1768321708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8l+PMSx1dMo0V8MdT06UoUXh18bncmRY0mnlTCdtsng=;
        b=PgOJUcgcdTx2+49ZZMkewx/s9wblQYjlmtixKzHAN1y+kfsu5HClNlcj37ieRyryhP
         T/2LYQueC8VqIMeHEIx5AuGCgPYjxPw3RBhiytAv5ilhVBQlRlGH/ySXp2KuHEnK8vxv
         mWQiGtlPYqBCcp3dkr76f9LIiunBinXAr0hN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716908; x=1768321708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8l+PMSx1dMo0V8MdT06UoUXh18bncmRY0mnlTCdtsng=;
        b=applLhmZnxHf3zxEnWUyS/j2Lvvh5MXvZkDboN+PSM1iIfYRLqoDWoWhHoKSRpyuXl
         Z3MYSvWIAK5rfvocqF2P/jueGK92kWwHDOoZYzyLkqH8DicxDrYo/g/DSt3ISAqlsfPX
         8efkfDX2ko44UmKLP7pQdETmdRolNnr6qfgrURkA9STyhuSutI1lrNiyRSO6OlR8W1L3
         M+VvQ55GUq9ceMCkJkWh3eVLhNHlQwz/9J42tFVGTbud2tv9p8Fb3lg0b41zAKIye3a6
         H3QDXxUfppBtRUx7IQq46YJA9Wn9J5T3SxNFk+mfxw85w7kKnGS/FZ54MSIfv7hnd3cp
         q7kw==
X-Gm-Message-State: AOJu0YxQJjK5KwbehypSgy6UNAIFl6+KMwhOgIX5m4khnoIxE/1TBKXG
	/2qbJxJnJ0cximF68YGwpm3xyfvT2ZJxFL+xjxrrKwKfmBkVgXTKbicTD55rlyxnc2HCNfz5/M9
	vFM0=
X-Gm-Gg: AY/fxX46oCZ8Hl6OUdtxaSFG+Lo0mla73sBkEsezQLBVZVngN6d/Bbm35p0m2VESXNC
	PK/ItV8Pn83+TueK2S5slFmbvGqRs7zTq5Yv22eO7hM108327Q6cM86AKae8k/i9Rjkfn4TghqY
	tLUpU/k2EN668RI/w2cAz6x1cFL5MxvarVb17M8+glqcMPHNFzZQBpzMl2x+F/vTUmxnO0oicVP
	PXqKxQGwWAxs3kFrVlbim+swdwhJrgt449yzJ7TZPSX/xeJeKJld0y7QBSGSd5goKnAn1KjcOsi
	Vr2fWUAYUvr2HplBXfunoOwA0qCmaP5/CgDX+wkDvdqQt7wOP8A2Pi3w9iLiyg5xnZmzRHoPGgs
	TVhmB5iz4ddYkys3kPyTqDF/eBJwT67tccrUgfYszaOyN4sOw+k9SjyawDLdlAmTpj+wgNrj7WI
	smA2px
X-Google-Smtp-Source: AGHT+IG1N3IU6CP3R1t+h3+E8Tm3EouijsvGbZCZNnDD2IeLB1xOLNvsC4ZitJZZxIKks46Ly/KPWQ==
X-Received: by 2002:a05:6830:4489:b0:7c5:2f8f:2527 with SMTP id 46e09a7af769-7ce4654f12fmr1812171a34.0.1767716908552;
        Tue, 06 Jan 2026 08:28:28 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm1630951a34.15.2026.01.06.08.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:28:23 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/6] scripts/make_fit: Compress dtbs in parallel
Date: Tue,  6 Jan 2026 09:27:36 -0700
Message-ID: <20260106162738.2605574-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
References: <20260106162738.2605574-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082830_547777_F71B61B2 
X-CRM114-Status: GOOD (  16.30  )
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

(no changes since v8)

Changes in v8:
- Drop erroneous line 'kbuild: Allow adding modules into the FIT ...'

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


