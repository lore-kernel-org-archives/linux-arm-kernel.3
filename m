Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24ACD41C3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGboLX11faY20GW7EG69bVQ+HimuuG86Fz7KsZ0Cjec=; b=JFKW5TZQ5BJkBdqrGzST++Upio
	cFCVF/YrlRBXn7+temwyt1DttgejsL1LO/e6TB6bNuvN8KLxMldxCcCfSAOXqGowwh+q9S/KCbQx5
	lWtM11vZaFg+T/dIjNgSzS8372iDeeczphRJbAQpZTZDZw7n1lzaf8clwJtUDh20X13NM3dukelD5
	5MrRAfsC8tGAAieAdAbIk23hjtKV3J7Wwjw2RKMaHl2i30rH+HxawpkcW9QXICEE0XMFpvipRMD/J
	+IHR3QA7maH9eMhmZvs2AIH4s8uf5hFYGWP3fM29PiRFv40DgZ3tYKKZEdHkEPpnsr+1O9dhhkD0h
	cq3vfpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGo-0000000Ggn9-36PS;
	Thu, 11 Dec 2025 14:03:50 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGl-0000000Gglu-3tWf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:03:49 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4557f0e5ed2so44096b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765461826; x=1766066626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGboLX11faY20GW7EG69bVQ+HimuuG86Fz7KsZ0Cjec=;
        b=azRQdPo6/931+96Fkixo1xmk0PAuMLKu4s9A1OxHtjXhAJS7HMhg/6DqVlh08h63tv
         GJTkRD5emOM1GIBCNYQrnQZNaR7qAw9adTjpJglbX9HkpqDq7otxCsAQF5SdG6D2343C
         7cDRsl3QbewgPTFq+4OxLpNqyHSdb57dDvDsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461826; x=1766066626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGboLX11faY20GW7EG69bVQ+HimuuG86Fz7KsZ0Cjec=;
        b=VZL/kBzCj3jEWDKMctkfBhgWT18fNa20NArnfa8IoZnPVnMnjWQUXBxDVPTGUj/oUM
         TnFDZOEbJ5qm4JlD1D3dic7Li9n5rvHxdI0+uNkCGeA4BAlKaVXsEUza5EnN9YDkZvM/
         iKQugVdw2C/H+cD7Q0tsDD6VAeOR0ibW0bpyfHZKc/TjoirUs+1ErCO4srzkXR1HbCee
         /lABlFU6to/gd9PyG88Fu5FMmwugdG6gTBJ3S6Zj46gguVAZvRawvi2FroqT/fE5A+pw
         SE5rJyKBXuJmkr/v6lJFl9PLJBpwftFp2oNVswDqeGTNqm69ETcB3UORSbC/8LHIHg+G
         VWXg==
X-Gm-Message-State: AOJu0YyfhLfcBvH4rYvQDTDnwre3ixNr+NF2ouJ7K9buVPLFMx6x21BE
	FpLr6HT7IXXyHetUConid1aTMkx0yaLJLSO2RV60PBDVtcQqClLf1sW7mbpixXz6eW+JTL7x9GV
	vEMU=
X-Gm-Gg: AY/fxX7STTTj+j6TmElU1sT2kvswi9rtu1M0wJHnsFNO6iGoMqWSdkXfZRESdTHkGqy
	Dc7MHDdZPpeD7Yh1WwFgtln+GmFcSvEHIRCpYpz3PVibs8lc3F06ShqRx4uopIf/9b5qyASckjy
	Fzj6XzIJRXEVHtj9HNExlKhVMyhgsUlg8C6VW4Q19y5+GousOb5xbA1atvHTs2SH3+TJcdvUoKd
	tupf4Rb+AQRIZMtQJgHxui0Sm6LZGeq2/2s/mC+OPx8crWGQZ+875BgE95Ysofe32gvXfkrAQnS
	M63X7bKWDA4VVsjLziIttdYqpv146buyCRQcJ7NyIuNlu+5qBT5MD34JSCuxb12WFZnpE24WNvv
	2EFPew0Z5O3jn1fngVnqcb/rePODbt3B6Us6dYl1G87MQA92h6KROhteBzZutdI3zBGHk/ATNHB
	GNzlWV3eWkEwi1veU=
X-Google-Smtp-Source: AGHT+IFW4sXgXHRcnLBTV5SDzKKgVwFFYBppoyZ7iYax8w6vu6HYQtjGylKmpzENOm340PSo/tAJkg==
X-Received: by 2002:a05:6808:222a:b0:450:89ee:922b with SMTP id 5614622812f47-4559bf3ef85mr1042177b6e.22.1765461826269;
        Thu, 11 Dec 2025 06:03:46 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598d6e789sm1130030b6e.22.2025.12.11.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:03:44 -0800 (PST)
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
Subject: [PATCH v7 3/6] scripts/make_fit: Move dtb processing into a function
Date: Thu, 11 Dec 2025 07:03:00 -0700
Message-ID: <20251211140309.1910613-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211140309.1910613-1-sjg@chromium.org>
References: <20251211140309.1910613-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_060347_971017_CC1436D2 
X-CRM114-Status: GOOD (  16.61  )
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


