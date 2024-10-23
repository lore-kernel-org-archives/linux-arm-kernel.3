Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A10ACF539D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKxet43PAr/hYc6VkfRyj2KFksGheEZfDPl0o5yroV8=; b=thdRrYh3PqYz+86ZYOVGJcFFZw
	NTeXHDT962/bHWvxQmaiUpHiPhnKT+VZ9hdfz2sHEL7oV1Jp6jGvS02WfuGYemBeUoaVbQjMw4UKX
	7LjIwDcqTaGx3qQY7VOHZaY0kLZHDvwvPVvjQGm+77LK4Zr/yODPQeY1+NCqyWCAKDdZ3awY/aUwu
	JdLrOhxk5VRL+J7YsaKzV/xK0xA1Y1E69VFkSlBCogbYdjqEtZn1xdXXcHy9tHwo6t8bVRjtG+c3b
	FJFGwHi5drrHXFXoco+gxdDddBQ3bhV2AIUewulei3a9K0TJtQGwo60YPmOGsPm1fdDSIOSk+esQx
	ZGDh4k0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cob-0000000EqVI-2GVC;
	Wed, 23 Oct 2024 14:58:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckD-0000000EpGt-0Ui3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1F3C0A44FFD;
	Wed, 23 Oct 2024 14:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B34C4CEED;
	Wed, 23 Oct 2024 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695231;
	bh=MBWM0D7McX9GDlu1l75I+bXhMtl73ItIQYTO8Q7XfS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RoagM2VAE6YrL7OjP6jkugZCmnz3l4dVzozNt/+UVspcIWi3ZoToYfGQkFBS3PTdl
	 HawoJFQQ04MWPMG96B/YUQXVtoEa7bTxbS6FLrq7VXpQG1ukia9VoZbaIs9DXYRpuX
	 YrGCidxIUMyQtBjFf/BvpRKe784NwHHma46rsIX8/A2glBN1jImbBgdJJPgdQWXyWj
	 m5MZ5N0aCfqbLdC+0dwngIMAH5sIKr+YqyCambHXZieU8rJ9hiKEuwK3a5wZe1vYfu
	 Q1kf4VsUVtoLEO653xtUAws/XkJJBspryWVzfEKRKn9YLtKYNHu8OEgeUuTDg8EJvW
	 O8E2m5ibjfgmA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ck9-0068vz-TJ;
	Wed, 23 Oct 2024 15:53:49 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 02/37] arm64: Remove VNCR definition for PIRE0_EL2
Date: Wed, 23 Oct 2024 15:53:10 +0100
Message-Id: <20241023145345.1613824-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075353_245480_F1A54966 
X-CRM114-Status: GOOD (  10.73  )
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

As of the ARM ARM Known Issues document 102105_K.a_04_en, D22677
fixes a problem with the PIRE0_EL2 register, resulting in its
removal from the VNCR page (it had no purpose being there the
first place).

Follow the architecture update by removing this offset.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/vncr_mapping.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index 06f8ec0906a6e..4f9bbd4d6c267 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -50,7 +50,6 @@
 #define VNCR_VBAR_EL1           0x250
 #define VNCR_TCR2_EL1		0x270
 #define VNCR_PIRE0_EL1		0x290
-#define VNCR_PIRE0_EL2		0x298
 #define VNCR_PIR_EL1		0x2A0
 #define VNCR_POR_EL1		0x2A8
 #define VNCR_ICH_LR0_EL2        0x400
-- 
2.39.2


