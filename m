Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A996C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXCB5COPxS98+AOtJTPe0xqgTof7/tudFifEFiWyRmE=; b=QO/kxI9pSpH5tGzE7rDLMTBYCp
	RZa/H6a7S+EqeoXGKFtPkOsSXoVm6HtKyG9aTT2wSvuk22cMO5OAZUWLnGzzZfKlTtkzIf/QyELoi
	7/M93bMJl1lCeCr97nEuJFgJpp+kfKc407EZf+YpDWzE3VprMxj5NcJOLGcjpD+394gm733V4tiwe
	OAWkYps7AG8wpFZvfl3bsL6a2CrNUaU7Voh0MP43bf8ZzsBHoflI0Se1Ih+3a1sYYXEVdS7d7pZN0
	e0YRkvsSU6HAhwJVDH2evw7XUr+ECCl6zqpvpJtrpZA8RteQjmN6rbZ90tGLD/eYD5VniLyMPYxNb
	kkMMw28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzTF-00000000U48-3BT1;
	Thu, 07 Aug 2025 12:11:45 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzJU-00000000Soh-0rka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 12:01:41 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b8d8935418so645820f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 05:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754568097; x=1755172897; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JXCB5COPxS98+AOtJTPe0xqgTof7/tudFifEFiWyRmE=;
        b=wlkDOr4alr5aIYlpW5duKvSto+Bg1PztJ3QXULYZz6RT4O7aPDU/f096KZrboYHm7H
         MgTymJs26dDWW1pyk7qofifDaGp7qqkCiII0Bjuzhryb644PoobbO/MkwMC4VI1qWd9p
         gBXN5g+AumOy+Vt1OXOVD6KAlUN8Y5V6cD8PEIFcliuk6HJug5wTaTj5v2gMmlT9CX9p
         1zwfAApI1h0kBfznCCv/4VsrZls5yZHdLCt60aXfT4Ici3Yfavz+/MO/kxd7OUcy7Zxq
         YQNUe5Ct/5Z/emcGXW3y0SPwNde5StD+YL1c2Asf7ZAdJ3wZf6Q1pFwspgsPagVeUE+N
         /gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754568097; x=1755172897;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXCB5COPxS98+AOtJTPe0xqgTof7/tudFifEFiWyRmE=;
        b=DWeFL299vxI8AEhY55JWHOPybF1QN8zwsKHy3G9HlBCKK52v3B5SRWxr/sL1QhJgBJ
         b00a6buJZfXXp2NAlLaLfGb/156A1AsLfQowhPPEf6bMKO/9nSZXcAKeWxygPrEYMNIF
         sFmh5giq/qsAtuQJKI9MA7axuV/j+gnF7oqI8FQtcanF6UtWPMHs+VK2AUhvuIqDtDmn
         j+ylxH/1WdmkH4mjnRRM9F12zgheXVnzO8BX13XSzVuiAQgNCSDZe8X+2H0Q+YZWqlJE
         Vco649u63lDB4b7GeaBn8I6k1A2P+Vh+3wiOoeMnIJuH7zWDZRHhqMZTpp3O11OCMODI
         IiTA==
X-Forwarded-Encrypted: i=1; AJvYcCXAMsCpkcnEPtKAHIqxyQ+NkYSNujuG6C8u4oHfPdy9ROkB55lZWGmSipktY5AYRVXeeEUcfG1JKcArWQZgvnoy@lists.infradead.org
X-Gm-Message-State: AOJu0YzYEJBLGrvZMcJsbI+bwoJiqD/tPC0vjEIX+gv5i0Do4XbTSmqD
	QKAiujIZ1bgoAbkvArhkx5avAqxrwe1g4DD4Zbsuelr00LxntSkaQaAqDxc9eYeVMkOSnM8C4oN
	+Jg==
X-Google-Smtp-Source: AGHT+IFbqlgpUCeIKiVmVb5DLHkhJlFqnQA1O8BwRkG5e8YjpC281M7Joqt7Ovdou2jw6C/+AI/z0mKmcQ==
X-Received: from wmqa10.prod.google.com ([2002:a05:600c:348a:b0:459:d67d:cbd1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1a85:b0:3b7:78c8:9392
 with SMTP id ffacd0b85a97d-3b8f4166f4emr5302575f8f.19.1754568097308; Thu, 07
 Aug 2025 05:01:37 -0700 (PDT)
Date: Thu,  7 Aug 2025 13:01:33 +0100
In-Reply-To: <20250807120133.871892-1-tabba@google.com>
Mime-Version: 1.0
References: <20250807120133.871892-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250807120133.871892-4-tabba@google.com>
Subject: [PATCH v2 3/3] arm64: vgic-v2: Fix guest endianness check in hVHE mode
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_050140_241609_2E4F3D24 
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

In hVHE when running at the hypervisor, SCTLR_EL1 refers to the
hypervisor's System Control Register rather than the guest's. Make sure
to access the guest's register to determine its endianness.

Reported-by: Will Deacon <will@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
index 87a54375bd6e..78579b31a420 100644
--- a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
+++ b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
@@ -20,7 +20,7 @@ static bool __is_be(struct kvm_vcpu *vcpu)
 	if (vcpu_mode_is_32bit(vcpu))
 		return !!(read_sysreg_el2(SYS_SPSR) & PSR_AA32_E_BIT);
 
-	return !!(read_sysreg(SCTLR_EL1) & SCTLR_ELx_EE);
+	return !!(read_sysreg_el1(SYS_SCTLR) & SCTLR_ELx_EE);
 }
 
 /*
-- 
2.50.1.565.gc32cd1483b-goog


