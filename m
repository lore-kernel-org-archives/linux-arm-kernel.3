Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FACC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlxUuvHn55P4VJoa3VPKXet3o2roscTj71cLK/0XsCo=; b=0czOFwjleW25zwt+L+1yN0xwar
	L9UWLKW7Hw78ehWAjLVluQUXP37+exgaH7cc9Bs0WmjH21trtEM9mDaj5xD6ChjyaPaO0fe50umja
	yahaMWi07U5CGS2dLkhCXijtHtHCJJ+3/ftOCtblxi7rvx47b/y5v+mA/o1XOScEm/05gmFWC5No9
	j+LRMWqkM814RCiHh1d+DXcDI8iZFpXKSI4Awo7YHfVTFjC9fI+mDWww2TA/pqSiyDgdfbxlkS3Br
	Il6wF1V8F81MVY9BsdGiz/mP1hXOdZCJweFgpsOiAUfm99XouF5nTcEWAcaeRS/jfjYHQoW7ZCz1+
	l1+Ya8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPnS-00000009yXT-2Ua2;
	Fri, 07 Feb 2025 14:57:34 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPkk-00000009y4z-06Bk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:54:47 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5daa661ec3dso2621950a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738940083; x=1739544883; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QlxUuvHn55P4VJoa3VPKXet3o2roscTj71cLK/0XsCo=;
        b=RS75RCM5NnHYrd62WyUUdHDg64t38X/gVnDqeEGSUYou6+bLOUCU9rvRl2v55HtiuB
         dQQ15/fAQltu4I8LCHNBB0bV/Man7KMpdHgEaQVWBchdRv3Om7WccWRdn2bhWc5jEuNo
         GTNappIC9K0Km8FbWrMVEvnqrRZiOnxOKE+X8Q/ppBY10Cdm2Oqm8BkNM7QpjilmmgbC
         p6gG5pp1EDsLFDvME75r83pe6oltSzFcJWBxuBxEU/qRgp0E4FrLNEEkAI3OWKpWv0VP
         0LR98IwTsDt7jUCcON7sGvw3ABE0xUL6RJIpRhjlLqpztJA9nq5JWNa442sWDmPX+ZfR
         IV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940083; x=1739544883;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QlxUuvHn55P4VJoa3VPKXet3o2roscTj71cLK/0XsCo=;
        b=ELx3/Y0X5GlLp/kxUcxtlAJufXP+NjZrdcsbEVHgKUqSsoXZTN6l7mvHqL+rokF6nY
         J6bZ7xgPZ3QOdAzwz2Ls4gFU9dkKk6ZN49TX3ug16JfRe6DYiZMd7IWswnhD5mhv73Y8
         OFjz2nhbrbtE0Fe4uCm4jX2lUs6aLiOkIUI0BR29PBe3JCjJey6FnNrGTz4+RJAkmPh4
         WZn45/QgdwGmxQks2UU71v4+fGi+HkdsDB2jVXWfrFh8XSvQurgTt9mcCNqDcmRlNY4Z
         8h0AErFnW+1sv6x0yrMsOm89SJtlyQFv09VcG+CUSDGu/KOwfgfWDcQDZYrEh/TD7r7x
         81aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvGtJxkoPnW2C4Kd9rEwLz1RVsK6iR1aGKes9l5omdoTQj7ywJjRxogvD+2ppK+Af7+Z1W55QsroyWtR+ZIt8G@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0Lt816rpe+hNT5wImlzijWQ6Hx0hlWji//9e3JO1YOHes4NHh
	Zx5+C+EyqZVX5ShQgkoAoNDHXk0QY2b0PFN15C0TWEZzI5hrvSIRi0rbeI16bN6U1x1km+KZZfH
	DSkEHfQ==
X-Google-Smtp-Source: AGHT+IEuPMCv7YqXJlNHwKccMEWSYS/+UUaEr2aDY+SyLUIdyjbcKQ2U586hKi+BCjLaIqvUPKXUd5QYm4sG
X-Received: from edax2.prod.google.com ([2002:a05:6402:4142:b0:5dc:110c:e5e2])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2546:b0:5d9:f21a:aa26
 with SMTP id 4fb4d7f45d1cf-5de450a9e4cmr3320543a12.24.1738940083729; Fri, 07
 Feb 2025 06:54:43 -0800 (PST)
Date: Fri,  7 Feb 2025 14:54:37 +0000
In-Reply-To: <20250207145438.1333475-1-qperret@google.com>
Mime-Version: 1.0
References: <20250207145438.1333475-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250207145438.1333475-2-qperret@google.com>
Subject: [PATCH 1/2] KVM: arm64: Improve error handling from check_host_shared_guest()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_065446_065091_B172ADC5 
X-CRM114-Status: GOOD (  11.97  )
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

The check_host_shared_guest() path expects to find a last-level valid
PTE in the guest's stage-2 page-table. However, it checks the PTE's
level before its validity, which makes it hard for callers to figure out
what went wrong.

To make error handling simpler, check the PTE's validity first.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7ad7b133b81a..41847c04b270 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -943,10 +943,10 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
 	if (ret)
 		return ret;
-	if (level != KVM_PGTABLE_LAST_LEVEL)
-		return -E2BIG;
 	if (!kvm_pte_valid(pte))
 		return -ENOENT;
+	if (level != KVM_PGTABLE_LAST_LEVEL)
+		return -E2BIG;
 
 	state = guest_get_page_state(pte, ipa);
 	if (state != PKVM_PAGE_SHARED_BORROWED)
-- 
2.48.1.502.g6dc24dfdaf-goog


