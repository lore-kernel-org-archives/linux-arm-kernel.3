Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C48CE9D79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uf5OzsvzLJF7JMEHMJOMsmKpYuDb1ZnOHsvKTOsoYw0=; b=om1Nt60XT2cSasxHfylT611HYp
	AAEPkoQwclIGsJLUaPtvwvPolo5FF8DKVeHXpgoHxyAWVlUBLsZ+dPRRjXOXXDPqEddHkRWQ+gEPq
	CBQd3AI+0eMkyRf+/HTmjD3cTeL6PEvKY47rVXo1Sn2tiMusblRhNpUkFLE/m3HwLx/gWaaMZCS9a
	Zq8iFqTM17TxPPP7aiXobR80/TwwWAg5DiGc1ceR/1a2gMjLHU0ljvq69bMyKyXRaKtSsevxVt+/O
	0dV++FFcIbnVRk7x3AwTFFsmfa6UqoFPAL8WZ4lQK0jKUrH0QXxPEUFNxnqpMR+8DZJ7n5KKnMwvp
	UlQzapAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9un-0000000DUCL-2cZN;
	Tue, 06 Jan 2026 16:28:13 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9ul-0000000DUBS-2PrI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:28:12 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7ce229972d9so649660a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716888; x=1768321688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf5OzsvzLJF7JMEHMJOMsmKpYuDb1ZnOHsvKTOsoYw0=;
        b=MlIzgsiLzUkuBBjTGEwhuMNHC0wB0uSRpS4k0Ley4wDxolUbbF8/XDomWFLbE9/820
         qYwSHqhgqagEDcuXKcNah07R8cqEy19+hBCFw9syPYH0stYYl4U5Xgj9/IoI5YNMWCx+
         3X1SlQWr1e7tORgNrta+uZjJ4zxt3qBewYj5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716888; x=1768321688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uf5OzsvzLJF7JMEHMJOMsmKpYuDb1ZnOHsvKTOsoYw0=;
        b=liq8PKLNV718nSOIkGeVgPluq5XQuMtng02b1sYsDBuJgb8bF9EYy96ujRdSfwpD2N
         Qj6WZ6BwhEF4ebOmYO3nvpYbU0I0E/r6uexBDYNzwOe8XNn1YH0uLiet7cTIsNg4QXNX
         ISq/O/24os2q/cwnsL8j6bLo1FwbYHZM/55WjfvLrlbgtvhlXTOvV5bGC/owql6OX0El
         C9bO3ivNPySVpItdEWpBCUgjrER/ji2f8aeKULll6rRtgSLNcfkCgfDmDGtAZW10Cuph
         pPLiR7oVT00UcYsnwko4DQEvoozO1bFLedWAOlNcsdse+lQbh6j/dJzbQN1UjbGu/ujh
         jDWA==
X-Gm-Message-State: AOJu0YxS1+VzkdK+5gwi7IB7rPjdLmxSokieSLch8n0T8HF2YKi7La2n
	B7Xs6bkncq3uzomKR093++qDbtGTowbEdRwMQbrcjX6b8VkPrZcJRIL+/Is9m9lqdFACd3Cbmx0
	65nY=
X-Gm-Gg: AY/fxX4Rt/OiZdK3U5CVdM/FpqqWMpjWWZGoVWDWNbRLhj7/qbzty638hXcCrJFLoAz
	9naJNkqYi0TXWmBM+RI5awE2XYwy0fHRkuZpk5S1iMXTlwxjhlfayMqAfoikg+Al1NzJiQcwZRO
	ujN5CwKOMgRmE+NVhey2zAItKeXjGwB/h4xcT1+7MaeXuQDBJk677j4J3aH/OwNKgFsU8BqktVT
	jqq4LHRO2A9YzGs4kO76k3hEfa2LHfEYknO3qss0IC+Kq1c9Z6IR66UPOqoueTMxGLfo4G4tNUA
	XlrCFaxfdNu/TN+s0AkPs4pjkOhLDO6Si3INWw+0dZtRtFxwh62ur9f2sA8ZXoEyHp6oCEJ7mxK
	xjMULe5Rf9R3pdVzEzc54cH7nOsUes0hzyw6kS4CNIIole4LgzsEkXUY7HVkkfaglxZ6lrG3ngf
	ImIz8Eb78vpxVNy6Y=
X-Google-Smtp-Source: AGHT+IH/uW+Dz4DHkg+DggfheF7JxW/x4X1apiIF05eXk1K0Su+uOEmzpRUhIyE4LvK1n4GcV+KuyA==
X-Received: by 2002:a05:6830:2b26:b0:7c7:59ce:d195 with SMTP id 46e09a7af769-7ce4669d7f8mr2356558a34.6.1767716888521;
        Tue, 06 Jan 2026 08:28:08 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm1630951a34.15.2026.01.06.08.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:28:02 -0800 (PST)
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
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/6] scripts/make_fit: Support an initial ramdisk
Date: Tue,  6 Jan 2026 09:27:32 -0700
Message-ID: <20260106162738.2605574-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
References: <20260106162738.2605574-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082811_631219_8E28A923 
X-CRM114-Status: GOOD (  24.51  )
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


