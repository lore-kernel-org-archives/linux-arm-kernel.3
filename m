Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBED3E8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 14:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uf5OzsvzLJF7JMEHMJOMsmKpYuDb1ZnOHsvKTOsoYw0=; b=CrUOKqpF9tJfjqbi+Rq/5a5Dez
	trNwQc+XHizy/C/mL/BkKsJz6gIFrauxGxFFuWpbxRZ5ZjYriIqBG8Wrl95xlVQZgAddNeRO4fJ49
	UPQkvhlk0UpGcsTMJNotorATKvysuEyOZKjTkHtsKkz7y5sXDfFFfJTatuyWOEjiOC8w8R8gIG4n/
	BrsS92xOLRWUgGOMQ4ZU1HgnzfNe8xhMi+VX6P++Iy5CiQFhtAc0EdtRkdAGF7z706+fits/I5EQF
	ZTcMH0GvZ1kE2fd5gZD5Nj48HfyLm9ab3QR2Alhq1i50CBt3DtBnAc8mgDlwNaRkUjrtrp9Wl6A7a
	jUhLY11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBc-000000021Zz-2lNg;
	Sat, 27 Dec 2025 14:22:28 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBX-000000021Yi-1FwC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 14:22:24 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7c7bfba3996so4680250a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 06:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845340; x=1767450140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf5OzsvzLJF7JMEHMJOMsmKpYuDb1ZnOHsvKTOsoYw0=;
        b=h7Vnl1D3D6lCH/0MpwSbnxAcY/HXG3SrnUVkE3nMOGyISzJMXA9DMLczwgfNl43Tuw
         CblfqlWnuZY/S3HLAPeIEjwVl0Npk4kVxjwJQsS73dMFOcbfToKhZkAWbRnHlQ5OUf1v
         UQ1tTAI3gyZm2HgkcB29rRhZtk3j4MA6lbs7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845340; x=1767450140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uf5OzsvzLJF7JMEHMJOMsmKpYuDb1ZnOHsvKTOsoYw0=;
        b=tJnIjrDQXUI6qFPJo25J4I4rrf8ilyBtUOesrrSZhJJRt359RpERdJWBwNDC30QwvT
         9+D6w/dATK1jMiO8R1/zcQGoo0VJHxLMuHw6+T6D/hOkuSelZ8g7loMb5XjNGyC7VnYl
         AKvIfO992Qqla7EhpFphSuE45ZE73FOKusytS/SMhAXneOaO4SuROTEQ/l+oOkwaQgg/
         0ACi8OA+jqNL369rrbb/amGdeIHcw1kqMoZlRS2wM6BcPjRONG9HHn6V7Vh2CnNht9VH
         uayeAC6d5IIUKuEg9FTHuFlXUkLS9OD8C3eABvV7eVb3Dc2tbnJmMsuomRKAwlskWqRS
         FYdQ==
X-Gm-Message-State: AOJu0YwOD3XbYLAA7hoixZM5Yd+BUJefXwkQ/iW3ZzRbkhdJzmR3XG0/
	5uHykch5kNiRhNzibi7963iSJd8nzayY7tCWYbvxFZNdS4cRhTXBaMSn+BBy+KVtK6fYemcTrmX
	pTFM=
X-Gm-Gg: AY/fxX4Ki5xmPR9xl0ekhRxew7BBjmwgV3T/LScNInm/xgE0gliapM/+0hfUJqrzcix
	K0MpvPIvam7esVZ74HgcDs/fNz+zZlNaKp6YvLKROaLkCWpmhxmNWhheRwyVml1tufcQPHfvydY
	mtw04DpFwf6/IRVjOFPvnInmCGSCPBtBOOGF1zWtDg8jT6AvhLjglwp/KJxSfvYbM77dLGk11et
	FZ4HtH8YTn3CloMiG9dUcBeof6r6TWPDeF1ZpohqS/dyf1QOmyIXQAumXCYIW/ZRUOGAhE6IMMo
	tOB8rdWkUEcLOQeU0CJofrygKk1jw28F69tRtNk8IJHNES64cIcUzc3NxYIiiiODUqcqrNVgz3l
	QOidPuN1JnW7GrpynbPIHGPaVE2wetyR7aOTv8AL3CXhO/QXW/82eVhrT8a8EcuN1y68cb7wXFg
	Gj2VHq
X-Google-Smtp-Source: AGHT+IFB9fWalUcUiO3rdGujfqPvSy2uyVV1y9oBi7yYhQ7EZmFI5catOG8/EQRfew7LrIG6+51fPQ==
X-Received: by 2002:a05:6830:2b2b:b0:7c7:701:fb10 with SMTP id 46e09a7af769-7cc668ffd39mr16342194a34.7.1766845339868;
        Sat, 27 Dec 2025 06:22:19 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66727e11sm17352660a34.3.2025.12.27.06.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:22:18 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/6] scripts/make_fit: Support an initial ramdisk
Date: Sat, 27 Dec 2025 07:21:46 -0700
Message-ID: <20251227142200.2241198-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227142200.2241198-1-sjg@chromium.org>
References: <20251227142200.2241198-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_062223_351928_EDB50438 
X-CRM114-Status: GOOD (  23.77  )
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

FIT (Flat Image Tree) allows a ramdisk to be included in each
configuration. Add support for this to the script.

This feature is not available via 'make image.fit' since the ramdisk
likely needs to be built separately anyway, e.g. using modules from
the kernel build. Future work may provide support for doing that.

Note that the uncompressed size is not correct when a ramdisk is used,
since it is too expensive to decompress the ramdisk.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---

(no changes since v6)

Changes in v6:
- Drop the load address for ramdisk, as it is not needed
- Bring back the ramdisk 'compression' property, set to 'none'

Changes in v5:
- Fix 'use' typo

Changes in v4:
- Update the commit message

Changes in v3:
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message

Changes in v2:
- Don't compress the ramdisk as it is already compressed

 scripts/make_fit.py | 52 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 0f5e7c4b8aed..66cd73711506 100755
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
+        fsw.property_string('compression', 'none')
+        fsw.property_string('os', args.os)
+        fsw.property('data', data)
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


