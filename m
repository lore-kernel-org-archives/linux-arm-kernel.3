Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B258C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 12:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym8ckk+VrCoktE6lkLMoRO29CSpEB7biJzQ35QJvlbM=; b=pPb2YT6Y+vg7PEnM9Fo+KnZMwR
	bOqwb6XwFvh8YQJoo7+kGkZaPMBtvVkExXTWX4dW6wUA3BTo0uO0H2QoXXZzp05yqnFqUSqldYUMN
	I/GauoatK0wOZpmLKVT9pi8XkXLc17bdkX11jqadlQUwtD1biUXA/1xJB3qG+TKECZSdVE+yZ7w6O
	0ugcDMmxqJuqed4KqBd/nBzJJ+0jCoEdiQcBuB0/WjP/Nl3o96X54MN4KK0bu+08NEGPw/JLVsAxv
	WI/9znWbnO/5uGJng0g4SacQi67VkOb6M/0MR9/E3v/H8cWTTUHtgQ0CSK8B4WEE0/EQUX3vPzCuy
	m4pAFB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzQn-00000000TiH-49yp;
	Thu, 07 Aug 2025 12:09:13 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzJT-00000000Sof-29EN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 12:01:40 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-61590e4718eso685973a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 05:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754568097; x=1755172897; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ym8ckk+VrCoktE6lkLMoRO29CSpEB7biJzQ35QJvlbM=;
        b=d42Hmj4OcEG+d1qRErUE/SNyyqUF882Y9fPVSb1ZCh67fHs3En0l55CTDKFmTjSv1p
         LH1XNk4gKpAFvMzMP1oZFW5EwwYe6Sl6M4DPW5ncgeS/Z4TmJ0K9utMNKjjDfBNJuhdH
         y3xFTiVdCkWyslKW9/qYkj0dq3LHIOfOknBS9KkIw0PsoZp2AU8wj3+qOP7W1X/LlbQd
         p0Rd0GsGXd9P05xTHv4l11RrHKB951dPVtTPo/hVMZ0mRhlxGKv7KoEQDnDIux4o7WmG
         aVSe7NOM2+p3tsX8UyO9edrdiyGonJ4D3O+9ruvjH8ybMFr0zP1cQW3+nKdl2anBHkrD
         u5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754568097; x=1755172897;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ym8ckk+VrCoktE6lkLMoRO29CSpEB7biJzQ35QJvlbM=;
        b=LCKj/JEUO1Ge21UljMTgdHHeFMPfD12afgrxCiUa9pc7CquMbBOQnIiAnEWmn4YGMW
         RzPT8zzPGQGc6lCDmhkPf+u7IimFNX2JTC6Cz2lUSq0FrJcOpH55WERg7QXrWcSXAroA
         hcVjQOHOShh/ufO/2s5iKBPkT94IuLCMRrw8LUbX1VxYKilrNEJxatRjJJk8pj4AIRZ6
         bAIsSRkBkzyWKPVNElUmGqNRbX860xX7nvRL9SeVrLfLeutvAg9B/0C4V7BsIir21Whc
         nDG9uNOxPIdv5pxnVnJH/OxurmbIqArbz17gR0dPILO0FFiqT4bxK379ee1amkALcxct
         NaKw==
X-Forwarded-Encrypted: i=1; AJvYcCVAxpwVJRmUDxbuOPzboxl7EknONH1np46m6QFj1dIno+CceolhIUVInVnw0qmA5Ba+cgUfUmJ5T4+GkJocc1Cz@lists.infradead.org
X-Gm-Message-State: AOJu0YyA79aAkQ2T5o1gAIc45CJLviIdYrQW/VTjnBQUbO7sLuxcnZJi
	6NK+S84yPUiYzmTmuL5rgz5GnW6iJ/XlAiwuOZG+OFR5OT51BaRQcHkl2Op9xBbCAk4dK+Lcv+8
	8JA==
X-Google-Smtp-Source: AGHT+IHCXiYdGkqSZezcMr/5HJ8nW+vXd0I20GHxpc650nk5XAEIKQRYW0qXtNDvRlsqHYqyF+bbLH2eYA==
X-Received: from edss28.prod.google.com ([2002:a50:8d1c:0:b0:608:fc64:b570])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:254d:b0:615:a5f0:26f9
 with SMTP id 4fb4d7f45d1cf-6179614219dmr4720604a12.21.1754568095234; Thu, 07
 Aug 2025 05:01:35 -0700 (PDT)
Date: Thu,  7 Aug 2025 13:01:31 +0100
In-Reply-To: <20250807120133.871892-1-tabba@google.com>
Mime-Version: 1.0
References: <20250807120133.871892-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250807120133.871892-2-tabba@google.com>
Subject: [PATCH v2 1/3] KVM: arm64: Handle AIDR_EL1 and REVIDR_EL1 in host for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_050139_557002_1C09DB09 
X-CRM114-Status: GOOD (  13.81  )
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

Since commit 17efc1acee62 ("arm64: Expose AIDR_EL1 via sysfs"), AIDR_EL1
is read early during boot. Therefore, a guest running as a protected VM
will fail to boot because when it attempts to access AIDR_EL1, access to
that register is restricted in pKVM for protected guests.

Similar to how MIDR_EL1 is handled by the host for protected VMs, let
the host handle accesses to AIDR_EL1 as well as REVIDR_EL1. However note
that, unlike MIDR_EL1, AIDR_EL1 and REVIDR_EL1 are trapped by
HCR_EL2.TID1. Therefore, explicitly mark them as handled by the host for
protected VMs. TID1 is always set in pKVM, because it needs to restrict
access to SMIDR_EL1, which is also trapped by that bit.

Reported-by: Will Deacon <will@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 1ddd9ed3cbb3..bbd60013cf9e 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -372,6 +372,9 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 
 	/* Debug and Trace Registers are restricted. */
 
+	/* Group 1 ID registers */
+	HOST_HANDLED(SYS_REVIDR_EL1),
+
 	/* AArch64 mappings of the AArch32 ID registers */
 	/* CRm=1 */
 	AARCH32(SYS_ID_PFR0_EL1),
@@ -460,6 +463,7 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 
 	HOST_HANDLED(SYS_CCSIDR_EL1),
 	HOST_HANDLED(SYS_CLIDR_EL1),
+	HOST_HANDLED(SYS_AIDR_EL1),
 	HOST_HANDLED(SYS_CSSELR_EL1),
 	HOST_HANDLED(SYS_CTR_EL0),
 
-- 
2.50.1.565.gc32cd1483b-goog


