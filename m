Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DF7C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzpL3Ld7f3Wg7N4Mr5qllGNQ06XKr05fHXYYgZEl88s=; b=VXeSdZl+N36KPGaFT9W5Kx0wgk
	VZpyDZMOxYTfFfzKcV0zvGF7Mk8JiCLa+3ooSzCCFBSMSlHdxSOdgHBp4z4ouAfSyx+214LvqM2sp
	TW4fpd58urs+sODGrN4v5undHFdJ9P4zhBesXPJo5DOmylhlJahDt8tfuGnjIf8PJiQIllBwa7aCl
	OfszmRTytyU3hIrWUIsvyhzle2aMQe/9xxF6tlUtcw7q3cCQiAgD0/jPSWAbTTQXQcylcmq68lsgs
	t8ClPV3Rm5RxNAprM1lLl2hr7YA4RihnvwSu02BkyDZnorw1Z7FW/w66G/Nt+PZosw7Vmi0QdoZEx
	C9WYNJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkFL-0000000Gk18-13Pr;
	Fri, 20 Jun 2025 22:30:07 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4G-0000000Ggza-3C6G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:41 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddc65f95b8so44628745ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457919; x=1751062719; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzpL3Ld7f3Wg7N4Mr5qllGNQ06XKr05fHXYYgZEl88s=;
        b=MEhjKJEtmeNSfpdmbwsaOb4/3uAKQbKZqorCYjy3COHo/vbAUP+CdvQXvBEo7XQa2q
         ZG42ABYXMSu05SVISGxw/gncnPwe9PATcwUrBSP9+uIW5Dspf9TbFUiMOquYU/uUldaU
         k3G82Y85i4Dabr8QhhsY8GfTqhDojIQE4lIvTBJn0j1eC2MU0xQ3g5B2wmkIMu7rMZn6
         jtYWkfxZOJ+NUVOVNHJZkSE51brzfKsG/JpvvJgZplaccLHy3FFfjRA1/BZtlkz3qwKl
         4DPU2IoyXj1sP+m9UiKCg84fl52kIV+w73R+6cll9UKKPVhQpWUlXZ0IGgzeYLqZAlA6
         I7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457919; x=1751062719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzpL3Ld7f3Wg7N4Mr5qllGNQ06XKr05fHXYYgZEl88s=;
        b=bUqpjLjFKODJSR8Zj/KJlpLY8B0hWuiN8RgiSfLUJz2C5r6JGInSAZBPQ9VEj9C3+K
         NfjRlDynyTgiLBFCAqy6/nYclrdr+ILgDA3QMI4PyMmBKjDQqAX8Lx7dNApYdR1jVmHV
         TKToLDb/H4pqpyg0PMcmYgfnkgH8h4ZGPKVM9nVdDjsB0HmGkkPSZGKUmDmMXkOLz4nC
         PoSXHqm4AyuBen52lqMCzUl8t6dtAwGXWr7MVWySnksfjO9Vy82hZbdYdhjazsIYhLgb
         r+lU5hAa2hdafqY1Zr5a0LjGbgDyoBwo0XaUiKVAiaSOfDRJAmkJJ6+iiEsw8W6s1cqh
         0xpw==
X-Forwarded-Encrypted: i=1; AJvYcCXDQCB5U7t159AHNhqUUU0h98Je5F8si7Gq6XEXufVHLvEy1ULSAPUoZtN6JZ9spiLH6ba9VnJimEMeDtjNWWAn@lists.infradead.org
X-Gm-Message-State: AOJu0YxC7S1Dklc3jcmEjIAHcCcLJyot8jU42GVmtx/3JGK6Zyz9eJmT
	65DnAzsf0DebCTLT9ab69VI3kzatbQLs2lVA8rhFtwEwPiSMtALVZxGwTXb/6t65EejPknwDrDG
	QD4/LtLN6HukwXH0X0cDj10wHgw==
X-Google-Smtp-Source: AGHT+IGe+i459NmOZi236cX8Bur8HwnWegO6n5YG8V2oQ3pdTXQJfj8y4MrKY8v3FuSI+vF/XixyV2nwOspzfQufmQ==
X-Received: from ilbea3.prod.google.com ([2002:a05:6e02:4503:b0:3dd:d24f:26bc])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a92:cd83:0:b0:3dd:cdea:8f85 with SMTP id e9e14a558f8ab-3de38cc7adbmr52345645ab.20.1750457919574;
 Fri, 20 Jun 2025 15:18:39 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:04 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-5-coltonlewis@google.com>
Subject: [PATCH v2 04/23] arm64: Define PMI{CNTR,FILTR}_EL0 as undef_access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_151840_797301_F2317576 
X-CRM114-Status: GOOD (  10.79  )
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

Because KVM isn't fully prepared to support these yet even though the
host PMUv3 driver does, define them as undef_access for now.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f..99fdbe174202 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3092,6 +3092,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility  },
 	{ SYS_DESC(SYS_FPMR), undef_access, reset_val, FPMR, 0, .visibility = fp8_visibility },
 
+	{ SYS_DESC(SYS_PMICNTR_EL0), undef_access },
+	{ SYS_DESC(SYS_PMICFILTR_EL0), undef_access },
+
 	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
 	  .reg = PMCR_EL0, .get_user = get_pmcr, .set_user = set_pmcr },
 	{ PMU_SYS_REG(PMCNTENSET_EL0),
-- 
2.50.0.714.g196bf9f422-goog


