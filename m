Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB3EC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCU2xeiF06KkVqtcXVSq5dyJUCYMUIv/B5XyYuirb0Q=; b=LrUheibTkOJFnPv10EB6grnElY
	EjqcC3ehOkQcC3F0LBQ1Gadq2Y9kpGm23IdwPsiIeL+7PTpxQBuAjWvmI6Y5Tfchsmg9J3F1k3Kyh
	hqM6e3uc2eHIZXp4q2FKh7CvBB+OpvhOZ7RYnuuDVW+Ht70nJUPAca533APGciK9sn5k02QSwUB+8
	eiHt4n6+fnClgbjlxWR1zCLBvfSS9IL6zN216VeEX12on8F5ctI52CRXzBURwzhue/1hbEKnWnCzL
	QAfd2SWrNx75WMT0RCLOOwd/feC5M1ELwfPceTrW8lG/MXCLz9coP9lHPB+WfWlDNRDZEMCYe3SZH
	SoXnU8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vJI-0000000FzRK-1H5X;
	Fri, 11 Sep 2026 07:04:32 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vJG-0000000FzQQ-0bNH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:04:31 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so773013a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 00:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110269; x=1789715069; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCU2xeiF06KkVqtcXVSq5dyJUCYMUIv/B5XyYuirb0Q=;
        b=kGC5IB0j7AK8Q/isVeWuOA/xWptDlKqlSndXDw3dJAGGrmOXC874DVO1qpl3g7cX6E
         7hbu1BsKYVzziq1RUY0xs2ni2B/cChD/YTOnv1DTbFbtFK5WjVm0CEkAx6eV1V1YOBrJ
         qxG6aW5VTGupzolaZ7claHVJgEkJfd/4jTwa/51gpA+hJVlr3Qdlyx0GS7LYlIehfQDo
         wJYIq7n1dV//fBTpXZm93NbvPkORu7GErhncj6bWliErxgOAaMHiCLKbkBBB8yad9Biv
         lOC7C4PqBP1AVfyjJG7lhblMx5ph0AVUwf8oiKU0ZBvXVrOniT4xE4q1W/U94p6b6tzV
         aosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110269; x=1789715069;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCU2xeiF06KkVqtcXVSq5dyJUCYMUIv/B5XyYuirb0Q=;
        b=pLT4v4kEuX/VI7w10gE0tVBiCyTv4ob7lfnoX+XitspTBiSoFugqSAQSFxCDn57GbQ
         UBXcomS5po97SG4WQjH17D6bpxtGPP9fTmU9uTx7Ow08dT8EW3SmqQDS5Vh77TjjcxQk
         nLz/dknsSqGkk5fTFI7gYHNsoKu+EHIp9TkshG+lQenPyPTKSBNiJfNFERQJN/HblNQK
         Dv1opMqA8e3NfRk7QeTpxyBNmU+ZGNacKbNiW9HeDphCEw2Tu24OWehnNKmym+r6MIHE
         7eySxCw2xXSHtCqTieJUzZZSF1Zu9e17PQ+c0ccrNuaazgNRIAgUTjT8QC/Mz8G/ia41
         /68g==
X-Forwarded-Encrypted: i=1; AKwUvBzWwEbFFN3rp6v6Ly8GgMa5z3Mm2OkGxjuCZ+O1cpezWR+cksSJR9Kl1qP2WfljbE/9364JHAQPciNiU06Y9R7s@lists.infradead.org
X-Gm-Message-State: AFuF++mwkoKCxhrMi4n496hZJQhF3AmsoBAakkMt9HsapE7p3Nw14Wfo
	y9h7mUZvJrMrd8JIpDdMp12mzEXqt8R8v5Szmkga8zPz5V3C+WIOyH6IONYFhFpYVnUujHJttCQ
	i
X-Received: from plbkc7.prod.google.com ([2002:a17:903:33c7:b0:2dd:630:cea4])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1448:b0:2dd:3d1a:6958
 with SMTP id d9443c01a7336-2dd3d1a6b2fmr2624175ad.6.1789110268515; Fri, 11
 Sep 2026 00:04:28 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:41 +0000
In-Reply-To: <20260911070346.801948-1-morbo@google.com>
Mime-Version: 1.0
References: <20260911070346.801948-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-4-morbo@google.com>
Subject: [PATCH 3/7] arm64/word-at-a-time: Instrument load_unaligned_zeropad()
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_000430_190714_C8308C1E 
X-CRM114-Status: GOOD (  13.68  )
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

Convert arm64 to the arch_load_unaligned_zeropad() /
load_unaligned_zeropad() split introduced for x86 in the previous
patch, so KASAN/KCSAN also see reads through load_unaligned_zeropad()
on this architecture (e.g. under CONFIG_KASAN_SW_TAGS).

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/include/asm/word-at-a-time.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
index 824ca6987a51..656e3274ed7a 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -47,7 +47,7 @@ static inline unsigned long zero_bytemask(unsigned long bits)
  * and the next page not being mapped, take the exception and
  * return zeroes in the non-existing part.
  */
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static inline unsigned long arch_load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
@@ -66,4 +66,6 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 	return ret;
 }
 
+#include <asm-generic/word-at-a-time-instrumented.h>
+
 #endif /* __ASM_WORD_AT_A_TIME_H */
-- 
2.47.3


