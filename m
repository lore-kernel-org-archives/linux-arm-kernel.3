Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6AECA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 22:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOXwCCejcKBrIfA4NCnEQXNnW7uiwgmDLBOmUw1NLdk=; b=gqO1jk3U9yPbDUhtuwhMOskzWR
	xgOiACLT4H8qhUNaCqPqVpHBnbBX+Ij4efz4dI6usrMX127svKRYCDaQEvS/nUM5cRW2XFOcyfdAK
	ad0ehreI0C04hsMxmGysrUn1qT7GFfL8VqrnTJ4pEkX+ty360zZfl3dOqM3qmFx3OjcYNTL7Dn1xN
	k6zIrdkyPuL0pOjUT7rYnkBXaDiRbA0Q6iuKeNN8R7kyvUR6erycpoFvRt6f1vPUTdIlQGM51cVVT
	qjVE6sThh6RPvv+CCMl2yCIFY4oodE5IpKkrrg/cM/UIw79H+kqkAhCUjaLL2vNifQGZa/T3iGXjA
	p7pXcUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLG-0000000BfUK-2PfM;
	Mon, 22 Sep 2025 22:49:06 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLC-0000000BfRo-1ZLG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 22:49:03 +0000
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-78807cd2236so738950a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 15:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758581341; x=1759186141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOXwCCejcKBrIfA4NCnEQXNnW7uiwgmDLBOmUw1NLdk=;
        b=W7MjBCFxF/gB4goBuz4TC1FZFhi+bbBWADahmeGYhJZry9az7OiNT19ir4Bz9Kvn2V
         bPBHxrRPfo9G/vcVJX4zTJDshan8Rp8YgxGPcdDWXtKfxWsiIfC+3eMOJHamxlxRe3GG
         +NEkfEgqswOHOc0+OtU9scD7ulLOk1cnsI6/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581341; x=1759186141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOXwCCejcKBrIfA4NCnEQXNnW7uiwgmDLBOmUw1NLdk=;
        b=OLaY33MGftTewDrKt+lISrWV4CmC8QIo4RtXPW9dQPvzdYKdhF81cYWuxLaDyACDfb
         kcYtDoTt4xKVIMVvlTlX9DVKGzBno8ixfb1wDoHkMgP5mNQsZTmLAkO9Sj6GxhAAsJta
         HvKOG+RgKqPvCczUIFGayNBAQuqRKrim0ktZA8xPgioZKckC0MRY5ScJc/XbuiEUMjXP
         /gedDv2aGWHVxN2wjVPtydfu3jIoZdmAbuKXs5WmsBjte5+UvozSpOTh19pRYjc4d/Qd
         5CN7R+3ZENqbIDZpXloLN4tCR9fO0gCspF4VAUksPI+XjSGuKad8FjwOR1tEKEwnJa9f
         UkFA==
X-Gm-Message-State: AOJu0Yx0TV4hgkbcd4vd1ZschHQq+V5xK6ubYkSWd1YasSPsNZ99Qlw3
	bq3OtEiT8LCzFpJSpAM0pAkIHJwAleQ1y0AA2NgKpLm9yJifld0vl7gaRNvC/+esykX5ZxGJK0q
	V+/6NueUD
X-Gm-Gg: ASbGnctSQwheq8+vg5W/ej2eD2yvo7TLkqxNLG3CR+bvv5w3QyLOY0+A1DNbQ/XT5zd
	UeYgjhj+IkyN5zURclJxOF+6nAlC/JwslnipRsJi8FtNxGo70RV3q6Odr9oyqqUpgAFlVI+Oxid
	fPPSrsB7OyEAnIoexDx4KG26nUjUj2npAMcwIwLuiC9beMGe6VO9YhtmZyU2LEf7Mw9hWDj2wFW
	NcAmDCrxI9D+APgfjNOXHjvdHgbbl1PDr2HpfGAsBmdKydeNDBE5tkmYzHyb8gNXVlu0sKkW+B1
	OHfFuLjR632BYbjtKcYdJ5q3b28yd5H7oDcsB2czarx3Ec8xnJvRNzQlU8OJuSyQEJEzTM1cSTD
	TtlcScJfrbuW/MEmIG+1mTxstS3mC3g==
X-Google-Smtp-Source: AGHT+IH7aeCy7V7yxeefrZ+BQ98k0yxMlTaw4kBkTCoAqDx66tU/rITeRorM6VHTncpvp1L7tlw3iw==
X-Received: by 2002:a05:6830:25d6:b0:753:7bce:64f0 with SMTP id 46e09a7af769-791472f7aeemr292744a34.3.1758581341059;
        Mon, 22 Sep 2025 15:49:01 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-78780383017sm1167244a34.37.2025.09.22.15.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 15:48:59 -0700 (PDT)
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
Subject: [PATCH v3 3/5] scripts/make_fit: Move dtb processing into a function
Date: Mon, 22 Sep 2025 16:48:30 -0600
Message-ID: <20250922224835.1918759-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922224835.1918759-1-sjg@chromium.org>
References: <20250922224835.1918759-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_154902_426494_FE434F11 
X-CRM114-Status: GOOD (  15.20  )
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

Since build_fit() is getting quite long, move the dtb processing into a
separate function.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 scripts/make_fit.py | 67 +++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 23 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 984371f505bc..1a74a9dcd85e 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -277,6 +277,47 @@ def process_dtb(fname, args):
 
     return (model, compat, files)
 
+
+def _process_dtbs(args, fsw, entries, fdts):
+    """Process all DTB files and add them to the FIT
+
+    Args:
+        args: Program arguments
+        fsw: FIT writer object
+        entries: List to append entries to
+        fdts: Dictionary of processed DTBs
+
+    Returns:
+        tuple:
+            Number of files processed
+            Total size of files processed
+    """
+    seq = 0
+    size = 0
+    for fname in args.dtbs:
+        # Ignore non-DTB (*.dtb) files
+        if os.path.splitext(fname)[1] != '.dtb':
+            continue
+
+        try:
+            (model, compat, files) = process_dtb(fname, args)
+        except Exception as e:
+            sys.stderr.write(f'Error processing {fname}:\n')
+            raise e
+
+        for fn in files:
+            if fn not in fdts:
+                seq += 1
+                size += os.path.getsize(fn)
+                output_dtb(fsw, seq, fn, args.arch, args.compress)
+                fdts[fn] = seq
+
+        files_seq = [fdts[fn] for fn in files]
+        entries.append([model, compat, files_seq])
+
+    return seq, size
+
+
 def build_fit(args):
     """Build the FIT from the provided files and arguments
 
@@ -289,7 +330,6 @@ def build_fit(args):
             int: Number of configurations generated
             size: Total uncompressed size of data
     """
-    seq = 0
     size = 0
     fsw = libfdt.FdtSw()
     setup_fit(fsw, args.name)
@@ -310,34 +350,15 @@ def build_fit(args):
         size += len(data)
         write_ramdisk(fsw, data, args)
 
-    for fname in args.dtbs:
-        # Ignore non-DTB (*.dtb) files
-        if os.path.splitext(fname)[1] != '.dtb':
-            continue
-
-        try:
-            (model, compat, files) = process_dtb(fname, args)
-        except Exception as e:
-            sys.stderr.write(f"Error processing {fname}:\n")
-            raise e
-
-        for fn in files:
-            if fn not in fdts:
-                seq += 1
-                size += os.path.getsize(fn)
-                output_dtb(fsw, seq, fn, args.arch, args.compress)
-                fdts[fn] = seq
-
-        files_seq = [fdts[fn] for fn in files]
-
-        entries.append([model, compat, files_seq])
+    count, fdt_size = _process_dtbs(args, fsw, entries, fdts)
+    size += fdt_size
 
     finish_fit(fsw, entries, bool(args.ramdisk))
 
     # Include the kernel itself in the returned file count
     fdt = fsw.as_fdt()
     fdt.pack()
-    return fdt.as_bytearray(), seq + 1 + bool(args.ramdisk), size
+    return fdt.as_bytearray(), count + 1 + bool(args.ramdisk), size
 
 
 def run_make_fit():
-- 
2.43.0

base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
branch: fita3

