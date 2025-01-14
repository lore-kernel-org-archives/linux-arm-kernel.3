Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91CAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Mime-Version:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0eTIIfStQ+7VgOiC8tdc+ucwS1WrBZu33tceKYHTFlo=; b=YU4AkkxQIXQLlySxyirxS/1Owd
	GJjPp9M2GfUL6xgLBsWuyPc8KNhFOLDA1l0JnZC8vaP5BUTQI/Os+VwMqGQ+eAt5fR/AiRmGUk8fH
	SxTxe+woAKfeSjEdTGkx1BICzFyB4T8LLN1kTKJa0MvcQnL65C99OjpY6JSrke2fMFuQzQIUtRoTe
	JlCyKPXn1QunNriDktXsG20fNsFF3zIIs/toeraVB1XKqsebsxWNT5GsM3Fgs2cxsfV2Ok9qewwqF
	FOt5Cko0nUOV/Wb7ySwp9pYnHYMmHJ3J3vmLyIOlF/tZoBeJCIqeJIrLzE3EGmbRgrwrC6MvxL/9D
	RDv9Qtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiHK-00000008kY6-2Wpz;
	Tue, 14 Jan 2025 14:52:26 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiG3-00000008kGV-38s3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 14:51:09 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so19216825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 06:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736866265; x=1737471065; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0eTIIfStQ+7VgOiC8tdc+ucwS1WrBZu33tceKYHTFlo=;
        b=PfhUHrtSM0SuHhukE5fCwGD7PIrMpp6X07jFw9ydsM8/UnlrzZ+Fd5K8t1wmHQhlNk
         8mOKnNP38vTqbluudk6wWdY5Hj3dmcxuYygNyYFom552a2mf3rqTaen9qnpCGKt7T2cj
         683BZCLWLKy/l5fPhrmm5jlSwBPEwxrNSwLqOafPGuztgxUf4zTk4oIDEzUNMRbd3hJo
         4UTYZlZh7lcIiQPYrQ4c5ldzkzBEYhmuwYVl9FmyWjcgtOzF5ewvMfNSRgmWEYTjfxjx
         2J5pi38Ae++S1XVqSkMU3Cp7TEVtCpYTcnRO3dNFT7E8jSTylgjrBK/IXsNzl3XFjdyH
         KTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736866265; x=1737471065;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0eTIIfStQ+7VgOiC8tdc+ucwS1WrBZu33tceKYHTFlo=;
        b=VYmlAzPqoitllNDWV/qEGowPGXC9Tc+stqUdgX6SHKLVmBdqFX200cASrExaYIDmXI
         D6tEOr4K+0Ai/Mz+NOEtqPWh2gVmTHjrdfq7YKRaves1bYdxaHPvKODWryFgJKsjXPt0
         5TRJFPZm6mN67Oh/V0mHE/LDOcioOa3P+23kMP2GFu/uD1Qavyh8pb9N6HLZY/wfmcN7
         ousf7OPVV2WwTEyWeYLSDbKQvQD0gaASsb0GOu1kykwAcyPMWzWWXTWlQUrfis2HcfJZ
         1wUMxocK2ta4AqJYsvA0xFgIWZAUgEN1pKTqMfRd4FZJVnL2DT3fZTy+Q2/Lub3QNqU+
         qwEg==
X-Forwarded-Encrypted: i=1; AJvYcCXsSOXLRSazdVgoKWCQwenGqGG9UQAqAvtt6rr4a7G1mP6xml4vY41X7YufJCLZ+J+7WOy9oGeSyiJDUkSiYx6E@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2caXxSyL6oYvwTkJ31vd4G8JhmwwChy71w1Q9XCzAyoP7Zn5M
	xl0f1oKEb9d4F1n6+DZBHlYYW9PFOa8HPHMcrPLdYUrN0eOZx9lN2dv5nA9scHPkIF/uj3Ekuse
	ZHCNrnwKr24rfKRUxctlGu2A3+A==
X-Google-Smtp-Source: AGHT+IHHxF6PgjGCqVXzpxA4AjixYi8BbG8haFoZBwrYz/9M9zFcbsfYBWQrtZ6low6sVY/sgvFdwRItNXxCPl5Z6Pk=
X-Received: from wmbfp16.prod.google.com ([2002:a05:600c:6990:b0:434:fc6f:e8c3])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f4e:b0:436:1ac2:1acf with SMTP id 5b1f17b1804b1-436e26e28cemr219984475e9.20.1736866265825;
 Tue, 14 Jan 2025 06:51:05 -0800 (PST)
Date: Tue, 14 Jan 2025 14:50:51 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250114145050.563658-2-sebastianene@google.com>
Subject: [PATCH] KVM: arm64: Fix the upper limit of the walker range
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, sebastianene@google.com, 
	suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_065107_788161_1E019674 
X-CRM114-Status: GOOD (  12.48  )
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

Prevent the walker from running into weeds when walking an
entire address range.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 40bd55966..2ffb5571e 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -260,7 +260,7 @@ static int _kvm_pgtable_walk(struct kvm_pgtable *pgt, struct kvm_pgtable_walk_da
 {
 	u32 idx;
 	int ret = 0;
-	u64 limit = BIT(pgt->ia_bits);
+	u64 limit = BIT(pgt->ia_bits) - 1;
 
 	if (data->addr > limit || data->end > limit)
 		return -ERANGE;
-- 
2.47.1.688.g23fc6f90ad-goog


