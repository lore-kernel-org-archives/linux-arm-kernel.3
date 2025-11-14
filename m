Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF0DCE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+WQ+WlElZR6b8foj+jTnRrBNTpepaWdsCyG6VTxCeY=; b=h2jL35U8q8OlS63nnZ8YhSR6DG
	yXgODPdt33IUx8H7XZZ7JuoOGMv8WwjbN/9sZevyz0joqXEA77vO5URU35AsqL8mEHan2JFlswUOn
	BHxsGT8lbbfSdamGsF4f4OBrIYBcsqIEj40+OZg8k1s65lzUgcXMCy0j5IB8V+ItDbFkjqQ0WPlAE
	oqt+B0ueujGqZ8nQkWoPHFFfI4xBo5xXO8gps4egcqh9FrAlJX4oGiFa4sq4v+lDeVeKqImdsrLfC
	BDDcYNb9Bb6xcj7GGOHapkLwtVBSg+NmbVq1JdwFStDDfvyiJ2SabxRJhnqVdBt6DQTfVUcWVQZjJ
	lORp0rSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumc-0000000CMu1-1Ffa;
	Fri, 14 Nov 2025 14:28:14 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumX-0000000CMqS-02s9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:28:10 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-9486b567baaso159706039f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130487; x=1763735287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+WQ+WlElZR6b8foj+jTnRrBNTpepaWdsCyG6VTxCeY=;
        b=SXuXwxMvIPyElDtHLu590AdTnqFeYWxeaCZ13bOCaDOLm+HAwfNnw6M2nS8p+9OiEG
         i4cjvXqopmtOKsVMjShdfyKdupAQh1e/5LFJZ0Ozsj895wtJkdnvrTKQNL/JsjH0YtqJ
         9y2e4VlAcf9yVVqaEu+8qffCmEnGT6ZlwNOWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130487; x=1763735287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+WQ+WlElZR6b8foj+jTnRrBNTpepaWdsCyG6VTxCeY=;
        b=q3/gT2Gk40dN7cp6ijlEePDznSrugO659oudjAKD4l25xPqgLZ6SEy9rt3vZkRUDo1
         BemUZ2/3DF7EG4euiVP2DLDs/wPUNmBBhhgDMAGw5DCU7akOOAAMXbZZVU7oKxXadCO9
         eSUQe3LT3ZlcEJhYaVmKnlMy4K3uyUFqelD3enugmWG+jjGWtvtyId/jZNIw3MpBl4bF
         CA/MMYkSdXzOHbeUk+UHcjef5LkwzJqZ6w4rZV5DXqFsX3zEdaaZawJvl5JnTfIAey9h
         4pjoUKX7iVBiKhri1QIK0kt1w904t0/4JGpFDtNtxjRNjjiC7yCTqRZZl8wa85QL9r0U
         2i7Q==
X-Gm-Message-State: AOJu0YwU9gLORecSxYHf76aGLiHSyCAM7yiNB1KwUG6wke0e6jBNLLGn
	MnSdNYlQZ6U1lH0CWlQoZWoq9DxJiS/K02Jb1uits+E+Dd79kpV3s+Y6qexUqzudkQMzqnnX4Jk
	Y/G0=
X-Gm-Gg: ASbGncuqp2bufhsGcsphB0cLE5SW0oV0GgvPMa6MRdvThj3UPpIshNq5a8/nnkvCU8X
	fM0tfMpaqXbeAlt4Ro9oMUUxismjAw3mNApANzjnHUh39R/epOp7c/0/p0OfOaTAWXCazpZc4Ww
	WZ3U4a1A0jiF/c5Exws1Ww3nd1jQhwqlTDwVzvOkX8TdbxXVZv6iMZGlINxO4L1eD/R/gfDlRXy
	yXlGchwdwDrqRl8zcFe1eWSYZLJ2z1079N02H2Nl1Gx4+rvu6O8ZQtG1Eqz4pQnBdDs+3uq9pm8
	tEoLDfjp0bjdazdgmiXFth0Zw2U/HJ/gfJOWGQ47F8JZjdE748/LCLu6anbaU5KSFaADZtS6vFK
	vtxAHhELFtYwMjIm8rHQWxhbNWlS/3noGn0uRRmG9bUvz7afefgqeuLFmeAv2jRNJsOomb/kM6o
	mPuPISVfCYGEpLzv8=
X-Google-Smtp-Source: AGHT+IGHyVy5O73G/VZLCysyXwbrLp5vRyiOAKVWO/iDDKm1SSBWJajVWW6I/83NMUwWoVuzzbgYUQ==
X-Received: by 2002:a92:c26c:0:b0:433:8161:872c with SMTP id e9e14a558f8ab-4348c88f748mr53671975ab.1.1763130487022;
        Fri, 14 Nov 2025 06:28:07 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:06 -0800 (PST)
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
Subject: [PATCH v5 3/8] scripts/make_fit: Move dtb processing into a function
Date: Fri, 14 Nov 2025 07:27:29 -0700
Message-ID: <20251114142741.1919072-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114142741.1919072-1-sjg@chromium.org>
References: <20251114142741.1919072-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_062809_055127_0CF6B952 
X-CRM114-Status: GOOD (  14.59  )
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


