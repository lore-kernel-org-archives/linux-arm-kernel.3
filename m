Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57996CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 22:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55OixrJ4Uv6119FapcKr6hiNiDYkKOQ8qqvXfI5KLxU=; b=gpTWmSznQQT9RE7vP505swfMOP
	d08gTo/KO8J9kgIAVT2LRVoL4J1xuqUM6ivZrF3Rp/X7gEdJvzYnVkuRiPuV/spg5tmmH/uC9ISQV
	XTPi0xT2OFoGdgsa3kGxH/cdOCVEu+wgtWoKUrZ6WEAtRVu5pl1wHJKr3l+sPGod/1Tj0mK8JOkm7
	7WmMB6qmc7GMANRhUs0bYSzLKRWKHBWubnfG/acNWBm0a/Ntu5vYYxBhaY7GjOXKrKiMkDhcZKsZn
	KQG2KFlQyCgBP5bRTk/uNKrLNff7HzXtIDyCBRxFBTiMbiyAatRl4FJTmYiGS3IywV1DaddfhcksW
	wbhfqIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLG-0000000BfTw-18KF;
	Mon, 22 Sep 2025 22:49:06 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pL9-0000000BfQ2-2iLL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 22:49:00 +0000
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-750b77699b4so3418618a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 15:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758581338; x=1759186138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55OixrJ4Uv6119FapcKr6hiNiDYkKOQ8qqvXfI5KLxU=;
        b=ULAGIt8nNAOgDq0ZvT+OnNx+Jm17LV/OOAGwTrLtGJmCBGS+1VsuIkkDgXD2JhbAy4
         R4xpLaq6uhLiBwnkfELJVk9ACnt1BgC3f9dRCQaD2c7fIK0qWW1SLIMRKGT/AyLsYP/A
         Wpt0JfB31csNj3bDaqgTEgHaymtuRK2GKG14Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581338; x=1759186138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55OixrJ4Uv6119FapcKr6hiNiDYkKOQ8qqvXfI5KLxU=;
        b=sNmAIqnwK0XrU9XZl3L74BW3uB/MFJcagEW6PsdqcQpIQ+0pZE5IoGeZjpRy7+quil
         ZYvkTE30/BuBc1OHQ9BGozqOp7RhjVJTaP5X+b1jJ6G2bkcV9iKprzjwyKYNcGPzaVb1
         ba1b+ztUpCcOhuEc58WfVE+Loxs5bKtRebje092MchXIez+a87/zfk/GdFq1KX8cwt/E
         Fe3QwTE9pFHYyh7i542kUHFD97oM4FloDjqf+bJ9AmwyT6iUy8mxe8L1WDcenMGTQt7K
         Bkhl1kpLuwD4oeZS7tPHBVhfc2d9wkDIqokmKDXHYJG0nEsI46rZHOFrRS1Zq1NzoNGI
         kyjg==
X-Gm-Message-State: AOJu0Yyflu0KFuQ63ZsUAvzYc1a4XxQOyv/B89G3j4uyEyxC6QRt6dj+
	t24cFreea0LU1if2h8jRwS/sz38NFfQBhsSJLSS3vs5Z/XbmbSs2tmShTBFKtJRyqkBB6S9aMlI
	Ki4qArWvl
X-Gm-Gg: ASbGncs67EDI7SRsnDLeVAextdzKE35uMmnsVE0lsVEPY+yI8bcayHR/IS8p8dvAvpE
	F5d8Wfm6iiz95YbZuYPJe1D6Shob0m72d2R6QYyvaJ2ZpIH9Ve7CRfSHPiz2HiHrx8nYCRbU++g
	Tm8JQf/xtMB6hhbbYdMYxx7ACMO2bGCfdQICF4yqc1wigYfroCONEWuA8qktUxG/6YlpW46EAh2
	VISIXOy6LQ6W8//KgGqNmHVCryffNz/jgMmVKEx5TcwoXmlqF6JuUe8CWVQ68w9jl9/vKO/fx7W
	QO5bp/wbjd/iYLExucrV497nvYOqlDGHCkJ8qjbt5+8943sToi+qTso270uqkvzT4784+PF0rBF
	JbLhWyrJAr7+lNx1g3L0=
X-Google-Smtp-Source: AGHT+IHvVi81p/Rk/iKsuI4Sf5ylhTMG/fpIOEuvDqD2PYyARqT+UX/5mT4PVlT7wJ/l1iR0NOi6EA==
X-Received: by 2002:a05:6830:2a90:b0:745:5450:b4b1 with SMTP id 46e09a7af769-79151de5e62mr240399a34.19.1758581337997;
        Mon, 22 Sep 2025 15:48:57 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-78780383017sm1167244a34.37.2025.09.22.15.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 15:48:57 -0700 (PDT)
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
Subject: [PATCH v3 2/5] scripts/make_fit: Support an initial ramdisk
Date: Mon, 22 Sep 2025 16:48:29 -0600
Message-ID: <20250922224835.1918759-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922224835.1918759-1-sjg@chromium.org>
References: <20250922224835.1918759-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_154859_695522_6A1E85FC 
X-CRM114-Status: GOOD (  24.23  )
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

FIT (Flat Image Tree) allows an ramdisk to be included in each
configuration. Add support for this to the script.

This feature is not available via 'make image.fit' since the ramdisk
likely needs to be built separately anyway, e.g. using modules from
the kernel build.

Note that the uncompressed size is not correct when a ramdisk is use,
since it is too expensive to decompress the ramdisk.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message

Changes in v2:
- Don't compress the ramdisk as it is already compressed

 scripts/make_fit.py | 52 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 0f5e7c4b8aed..984371f505bc 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -10,10 +10,14 @@
 Usage:
     make_fit.py -A arm64 -n 'Linux-6.6' -O linux
         -o arch/arm64/boot/image.fit -k /tmp/kern/arch/arm64/boot/image.itk
-        @arch/arm64/boot/dts/dtbs-list -E -c gzip
+        -r /boot/initrd.img-6.14.0-27-generic @arch/arm64/boot/dts/dtbs-list
+        -E -c gzip
 
-Creates a FIT containing the supplied kernel and a set of devicetree files,
-either specified individually or listed in a file (with an '@' prefix).
+Creates a FIT containing the supplied kernel, an optional ramdisk, and a set of
+devicetree files, either specified individually or listed in a file (with an
+'@' prefix).
+
+Use -r to specify an existing ramdisk/initrd file.
 
 Use -E to generate an external FIT (where the data is placed after the
 FIT data structure). This allows parsing of the data without loading
@@ -29,8 +33,6 @@ looks at the .cmd files produced by the kernel build.
 
 The resulting FIT can be booted by bootloaders which support FIT, such
 as U-Boot, Linuxboot, Tianocore, etc.
-
-Note that this tool does not yet support adding a ramdisk / initrd.
 """
 
 import argparse
@@ -81,6 +83,8 @@ def parse_args():
           help='Specifies the operating system')
     parser.add_argument('-k', '--kernel', type=str, required=True,
           help='Specifies the (uncompressed) kernel input file (.itk)')
+    parser.add_argument('-r', '--ramdisk', type=str,
+          help='Specifies the ramdisk/initrd input file')
     parser.add_argument('-v', '--verbose', action='store_true',
                         help='Enable verbose output')
     parser.add_argument('dtbs', type=str, nargs='*',
@@ -133,7 +137,28 @@ def write_kernel(fsw, data, args):
         fsw.property_u32('entry', 0)
 
 
-def finish_fit(fsw, entries):
+def write_ramdisk(fsw, data, args):
+    """Write out the ramdisk image
+
+    Writes a ramdisk node along with the required properties
+
+    Args:
+        fsw (libfdt.FdtSw): Object to use for writing
+        data (bytes): Data to write (possibly compressed)
+        args (Namespace): Contains necessary strings:
+            arch: FIT architecture, e.g. 'arm64'
+            fit_os: Operating Systems, e.g. 'linux'
+    """
+    with fsw.add_node('ramdisk'):
+        fsw.property_string('description', 'Ramdisk')
+        fsw.property_string('type', 'ramdisk')
+        fsw.property_string('arch', args.arch)
+        fsw.property_string('os', args.os)
+        fsw.property('data', data)
+        fsw.property_u32('load', 0)
+
+
+def finish_fit(fsw, entries, has_ramdisk=False):
     """Finish the FIT ready for use
 
     Writes the /configurations node and subnodes
@@ -143,6 +168,7 @@ def finish_fit(fsw, entries):
         entries (list of tuple): List of configurations:
             str: Description of model
             str: Compatible stringlist
+        has_ramdisk (bool): True if a ramdisk is included in the FIT
     """
     fsw.end_node()
     seq = 0
@@ -154,6 +180,8 @@ def finish_fit(fsw, entries):
                 fsw.property_string('description', model)
                 fsw.property('fdt', bytes(''.join(f'fdt-{x}\x00' for x in files), "ascii"))
                 fsw.property_string('kernel', 'kernel')
+                if has_ramdisk:
+                    fsw.property_string('ramdisk', 'ramdisk')
     fsw.end_node()
 
 
@@ -274,6 +302,14 @@ def build_fit(args):
     size += os.path.getsize(args.kernel)
     write_kernel(fsw, comp_data, args)
 
+    # Handle the ramdisk if provided. Compression is not supported as it is
+    # already compressed.
+    if args.ramdisk:
+        with open(args.ramdisk, 'rb') as inf:
+            data = inf.read()
+        size += len(data)
+        write_ramdisk(fsw, data, args)
+
     for fname in args.dtbs:
         # Ignore non-DTB (*.dtb) files
         if os.path.splitext(fname)[1] != '.dtb':
@@ -296,12 +332,12 @@ def build_fit(args):
 
         entries.append([model, compat, files_seq])
 
-    finish_fit(fsw, entries)
+    finish_fit(fsw, entries, bool(args.ramdisk))
 
     # Include the kernel itself in the returned file count
     fdt = fsw.as_fdt()
     fdt.pack()
-    return fdt.as_bytearray(), seq + 1, size
+    return fdt.as_bytearray(), seq + 1 + bool(args.ramdisk), size
 
 
 def run_make_fit():
-- 
2.43.0

base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
branch: fita3

