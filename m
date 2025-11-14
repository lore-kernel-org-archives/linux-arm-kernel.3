Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEC9CE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbwiEPUMKFzWHVRkANDWXLiE9C+Y1AwxTIo0xTKShXQ=; b=SQIhvIcPAX7Bb2dBoqBT8KOJ4A
	Oa4i6NtgtMs1wV0pi6EcrqxO1BRMYhckHz5A94a0T1mTUM6jArUylrM5XmUhEqdmO5owhhKPxISIk
	H0rMEhHDrx4bbEXpX/IO+N/FrKM7JmNPdWIvyUkkvgqeYYwWbix7A9Uv2KE2iItk9pOCFcVIJKyun
	Bl3aAAwS8rX8S/u9lJumxL1QkXCKsG6jyqR2I7qlqA9vsKtZu62MtswoyZDzUwVM1Cnv7Ku/G1vyu
	TSXlJc6Z2hV+vDSb5G8Jls2rGb0+MIOAGSRwVOQ+zIvIlFXU62zWSulc89465lgbQl5CS/y+KFPz4
	ttAMMHUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumX-0000000CMrE-49t0;
	Fri, 14 Nov 2025 14:28:10 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumV-0000000CMpQ-0CXz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:28:08 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-434709e7cc9so9991565ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130485; x=1763735285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbwiEPUMKFzWHVRkANDWXLiE9C+Y1AwxTIo0xTKShXQ=;
        b=HlLLxPZZ6pNjM6F2iNvqryPObk39aoxhFU9twEUrL+GQ8WACOhUC+lwJQNcFT8rQfR
         6M2te18pFyQNfx3N0QFHyJ9aobhJ14lcjwi06bezgcKasQm6oON5GCwKd6q/0xR4FvnD
         zgtvcYXDGBj6XIwBoYMgEav+OG8xi1N+iwpl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130485; x=1763735285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbwiEPUMKFzWHVRkANDWXLiE9C+Y1AwxTIo0xTKShXQ=;
        b=rsW7qOJXPZ1Z+RgpWp4E23vuSrYuB/Jv1hMYeZnRfSLvUeyFUTfXiQHW/EyC9jPu2X
         nTDi5UleSO6kuiTr/r9+50B074qoXIReo+v38dEu3ZLoxf8jiviLNFviHKL7vUfFsbV1
         9LLc76Pf2JLB/AeWypmzXiM5WiN0HwDDtwMsT9KIrgTSqaz6QybGw0Joaj3ZFcQobPxP
         utQsEzha5/lgtmicq8j5R7PME6NgXQC3s7/8HTyY2C+n1C5pX8ZcByIjdpbHXJeFBD2u
         LmaV2gqOq3+W8nv3BbIkXX2GGZ36jnn4d0ZJXECq3n+M4loPY3n/Wq3asBAn/C4e0uKL
         bGTw==
X-Gm-Message-State: AOJu0Yyg7bqNhR8ifJ8QPsKqYXhcN5Dvht1VLynMH9kpvYYE9cQZPygP
	Zh7PIzfiWoH+KHIEENWbMkrDHtl9ZkE5D8mHaBJA08AgNF/oyLLp0fcjFUzM6xRSiudRo1B8ny1
	7gig=
X-Gm-Gg: ASbGncuaPcA7tPnfIIMkl6AzXiUHIzb5LhWqhugcFGSQEnHDbqxvnu3qlSamjmJExyn
	FEG+3w9ixMoP82OlcGbKO1XxT2r9hA13/+/smrnOTpADYB8x0M+gqjF0B1pfxGhfbXl4uTcdpb2
	MtL/P2ygq6+oDGjURj0qhYrOcq6r6brG8sqzGVf2Em23xVsinctPFS6o6b+BnpHp8WvinolZoLo
	Sr5KM/cnwkD2aUwQnumcqBy3Bs0c1DXBB3N1TtPsSC5a2rnqkHnQ0t5ggq0xmIuHFAg6+3jHUl0
	LHp/+hcDczmCWSD9Km/F3UOo6K+u6+nxFwuPt0ITbR29j7DpnbV3F9++QP0EQKbPMRjcQkZAx39
	GE/WSTtXBWBVbRtAHb89iKFdYPMOkZO86zmKC09mjHeeEw378+BdKAARDj8ak0kKOTnMVzhGmny
	H7+275
X-Google-Smtp-Source: AGHT+IGsFSLfQsHTQySP1q0sttqWWUuCQB9YY1khd7e5giMT7AMOylsJY1uQiJSgSiyY72LImJOkkQ==
X-Received: by 2002:a05:6e02:3090:b0:433:7a94:6fcc with SMTP id e9e14a558f8ab-4348c8503camr48779555ab.2.1763130485241;
        Fri, 14 Nov 2025 06:28:05 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:04 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Simon Glass <sjg@chromium.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/8] scripts/make_fit: Support an initial ramdisk
Date: Fri, 14 Nov 2025 07:27:28 -0700
Message-ID: <20251114142741.1919072-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114142741.1919072-1-sjg@chromium.org>
References: <20251114142741.1919072-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_062807_118976_74B72426 
X-CRM114-Status: GOOD (  23.58  )
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


