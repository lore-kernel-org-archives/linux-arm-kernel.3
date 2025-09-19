Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EF4CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 21:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UxhaBuaC7q264UUKsUJVW5OUbIqA/R+5FTafCFNdtk=; b=QKg8OJEB6v9QpIldiHSheB8Qqk
	Io8P47KAOFZRflC3xvrNRaY6fa0E7Fh7n162tl/eIMZdYNCoBNxVcu+QaX/Km0z3dfw56eGilIU88
	lQSx7x5k5CDUwmO+yyVRz5FB8a695Qy7NIDwuOyBkYiWUzJPz+aIxhAxZZeNisXOJ3JgY8GMSCUNk
	ljKwoAvZy2jILx6id/WKmWwnEYANmpnbx4vbjO2XnEhcY8VKFQGjLYotiHPdtjQ+ElhX6n7b8b38h
	Tl9KhdS866hfPQ3fH6EbqHAKlnBBMTtyTeoCmIZ99zgS9SgBjKdKaCm9+QiWrJxN0yJlwsY9D9Hqe
	x9VM3T+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziN7-000000043Pj-3Op3;
	Fri, 19 Sep 2025 21:10:25 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziN2-000000043NR-3xZI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 21:10:22 +0000
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-4248b320541so3069865ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 14:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758316219; x=1758921019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UxhaBuaC7q264UUKsUJVW5OUbIqA/R+5FTafCFNdtk=;
        b=XBxHEq9BmEsjxu7CQAdJ+NjIshTejC873pD6LZsBTElcZdd9Oel17kYJGOwvdcn0Qc
         s6gcnXQg7SIdBWrkqBa+6kFq3w34eHxa7i0+ohgkhCeEMIQWYCAYQ8rfNIB0S3wG7O7o
         x4cRlNE2fDbB5/wks5VxLb677F25bxUGjJtf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316219; x=1758921019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UxhaBuaC7q264UUKsUJVW5OUbIqA/R+5FTafCFNdtk=;
        b=rqaPAP87YzC113AOTve5H3/7SGVCcdZbhH9cXg9f6/3ZExhjrXgeXODFH2Nhh8tszM
         Kn3dBtk0Gwsvt6vIPStzGWTn4UVsR+w0vOvXF+fn1jYTsKvmRdVV87/wepDNZuona++K
         Uf/X+OSrIPsODP51xwTf2gde7NPST7GN63jobUHXUNz0S1kr287tAbjBpFZizSa7eSzR
         xNzlxDseaSoSVtyEL+xfXltf3XZpULB5bxZJX7aEcsPVsGAtTZvOWos3AhEg5P3DFKS6
         UBPKtL2IjfADEBn9xXc94RP6Qy8m7RS7ejBULQrisjo9IT7PIJM4yhzju9mQJPZQfbR0
         wUtw==
X-Gm-Message-State: AOJu0YwKaxCGcdhD2tvwzMc0ELjHi4mmkNzM1yGZsxlVyrZmQABIen+C
	wEsN5BpwEMbxnB0/BbhNRh57gQkvqlHMdePbA54G3zFFPnodWEmgALtLUX9a96ZFLM0jYsDuuX5
	o8eHznpZU
X-Gm-Gg: ASbGncvjXq7u3vcFQKzGHyVadb6J0tF5Eb/I9ddZ5ghqFsVda70lwCs0cnZYc5nX6El
	cYDvFeQJ2CRe3SCX1l7N237KOt7/3AvK7CGSdgWswb2JhwCUjx7oTK6FRw20JS/U09SMRoVaePi
	p+JBGLURORNsrwuDR7R+OtmZRuHYJItRFrlb+PJG9L2aChtcNCdZHz4ek7jpre3XOtYsJQiLUGg
	Dp2A4+L9L/6WR3ZeevyZGVAe8DY1UJMZNVwe89AaZBleWFZf1vcJzE6WbHFwB8xlGn2y1+8h0GY
	RAwKBQPIjB0qsBk1jFffyWE1gUb56pFr9qj7KGXEZBn92YKStARkG+37tdW0zEgpqSBHhbCo3Xj
	JHZPVcs+Wl+VJHo/u
X-Google-Smtp-Source: AGHT+IEyFLXaC5Y5KS/njQ9p6SBYpgmleLVwj5VVwDmLYgKztxHwdMcd0U4JQzV9WEe2+IwhzwTg/Q==
X-Received: by 2002:a05:6e02:1aa8:b0:423:fac4:d8aa with SMTP id e9e14a558f8ab-42481909d99mr70513475ab.8.1758316219490;
        Fri, 19 Sep 2025 14:10:19 -0700 (PDT)
Received: from chromium.org ([96.79.232.53])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d56e41ec1sm2513604173.72.2025.09.19.14.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:10:18 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] scripts/make_fit: Speed up operation
Date: Fri, 19 Sep 2025 15:09:58 -0600
Message-ID: <20250919211000.1045267-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919211000.1045267-1-sjg@chromium.org>
References: <20250919211000.1045267-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_141020_984851_4F8E1EA9 
X-CRM114-Status: GOOD (  14.73  )
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

The kernel is likely at least 16MB so we may as well use that as a step
size when reallocating space for the FIT in memory. Pack the FIT at the
end, so there is no wasted space.

This reduces the time to pack by an order of magnitude, or so.

Signed-off-by: Simon Glass <sjg@chromium.org>

---

 scripts/make_fit.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index c43fd9d60809..a8ea41fdaf08 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -100,7 +100,7 @@ def setup_fit(fsw, name):
         fsw (libfdt.FdtSw): Object to use for writing
         name (str): Name of kernel image
     """
-    fsw.INC_SIZE = 65536
+    fsw.INC_SIZE = 16 << 20
     fsw.finish_reservemap()
     fsw.begin_node('')
     fsw.property_string('description', f'{name} with devicetree set')
@@ -331,10 +331,12 @@ def build_fit(args):
 
         entries.append([model, compat, files_seq])
 
-    finish_fit(fsw, entries)
+    finish_fit(fsw, entries, bool(args.ramdisk))
 
     # Include the kernel itself in the returned file count
-    return fsw.as_fdt().as_bytearray(), seq + 1, size
+    fdt = fsw.as_fdt()
+    fdt.pack()
+    return fdt.as_bytearray(), seq + 1, size
 
 
 def run_make_fit():
-- 
2.43.0

base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
branch: fit

