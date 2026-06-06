Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BDACD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtrLaj5ltFoAG/++WffsPSgWGaLrPwS8Itqpcy4i6xY=; b=CDSzQr9AXwsfEgeJSroRhJ9Odc
	/ZOhClLxoMqD7eZREUIN+N1ng4pNrfQDwQS7cRmX8Buc9Z3E9AUqkhQeUpf8S5l9PQiOLTJEI6llm
	jzOCE/83fDKOuVjXOGSfE8ed8v2cCmc6BAa4nkFzSMCr1riS0LcSWAFYQmILFmxFdoW8jSgYR382u
	z+H7A92ElvnFzIi4w3+fUvK0tV1U5j9xj/actijmayGhPEuiTaA8GwodT9i8XUGoyaqy5vDlvANZs
	Z5ZZR9Iy20UDwlfHrTJEbGAAbz/YyzdNLCiljd6wQY9OGAnyNek0xX/Blx1nhsigXl7wCLSrgGhK1
	G0Ju2zug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVvGp-00000001k23-2lbG;
	Sat, 06 Jun 2026 17:57:19 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVvGn-00000001k1I-3eUK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 17:57:18 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bf114b0cf9so25950115ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 10:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780768637; x=1781373437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtrLaj5ltFoAG/++WffsPSgWGaLrPwS8Itqpcy4i6xY=;
        b=XkJt3CEyzWyWJcNM31H00peLp+LXM9tgqQX8ZqD4ngoKRMLOAChK1WV91Rm94N7joN
         pAqImU+wfiPxHyFoFoKBnJo1/XDZl3RMkgUaHTx1YNEkZMj9uEJfUSriQ313sUZ0yiQ4
         wTQgTaUIMiI8WH/z8Y16hlpi+kaYEHMCYtry+e6nkFosVJmI6RTitYI8KE1uFCG25Ud2
         rRTT9nz6qZnQN6S/k95JuNFgDh+8irTcp8X5NEtw0kznsklMlV7evKwfBToI2tzz22aU
         /kHiEE9emmsiDdsuAliNvF8BBqOYjuy1vd9pwkKx18hLpwkEC+L4ubeF1d8v/od8/0j9
         kjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780768637; x=1781373437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DtrLaj5ltFoAG/++WffsPSgWGaLrPwS8Itqpcy4i6xY=;
        b=MH91UKkxSsXJF/tyPgns8grmyUvICMJZrek5Xon2HxE6lGbfYa98kfm58w3F9RchsE
         7LCUlaYcCEoQExX3H54/1GiwmQbV7PdUXKxb1MURB46tEBA4NbnX7i1LcRwqICTTi+PU
         C1tc8nom+iLLOgQqChN8gIz2mDYMeN4sCREPvSdZpvR8tDQuEZYtQqC7UXFtyeiGoJPM
         KPQwFaCE7FLu5xqjl2chIOAs2ABVEQVAjA29nEmyStO8bBZhVaLQ9Dz5JUddQu8h67Ud
         QXo/1RLsPWhexpBtFoCfRudpov5cbNdAZSCnsWg3p2Lw/eJiCO78a6cLzACzrmi0wadn
         +aCw==
X-Gm-Message-State: AOJu0YyOM93OpkeHEC7F1TpXS6e1yGeWjJIUoPimXHM/ZW0pGhEm3yHt
	ZQREr6VXHfbiCTDpqXpNC3RuBnoAJddFl+riadnkwiMc7Q5MdY7gA7CE3skvxw==
X-Gm-Gg: Acq92OGh1vhvEa2J8wVvk3cmaUihG8sq+RqwRRzErbKDBTr3e8qRRdax0mHO1BRb5G/
	myDjnLdbx9YSW148346uZ7srwmd70fheezS+0KFS+9cXSO8IlQMJPqqU9tuMtSKXVIUnkADBgx4
	xamzazZftKpU/8YMka1dnreusRxIK8ZnzP973F+cCLbX/ueVVqn9ZKleG1vdb9uhpjcRL9gmhls
	oiqirpHvmSD3zrNsVv4amPM2kkIniB4uUbMDqoEoJkDY3oxOfIpLoKQQqBhhrY2ax4McrCTYSR5
	MB/RUyXXol4xYYqczOYUurfBYMpwIuKzb/veGtimkv3BQ97kWDFogTBwVO3KX9/WtO+NFw7bcID
	fHBYb3F++aIvImYeWdHB3G/yIZ/8gttQR/4InYI2J5oB62OlRAxxa0Y85FO3xFOZ+bEb+3OYWdt
	Ou60766N2Ex4jKr5tKuMe6m3CBk+WfOYpfqokilmfT1qvl06xgoT1IRkdL
X-Received: by 2002:a17:902:c952:b0:2c0:fa4e:91ed with SMTP id d9443c01a7336-2c1e834699fmr108804645ad.18.1780768636898;
        Sat, 06 Jun 2026 10:57:16 -0700 (PDT)
Received: from v4bel.. ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm129196425ad.2.2026.06.06.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 10:57:16 -0700 (PDT)
From: Hyunwoo Kim <imv4bel@gmail.com>
To: tabba@google.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	stable@vger.kernel.org,
	imv4bel@gmail.com
Subject: [PATCH v3 1/2] KVM: arm64: Clear __hyp_running_vcpu when flushing the pKVM hyp vCPU
Date: Sun,  7 Jun 2026 02:56:10 +0900
Message-ID: <20260606175614.83273-2-imv4bel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260606175614.83273-1-imv4bel@gmail.com>
References: <20260606175614.83273-1-imv4bel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_105717_930176_54AA3E7C 
X-CRM114-Status: GOOD (  10.71  )
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

flush_hyp_vcpu() copies the host vCPU context into the hyp's private
vCPU on every run. ctxt_to_vcpu() expects a guest context to have a
NULL __hyp_running_vcpu, which is only ever set on the host context, so
that it resolves the vCPU via container_of(). While this is generally
the case, flush_hyp_vcpu() copies the context verbatim and does not
enforce this, so a value provided by the host is dereferenced at EL2
(host -> EL2).

Fix by clearing __hyp_running_vcpu after the copy.

Cc: stable@vger.kernel.org
Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 06db299c37a8..02c5d6e5abcb 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -128,6 +128,9 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.ctxt	= host_vcpu->arch.ctxt;
 
+	/* __hyp_running_vcpu must be NULL in a guest context. */
+	hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
+
 	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
 	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
 	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
-- 
2.43.0


