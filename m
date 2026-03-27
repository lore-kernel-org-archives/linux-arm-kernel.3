Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD15710ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s29Xdjdtn9joPLQhVjn5m444FoNDrSpcw3rugwHh8kA=; b=wSZNPxy2rTuFS08ihdSDSzRx5a
	kYCyI287n0eD8IRbAwkDAWvTpN24o6B0GlvtleqtSof8M1teqMf2DGK7W0GIthUTTPKS7OkJPvejm
	OdRf5/CHohPtg0uwlrx/pVy8taBxLkifjmmJqLCLFFBp4MurQIt2AOjBTfKGyH2lWBHim+QAFr66/
	61gOoWitj9iiccNeEd2prJDcON8Fw5mLWRL/Uwysh2rgyduVtXCFS+5IPCMPzpSpVAqrGrv444raQ
	iufd6fjloVTZpvw+eB7OUd0gpogS333BRGaDvZL78puWXMflkrGug2KHRtBxDJd9WpQBPfIp0/0ud
	eov0ECOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65PQ-00000007EDI-1hzg;
	Fri, 27 Mar 2026 11:31:24 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65PJ-00000007E7y-0njm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:31:18 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4871fc50fe7so13234195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774611074; x=1775215874; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s29Xdjdtn9joPLQhVjn5m444FoNDrSpcw3rugwHh8kA=;
        b=nsK3K/FivFnbPfmKw8uPjiSiO1HDdQ1rIOL3ObG5IBX7H1dEpcS6t3EshUdu5uimGn
         2PfKTd1UQ/mwVWYC0PrAH8507p2sXylHvIFHnJv/rHcpoge/Lz+KWRm3uEUKszS3srGh
         ey0H7d2k3RmhxMbmDUOcHV4xRPHu65Wqf/gH9gBqssc1sajAHB/we1A4X0cSiLTyDYG1
         geFrjL3aHAm3KVpdScav51H6TOnaW2s2lcx+NyBGzkg1nsp8xaJyvw37zjt23++ZJf4N
         UXdZCRj6iIP/+jLfPh4v4r9OSgtgxphX7u/nRwp4ZCf55bxa4wJ/Mi60WNW+3SfVIUCo
         ab/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611074; x=1775215874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s29Xdjdtn9joPLQhVjn5m444FoNDrSpcw3rugwHh8kA=;
        b=lrCrtdC5q67JrD1Fk3pjF+FZL8sJJI0ENWIM/x4VHjb/8JNQ5pf5ZXsmM9tpFzbmRz
         NfuNTcx+I66RyqwxejKEQOGWpo1xA+8npca+gvwJkpeTOaFaNJYYOuZueP/NUTn264AV
         2eF0BSYpgtgPpLQdjjCtT6Hc0l+Np1JE1bu/YL1dxteT4MvTk8NAKZHeoA75BtIqwhCQ
         1PG35q0O38cn1yJvMNMvTc1ZFsyqMNAhAGqhNKItKebU5WoTUK0cJydn2jfwOuLAY9Ov
         wUO06UbrEc1gPt7FmlXDsqJi/Vwxdu6pNxgvv6naJnK+m454xhH5LeQ5XVjuTK3IXeUn
         4tDg==
X-Gm-Message-State: AOJu0YwZ3f2QpOJtPbx5XAogRa0irKm4g4yBPbrX0orl2HPeb5M/Mhcg
	1tAw7OGC57fBLqa4HVqW3kikPO3WtfpitjiGhrqrRxhpwiZpyeowlUEK69QYlt+oh/tgcGkQiw=
	=
X-Received: from wmph38.prod.google.com ([2002:a05:600c:49a6:b0:486:fe68:2045])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a303:b0:486:d76c:fa51
 with SMTP id 5b1f17b1804b1-48727f0a808mr26067575e9.27.1774611074454; Fri, 27
 Mar 2026 04:31:14 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:30:50 +0100
In-Reply-To: <20260327113047.4043492-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260327113047.4043492-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=846; i=ardb@kernel.org;
 h=from:subject; bh=DspK9ILwbkU2K9P3QWlgKSmk7WPgvh8qrRYpz8jocUU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfNYVlaSb9n928w8lgdUqyVzDj3ysF1n+OWzjOnGM3aGJ
 lPTHyzrKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpADeZi+Gf9ok0veLs3ntKDCJn
 n96tZ1UV/yGTwBriuPjwOfM5lbprGf6pp2Q37qwxSlBlftLoUrjN6dkSuz2sO9oYrx9WmzhDpYc XAA==
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260327113047.4043492-9-ardb+git@google.com>
Subject: [PATCH 2/5] crypto: aegis128 - Use neon-intrinsics.h on ARM too
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-raid@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043117_244524_BFD80BCD 
X-CRM114-Status: GOOD (  11.01  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Use the asm/neon-intrinsics.h header on ARM as well as arm64, so that
the calling code does not have to know the difference.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/aegis128-neon-inner.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/crypto/aegis128-neon-inner.c b/crypto/aegis128-neon-inner.c
index b6a52a386b22..56b534eeb680 100644
--- a/crypto/aegis128-neon-inner.c
+++ b/crypto/aegis128-neon-inner.c
@@ -3,13 +3,11 @@
  * Copyright (C) 2019 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#ifdef CONFIG_ARM64
 #include <asm/neon-intrinsics.h>
 
+#ifdef CONFIG_ARM64
 #define AES_ROUND	"aese %0.16b, %1.16b \n\t aesmc %0.16b, %0.16b"
 #else
-#include <arm_neon.h>
-
 #define AES_ROUND	"aese.8 %q0, %q1 \n\t aesmc.8 %q0, %q0"
 #endif
 
-- 
2.53.0.1018.g2bb0e51243-goog


