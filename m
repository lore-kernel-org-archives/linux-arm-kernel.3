Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8E3C3600D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 07:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VjdDMxOJ8ypIsJr26T0ef7SswO7nHrS4JeKFOEHommw=; b=U6vKU21+8FgCxeZa0Bh8Ysuu0G
	XPw8L7iGOIMSqyfN8i5AVQUbcekjFk65nU5MielFu4shLMWtoub8Al/IXKuk/3ft5NugwmsbShsK6
	c7+U8N1NKB8xl6r3injrhXrcVB9CjE5FApyZk06JLMW7Pc2Ji+8COxoyXQiI/06znhWTrAJDZHZk4
	Q1FQD7lFWulUqqobTe5NN/YzhAgucg5PNAjIzPemyceIbBlrvj838r+u0Oaf4BF0MkA76bqvonl1v
	7MveTOPwt/TIH9SNIYb5jLu4PdMcPldFxqhvjeCJwanrJ0B96Vwrr86VyYMEjPUSxG0TxpG+Hhp+U
	9VmBLblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKqr-00000007k4c-0Mg2;
	Wed, 26 Mar 2025 07:07:01 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKnP-00000007jA5-1Sqn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 07:03:28 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso22799355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 00:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742972605; x=1743577405; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VjdDMxOJ8ypIsJr26T0ef7SswO7nHrS4JeKFOEHommw=;
        b=jfgNB8TG9xG7IzK+WP+u1l5U5jno7nF9iJpATuzzs2B33+rdP4aWUqL3HBYLx4Zawk
         evwXQuMZeS6g+3uubHf7dEcuYR5ze5QMnQddhysaz/BxZZu71XND8OXYvcbe+yKZpgA3
         FA2UGSWco/mCvJI+7hBy3dzTb4cOLo7CLVmMgzWnkeOdEQs5UE3UuCW/zQd00M1zlRTk
         cZ5yqeDKUQnZNlINgB2XZUvn/HJti3HWTDpVcFeo44ibSj/XAAGzAV0a2ZBXt6e+CEtM
         i5rwKqN5v50W+W9XFPqahqvS2qUsSa/RFw0WlPKdeQypo+T9deGrYyW/OlUEb/kcpuG6
         BH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972605; x=1743577405;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjdDMxOJ8ypIsJr26T0ef7SswO7nHrS4JeKFOEHommw=;
        b=n4ohav998zcN8omHHNq5Qewy6XPJTF7YilmSXoULe+aGjLAxUSZerkPNRZnWMPXMP+
         eRyK0uICwteFWY9kdJkf+1iDvjECCc9nCVg7ntpJKuTaIpSNGSAHFFWalkEAdVLNQR79
         6B6Da+2jU987ohn3agQaxtvGqubnWFJQBpcxy+BZiA7Gt2H8C1+9Htt8evmeoqgUNjzI
         0SYU/Etx28SRZvy4vKEHJwlGUcgHowQjR+ntB3it5ppceqyXzKYw0tzF24wHijBPp/4i
         Hu1KP8fImftOSmwzhS2KY9V9YRAJ+KHGRgBIhr8qJlQR7+1+PqVvAsq4qkGXqo2yL03J
         /4Nw==
X-Gm-Message-State: AOJu0YxGRzOW260Zv3rSajQC3PGBacqDc97WGm56zL42CSooivSctzl+
	NtY7ZgkYB0gPi0d6qeTJqjVkacS5c7bpTat/Z/GA3g3i1t4O2I8w1FS6K+4ejJ8Bm40Sd+C1BE9
	KnKyZdpvBEiB1cixBtScqoPVQ2PF1/OzAueuYOdAPrLLLudnNZAfMel2LVgVXMyDRsP5biFtYqq
	4KHmg9CAMgWar3UMZct+3q2KpLhnNUH6jr8xTKoqA6XKMhDw==
X-Google-Smtp-Source: AGHT+IH/xYSgXGEpnU/366BtleKSATBGgV7i3H8fDcMjsdSTbRVbQbDtBIxppx2fAgMCYggfEAQrcuBHoQ==
X-Received: from wmbgx13.prod.google.com ([2002:a05:600c:858d:b0:43d:8f:dd29])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:186d:b0:390:ed04:a676
 with SMTP id ffacd0b85a97d-3997f8ff44fmr18138026f8f.22.1742972605097; Wed, 26
 Mar 2025 00:03:25 -0700 (PDT)
Date: Wed, 26 Mar 2025 07:02:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326070255.2567981-1-keirf@google.com>
Subject: [PATCH] arm64: mops: Do not dereference src reg for a set operation
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Keir Fraser <keirf@google.com>, Kristina Martsenko <kristina.martsenko@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_000327_405605_9B6B5355 
X-CRM114-Status: GOOD (  13.25  )
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

The register is not defined and reading it can result in a UBSAN
out-of-bounds array access error, specifically when the srcreg field
value is 31.

Cc: Kristina Martsenko <kristina.martsenko@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Keir Fraser <keirf@google.com>
---
 arch/arm64/include/asm/traps.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
index d780d1bd2eac..82cf1f879c61 100644
--- a/arch/arm64/include/asm/traps.h
+++ b/arch/arm64/include/asm/traps.h
@@ -109,10 +109,9 @@ static inline void arm64_mops_reset_regs(struct user_pt_regs *regs, unsigned lon
 	int dstreg = ESR_ELx_MOPS_ISS_DESTREG(esr);
 	int srcreg = ESR_ELx_MOPS_ISS_SRCREG(esr);
 	int sizereg = ESR_ELx_MOPS_ISS_SIZEREG(esr);
-	unsigned long dst, src, size;
+	unsigned long dst, size;
 
 	dst = regs->regs[dstreg];
-	src = regs->regs[srcreg];
 	size = regs->regs[sizereg];
 
 	/*
@@ -129,6 +128,7 @@ static inline void arm64_mops_reset_regs(struct user_pt_regs *regs, unsigned lon
 		}
 	} else {
 		/* CPY* instruction */
+		unsigned long src = regs->regs[srcreg];
 		if (!(option_a ^ wrong_option)) {
 			/* Format is from Option B */
 			if (regs->pstate & PSR_N_BIT) {
-- 
2.49.0.395.g12beb8f557-goog


