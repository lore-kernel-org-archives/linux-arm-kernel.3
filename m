Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1F6D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxY6K3VXBOtHUoqxNWrBAsAGxnWGhHRmDGILp9vXmzY=; b=zh/2hBzM0pl6UgBKVh4E3lvOUg
	aOHdkd/2Zk9zyuqSxmAX1O4+oO6Zr13pZ6VbzFGQX5bbpGKjdvHktF+aKFofl7Ss4nNQYo93Osea2
	iqxi82X8ifQw2sI5Nm2KbVhl1W/td6yPwLOPEb+70dRGjgKyTjHdp3DSzaXDJWhZSBXzmg2FEPez6
	6qplVBp3vhloyyyGhZU9NBGdDKiqD9ZkX30QIkiMr4pwRHHt1zbl0uDtFk6o5+UJhUrp/xURtCOBT
	1jtm22maRKne7R5tWoppep/7zcicJZty/Bl03N5OkFCl0VjSAQVe+emCrer/EeNE0QaEC9v03zJ4V
	7ogfCbDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDP-0000000GHfe-2dOP;
	Thu, 27 Nov 2025 09:23:03 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDJ-0000000GHaO-25kp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:22:59 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b764b80358bso59385466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764235375; x=1764840175; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxY6K3VXBOtHUoqxNWrBAsAGxnWGhHRmDGILp9vXmzY=;
        b=soM918ckDWV2uxh+n2V9gubpS4TmOLBYAUB9oBZw8Qfbm2X+KsaVsLKA2oLI8VAgED
         ANqDHUhydaQ+G39Y+qU5MUWQ4PTas1ZvCZT9y+sFhF+w+cuE3T04A8OFz81U1b75r/Zz
         HMUEiNFM8sqAKWqIrJ45tMtroPMl4/pyheziM5vdlN3cC78ioxSW2IORsYm3VoGD3zu5
         QboKOOKdl1+hFUEi61/meLfaKaACLY85GRhaI86eEpBbS20j3WbWtG1jgtuWw450Ezxu
         tdJegksBcoTKBlDnKNjiBoU9OoUSMy09GWwan5Xdt2YlDDMqMcDz95D4fOVfQrDnk1xb
         oHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235375; x=1764840175;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxY6K3VXBOtHUoqxNWrBAsAGxnWGhHRmDGILp9vXmzY=;
        b=EZL/+lFnH8U3gv4hgesi7vnXL3tPl2bG+2EAB7/PiD2xFuZh4o6pttXTq0eyWUftIG
         +7GuqGKrK1CJIm17dv83MGo0kOtMV/RFKmHgxE1bfg3qbdmZjBLkGYmtZgog+0PQdVUP
         EbhWSHeuyeeV2XKMOWXHvGZ2Uwx5TSRefricVe8PiKH/t424T1KWAH8SifuLQPLdlHPQ
         sAezS9Q+rz2exAtdlxbRR7F6Gx7rL/oPGc+oQYIRzyEbhh8MgumPzrRlVAIIL2m9cU6l
         2yObRQ6E0doR/rizSqkYHYct+Xxbn19ai153tXmet7z8s2cWKzIdJrMIZMwoRsge3A/K
         190Q==
X-Gm-Message-State: AOJu0YxnAtTPWEkrPJgTb2hQVylpVAsoTCiNlbqJZLYbzE9mvNUUS7V5
	sXW5k3VStDpv1ogfu5LIBZA5bz6RLNmbfE6LWZ71HayORG6Lee5p2CF0Va4wovK+rtXWOirkPQ=
	=
X-Google-Smtp-Source: AGHT+IGFdDZxAqRvQLpZk6/eWvniWko12T2iQL0bdLzORuqHked+ojY3yfI07AtzD9o2ck5cQMXXIq6+
X-Received: from ejcvv1.prod.google.com ([2002:a17:907:a681:b0:b73:36a1:4995])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3d90:b0:b0e:d477:4972
 with SMTP id a640c23a62f3a-b76c54090f0mr967515866b.25.1764235375046; Thu, 27
 Nov 2025 01:22:55 -0800 (PST)
Date: Thu, 27 Nov 2025 10:22:29 +0100
In-Reply-To: <20251127092226.1439196-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=697; i=ardb@kernel.org;
 h=from:subject; bh=bPOIFl7qSFo8fyyP7vM3iVB+S1w+UZidjo3tNBxTCOI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIVNDIkz65cQ92/8IPf/2+Omz95cLdJSj//5xu/T6vgODl
 7BcJ49nRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIxyyGfxY7e1+ncsRubd0+
 r/dYC9upMAneH5cXs1vfeyHuyNHMVc7IMOWVVNRJEeuexw86Pyaei/4Wy1X763/6xVc6DttPhKw q5gQA
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251127092226.1439196-10-ardb+git@google.com>
Subject: [RFC/RFT PATCH 2/6] arc: Wire up cmpxchg64_local() to generic implementation
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-hardening@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012257_545623_7A205CC0 
X-CRM114-Status: GOOD (  10.47  )
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

Provide cmpxchg64_local() for hexagon so we can start using it in
generic code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arc/include/asm/cmpxchg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 76f43db0890f..f2d55823645c 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -12,6 +12,7 @@
 
 #include <asm/barrier.h>
 #include <asm/smp.h>
+#include <asm-generic/cmpxchg-local.h>
 
 #ifdef CONFIG_ARC_HAS_LLSC
 
@@ -142,4 +143,6 @@
 
 #endif
 
+#define arch_cmpxchg64_local __generic_cmpxchg64_local
+
 #endif
-- 
2.52.0.107.ga0afd4fd5b-goog


