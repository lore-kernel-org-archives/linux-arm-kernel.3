Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5390EE7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OcklqGs3a66zj+S5GgwWilSvCAUZ212synoded3Er0=; b=xkF6Gc4284CIMQFEM1I5Gweg8l
	VL9al3dcTrHuG/zqIaFVMoYOg1C5/gzQR62ImLgBot5Bz04M9h3HAhDHx95ZvAtjNPaWWHSI8kwg5
	sx1LRqn849oYn6OqtqKRORb2OTi+OXERaARMLupp46Eluhl6opB8XZw3SUmcMZKvZvq1bt2HRqI4A
	HfsKH9JyHDtqzkW3ysxsKer7ivmCqgzMQlniYdpcg8noh3qtdBKKotj6Cij7B1jjo8XjWICUkVTSC
	vTSIRde8SY75XfzRytorZl9yQZm0TPCpHZimhTioBiFi9wq0z0mxy+Pot16V6WJlVyzY8D3rFnZ1O
	qMGGS/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyu3-00000005RR2-0uoV;
	Mon, 02 Feb 2026 18:44:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytl-00000005R21-1YxJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 019CF442A6;
	Mon,  2 Feb 2026 18:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6257C2BC86;
	Mon,  2 Feb 2026 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057824;
	bh=0uQbqtqzatb0+WEzqiykyv4VMqfCd11CnuuzgkEfvVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GUkTwHNq0rs2BVg+ZlGwsKHJu2+FG9OcbLv8Mql9Swag5mYt1HcpG8q3g5QTXWTZ0
	 hoyluvnB7lpHzwJSpFzHFq8kdtGXR62EQ+Las88mJ44bsz334/h5marK6pap+CxVjn
	 MgYInMGLN84Vf+4txOoF55ID6t3SUkqhQizbYrtpxuW9NBZcySJ66Y24+T4AV5S7/g
	 mv52IDmCLAU57MqawWp48N9yCKG3ZaQl60hcdJ1dMpcoqXtmwhHRXiln62y3OIUEWG
	 4B5Fmplm9rb6zMDZ9+xofykoEGR1hnqCIxzMhYI9U9LHk8GzRmNWlNefe84j6qSUrL
	 HNz3iNyL2u7Pg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmytj-00000007sAy-0UTV;
	Mon, 02 Feb 2026 18:43:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 18/20] KVM: arm64: Remove all traces of HCR_EL2.MIOCNCE
Date: Mon,  2 Feb 2026 18:43:27 +0000
Message-ID: <20260202184329.2724080-19-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104345_590901_3783377C 
X-CRM114-Status: GOOD (  11.61  )
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

MIOCNCE had the potential to eat your data, and also was never
implemented by anyone. It's been retrospectively removed from
the architecture, and we're happy to follow that lead.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 1 -
 arch/arm64/tools/sysreg | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index c1b76a76a5e4e..8640f9c9b2e0e 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -938,7 +938,6 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 		   HCR_EL2_FMO		|
 		   HCR_EL2_ID		|
 		   HCR_EL2_IMO		|
-		   HCR_EL2_MIOCNCE	|
 		   HCR_EL2_PTW		|
 		   HCR_EL2_SWIO		|
 		   HCR_EL2_TACR		|
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 650d7d477087e..724e6ad966c20 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3834,8 +3834,7 @@ Field	43	NV1
 Field	42	NV
 Field	41	API
 Field	40	APK
-Res0	39
-Field	38	MIOCNCE
+Res0	39:38
 Field	37	TEA
 Field	36	TERR
 Field	35	TLOR
-- 
2.47.3


