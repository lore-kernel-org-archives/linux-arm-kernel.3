Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72ADCF539F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JvKZAA9+PRxmAh6gbWkG7l4UZwFJ+Pl41i0VljhLyA=; b=o8FNZGgqpk0KudIAMha7HAkdmQ
	PQLUlCUKQj3xevuj/NFkBGM2K+F7+3IxBE9f86gCjI4E8mwwvj8YCWK8fzPUfNXCNOM551Zfv+5Z3
	g8yA2fZsu6r/GGeISaI8cFqsM8/HPI8SrONWWHy1ONaXyQRAUVh9phMpMRwpH2et3PoC7L2e34RmM
	8xuBxHKifuCwx81EgVCbqOX+/KN4oDboEbEBuZc55Yr2mSlnJytG0vComVEFIpvZP5zVpmoVhJmCL
	k2udYoih432x714IMfGo8bEyBAZOrEIaAicOa9hwFCrWgTcyCxnyMHQ+D7r++jVMJo1fwe24DQ+fu
	ECjy2x0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3crj-0000000ErMK-1Szb;
	Wed, 23 Oct 2024 15:01:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckD-0000000EpGv-0lGX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D95FA4500D;
	Wed, 23 Oct 2024 14:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16BBC4CEE9;
	Wed, 23 Oct 2024 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695232;
	bh=2p8gtbngTQycKdtoWZv63noAS1lUhgvWdrHkUVI0VQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=epIvBurrAvY5MNIx7KS+hXHCQnGCXnVbmE5HDQtC8CRMJnH09GHk26KC+9e3YrJYg
	 6taX7/eiaU4SFIDBGbwsei3ET/uPNw0VaH+8j9u9WW3urWwHyQE2q0rbMH8ys/6ACC
	 rYbZ4bQEF5tMGFWEPPgoKRifn7xFT3oIOHidzWS4cUXCWeyQ60RLabJ4rxDX9JGIw0
	 U3BdS47cHkkaPxaFb9VrrQ0wDS9VttQYu9OkoDK+nWuCl0wptqY55Kfg1QeBMdOcyX
	 JrWFTYl9+C3j0i5t8ETo+RtS7oREj7heJrvlzCtsMdwdpazHvFO55k7jh/4bNV4sXa
	 Sv97Sy8nHlXjQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckA-0068vz-3b;
	Wed, 23 Oct 2024 15:53:50 +0100
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
Subject: [PATCH v5 03/37] arm64: Add encoding for PIRE0_EL2
Date: Wed, 23 Oct 2024 15:53:11 +0100
Message-Id: <20241023145345.1613824-4-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241023_075353_319472_E18CBB7A 
X-CRM114-Status: GOOD (  10.07  )
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

PIRE0_EL2 is the equivalent of PIRE0_EL1 for the EL2&0 translation
regime, and it is sorely missing from the sysreg file.

Add the sucker.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index ee3adec6a7c82..3c812fd28eca2 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2882,6 +2882,10 @@ Sysreg	PIRE0_EL12	3	5	10	2	2
 Fields	PIRx_ELx
 EndSysreg
 
+Sysreg	PIRE0_EL2	3	4	10	2	2
+Fields	PIRx_ELx
+EndSysreg
+
 Sysreg	PIR_EL1		3	0	10	2	3
 Fields	PIRx_ELx
 EndSysreg
-- 
2.39.2


