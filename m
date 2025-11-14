Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11475CE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOwDYlRH5DhNzOzjWWbwzUOQiOeiolgsqjgpBqGQ14g=; b=B/qWw/bLNSg29GvCmklvrAA9TZ
	MndQgqHf2GgJxg+bzYLxa0jLvPOP4eyIM/9+eNUTy7y9OP1ppdkkBpxoFXVXmZQKTejwiWXY1i+hp
	oV2iXgSKUuKeVq7TabNFqpmz/BcK7AZKtfFrb0tY29f2bsrGxBLdJrSvYpGVtFby8ZluIb4h7ubWO
	GiJar43OiQXGK3FUZ7HmVG9+kaby76zLGYQ1xEC9KasJmY5r1M1cLJBzQwo1ujKDq2e0zEWt526Za
	n9trl2r1b+5VWjl6k1a0Stlzz3ZbGzAr/bMc9KO6vv5aQ57ZCANLFndPvP7x+Vz5LjtLqFyg/knNP
	UeOkf9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumX-0000000CMqu-2zAf;
	Fri, 14 Nov 2025 14:28:09 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumT-0000000CMom-0iiA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:28:06 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-43320651e53so14482315ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130483; x=1763735283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOwDYlRH5DhNzOzjWWbwzUOQiOeiolgsqjgpBqGQ14g=;
        b=IrLUDDuY4ZbtQFnu+GCe5XtTfh6Yyuy4+i9rxrryAnPY0rbXdrjQggNfK79PdMoIAH
         2+INrqj0ssZnF9k+BMLu+LDL2s13aEwIf1TK2VjqZK8Vb6hr1u6o5cMQQgo5DnGWbcon
         cWVpvKsL1/38UJ9Wtl3RsgM77AbZyohZNps28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130483; x=1763735283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VOwDYlRH5DhNzOzjWWbwzUOQiOeiolgsqjgpBqGQ14g=;
        b=q8FFpOQnYJRUOjrSt5YN5bjTb+VatIp4QA4TgVlwbf5sSKHYEiC82aPa6roIwY5FDI
         Lt9nkUQ36z9wm9CDYy/lDHhoJe03iuNQ9o77QTb858EFX5VFajSvWDmi/Rx4k7aBCSxZ
         oerr/nV/Rbs5TEBN/q2ShjW1V7sUjkkRvj5qWzKdVUyTux845K7nCapkgqL+RhbQW3Sh
         c80W7YVJ+TkGp5Hs/6cbBHxfvtbUGkkG8ByAul6SHu/uWjOw13v6mvV0IowJwm66EcA6
         37iQMoMr2DJiimdZRGN/bFRqKnwYvlHB8xQgvPRyrf862T4UFUBR/kgVZKfyza4W2Upt
         PPrA==
X-Gm-Message-State: AOJu0YwNwq/58BHTuIg634meZ9VPtGWx/mGHtRwM2WQqR8ImsKIDxvEi
	w2qwk7NUfxhmjR98NAYpiq/3EHc0oeLweHtvyFnrVgeB2/pNBYCbYdCFhP1Xx45j9h/qEEnoPTO
	yIn4=
X-Gm-Gg: ASbGncscaQacNZsQDvMuu5O0pb0yoDBsQHr45jUFxhJewCfmjkeSrXcGlnEp/fJsdiq
	4cgvLoFy8oBYUNV03aEPZtoaEj9PGMqcHhIJm3eza0jUvlFwJui28mvqs7eiZ3t7N2PmVxP4g2q
	B8a0hV+2BbBC7sIPmcb+QCp2OtOnYU/tpIRUcaQ9vEs+Sh1OaI+uGncuFMN9DHBmONvBTWmn1AI
	Xp6nMMJ6crOvjebXQPqfWZKAewQqxxCo6fhaL9im2k7FSpG+4XDp7ksp6Z0QSPWq2uqzizYknUt
	DlceuZQxGjoh/vFAnQ1Zvdfzy0KzZQhEPtyjcxV0+/Kr4RvnuhLKyCoCPd4DKcWx/Xsv9fRM+Go
	IMQtloOIcGlTdimifHF4S34DBKuyFgZU6HzmjCufnsZafRVPoueZJs4/lYq99oRa7t9FiDPOgCR
	OFT1v2c0JoB8ofQ7o=
X-Google-Smtp-Source: AGHT+IHKQCuiUr5zChKS0MHb/W5O2DKQjIJyTMquCSOnoatcp/1EvxDxrceULeEYGZCSDbMoVvwx8A==
X-Received: by 2002:a05:6e02:1a4c:b0:434:7caa:8947 with SMTP id e9e14a558f8ab-4348c949d5bmr50346505ab.28.1763130483086;
        Fri, 14 Nov 2025 06:28:03 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:02 -0800 (PST)
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
Subject: [PATCH v5 1/8] scripts/make_fit: Speed up operation
Date: Fri, 14 Nov 2025 07:27:27 -0700
Message-ID: <20251114142741.1919072-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114142741.1919072-1-sjg@chromium.org>
References: <20251114142741.1919072-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_062805_211247_F6467801 
X-CRM114-Status: GOOD (  13.97  )
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
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---

(no changes since v3)

Changes in v3:
- Move the ramdisk chunk into the correct patch

 scripts/make_fit.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 1683e5ec6e67..0f5e7c4b8aed 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -98,7 +98,7 @@ def setup_fit(fsw, name):
         fsw (libfdt.FdtSw): Object to use for writing
         name (str): Name of kernel image
     """
-    fsw.INC_SIZE = 65536
+    fsw.INC_SIZE = 16 << 20
     fsw.finish_reservemap()
     fsw.begin_node('')
     fsw.property_string('description', f'{name} with devicetree set')
@@ -299,7 +299,9 @@ def build_fit(args):
     finish_fit(fsw, entries)
 
     # Include the kernel itself in the returned file count
-    return fsw.as_fdt().as_bytearray(), seq + 1, size
+    fdt = fsw.as_fdt()
+    fdt.pack()
+    return fdt.as_bytearray(), seq + 1, size
 
 
 def run_make_fit():
-- 
2.43.0


