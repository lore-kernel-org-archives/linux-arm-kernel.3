Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D40DCF58C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+WQ+WlElZR6b8foj+jTnRrBNTpepaWdsCyG6VTxCeY=; b=FLY2FapKL01peYwNq37OIPC4Mr
	7bh6YRYWBpMHpByu8YQV3XExaKqPmIx2wpcNYCmpnHSsyHaB/9zBXq13uShpUW1VPj6ri9He3rbFk
	IAl5GBS3wEE1JaMeuJ92VfhvMqw/UPa1j5pXSzhQDvP2O3jUkydyQFUzvPU20j5TtD0VQkt3cBqg9
	w+bybwRTcOFF8BBzURKgSiH2Q9b2XZ6Y+yI6l5j/rPu//WifLjSjdjP5WdYfX0MEEYmAmlLBEMdOq
	fuFA5N0u0A21jwbFY1iaatXau5ZyISFUe/7HX3Huu/z0pTpfLVxY/S7q4Y/g9GCNpfuTgKJPKIcj6
	AHpTcVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmh8-00000004TiP-1vhI;
	Wed, 19 Nov 2025 18:14:18 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmh0-00000004Taw-3Cge
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:14:12 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-9486248f01bso530439f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576048; x=1764180848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+WQ+WlElZR6b8foj+jTnRrBNTpepaWdsCyG6VTxCeY=;
        b=kvBB7eH7+4XgAAZ9SK9SCqwrF1m40C5NqYVS+fqz8+CUDSHgXc9AoDe4GrT85qyDXR
         vRpaWBiLeZi879Bq5O+J4TZLPX3AACue2LIJhBkP1TYe6Nrb/Gd7to0hjH/TM7p4KjeK
         fG8Zvb2cWdknEiwNauu6k+CNFijb9LgHYdBug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576048; x=1764180848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+WQ+WlElZR6b8foj+jTnRrBNTpepaWdsCyG6VTxCeY=;
        b=ULZpjDJUsyl16Ir0miIGcUQE+5aoVA/3QfcgY6brFBJu56G83ZRISqp7tNaiARvbGG
         e0s6FrKtJMrf3J/Az5SYgguiWyiwLU9/2qL2DS6Wb7JbaAxe0TH8ybaTZBYo99y1xNs8
         hW6OcWxhDc060Xs1IsXp0JIojVXrjBDZN6AKcCBG6GA8mp/q+bMDpYLbxJhUuWlbM9V3
         xn2mssfVxSEPLyksSeya8G8aEab2PaAR4xiO6fEBD4ENK7Lm818gpMapEQGp/FpTUfjC
         GW4w80jXSBTtwtUz9vVwlPg1Zjxh7oeHssX7aDGPQMXb6vbopjcfye8SIYG6l1J+pZqC
         emgg==
X-Gm-Message-State: AOJu0YxjH3Ix1iCAY/36v/4RyvCQtD2ezUTIbvsAU6sUwH5wfyiaMhM9
	Jk5GPPJwglKddH+VvqL3pPZO6bGFweP35JvazA7qojEXfHZQjqOQgjsHCwTb9YdIk/UAlolHakX
	E/zY=
X-Gm-Gg: ASbGncsJN11rRzWLFwyAhcr18TZ6FHSYE2gPrMSLWJwr+5T7YTln8BlxzYeP7l3u8J2
	M5TeQGjTpHkLAgRDo/NjmIPMgzCVs2I32Wkyq1cwXR7LPbGi+FjVm1AV/NbhJSAqjIw7o/z+eMZ
	ASq6XSyROQOJP7INn04iSqmQpU2X/Ttjyyquy1CAAKo9EvYd3f6XDo16XC/ZuztZRdaWC1adEtW
	54pwXeSEeJgoyuX/50eN+2HI+j3ZNovdLSM0WjwtPZbmlWUrltT6dXXr0OTYY8iY246ukrprDKy
	wmnTZgJ9sxKJakA6slhjnEYcW8XkCoDTgyLwDPIh1CFQ8bJqGjQHdGQGoKCWqOq8jGsKGHeIbvb
	h8rBB85r3RNC0L2eQJNkjlgb3eN+tMd+jxMSYoaxfOmHUtjcqTyE4vYI+24BHPN1EQXz8g+3aHM
	SY+93RITx+RMYcXf8=
X-Google-Smtp-Source: AGHT+IEWVC1WUvwuvE7gE75ZizxaJkg7b27WdqYa4Fj1cP88bi/r3Jqe9CCCTezK2EVjIde2401KXw==
X-Received: by 2002:a05:6602:4913:b0:938:9f22:ed34 with SMTP id ca18e2360f4ac-948e0d8eedamr1676190439f.16.1763576048598;
        Wed, 19 Nov 2025 10:14:08 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:07 -0800 (PST)
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
Subject: [PATCH v6 3/8] scripts/make_fit: Move dtb processing into a function
Date: Wed, 19 Nov 2025 11:13:24 -0700
Message-ID: <20251119181333.991099-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_101410_821124_A617F1AA 
X-CRM114-Status: GOOD (  15.47  )
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
Reviewed-by: Nicolas Schier <nsc@kernel.org>
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


