Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FD7D6392B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otK6F93Vu1cX9TaP11m2Y2QryXuFz9NU0aIFOkiC1D8=; b=aEueopeuhWmzSej2xPptQ6A+07
	1RMTzjGb0Sh5f8LhGJx+XL0z9OPkBPq7nAuEx20Q+ZWPa7T6bpNUGxemTYlwImsnyfFA3bfbWDwiX
	WMhnWef2oShdZeIOGpcThMp1MyLme6qt1w4+dUy9pSe+8Vs9GInLOrc1CrFzoF6T+tG5GpDIhtOdy
	sVWs3284bcwtFpq4WK5zAVhTdx3BklI7VHBdDXIm6mnswVGxxaik0oib7WCA/+kAJJT4JdUNwM7kL
	wIEtnlSknvPAb7lzLkNPltsXp2wTAsCPlej/xD1nMcqXGrYTSOZa7AwHQDJ+HjMaHeMjY8zKOysT0
	V47A3x7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiWR-0000000F904-3N4a;
	Wed, 20 Nov 2024 11:05:23 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiKt-0000000F6X1-1COp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:53:28 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-38233ea8c1bso371204f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 02:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732100005; x=1732704805; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=otK6F93Vu1cX9TaP11m2Y2QryXuFz9NU0aIFOkiC1D8=;
        b=DbPJF2XTA5+CQ4lTDOeImezLkyXditt3dCF5tuKgPKIoAWyHAIbhyWMjTaHqKX8pfF
         D7MExC5i3cy7NjLiADkpPrFJnglYbDn31aUB3Y3/zDTniboNRCT4bNsIlixNwRU2qB41
         IVtDhwrUnyXbOl2fAA14bffBIu7iOQbH95cDpZ7wMzRdSzxBKWscgiZsAAnWipAjDP8d
         u2RzzbLX6CORzE3coJ+mjfBFeH3CW/Q0g+zwteZyxmIZ/HnMLMrIOnYrcZZqdb6uL7th
         IbxQNQPOMaGHI2vLDoEt1H0rO0RAY6WGoSmgeyLTagpj1Oj2xExMSKKc1gr16uKqgOtC
         /B+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732100005; x=1732704805;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otK6F93Vu1cX9TaP11m2Y2QryXuFz9NU0aIFOkiC1D8=;
        b=GWJuU9gpM2kF8CWWktYqh8kqMUgB1tU0xFRSPDRUBfoB3Olxd6comFPvLIJhr/eBJH
         J36HDpYkLVeUAI54ymw9o59r6ZB/pO2FYkNBbH2xIrKyFolSCzLhruhwDzFz14RN25Sp
         /obHPtE5kNqHf9tBaHOf7roZm9P9yDP0ZoUnmu1AdfGiJs9FXZD+546SwJ4rbpW2VsO+
         zlz4YjO/0QJEjCewDrWvX6SMG1fANp4kaLfwTrqDeme2jK26pDIJdlI8jXE4I/u8ix58
         qDv10NpqLZu+jRw4tIFuCMdTEc6m4mk816QzeWoY7bMRLHk3Zs+zMY8x+KKTDdc7LB99
         Qk7A==
X-Forwarded-Encrypted: i=1; AJvYcCUyZxHJUCpO+nVX5XvRdMPCjdKqTvoyIEA6HKMfCoEFdxACiMX53LyRyhMoG25iJHdewpeTp8umGoY7IjRxBulg@lists.infradead.org
X-Gm-Message-State: AOJu0YyQHRRMzcCz1X22LCcLKxPX2GCLOuIJ4ZnZX7GtS98qtRT3iEr6
	kP8xsqo9WL/H73yLhGZBcnuo7i4IJQ4uyNSJ6H6XyS5xzjXaQFBfZo62sq7WpTJCxa5z6zTwHA=
	=
X-Google-Smtp-Source: AGHT+IFLMAX/63k03WDt22YQHM6Q6kyUAtxR/WjHVGa/qbz6yho54YcU61tg0uhcrJaQaYFKwiLbQBDAfw==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:adf:f748:0:b0:382:49c2:fb12 with SMTP id
 ffacd0b85a97d-3824cd4e421mr2898f8f.4.1732100004722; Wed, 20 Nov 2024 02:53:24
 -0800 (PST)
Date: Wed, 20 Nov 2024 10:52:54 +0000
In-Reply-To: <20241120105254.2842020-1-tabba@google.com>
Mime-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120105254.2842020-13-tabba@google.com>
Subject: [PATCH v1 12/12] fixup! KVM: arm64: Initialize feature id registers
 for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025327_321665_6885AB56 
X-CRM114-Status: GOOD (  10.39  )
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

---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 54f23d9fea18..62d06d5f5bca 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -477,7 +477,6 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
  */
 void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
 {
-	/* List of feature registers to reset for protected VMs. */
 	const u32 pvm_feat_id_regs[] = {
 		SYS_ID_AA64PFR0_EL1,
 		SYS_ID_AA64PFR1_EL1,
-- 
2.47.0.338.g60cca15819-goog


