Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5609C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g5s/vMNa6k0VF8k/74mjwV2z8bECBFX7KuPQJtOVcc=; b=JjScR42q5yFyF3bZJNAOMsEfqX
	TH7Mg0Vgfog6snbDIyyZ7hQRRMOa2UJX4rOcizFlOLAewbuOGEI4uxS4+kkOiLkHQX0MJefXk38Sj
	NVoJKpNk9UxezPkIm2xoMZnk/S5tHYQkhwyaxa6vc5wtMQFyqyvLpmNhY764gVAXPbZvzrkRVXl78
	ZqaXhg1bbDF9v9/3objl2Y32H4GGOHUyAYO4hZ2PR0exZ+WgczI7Tdna23kAkk959hkFdgijmdlDR
	du3C2NQWPEGFODrtggxfpQ9tMdFmyzAMzQLJRiEhBJWam1Qto4C0XV+oZM7mn9byfjiDKxdjOhoEm
	7tIVapRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJUa-0000000D8JO-1DMO;
	Tue, 05 Aug 2025 15:22:20 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI9P-0000000CuOg-43ir
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:56:25 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b780da0ab6so2431414f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754402182; x=1755006982; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0g5s/vMNa6k0VF8k/74mjwV2z8bECBFX7KuPQJtOVcc=;
        b=fw5clXOHEIi0HEDZkbLvo6FeQF7te+8bwL4SaV4kSoYBjlcKoxu67cuw5rkgD7VyI/
         Ywq9WNeBSlMfdGqYvoXqHMdAv8LHbiC+qlfPxg/FsB5rWOlKkYBlu97eGNvlml84+WX9
         ulJIui04leLQ0KC7aNCrme5Bwh7Ju+84jucRhqig/nW5LAvGdsGzhjZKbSjQzv9ngYue
         r7r6gRs3OYbg7xQEvXYrzesZBXN+fyg6U7UGVf5vnbtfEhlecIvhf3g2/o65A7LmvqsB
         oTqeR+D/mVPWSHsimGk1erJFMJYL7JC4ToxRYUDje2bU3tsj9mshfLewkPkAF6Hs3WTJ
         jqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402182; x=1755006982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0g5s/vMNa6k0VF8k/74mjwV2z8bECBFX7KuPQJtOVcc=;
        b=hZTAOGl84oCyc7KF5YlbreUdtubcF5oWRAQxvQpCkZa1gRfmdlhV0Ng9XniJXL+Z3Y
         11/DENm97qZdi6xow/dHbXOXlcVZFeu5F2YnJ7mZrwBEhcC3lmtoCZS34XFuisi9wbBQ
         u7/x/lO3JZ8hYKFVSZJnXm80J/3RX0SndBel721BZ7093EalDpsCEvdzlH4uauYulUdI
         YI5hsibL6OV4Da51iTZox05+IguminnOCPelhOVOkuoncNwpijwT9rwWc6O8OrgihZpR
         fq5JDwuDFBt7QPEaITp59fWWt9lfg6mxWl2AoHgrM19Qmg+tAeoDUa4Z2kN25j2GfVnJ
         AkzA==
X-Forwarded-Encrypted: i=1; AJvYcCXHijKaacrZfBxDnOkxf62J4qdgMLLZXQG7xIw83NCLZguD9mrry8jYG8A9kqI3RbzwGVI0Pmac+Uez2EpBkn/J@lists.infradead.org
X-Gm-Message-State: AOJu0YxY7rFd051Oz2OdM98umz+wtZ1bLQtXiuwWOFJlcg6gG8nwxOMY
	q8MnDgrFhoS3N0LF6r47S0vmJnDDDippVu3949SjH0FUdBCY134Wr18FN9kCR61H5rTQCYKiOOc
	iOQ==
X-Google-Smtp-Source: AGHT+IF/UGyI4L7YpCXJDabe/uv6iQuXjlneJOcefO9AkqQGkDCIdBxHYEZPw+BgfwWT0U2pqZzo0vel9w==
X-Received: from wrbft8.prod.google.com ([2002:a05:6000:2b08:b0:3b7:9af7:9cb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:24c1:b0:3b7:879c:c15c
 with SMTP id ffacd0b85a97d-3b8d94c3a7cmr10132358f8f.47.1754402181707; Tue, 05
 Aug 2025 06:56:21 -0700 (PDT)
Date: Tue,  5 Aug 2025 14:56:16 +0100
In-Reply-To: <20250805135617.831971-1-tabba@google.com>
Mime-Version: 1.0
References: <20250805135617.831971-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250805135617.831971-4-tabba@google.com>
Subject: [PATCH v1 3/4] KVM: arm64: Sync protected guest VBAR_EL1 on injecting
 an undef exception
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065624_007745_C4CE66EC 
X-CRM114-Status: GOOD (  12.81  )
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

In pKVM, a race condition can occur if a guest updates its VBAR_EL1
register and, before a vCPU exit synchronizes this change, the
hypervisor needs to inject an undefined exception into a protected
guest.

In this scenario, the vCPU still holds the stale VBAR_EL1 value from
before the guest's update. When pKVM injects the exception, it ends up
using the stale value.

Explicitly read the live value of VBAR_EL1 from the guest and update the
vCPU value immediately before pending the exception. This ensures the
vCPU's value is the same as the guest's and that the exception will be
handled at the correct address upon resuming the guest.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index bbd60013cf9e..b34b10be1ad7 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -253,6 +253,7 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
 
 	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
 	*vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
+	vcpu_write_sys_reg(vcpu, read_sysreg_el1(SYS_VBAR), VBAR_EL1);
 
 	kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
 
-- 
2.50.1.565.gc32cd1483b-goog


