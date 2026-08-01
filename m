Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F88C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u7Hwn0xlTzxIN2uBpUzcPzgILfRygUZswZJisr8yQeU=; b=ap4T/FClWchOno/Hutc5PTGoJy
	HV0yDabOFnD4ca+FjaKxFwbUQ/0p/q2tdTYnOt3sBghEofJsV0DDhyI8F6MU9m9hgOrK2ulLn1Fzb
	7CuTrw5DWTXm348seO+iIrvnRovfMEMJVjGtTkDxPD6jsZyYIiY8V6JAeAKjH28Q1f/dUyykIFSMw
	/ix6+a3SoVCosKpu//aLOvU8qjfVhCCA3P7UYvuSUMghlHvpt6/zzqUQkaHYXfUxFruFwRZHXYsk0
	KvhMWjD6atrFRCLu3rUiVWbwjCpyX0yvy6TQY/F5I0VSSujiaLWpJK7+QG81Gjcg/Ahl6PXxQWzEz
	C7FmoNTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBmS-0000000EoPE-1drF;
	Sat, 01 Aug 2026 15:37:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBmP-0000000EoOl-1nvF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:37:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4954aff6088so5597405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 08:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785598659; x=1786203459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7Hwn0xlTzxIN2uBpUzcPzgILfRygUZswZJisr8yQeU=;
        b=RZc5HDx0c9sNkteNriUziamqpqEG6NaEpIArkLFAm6rpfmCYDljDbqt1inGCW7NwvZ
         2+ItB49RsE0y2rWlzHoRdK44eWhOfrNswmjzx0hERL7Hg0iRW8v7n1+TU/hWJ1LLHVHL
         K/a+UP8fOIPe2SKgsFcQXRs7whnyneiCeXxYflRfXV21pXgOkBAGRvxrlyj1HYhd1MEk
         QM0KK8MjdI79ZxWppCV4QcE2db/Lz6OxOCT1aXDLjAI7tKeurjhaihcwyCdzP8UUTXMt
         wwW3TU86qfjcZ4jP3bWxLK27qqJdSXXHCRbxtVjoLe9id8HAaTxcO2ZQgwQct5DnqWmT
         R4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785598659; x=1786203459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7Hwn0xlTzxIN2uBpUzcPzgILfRygUZswZJisr8yQeU=;
        b=mavUKwHjRGMyhjXPftiNgImbNWDyvkuyQ1W8ZArAjPZCAkcV6u+VR9wlwhjev7U04c
         x+rzK5tgDv95024YGfH8QwCr43aDGAiL0BIadoPbVDaReu3TwR8ZbCS1Ts+8rGQUqyID
         z+6XxJ3T0KCx8m1041uFVNcNYU3dnbd9CHNG/unhk/BWiE9y/06RJcWnJ8MEq6RXPdLi
         Kgabei2/mhJi20h6kYvq4PNSl6TW26g5astQwuOFOZ889U1FNzQe5J48yLfqO3GnjnIh
         uJZkrWm6OWFqU2nXGfMoLbrDPEt6Sn+mr8DM1MUVCt2X1ALFdkNRSN2M1tPHEJ4hvwK7
         Y8CA==
X-Forwarded-Encrypted: i=1; AHgh+RpqiGgRNeuuCT3rvv289BAZh2YCq7KwQd+zHM2n40DYjCP7Q/fr+pbKI5wbLODXDLVO9jE+4LEcP1fSSTPPNqtJ@lists.infradead.org
X-Gm-Message-State: AOJu0YymRVEEjN6c1WQnJdIVkNOoAvtzX+AV3uvpvaBYnHeZwxQiiOR0
	2WOKuLQHxt5J9Z6H+bGkBZBIqL2VOuwHS4kJauJytsvMsVZxGdCDiqJV
X-Gm-Gg: AR+sD11fq2Oj69rkl/zm7pwHhwwS9TNXNLKoMPnbUgw/u+cdMwjdHi+CGFysxoHRoj+
	FemJVEgaN4Pre9rJh0F9Ne36YExQVUM4HMjr9ypjiPZVLQcsS/4NBjfjW4ZwCp7Ol9G1gkcbSb2
	lLmJmAzN9cLrE4boVMl1HzIrv4tUSs00uoAaVVCQpn2hMf3bEjP6mPoy1SM6wZTqPvGfFhKvB/B
	b/m39JauO4di3hIkY1lQDXbCpROEV5jRDTIrQWDFHx/5re8lXvYKOC44rCRlhlyxGiysJvZdjUC
	1aZgF1h5NC8ziIvl+JQW+vbOMCsZPQ5dpsChuJfKF4VK9++CcivP5qKMRkq8ZM9twscvAsWmMhs
	WpcDYaSqoEP78xugD41r0z6nk5TKNSyxLPz6DUQ2mX1gE2iHPvdFm3ucroOsTGKM8m8F8HKhUUI
	3B/uO0Ta6SggLcd1kGD94taEqS7JmFzFRDJDFtnxCv5oomP9J49GMRmcQVac/5jfwnm9RqNrEhH
	n4uVdVq46AZheuknnSd+iuMT5VDoqLhp6gTlga7BNvi44X/1x6/b7JSuDfJwWnsJvZ/p6U9uVoV
	zpNbm221FponU/IpDeZLz+oknA==
X-Received: by 2002:a05:600c:871a:b0:498:952:e276 with SMTP id 5b1f17b1804b1-4980c66c991mr73253905e9.8.1785598658895;
        Sat, 01 Aug 2026 08:37:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-005-130.95.114.pool.telefonica.de. [95.114.5.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b67529sm65115055e9.8.2026.08.01.08.37.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Aug 2026 08:37:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Preserve AArch32 CP64 registers on rejected reads
Date: Sat,  1 Aug 2026 17:36:16 +0200
Message-Id: <20260801153616.71960-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_083741_490114_4ACA453C 
X-CRM114-Status: GOOD (  10.94  )
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

kvm_handle_cp_64() only seeds params.regval for writes. If a CP64 read is
decoded but rejected, emulate_cp() still returns handled and the caller
writes params.regval back to Rt/Rt2.

This can happen for write-only GIC SGI registers and for rejected PMU
counter reads. In both cases KVM injects an UNDEF into the guest, so the
MRRC destination registers must remain unchanged.

Instead, the uninitialised regval is copied into the guest registers. With
stack auto-initialisation this is a deterministic zero or pattern value.
With CONFIG_INIT_STACK_NONE it may be stale host stack data.

Match kvm_handle_cp_32() and kvm_handle_sys_reg() by seeding regval from
the destination registers before emulation.

Fixes: 6d52f35af10c ("arm64: KVM: add SGI generation register emulation")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Runtime tested on a Raspberry Pi 400 with a minimal KVM harness running
an AArch32 guest. On the unpatched 6.1.21-v8+ vendor kernel, the PMCCNTR
MRRC test took UNDEF with r0=0x00000001/r1=0x00000000 instead of the
guest's sentinel values. With this patch on v7.2-rc3-278-g38436106b2f5,
the same test preserved r0=0x12345678/r1=0x9abcdef0.

--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4860,11 +4860,11 @@
 	/*
 	 * Make a 64-bit value out of Rt and Rt2. As we use the same trap
 	 * backends between AArch32 and AArch64, we get away with it.
+	 *
+	 * This also makes rejected reads preserve Rt/Rt2.
 	 */
-	if (params.is_write) {
-		params.regval = vcpu_get_reg(vcpu, Rt) & 0xffffffff;
-		params.regval |= vcpu_get_reg(vcpu, Rt2) << 32;
-	}
+	params.regval = vcpu_get_reg(vcpu, Rt) & 0xffffffff;
+	params.regval |= vcpu_get_reg(vcpu, Rt2) << 32;
 
 	/*
 	 * If the table contains a handler, handle the
-- 
2.51.0

