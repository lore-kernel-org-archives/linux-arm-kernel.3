Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0FECD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPcON38i/uY+vfZomqsbE4paaQjqW1yEj/vRQWl6QlA=; b=nDtsJIuBM0Cp4NKnzhtPMfJeLZ
	d7RK/VGkjfIF6ZuLFs2WPaAWStJwVy/zHoIeYVFca9Gx/7bgHSKvv6z21H4VEvPOmRGtUyHa5cj+m
	wqytLn5Y7g7+D9LR2bYtxOcsANt8cuyC51EFq8b1fLg6nUn/JSlVb9OpowyQitrRW2W4cIuuUdfhZ
	/IO0aiRHittw6jLGwHv/bgvuk/CHRQAHgCQPjAGEQpqGbS9nU0Z6txl3gNVkY2AAnRB1ghHgjtEqN
	IzSOLHPexHC03yMrrhFrPZLNweG4cOmnFgayFRKtPoKz1PaiMiRyOnpwsip4IFpdHiqQ1qD4RFD7w
	Bev9H4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjPk-0000000EsRY-2vwB;
	Wed, 03 Jun 2026 11:05:36 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjPi-0000000EsPk-1UuE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:05:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490ace40f13so14369205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 04:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780484732; x=1781089532; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JPcON38i/uY+vfZomqsbE4paaQjqW1yEj/vRQWl6QlA=;
        b=rjIDVmXSYb1PmbH5bnQ9FpAfAmiBYf9gsjQcgvj1QCJB6HhYd4ogbseWTQWwGqRZdl
         4AOcXGCiQ8bh2Oe1vKbDI3zDO4rohjEqm/Mc4i5qF92joNdYAAT/wd/eVG/hiVoTM6/o
         QWWYaXpg8DpX8i1IK3jhqOHN7ljsWfHY39OaHxt2Y+tSy0hFAhpFCjGpbTYat74S3s7j
         kXrr6Tw+KbdWUdC0zWhuYwkjsU79B/EUqP9NBjVQUmXYZNDL1awKUVcjdfxBEB2MnCnd
         k8yQ7QL76m+38FW0pFiPhoQba4UYa7VAIyAwINNi6Tutd7FQqb+cmAQ8TlVckfnKKsHt
         rxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484732; x=1781089532;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPcON38i/uY+vfZomqsbE4paaQjqW1yEj/vRQWl6QlA=;
        b=D1crag9eWiZgOkQjIo0uMU8t4O0p93ShlWAxMe923dg4uSK7o++439V7OjHZrZYCB4
         Ujh4Bz5QsBrwQXmEI42vQ+f8iVvvbENacVfmm9906mzf4lV+ucustJNhB0EfXuXKrRV3
         hXqfelpFvcqJVeETs1o9XoHP4+Kn8ni2VBscdBSzl0p16DHyGqtnAT8DYgpyZZpdDS17
         5J7zUG8lkqLEApKKwDELx6GTiXKIY5tTEDUKw35GYKHQyYw2joiG+FnJoTawZZ8JX7ov
         GCmwoV0JCyl8P5ejBfXiPFQiDpjLE+dL5jUBk7L6M4T8sK4GHpBtUXV/26U68DopBbgd
         5ixw==
X-Gm-Message-State: AOJu0YxM5U9dWRMzqZSMeA5Tlf28o7LFkjcO8xRCEbmc1LjeeQzyxc+S
	Utmf4tT9uVtBmcOnwcvrhOYrtS8uoE+W4BlO5pttRciFUEOsM7a9c8PIElA8nxLHnLc6Rksr7Vm
	y6iB8+LxJB7KJ6yDm8WscWAq/C9aXwwlp5TWcZG3PihrFH79srypmF2GVo01LIIGLE79gMNjBsg
	iplRVPDxlSnF7Qlxm7bAaRfYZohJea4W/LJNWrG+fd3Z7nOnCOsix5VZK6yyee95+wyA==
X-Received: from wrwc11.prod.google.com ([2002:a5d:63cb:0:b0:45f:60ce:4270])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:354e:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-490b60edb8bmr44260465e9.29.1780484732043;
 Wed, 03 Jun 2026 04:05:32 -0700 (PDT)
Date: Wed,  3 Jun 2026 11:05:21 +0000
In-Reply-To: <20260603110522.3331819-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260603110522.3331819-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260603110522.3331819-3-smostafa@google.com>
Subject: [PATCH 2/3] drivers/virt: pkvm: Fix end calculation in mmio_guard_ioremap_hook()
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org, 
	rppt@kernel.org, maz@kernel.org, aneesh.kumar@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040534_399874_0258A12D 
X-CRM114-Status: GOOD (  13.21  )
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

Sashiko (locally) reports a logical issues in mmio_guard_ioremap_hook()

mmio_guard_ioremap_hook() attempts to handle unaligned addresses and
sizes. However, aligning the start address before adding the size, might
shift the end to the page before.

Fixes: 0f1269495800 ("drivers/virt: pkvm: Intercept ioremap using pKVM MMIO_GUARD hypercall")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 4230b817a80b..d66291def0f4 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -82,8 +82,8 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	if (protval != PROT_DEVICE_nGnRE && protval != PROT_DEVICE_nGnRnE)
 		return 0;
 
+	end = PAGE_ALIGN(phys + size);
 	phys = PAGE_ALIGN_DOWN(phys);
-	end = phys + PAGE_ALIGN(size);
 
 	while (phys < end) {
 		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
-- 
2.54.0.1032.g2f8565e1d1-goog


