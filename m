Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE79EC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWba0MXKPePT9+pbYbVkPTqSSVKwgxdR9mpJ5XY3bKM=; b=yVYjxJRalBiAIUrfOK7wE8KyBh
	fM0seqxlx2PZlf1dSSKEetU6T2D2Z+4ozfHUdupokZujseJzXrGe7FchNGfPdVjtvlaTyZbDRBGTx
	58n7PmO4lQzTgKs5cLO9lfNfh230vqv6VEdO6G9XOHK41oG54ZUQyjTB8SjEaU2rlyA1N4scE0WeJ
	dqxMZFWTp6Isir/tSHloGbJDrZvgoY1UJUktRNr4+a6H1YpdNW63F4xCjkztj6JH3v31K05GLvroK
	uzLg6XGaLKCUhBrMqtO6TLYw3nPLJvrtcjy3LF77mGCeRlxQBJkDmshGBNcxj7wdOPzhxH1z4q43H
	4BPfQ8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vJM-0000000FzTS-1pP1;
	Fri, 11 Sep 2026 07:04:36 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vJJ-0000000FzRf-3iFg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:04:35 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2db3734d06dso12743075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 00:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110272; x=1789715072; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWba0MXKPePT9+pbYbVkPTqSSVKwgxdR9mpJ5XY3bKM=;
        b=MdSWVb8fnCZWQz91wdAkkWCCjZi9fIHHxnUiEyEbyFz1EFeV8bY2DUtvDYVaB0jC/A
         073nCQamOEXlXLboR2HNs9n2nEJ6GNXUxubt/iag9AjTialhlfKHYzmovOyJGuOj9LEq
         8DxB87Nz8XuyU42R5q/0sovAVJW8X7al6ZxTOzHSaes54Q+jxPx3J9fNsKkAbnBajbJw
         ahN183UszSxu96ziiKlmvapAXYOdWz3x1U9oxPNp7dNNiOZpenbhSssJofiknn1HNMbm
         i4W5Ux/3opgJydeuWdZ8hrCcRNoaARxzT3ZiHGhL8sWlEsGCJ93qdlrAsaBOugQGRw/C
         uoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110272; x=1789715072;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWba0MXKPePT9+pbYbVkPTqSSVKwgxdR9mpJ5XY3bKM=;
        b=lbVy3gQtQ0ifYYdwU/xEFRkyJFqhs5wXYss/SgHUj6AtqIhqhOu9Vc9HXuPD2UGPsq
         r1uAHyYmuioF/Om/EzWBwv6itN2ypaNzGzDo4vJFtDIfkvDWrVCYiYP2g1kBMY6qEyDB
         QCtnbdvPvRwpNZtPiR4Xedn2kWtkVHG7sxdSCozH87oqMKwopssZrGmlAVYJ5Jrhn7Bc
         hBcbCpwhmCM+0ehsii5+y8+uw3lbizW3tiNkg7cZuK7t8ndyoxXUVhqfriUt43PoyqA9
         iv5DB8WiyLGMRXOKT6mG6giMJQeS7ub3dozjlPaf+dHRQx/0+Eo4Ox3FbR83vzyLgOFi
         KXtA==
X-Forwarded-Encrypted: i=1; AKwUvBzM0PrNIijkCIEBShTPaiHFn3MY3IcFUZqM7nNqyI6tSt6cFEWsLTMBx9OPzkIAIW6tIAURsOqtsLVq6iH84Eya@lists.infradead.org
X-Gm-Message-State: AFuF++lxSDXDBkFH/QT5vptVs4YXDxW5nLV+Qlbdj3c40xuzpDFJOoxb
	05eJ3FXf7XFLTp0A27MROHk8qTg+zhEqi8PDdq2nEsOp/sUmmGl6DH7hPfG85+bME3juGw1DKUv
	x
X-Received: from plbkq15.prod.google.com ([2002:a17:903:284f:b0:2dd:1c44:fe2])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f605:b0:2d9:464f:d45f
 with SMTP id d9443c01a7336-2dd2a1c4541mr62202195ad.5.1789110271979; Fri, 11
 Sep 2026 00:04:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:42 +0000
In-Reply-To: <20260911070346.801948-1-morbo@google.com>
Mime-Version: 1.0
References: <20260911070346.801948-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-5-morbo@google.com>
Subject: [PATCH 4/7] arm/word-at-a-time: Instrument load_unaligned_zeropad()
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Liyuan Pang <pangliyuan1@huawei.com>, 
	Xie Yuanbin <xieyuanbin1@huawei.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_000433_940883_07E22EB4 
X-CRM114-Status: GOOD (  13.28  )
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

Convert arm to the arch_load_unaligned_zeropad() /
load_unaligned_zeropad() split introduced for x86 earlier in this
series, so KASAN/KCSAN also see reads through load_unaligned_zeropad()
on this architecture.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Russell King <linux@armlinux.org.uk>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Liyuan Pang <pangliyuan1@huawei.com>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/include/asm/word-at-a-time.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
index 5023f98d8293..ef0002d16dc1 100644
--- a/arch/arm/include/asm/word-at-a-time.h
+++ b/arch/arm/include/asm/word-at-a-time.h
@@ -65,7 +65,7 @@ static inline unsigned long find_zero(unsigned long mask)
  * and the next page not being mapped, take the exception and
  * return zeroes in the non-existing part.
  */
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static inline unsigned long arch_load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, tmp;
 
@@ -96,5 +96,7 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 	return ret;
 }
 
+#include <asm-generic/word-at-a-time-instrumented.h>
+
 #endif	/* DCACHE_WORD_ACCESS */
 #endif /* __ASM_ARM_WORD_AT_A_TIME_H */
-- 
2.47.3


