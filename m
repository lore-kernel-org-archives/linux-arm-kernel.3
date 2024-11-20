Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E32FD6392B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f42/EUroZ+Ntky4r0huxue9aybFDac6HgHyBNdqjIFU=; b=APTRlf8PgSx7OPwJJHgvTOL0UK
	ptP0DoOnpqHMIFcaYJTPgDGU85PWWzuVyhypJhHFH69mYJnoxCLBsFTd/laWb3JGl/A9KsYBt6uQs
	2pzFnITw43XEmNG5Q1rZEErJCJZb5bxnilHBFEAZWC2L+dw67ikgdV8si1G3bB1syEPzWmn3kr41R
	x0aySIt/KLBtltXA7bacQaczStEcH+5rp8c7w/eGi+kGK1o8cdaATJlXaAMgdlNUNYJ9CS3W/39RC
	jf57jVYv+E/oVgUqnsZs2Od+LMNK2l7BQDhGls3LOAeu9jW+RjT+lF3Cvt7aiGhcpky1ZXIJj4t/b
	LwiUgmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiVX-0000000F8oD-0qTw;
	Wed, 20 Nov 2024 11:04:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiKq-0000000F6WL-0iVy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:53:25 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43159603c92so30435775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 02:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732100002; x=1732704802; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f42/EUroZ+Ntky4r0huxue9aybFDac6HgHyBNdqjIFU=;
        b=itbQ7x4kFCuJK2Cp2HRikgrcMgJI91Hv3nHdjH5MquBXwxEiISz1amlXzhusAlCPe+
         rc86YYXP3+sKQM+AqmMxgQnHoiib2bzPWyMY8MfkwM4dO2r9W/IbB05UwxhaMTRlKzHu
         /E9thS1z2x22FnDx267ss5rWDdB3boDj2isVHrxvS+R0mWni1jirzH5h+uMr4MCqMkuL
         vzDxy/Gxf5j/39BeL1yHX18+ebwzQxG4wGnDf5GvGDZ87yKlHFpYu3IuvqLsANsM4Y+c
         tIm+8o7e96O25zcOxWW6Cn0ZanPEhqp65/KgwtWYfH5bq7HLDS2ZXGe6kmMkhRFF61p+
         ef6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732100002; x=1732704802;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f42/EUroZ+Ntky4r0huxue9aybFDac6HgHyBNdqjIFU=;
        b=UkPkufXh8ROnNLLOViW26KsT2iLDyRM2U9n3rVBfXHmCutAQ9S6yGLHw7aItH/UjDB
         uDIOkORBaOwGUC2Pq22ZcnecPZkXQFEBdzygohyT+yeHYEMmbISvcbKdkpWzcu7+fzm1
         PvFLP2aJZo3Mg3uAA32WTMDYy5BfkLxMUlJWtGvporcpW6R5ZIyV9tY+rj4/4Kwzjxva
         1XCYTPktOpRm6pCKxqLZ9MYk72mBDdu89cnQOTd5zvpTM0+nKhpASZ6DYP8CQZxj1Qk6
         4GrV6v71XXXVcXBrCc/1V7iHcyQ0cOeeNQfOkIHP9ND8Out5y+khBu2gGoZ7OjV04nzk
         vYRA==
X-Forwarded-Encrypted: i=1; AJvYcCXcCbgFdneqPWsLSLDxfQDpmD4MHlI8SN8Jy3NRjPIAw/ADvX2iOdpElTFVAyehmH8k7CYYP9J70+qo8pTSa/Qs@lists.infradead.org
X-Gm-Message-State: AOJu0YyhvWRW2P44AOiuoPjtz/V+Ic+pqu//ArrT2mqSTrxtsfMG8baM
	yVV/gWMu1FK9A5zWOj9Q82Q/Wsd5TXjs2q4f36itIugd8j6CvoZVECV9k/99V7l3Jt8HZSiaRA=
	=
X-Google-Smtp-Source: AGHT+IFPX6eRpgufFtGAE+RtbW0UGVjU2hx2f4BR3zFtKKVagI2hwWLt5wnkcg1+LlBATxzL0czObknczQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a7b:cc8f:0:b0:42c:ae4e:a983 with SMTP id
 5b1f17b1804b1-4334f020b66mr8555e9.3.1732100002370; Wed, 20 Nov 2024 02:53:22
 -0800 (PST)
Date: Wed, 20 Nov 2024 10:52:53 +0000
In-Reply-To: <20241120105254.2842020-1-tabba@google.com>
Mime-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120105254.2842020-12-tabba@google.com>
Subject: [PATCH v1 11/12] KVM: arm64: Update vcpu state with live value of
 VBAR_EL1 on injecting an exception
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025324_207001_4518E826 
X-CRM114-Status: GOOD (  10.42  )
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

If the injection happens early, when VBAR_EL1 has just been set,
it's value wouldn't be up to date in the vcpu structure,
resulting in it being clobbered before returning to the guest
with the injected exception, which the guest wouldn't be able to
handle properly. Although this probably means that the guest
cannot properly run, this behavior is unexpected and makes
debugging harder.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 17783c8ddb92..54f23d9fea18 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -250,6 +250,7 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
 
 	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
 	*vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
+	vcpu_write_sys_reg(vcpu, read_sysreg(VBAR_EL1), VBAR_EL1);
 
 	kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
 
-- 
2.47.0.338.g60cca15819-goog


