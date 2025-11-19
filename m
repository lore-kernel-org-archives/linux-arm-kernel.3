Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5978ECF58C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGHNU0Y9qZ5AJfcI+Hz5PCDOOAK0uiMHY3/rFUZcMgQ=; b=cpmrN56gm4ycJGWoT3/n7BkT1W
	5iW9tP/TaHsly9usW/Mfa0flTTWoXqrT40Zukk7TfbX9/TSPlcJIPrAugZjr8EbN2JcWQBr9x4K3T
	SWShMkQzKnR3NUCRnjokD8GPIsBxdDpKn5h9Q8QbVlmhqpH/9/Q7KZDFA3Ioc7vGGFL0EaW6uBKnF
	vCiv7f1QzewSGjalMapiDaFaYqMz+0HM54unGLjtZTdnzPU9LurkIMa47G3IIVBhdDrHwyZJ4nUTd
	qnRzjYrjX4z3MUd0ZEBrXjxmPVWALk9e9QNlCjqRF32Q5EVMPz6ivawFqext5w1en4fZC63f6CPVF
	8LuVq3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmh2-00000004TdH-0jat;
	Wed, 19 Nov 2025 18:14:12 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmgx-00000004TYG-25zw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:14:08 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-948e1ec34afso217487739f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576045; x=1764180845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGHNU0Y9qZ5AJfcI+Hz5PCDOOAK0uiMHY3/rFUZcMgQ=;
        b=V9PLbURaTXVM5WatvAMEsu8f7Dt9nE4HH11LenqJ6FgWFyqDKIcfBa31jn6LHKVnPO
         8KAV3motiWgbTpEdYttvmo8kCOT58sndaaZeLqXyhVkPrDLlnRpDqMb+8MmFhC+Yk293
         OODGBLbok2bQ/eNZfkso6mwIQ9eVCtjhBQcDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576045; x=1764180845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vGHNU0Y9qZ5AJfcI+Hz5PCDOOAK0uiMHY3/rFUZcMgQ=;
        b=KJLML5XEa3m0olC9dj40YFeUd+TAPjPTOurSsmWEHDQPjAwGUHJFXcTNlc3fvD6WcS
         F80BUEdq5vwXZWL1r1EdTm0QvdrxCO/acMd9KI9K5hmNbXrI+tdwvCoS5uQDpkeuGNfp
         h1dS5y3KaRanhzJo4en4YUoZeJuAqqvqTU+sxkrkNHcUWnANTMIwNZ4sOhX+8lvA/PJr
         JKohFVzCPw5EsKm3kTnkCkxy35ak8Doe+3UA5evAhUcA5yrZkGYLn+QEGe3DrIph3Hr8
         r/V5nahxJQOQUtKBv0wM4D+466enInxCurXcu/6/Ec86cBS+E8m630xM6+4igwYuQRCQ
         GYKQ==
X-Gm-Message-State: AOJu0Yx+aiOVb2lnr6w9YZTQUDtMIdqHDYD1G6M3ZJ30GGv8waRM/oz0
	08ufK3RB9IgRYjyBxrTPXHUAKK2iYKUM7Q3x9ubATpYdiNAakM6kuFY2/qy9GLWbJ+/v76QaKM+
	VjnU=
X-Gm-Gg: ASbGncvd2Bh1iQNsBLS1R97AhcsVv4iN5+vIHYmHGkqGNYc18A/Arh3qiTl2t/7rxT4
	Bn0DjDzIkxSsb1Ev8TFlOhwXQ8Z85eTHgEokVtAUxtumj8VlQ05haK43e46NI/XoGs9qg91OwuF
	Qmj5YQmgJBXEKz57evJO1aOvNbo2jufcp3RArT/+2fKC5wyDoA8sYOjlmFVlkMPyfaCxJ0jMIQ1
	NnCnzMqk0bOgm9Ekhn5QnVxjJhKX5t05Ei3AEY+CtHHsw3qHB3rVxQnJNuPuIxmmK/G12bWFXkY
	pQG6poYRO76/4Sv05BQHOAkfDTUnIupMmTWnEwdvwdkrO0PeDgwBDNWZDlfJiSj4MsxZMa8Y+PW
	RJITgb5DRjr8jAbci2L3ej5phEytsv5Z9jjLiKSxjkAfdKdicIbxzXAgqC+nkoToFxOU0yDVq3d
	DQHKrlW7ai7GOI8lQ=
X-Google-Smtp-Source: AGHT+IFizsIKzcR3jkJP4zRDwTEP7H8DQprwvCzIj1bXPI84SnGAVfnAaADLyypxEJkbDennAkqXxw==
X-Received: by 2002:a6b:4e19:0:b0:949:3623:dc25 with SMTP id ca18e2360f4ac-9493623efc5mr107582639f.13.1763576045401;
        Wed, 19 Nov 2025 10:14:05 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:04 -0800 (PST)
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
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/8] scripts/make_fit: Support an initial ramdisk
Date: Wed, 19 Nov 2025 11:13:23 -0700
Message-ID: <20251119181333.991099-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_101407_585073_BAB6FBAA 
X-CRM114-Status: GOOD (  24.47  )
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
the kernel build. A later patch in this series provides support for
doing that.

Note that the uncompressed size is not correct when a ramdisk is used,
since it is too expensive to decompress the ramdisk.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---

(no changes since v5)

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


