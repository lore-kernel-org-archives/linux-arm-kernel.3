Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B307DD778BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLShc81E/+Lme+gJ9JRioNlppj/hbf+/HE944re/X2I=; b=BMRjQroRRKZ/PqRMYF4JjwTHpq
	zuLaZfuX0PTohzy1E+U8TcJQXvZquscBpN2KddPUdNP1/w52iNjSkw9XYq619zcFsujibnOB3ED/t
	e8fGhRKz4O+EMY4BGa0VkAbOSLpEo8dGDLynYXyYoRj7FIizhfbEyjKx3PhaETI4ZWRCCp283re1s
	wJ9eDaa2X4mvmfXbZ9C8QZTX79N+up79MKYndYeFs5sKk07F2ctd1fCwvSO8ZpfY8QwQDKj93h8oN
	V/8pp7Q67WRVpS3epohFB8PrdEYzqVLkWYLipsQdbpUlMPrfZ2DNuThAP+OOna2jjAutQ96p+ZJBm
	ftWzLgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsq-0000000CC4K-23gZ;
	Mon, 26 Jan 2026 09:27:44 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsi-0000000CBzP-2rPh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:37 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4801e2e3532so29091875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419654; x=1770024454; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eLShc81E/+Lme+gJ9JRioNlppj/hbf+/HE944re/X2I=;
        b=LY1TCYGAtfteSqKIPaxehcDT73/opLM15gz2nv9oIjT/qNwIOuAvYZP++hVU5TmfL9
         uuIWuKA0hdev3ZWee0OE4w32H0bzvDwZ8ZSatT3bqkYIZlORRV/IBj+qkgfGz59ZVcON
         gB5hMRymKYBh2s7EnjoaehiQT/82BSw6n+2rkKL2Ex/affqtkcBxs1Ik+H4OW5J7zyoX
         arcuIGniP2tYw3YILDjy3j5iL8utF7rAG2sJkYEvZza7MYHNH8Xbb8TcotqUFlEA7lBd
         +QUWPjUrmS2K5X9MZi5jQv6xTQiQjFBWlQzjoE4pw4zmazIow72K0EgyhPKXBHVua++3
         Q+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419654; x=1770024454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eLShc81E/+Lme+gJ9JRioNlppj/hbf+/HE944re/X2I=;
        b=MBrJ67oZArn9J9pSYEw3UZg3IxfKupLYu3kG4F/wD0w7yGrUwAnnP8zmmt8ZmwSEy+
         u+cvAB/GHeiF99oK9veB4xu4cHZ1daib7yoqLecJV13n9TTuVvOIlYwxK3gppsnyb23C
         K7ZBEtECD+TAMCy/qP8ioCqJu5E6sXCfCbL+M00nYly3Jc+jngR38icFetZHiMnGWcls
         9rkSqJ8RBCgyREE8pNeStHp1en/gdY6vbBzW6stK1VKl+34LYaNKaw+SjyzooEZ/fUsY
         NUyDOHzbel18M4aQceREvFhxG/+tlCkb0QsU/01uEQkI8WyOiFHke7JYAyTHkr+37EKM
         GgBw==
X-Gm-Message-State: AOJu0YwTLBlI+HLoDLrVP8gY8c3OB5Ux3HLTqaI6aGKUHGJnWrSuwBXU
	Wltsj6q719x4qFKvkXiuFiJZnTYFndE8ClyEjjw1A6bpcd1aZze2eJjiwkeF5oLCq3CsLr1e7w=
	=
X-Received: from wmbjw6.prod.google.com ([2002:a05:600c:5746:b0:480:3842:3532])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4689:b0:47e:e78a:c831
 with SMTP id 5b1f17b1804b1-4805d0668famr63022225e9.36.1769419654312; Mon, 26
 Jan 2026 01:27:34 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:34 +0100
In-Reply-To: <20260126092630.1800589-12-ardb+git@google.com>
Mime-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=874; i=ardb@kernel.org;
 h=from:subject; bh=Gtkmu5xUf/IdJr0kiShY6X4TSbxJqYA0pGP5tteQQSc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2EOMl1Oe+ZtxwpPOV9LiF4RXP+tbf+lo+TXjL389J
 m2duYmho5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkSiQjQyt7cfCidwej5f/9
 5p7Qf1Jt4vfD9tERNyW+nXLVefgp8xkjw8lZxm6uxhc5n927XLbV0/fcU+dXx87Oeyi4gG+7QvH jeEYA
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-15-ardb+git@google.com>
Subject: [PATCH v2 03/10] arm64: mm: Permit contiguous descriptors to be rewritten
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_012736_769565_F5AD2131 
X-CRM114-Status: GOOD (  14.01  )
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

Currently, pgattr_change_is_safe() is overly pedantic when it comes to
descriptors with the contiguous hint attribute set, as it rejects
assignments even if the old and the new value are the same.

So relax the check to allow that.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index c36422a3fae2..9d39de3cfe67 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -141,7 +141,7 @@ bool pgattr_change_is_safe(pteval_t old, pteval_t new)
 		return false;
 
 	/* live contiguous mappings may not be manipulated at all */
-	if ((old | new) & PTE_CONT)
+	if ((old | new) & PTE_CONT && old != new)
 		return false;
 
 	/* Transitioning from Non-Global to Global is unsafe */
-- 
2.52.0.457.g6b5491de43-goog


