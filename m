Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ED8D41C3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uf5OzsvzLJF7JMEHMJOMsmKpYuDb1ZnOHsvKTOsoYw0=; b=z/XcznAPofI829dT2X8pOlqsHN
	cilv+2P6GciHYuiEMYJSX1G+dNl4mVmMBqz0TrCKPqXGb2mtaOqZJQOpRm+bYhVF4DvvSI2CgBNd8
	nHDAEzY6krSErk062vBNpafj5ACj00W0xviZmfCYWsZ8ylye4NDnsEmisgZ3CKe26aZZAfIRUC7is
	jEREnFcrq0PNJcMDQEh43kylV4xh+mt1fpvQ29cfOvl8lBh4BsgDknpE8qy/uUWFw+xO3n/E6Ev3B
	+7kOz5ILA7l5SyWHS2VR8hn83O9xCZ9DCQEnLGQwVkKKcP312caxh3E9vJV1Qlc9cC+qYzvi0cXJr
	djh32dMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGm-0000000GgmF-1oZR;
	Thu, 11 Dec 2025 14:03:48 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGk-0000000GglK-06G3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:03:47 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-4557c596339so53803b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765461824; x=1766066624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf5OzsvzLJF7JMEHMJOMsmKpYuDb1ZnOHsvKTOsoYw0=;
        b=a0cQOH2x7HzYiWC/zokgjcx0k5oA863g+F8JXHnBpNSqNZb92Kt3EjcZG/mkpz3P6z
         57cq+Hl14NHPv0hUZZD27GvmBCmJDUXA4pkduY2wO7Be+Y1JYF2ePpvE3sFQw7RWHMSR
         iEzxe6LpopW5kIvrUnUIl5BUGrdGaEZqHr8R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461824; x=1766066624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uf5OzsvzLJF7JMEHMJOMsmKpYuDb1ZnOHsvKTOsoYw0=;
        b=ceXUhio8tGmdLfovR+6iq+JDafU/Q8+f/i1iqPivxpNzn/3ptPyhaSsTVH27HdTyub
         BUyBbh3y7Y8x4ZOEmKU6HXLFW0CXeVcRECfqjXT094TeQodimN44HrH2IfxwTdmNnuaE
         7rr7ayOX05DOrFyfZ29z3Swbb4QFMvdI7Zl/UX04HbjLJo1ekENu+U3/t8OCJQrOdUuG
         N8wpLX0+zJZIT+Aaky3gtoNXp05FmxyoMmxShTXOlPord7LMUG5widjFzSrL9s7i/dcI
         3XMNa1gO3GTxBeFwHfyWfBC0iB8lfbIPHoL8kar4lDwoTqwpxwd9HIT4+0RuNaQjMyz2
         TBkg==
X-Gm-Message-State: AOJu0YwHbAmBPkC3thIkclnau08F1dA94NMzcrMnp095xQ/97viH1sFU
	3DNXiE617eKJoTqiw0pNXvmlFz+kL5wtCqmXe/JgbQjpvgVRdlEm+NSlWZnjA5rNq2XeBsJU/pn
	DC8c=
X-Gm-Gg: AY/fxX4LUH9tcx1mIuz8n4My6tjGr4oy0szks2G3m/DYmQGjMqYHfMXD6Xnd8KvLEM0
	lS4p1W9LUmRUKsyNtRgO0UCf690Ssngqaf9fEhbxjv33oIMPuhkhlIStT0VVPZIOuYu0d02bZXC
	a6rZu2P1pMY4DNTY8nW/XoWL9cLSVhmuCxFs8IwqMDJ/2wgB7cEkYqXQK0TkgDt8dme5UF12CGV
	DWWaWOZAGQqQT8pVu2SYAffzSNVsv21Zn4sbwkot1/bPizEux0YFsDyUQeQYDNI2Or4KCA1VMN8
	F5qVItT0P26z/KxsHsacrHD7J/pJdba9lHxbWacpFBL8QKlI+PZPr8VXJxlYVg+4iwFm+ufdJyC
	Il41rgOehTzxNeBbSTvtr4A32sDWao7qe+gueVJQit+VIxdQskfAQ7d3CWelfWNyZx6Ss/CKtvl
	F7ZF/M
X-Google-Smtp-Source: AGHT+IGAhfe/8+QVBKrlzKF3W05U1ybOZGuxX3rXL5y843UymGBcnVJuY3dUEiFiCqu+eUImkPT9HA==
X-Received: by 2002:a05:6808:1507:b0:450:d3af:ba4c with SMTP id 5614622812f47-45586723052mr3049979b6e.52.1765461823858;
        Thu, 11 Dec 2025 06:03:43 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598d6e789sm1130030b6e.22.2025.12.11.06.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:03:43 -0800 (PST)
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
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/6] scripts/make_fit: Support an initial ramdisk
Date: Thu, 11 Dec 2025 07:02:59 -0700
Message-ID: <20251211140309.1910613-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211140309.1910613-1-sjg@chromium.org>
References: <20251211140309.1910613-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_060346_075725_4214B49E 
X-CRM114-Status: GOOD (  23.53  )
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


