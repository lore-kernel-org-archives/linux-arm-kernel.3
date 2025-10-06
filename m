Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9458ECCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b318BeGWA3r29XTQ0vNTU6rijD9/dIK2iMOcNHHPjBE=; b=K0kp699LZySrvpt3BiZEszyVvq
	uZ0W6IWLmhjh1qf39D1V+q3chJw55svmHoga19v7cuXurj9O1yEXwcD2QVuLZ2cnCfSOl8a/MfrcO
	0w5I9iUx9F9SrNQilWpzfjtdGXLixhYcOvygJdrTjZCMIVg+MaGifldd/23p4XZDYcu2647WM94JI
	1WoMj2XHSl+yS4AZAEnG6JnxDsHwxAWhbiaoi+iT5bpDsJ79qpb4ZeqHQxfqhISnp/wt5/WP4ugpz
	fzkCRR00PL+J2HUPr51C+FnuNB78qlyHYrtRQeBqHn3ug2+eumXZA1ILxr22u1Z3T1IgSf7vPUIiY
	KRCNztFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEO-00000000y5s-2EX9;
	Mon, 06 Oct 2025 23:03:00 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEM-00000000y3E-3hmb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:03:00 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-42f05cbc3d1so17609495ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791777; x=1760396577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b318BeGWA3r29XTQ0vNTU6rijD9/dIK2iMOcNHHPjBE=;
        b=IUghersI3Fn+H+JRggD/TlOhAx8X7G8GrdVP+mSC+YHK+5/5dTaXg0xMIscxDNxFUF
         tyEtUR8/QoHw8oQMDFRh5l5xawZBTXNKkqu1mHUOxfORlJfzzxSgwXMpKeux/+C7TRvo
         hZ+XOUM0M2ii6F9w+4sIE3iYX7nvkmBj/rKNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791777; x=1760396577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b318BeGWA3r29XTQ0vNTU6rijD9/dIK2iMOcNHHPjBE=;
        b=GVVriFwGe7onlkGyipsEEijBCpffUmJHP2dWMhf/Gr0Oq9+xr/YFF8qGJil2PnfY3n
         cdcn+97+LG+92Auv8FwlUVVSwptyQ8YMeXZdhaGTqgJatvzmfaBnxVebXmJcL3DZNOIH
         wpnoCsrOcqD7BpBROAh7Pqy7x8b+EZiPqcrkTvKD2nCnT+jSO6BF0wSdMPDSHTcOHLYQ
         jKeC2GIGGUd4kkgLvyg6vpW3i9krd3fTtjKBoeFjbC/arGclph2sm2AGEmE+eD6rEE/L
         dNJLf2EXlLWATUQh6CJhsLuOb53lGlLvOGmN1IFw68Hz9u9Hgo6ll88//y9dVGEuMGPD
         f6mA==
X-Gm-Message-State: AOJu0Yyok8mGSPmSKqvKaHgiLO4RB2AIM8p3rhkSviZTOcNLqnCcPJ/i
	T7k7BnJDUEDv9EmId7TfkXn2gLZsiZAdnBhuPctmiFk071nlBbnSg8iF1KsQ7B/vg9dmdLPo/CP
	DtkqGdw==
X-Gm-Gg: ASbGnct53kH3Rjy+NIGmdBb+GQ9ebm+bhk6PqF6hTF9dMbq1bZ+oKT9cboOa3GDSYH2
	naS57WRoH2J6tyM+jDX4RkMkJItBKr9pkM0W23wdYkwzPpSbyr1rfJvpcG4ezwVSb1Vb9PVk+ty
	fq9J+BiiMTy9GDzK8GflmjctJwZh3fQSh85E+5jGKlFaXoixmaR68TrTDeY9Qje0Ua9RALrq970
	Hd2MXf3zuECADc+liX2/pn9lCHy1vhvDkIXvFewMNNjNOeFcsqzbpJtfYCG9fdA28yEWYUy4qE1
	Yp4ikdK48cz4agRZCAxHit4QzB1KbZqL/K8Ar6oYGUbvdv1LE4EgoqBMtVH37SUSsYIaWVB6If6
	6eu2C5hwrttoL09swohTnh0IWyD1d3ycNbyl6lPHd5/Y=
X-Google-Smtp-Source: AGHT+IG7h6VEIrYxcywgIQo3xi3mnzcDBjSio3qPq2k9Vpojaaa/mhuStt80mORSz4TB5A7diQ4H6A==
X-Received: by 2002:a05:6e02:12c1:b0:427:215a:93fa with SMTP id e9e14a558f8ab-42f7c349cd6mr17245875ab.2.1759791777236;
        Mon, 06 Oct 2025 16:02:57 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec55bc7sm5422226173.69.2025.10.06.16.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:02:55 -0700 (PDT)
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
Subject: [PATCH v4 7/7] scripts/make_fit: Compress dtbs in parallel
Date: Mon,  6 Oct 2025 17:01:58 -0600
Message-ID: <20251006230205.521341-8-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006230205.521341-1-sjg@chromium.org>
References: <20251006230205.521341-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_160258_928695_DEA9F596 
X-CRM114-Status: GOOD (  15.82  )
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


