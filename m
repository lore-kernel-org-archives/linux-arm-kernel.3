Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AC8CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebeC0cVyiB9zakr1pU6jmsWgTyhsnBRYHpTkJMDPkjw=; b=eZtcOxBkR0hbDcksnCzViGQBYe
	QMYAgEOasif7nIUUu8BfSKoZO4nHyBr1EgDE1JGS+Cp04ybtFkpfN9LbLIKIpVNhP8cFvxNzCSAnc
	ifhck8dkpyPV45GC33qNM1DKW8soAcMigfQ2mzr0sPX0OX9hfCEEOZb7QTvhCJadLrzOxZM57cTb2
	xGWBea1jdUjvmxumwfB/hrwQf+4FWz2oY0hakQRFLQhiSqdpMtQg5S0bvfnu4ai6nxnXfzAC043fQ
	QawTAJfs3KlHb9xvRTq9iWxwjTnsDWFrFv0IXKTzdog/GKqBPBT6KRiIE+1ECBEqyWRAxeiAiBVC9
	uE5HCrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEG-00000000xwC-2kFu;
	Mon, 06 Oct 2025 23:02:52 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEE-00000000xtU-0fgY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:02:51 +0000
Received: by mail-io1-xd41.google.com with SMTP id ca18e2360f4ac-912d4135379so219072239f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791769; x=1760396569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebeC0cVyiB9zakr1pU6jmsWgTyhsnBRYHpTkJMDPkjw=;
        b=Njtv55oR13/bncooC8yra2S/zP6mSmC7btWi3T6Xgmw8IY8knRtJi1nPBOahTu3396
         VOGcffQpbM9995nuTcRrckY7OKbMacEc9DRhC+xG0L+ck4fcnOg605dNZe2kTSuxeNbX
         QVFIKl1iBLAisoV/KwxXaDaCxq4xS7GlSdha0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791769; x=1760396569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebeC0cVyiB9zakr1pU6jmsWgTyhsnBRYHpTkJMDPkjw=;
        b=p1552LNcJpcXiWkgiZVd79pW7Qd+SVrLAIHThcdBDJv0JZRUbwQynM8hjsk/OEz/QA
         ywBuBWRo/f10d/iJ6wG7F4ufyEDnn+sM22EIOoIlfHVm7y+vNEtA79MKwLwh9qxD12fG
         6bT/5NDgzZ2YtEzQIw413hIXNv0+GTv4Szf+v5aaS/1Y7tCSVxmn4kDMHXgqpaV5Jhi1
         WLCeUEnvVyx+U8n89a7nXIF+gEeRc65pm45LqT4cUYwhQnt5+hmrk0lnSnLoFvsWGXgW
         EXfhkafZl4s3FN1qPTJG9p9dqhhGC5OTExMhyi5GW7NUGpg1Eil7/+mJ5lP5FCuX5XFX
         UEKg==
X-Gm-Message-State: AOJu0YyWvev1UTrO+qCNi532h+Z6wH4NKWoahyqslvrz5xLRX4zQke8G
	oZAInzZG+4zejNE0LWBPop7B9d6pvSonxVyrQBZXZtBy1xSZlO8yYxTQCiVgRLJxS1h/ql9aOul
	NBD9QlhjZ
X-Gm-Gg: ASbGncsbTKjINiwRKXJwDpVi/xGvdhsX2j4j43wNQzGpyNCgfQjxu0KXKG+ZzJb4Thy
	tAMGzpnDehwne3gIxzUEbhRrosfNMpdJr1orLkCdZCiciLz6pmtqyDi/WiKBc+Sh9hqRFHJJNJt
	Vk4q6TgPE7IKuOzwU0LBJ0gAoM2Gaz8wIdEfXlwRPThIVS1oJkFgSrbV5pxZtnrIoV+cfV6aj78
	QnLlm00Zu/qloZSIRbWfdqpSIZ+c9MtGjkQbEBI6qXTdC1AC6jXj26fQCGEWl7vB4wmanKCc3XK
	i5pPkUmbgzJNI8V1Wa3bragQuqorYEnc+elUCbZuWS/yfh1xkKYw7ODHa1bBCuH1Oyh38aXP9WO
	mjX1RJrE+DPGlKhGBX+TtBNSylYF1sz9TCbM1il79iJfQ9YopPJwSRA==
X-Google-Smtp-Source: AGHT+IE9mdrAm5cg7BGAOe6wYDIg3l4Up+MccpLj79jTe3IHNt2jz5i4agbBHCXH73i/NIp8NWNZ1A==
X-Received: by 2002:a05:6602:15c5:b0:93b:ba4a:3b64 with SMTP id ca18e2360f4ac-93bba4a441fmr740270939f.17.1759791768428;
        Mon, 06 Oct 2025 16:02:48 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec55bc7sm5422226173.69.2025.10.06.16.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:02:46 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] scripts/make_fit: Move dtb processing into a function
Date: Mon,  6 Oct 2025 17:01:54 -0600
Message-ID: <20251006230205.521341-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006230205.521341-1-sjg@chromium.org>
References: <20251006230205.521341-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_160250_206433_7F29A4DA 
X-CRM114-Status: GOOD (  14.97  )
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


