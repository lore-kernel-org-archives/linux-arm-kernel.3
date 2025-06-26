Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D11C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPJCCS28P/ht0GkmQnG+3GK0DAvT59T6hS3LwMCctEw=; b=FKtIENtMUo4XgIuGBkZD+ps9yT
	UN8ijqpYLwRxz4RkhmEQ4vlecXHoNDGISuV2Mn38KIevug63xArTOG0X/kKjjqy9bVGOfvxogIMfr
	ZX5aNOBpL5PyF3AoVyIPazMPtb+MDY6q+pQCSaOzHHflyTXcYlx4uad4OYWi7U5imuP2PzZvs1ojn
	ARYHMe/psFTLU+v44rEUbWqMNWJD3AasektcQh6MD2psoCZi0geWPY6nGi9ETBdv1a1/gdHDzJ8nb
	ELCkz5ORtM69XeQ5TRHqhwin6Hz1JQBUua6IOwr9ZbRy3jdhbGyXwGcfX1aAkNKdnVmZKewPPlqci
	nfmKbJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuQv-0000000Crnk-3CX2;
	Thu, 26 Jun 2025 21:47:01 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsr6-0000000CgfD-2fec
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:05:57 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-2e954a1d239so1213355fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968355; x=1751573155; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zPJCCS28P/ht0GkmQnG+3GK0DAvT59T6hS3LwMCctEw=;
        b=vz2DkwbYvXoKw2D30l7cfKMqUfb46aFTl+7ueHOwGqN7o94Ctkm1qomIKoUH7yYmRF
         tfgyQpH1o2OruD1Q3i/63+fTFSyScmqdH14sf6MXe7hPGwYEmwzgmMarrmNMJonxpid1
         FjtXiDdMaCrbIRokxMYNOSA9aOrDcaNVNhRxXaLCTIGRnAS88BLfMcHHEolpsNiln0mV
         wu4BDh1yF/Y5x0MTHJsqP6N2hEPf9m0X6SMyyYwvU8H8wBdy158xFGBE0hZVUl4CThi4
         VN+6D1/DM0faSSPdno65x/W+Uw6YZFiIqk2EmR8bUYc5gvORyEp8ghcTctCEz3cQIp71
         Vcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968355; x=1751573155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPJCCS28P/ht0GkmQnG+3GK0DAvT59T6hS3LwMCctEw=;
        b=fp5r1IwGLyhIoFgoZRUNysaTp+CagTFCwEBkjPyJ5+lXDlBCqFV0djkLBrBXT++Hc1
         RAOFFGamtk5CVu8EXZDIpx8ktiFPtSAu3e5kWl5GN73bCKpzBsjIHLaYgH7kzmBKNkb0
         KnhDAze9fclruZtt9tA9rNIDpXZ96elgSN+JIN4MDX46eTr9n4/Q5ov1P4EU53+GwPmG
         2T/8Dg9O8ik8Wf6elzdYnXtoegteiEOyWjpYojGMebf7Nq0cSky1dAPFO1+YTdjpfq09
         p7Bgu3rk8eHPt0E8kqF3JKeeBgwkj9/I8D7qkfcmsVXB4O3p2egyYaTOH4v9ag1kZJxJ
         2yQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQMxv82b7dCtWoRYGeYAZbhQwVMswS2cmkIQgzip7rvGppIWC9Qfg+E23zWW5JHFq0jyrE5ABCMtmPHf3fLNOK@lists.infradead.org
X-Gm-Message-State: AOJu0YxDB+LuBIaSn93H3+HOWdHKryXkLNGntIDdtZe1Mv3bhnqexlFy
	0bvFbe3WSv46Q+bxorwLvznY2k4w+YTXuCRM7+t77dMjX3sSq2XjP3dR+T8FKUAlRUSrWJwqzhI
	SRkSf745uLFaqyGJL6pJ/avxnDQ==
X-Google-Smtp-Source: AGHT+IEAValjLvIQUTTrl0WGiv7qDA/VK+W0m1ZQUDRoDH/VSaq0CR37ZF/2z6Fxf5GRvTFbBupf/JJhqDdR5wa1WQ==
X-Received: from oabxc6.prod.google.com ([2002:a05:6870:ce06:b0:2e8:ed52:15c9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:7050:10b0:2ef:eddd:690d with SMTP id 586e51a60fabf-2efeddd6bf1mr119143fac.24.1750968354720;
 Thu, 26 Jun 2025 13:05:54 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:39 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-4-coltonlewis@google.com>
Subject: [PATCH v3 03/22] KVM: arm64: Define PMI{CNTR,FILTR}_EL0 as undef_access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130556_674472_081E6451 
X-CRM114-Status: GOOD (  11.28  )
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
2.50.0.727.gbf7dc18ff4-goog


