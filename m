Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5D7E92704
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 14:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQo1oqJAVo44ptfZ9oLDxIXzqeCSewp3mycJJep0ovk=; b=IC6HG8SLjGxRfu7EyhMGjHMRm5
	j8JWymn7qQTrm2S/cocexojWvxMmZDRB4+2QtosKPBlBRYRNBQmBAYv2ly4e1ESBTZVzX0mEddFNp
	98jT1lwMWuRKn5IBTex2SKuCfLx1LCdlECaOGGMChfj097y4QdF4hhOXR7rRHm6PP+wV/Ln2cz1jB
	B43op2Zq5V9EbUlhe9JiCGLfvr/FzC9xzI7gsWZktRRklg6/rE/v35sv1gzX3sKBiL1HUY6B3u1Rp
	mvKc4P7erQ9ZzW/Myi9e1g7+1cEe0HTjicvYrwFTaq2Bwp0frsFLGUzQj3t/4pxc+BuCN9CWAH3sg
	VwHKiwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBg-000000021au-48on;
	Sat, 27 Dec 2025 14:22:32 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBb-000000021ZS-14cs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 14:22:28 +0000
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-7c7bfba3996so4680268a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 06:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845344; x=1767450144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQo1oqJAVo44ptfZ9oLDxIXzqeCSewp3mycJJep0ovk=;
        b=iRmN/CEZ1RDhnuKDSsTKrLeyZXOTBfweVLBJyoKfqRXT2mHNqRe6J04jPNDyyhzI3j
         Km1S3R8Dwk1qDPIqDO5EOdtf6m7qfqLb9L0W41CQ4ikqgxIJ3r/hh7WJsquOz9XQWwg1
         7nTR2kKxP60T4zkVySRvL1hNdhm3GQR98qMVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845344; x=1767450144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQo1oqJAVo44ptfZ9oLDxIXzqeCSewp3mycJJep0ovk=;
        b=sb+aYKif6X6WHILb5LXKZyWvX7QU5ErVssGhrvMUPEtuMW22w8g/PYjLzSQKVjKa4M
         LCwd6W9bVfiwUbA2LEdOLnlsOm9pC//1XD8OSxFrdajZ5wjZVsJYIqUxkB3LFHOqOcvi
         h5QexKW4XVhFhsH+R/Ga2wVwsbG39p3l2MOHiGZmW7HPUqE2AJUuCU8WlN2q4nE8i2D6
         3kD4+CYk1K9136wbYSgg/UlnPDN5rkP2W5D+xtIgZxuiX2v89z+fLvOdev4qKY3dnp+d
         2M9ElaLlK0POuAUzFeXnpKz/5S+0zxEJpyPI2jIxqx/+P4N+MSzidgrmatp/ggO9IZ1R
         TWDg==
X-Gm-Message-State: AOJu0YxzGHwhvhBdb0MNtvPJIu7Otibn44HRnPtBU3j38inksFFiSwIo
	nrIdsMQZzxB0CS3Oq1t8Dck7N0qKlnuB/REUBecuzgfqkBPny+ApmXaOw7e64uG2IuTiOUd1DTf
	uXp8=
X-Gm-Gg: AY/fxX7F/wnV85qH0NpHkqlayZL6t6hrmOaZCMhToK/nYSItgRiA6G57ofxMq+9uTv+
	BngUz07C8FynjcefoSwJ+yrbEhPk3MOCCSklCQ2i1ltC7sN+VMPdGirtvuTsw1BRoCVmv6Rs7mz
	6K45xhDvzxN1jxHdrwa72VOa+Za9zRoSlV1QRWpiL9ZjJTfPoSNn2vUizQ02eJv682eU79qKg1Q
	xHEbGkz1BMzkssGnptdeX2H4I4WVUIHizj62WX0Os+NVoI73jT5t1yOzSRgJM/+MDvHYVbnfw1N
	5C78OXlksrhl1OsVCcFEu54f/vRjUoLVsetNAaiM7rl9JdsRgRux5T11t2ttNw85WaUEwubEZkU
	bHSne49ZVpnw9ycoK4odM+YdMobwfSNBdpEYGpaY9bhwUd8mmPXi6Fqz6UVRZdBR1iYJMmCLJf3
	1OIGz8WNDfjdB1l7o=
X-Google-Smtp-Source: AGHT+IG/iPHYfwLVw3hTqVWk+/TFfy/39UQV5YqNYUp6ccKtSuEg3+Tg7hchdtSmxedRas5yzGbUtg==
X-Received: by 2002:a05:6830:3894:b0:7c7:501f:4bce with SMTP id 46e09a7af769-7cc66a952d3mr11728229a34.25.1766845343827;
        Sat, 27 Dec 2025 06:22:23 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66727e11sm17352660a34.3.2025.12.27.06.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:22:20 -0800 (PST)
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
Subject: [PATCH v8 3/6] scripts/make_fit: Move dtb processing into a function
Date: Sat, 27 Dec 2025 07:21:47 -0700
Message-ID: <20251227142200.2241198-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227142200.2241198-1-sjg@chromium.org>
References: <20251227142200.2241198-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_062227_335682_4A9B129B 
X-CRM114-Status: GOOD (  16.48  )
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

Change the double quotes in the write() call to single, to match the
rest of the script.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---

(no changes since v7)

Changes in v7:
- Add a note about the " -> ' change

 scripts/make_fit.py | 67 +++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 23 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 66cd73711506..7ddaf3c0d783 100755
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


