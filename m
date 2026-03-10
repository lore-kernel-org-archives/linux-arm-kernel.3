Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE5CFD2D70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6R0MEPExNqGukuDQgEpxXtxN4aPLVf9h/otxBvo9VYk=; b=xk7MKyXPnkENIow1Kzqid2QPhv
	B7FRs36m6pPhuzNHalLuXnMuQFiKGTDx5/w/X5YvdS6U+OUrq3psSmhYvPkc5dNzWbDq4BtGKaSbt
	aAqQJv5rXMMM8HmICwIqn+6JzjY7hTBFvwtDkAv1Cw718X3qUjBfy2f3NW57m8sKBPeUdBg3poviD
	Lgoa+HcCyf1ivJMVH+ZTMBEAYXruua7eVccVkI3jHrlpTd3VBcT6uR1o+2XAOs+U/tjhXl1mRcysF
	q9P2BfRC7TVF3PGqnoCYsZcavXvY5VkqpxZqgVt/O/P4PTnZ21Sb3LcrNkGaLbLmc/jjkjBVQKpzv
	zLv7eFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwXE-00000009WIZ-0SQd;
	Tue, 10 Mar 2026 12:50:04 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX8-00000009WA8-05TB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:59 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-661cd3c9c0eso4222980a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146996; x=1773751796; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6R0MEPExNqGukuDQgEpxXtxN4aPLVf9h/otxBvo9VYk=;
        b=rIVLDmIdsSSUGw0Ww6b2EUuN78bflZ2EcYfFfquVrZOPf+gjCgo/7ZUDUaXX+AX1Tt
         yiBYNjFeMH/yTkQTqbzjnDanXftQwdRZhCqVGi3cyg/sddXqYCNFOT3wrTFDMjHgzq/f
         ms3wOx0CqpBzbM4ppB3A+MGgmoknzqKVe8VuuRkDdaYu5EWRTnndT44whoKasewEd+62
         EDkPM6RxGNVYnYBKtKqWEt70xQyk7CTo9yHxQkD3NM/kUm3X8dafzvwRLMM3fF7cYyEf
         TgewTz5LZoLnBe7zeOGOPCatu1wMk+KO1A4sDijkDVsje+qTxiv8HQ2FQ6Qf+hRL4oHh
         8wHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146996; x=1773751796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6R0MEPExNqGukuDQgEpxXtxN4aPLVf9h/otxBvo9VYk=;
        b=Vz+BA9yrsBCUBu6DtquH4ZgJF//T6Saw0CJV9Gywe6Iodfod/Tg0Lju7yVyQnc8MW6
         qcfpFxi9Mpf8m3ubzduoAjZxQBx/DOEYhxsgAScHHtvhkrtC5MlMFgvgsGw3Zb0w6zqN
         2VMaCWWqfp+vpNiBOrNyqt1WcCmmI5pPtsJ+oSXosUp0TZ8RW0/YQDNCKxZ/eV2x08/U
         /+pvLU+omeiW/E+nOpkgvl5OwiMR1aT2LLt8qsKena5IvIlPwmYX5En9CVcjYsb68qc7
         nsqOATXprWQwz6b0M/xqMhQMESh2Kn3owHrqB6jxeMSYHZNQuWzhnEYdqsIPfx62WYoH
         xVgA==
X-Forwarded-Encrypted: i=1; AJvYcCX/Ifyq1LigCijSaT77F7TzT1kNsPrGoaZ+iIw0grPjcaBAIoI6QPe3HTNsfwtKHz/KHkgJuJ0hPB5JnZEIXM4L@lists.infradead.org
X-Gm-Message-State: AOJu0YzU5uhTwGu0QN2xe5dLB+G3ADfzdMSwTHmCoeUKJGw5Q8vnKlJD
	XN7TInmHsLaaK4lAO0TQpyWs7j8jkcjjvRA9IyKrjeX+jErwCSMy1CbWZvWRwkeUXftwWRVYgFb
	u9Cf3+9nqMejbj6sE96K+Bo2LrghdVw==
X-Received: from edtb1.prod.google.com ([2002:aa7:c901:0:b0:662:85d8:35f8])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1463:b0:662:bd98:890a with SMTP id 4fb4d7f45d1cf-662bd988b1bmr1727440a12.25.1773146995409;
 Tue, 10 Mar 2026 05:49:55 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:30 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-12-sebastianene@google.com>
Subject: [PATCH 11/14] KVM: arm64: Restrict host updates to GITS_CTLR
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054958_080429_025FBFF3 
X-CRM114-Status: GOOD (  10.62  )
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

Prevent unpredictable hardware behavior when the
host tries to enable the ITS while it is not in
quiescent state.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 4782a9a24caa..539d2ee3b58e 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -274,6 +274,23 @@ static void cwriter_read(struct its_priv_state *its, u64 offset, u64 *read)
 	*read = readq_relaxed(its->base + GITS_CWRITER);
 }
 
+static void ctlr_read(struct its_priv_state *its, u64 offset, u64 *read)
+{
+	*read = readq_relaxed(its->base + GITS_CTLR);
+}
+
+static void ctlr_write(struct its_priv_state *its, u64 offset, u64 value)
+{
+	u64 ctlr = readq_relaxed(its->base + GITS_CTLR);
+	bool is_quiescent = !!(ctlr & GITS_CTLR_QUIESCENT);
+	bool is_enabled = !!(ctlr & GITS_CTLR_ENABLE);
+
+	if (!is_enabled && (value & GITS_CTLR_ENABLE) && !is_quiescent)
+		return;
+
+	writeq_relaxed(value, its->base + GITS_CTLR);
+}
+
 #define ITS_HANDLER(off, sz, write_cb, read_cb)	\
 {							\
 	.offset = (off),				\
@@ -284,6 +301,7 @@ static void cwriter_read(struct its_priv_state *its, u64 offset, u64 *read)
 
 static struct its_handler its_handlers[] = {
 	ITS_HANDLER(GITS_CWRITER, sizeof(u64), cwriter_write, cwriter_read),
+	ITS_HANDLER(GITS_CTLR, sizeof(u64), ctlr_write, ctlr_read),
 	{},
 };
 
-- 
2.53.0.473.g4a7958ca14-goog


