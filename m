Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F74AEDF051
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 07:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IwBQZb9LutgzxDJE2EIdjZTP/amX0scnz6PZcXkgqfs=; b=vK222RLr6UgAb/5nvzKyVZ9rc3
	2kjsxTfYJGaOS3i+kr3S3NdmjSMKQV3+S6x53LWRycSSawDj0SBlXodCsNTtHQawvp+vSYFkjmoaL
	n25mFgTQcRKaYac+UnTifPFCGQ4l+YYXoZaQT4GrE+MF4hZeeMZzAvw5o0DMjPG2GeoV3VoTRaN6J
	jvldf+hjgv23eXQDpPNufJvPKh7QjFGsGmlaxVH23un5EBYqqJWIgc7gebSeBPT3ozb8M992l3Uru
	C42irm6zWmbxYf5yrU4PJFZEvMyX9GehvIoqGqWF2UsVvkSVC7wwClRT4NTQbKoDpbzJc2pilW8dY
	ul5FKeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRM9-00000001ipl-0Ee2;
	Thu, 12 Feb 2026 07:43:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRM5-00000001ipQ-31ff
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 07:43:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2aaf43014d0so27982865ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 23:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770882196; x=1771486996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IwBQZb9LutgzxDJE2EIdjZTP/amX0scnz6PZcXkgqfs=;
        b=FERQQJ0Cumd6UPBh01NengOUn3IyNHmnK4HQ/XuxLG+eRf90fBdD+MQGCt+F8pt/fc
         zdT45OwX17XtX3Lf+4LQzFpDbqz21+h9JIYHRl7XE41tmeBWjeWV3HU6G4YE2hJb9nxJ
         SiHH9UKGCDAee5xSyIrwRyuZekUe6AYaWjROg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770882196; x=1771486996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwBQZb9LutgzxDJE2EIdjZTP/amX0scnz6PZcXkgqfs=;
        b=nGjIGSpb45UBLtyaRpHdoy7DEdZ7qxvYNnfEq5YAdY2Gi0rjMxlkrgJIWeD/iP5mOB
         RsYW0VNVaZguQd+Wy18c5C4ShHIFxzfLVeTnHLoXtlX9sZPJsBcHio1ygO+JOxUTisYE
         f85cgyxnTrEbQCmfICS3GYMglYByj6oQx02hOvLiq/UiTDnzoZaibZAt6AXkLFaGrliq
         A/gbFRqnHuhYti3cg/3fR8fJTpJKwz/jAH6axaCUgnkPFtgms/31gXzwGlkuy92QYdc6
         yhEmdby60Noh4NXlyyBOVoGdRhKRNfCX8oSZ2d/pUmwbC6X8Qf1+2DyJvpK6gTT+E+Za
         Q9kw==
X-Forwarded-Encrypted: i=1; AJvYcCXKYOG0yZRv6Cq9SYJoBiRNQJm2yz95hEakghy9z0PNIyYVbAVjR/ELZb2e+FbzSH9KHVfc2w99aGw+eGiitrX+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1xJ5tCQ5o9KPbEbvG+YWLh6cZddv4fPKgoPZ7NQgTxn0ZgJrh
	llV8OBQLO7m2O+6ZcJLj6pJqTEmravF021wqhePBTFwMwE3XeWOKdzKmnJH54LDjxA==
X-Gm-Gg: AZuq6aJnDA/ccLGLrspFCFUVkS7O6IMb4JeSTh3B1zodS8Dar6uUT2EfMkbDdGA1c0W
	XwSBBVkLkqeEtqgCtjQzkO1QSLynz5wGA1Cq6j6waUNE5hOe8aHToFdCiS4j8ofOXJ370zxAlCg
	d4E/pBZ7sF22Q9hGDxa71o1cFpG+WjhDNlTYDtP8bg2wEDN8vwEVYFCFEcMCZuab/WBRToFgHLf
	XcdFjMXIx9M+GKSYWjOSa85J1/TPR2uiK6no0KVIbg0/ziN3v9ppHYr8nI+xXkLtCFBfrdokE9j
	bfRVS6rkQah3yg+2mKzCAPwDhw4zqD6toWYJom31PVxkcYB6bTJX03HplvRvLZn8UHlTcgoZrr8
	SjcDuc7suUtSgGB0IDfmZ940/R0fje1FGMjtyx5zp0N40Tka9u1i+InnYQll5+dSux1kIUOjkrK
	EXvLK+lF/tbeZ0/tQJp+FtGQoiIH+k5uL3ZAJmJmhpmOZIZXsLJ1tJfEPqZRQyAoDU25JKVos5b
	xjzaN/C
X-Received: by 2002:a17:902:d4ce:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2ab39a0e570mr20991275ad.44.1770882196363;
        Wed, 11 Feb 2026 23:43:16 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a4bc:cab3:eda1:c9db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29964c62sm42838995ad.55.2026.02.11.23.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 23:43:15 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Simon Glass <sjg@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH] scripts/make_fit.py: Drop explicit LZMA parallel compression
Date: Thu, 12 Feb 2026 15:43:07 +0800
Message-ID: <20260212074308.2189032-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_234317_833281_59415D44 
X-CRM114-Status: GOOD (  16.15  )
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

Parallel compression for LZMA was added using the plzip tool. However
plzip produces lzip format output, which is different from the raw LZMA
format that the lzma tool produces. This causes depthcharge (the second
stage bootloader on Chromebooks) to fail to load the payload.

Drop the explicit LZMA parallel compression toolchain. If the lzma tool
on the build machine is from xz-utils, then there's a chance parallel
compression is already enabled.

The xz-utils manpage says the following for the -T (threads) argument:

    Specify the number of worker threads to use.  Setting threads to a
    special value 0 makes xz use up to as many threads as the processor(s)
    on the system support.  The actual number of threads can be fewer than
    threads if the input file is not big enough for threading with the
    given settings or if using more threads would exceed the memory usage
    limit.

    [...]

    The default value for threads is 0.  In xz 5.4.x and older the default
    is 1.

Fixes: fcdcf22a34b0 ("scripts/make_fit: Support a few more parallel compressors")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Please merge this for fixes.

 scripts/make_fit.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 517ca84fd32c..76ab40353d9a 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -54,7 +54,7 @@ COMP_TOOLS = {
     'bzip2': CompTool('.bz2', 'pbzip2,bzip2'),
     'gzip': CompTool('.gz', 'pigz,gzip'),
     'lz4': CompTool('.lz4', 'lz4'),
-    'lzma': CompTool('.lzma', 'plzip,lzma'),
+    'lzma': CompTool('.lzma', 'lzma'),
     'lzo': CompTool('.lzo', 'lzop'),
     'xz': CompTool('.xz', 'xz'),
     'zstd': CompTool('.zstd', 'zstd'),
-- 
2.53.0.239.g8d8fc8a987-goog


