Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D085C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 12:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43qvLnJub9il9y7c/oiikUGuqA3hYAIWrGmGOMik7Vc=; b=HnfwOTIgzczbMmaSmLHpjOQd4G
	o9DqxxxdAlQZzhQRl+S30o4JBuok6EtLlErpLlGFfDQaIceCRvZ7ozDjO3XDp3/UZMelY2wvy5hH6
	eyo5CjM7ahnQGSDGMdsxsDDSznpnZwLdpjcbJ46qPmgwathTEuTQALVAaBDkrCat4mUI8SXnTx2c9
	2Q2UOwQUDr6HCqk+Zd6GD3XIejAG2KRpJ5qsaozDH8sDrr91Uc8YzXzctZsdqKK8C1AFTwfRcO/u9
	RxzY5hEtY8KNJxpNUSUSV4TuaVxrHNFMCbi1utmSWf9q5TjjOgsmPTsxTTnhQ46F7jRIKceRanN5v
	tO7mElVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8egC-00000001zZU-1Xod;
	Sat, 26 Apr 2025 12:30:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeJ-00000001yyc-2Oi3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6CE168443;
	Sat, 26 Apr 2025 12:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E8AC4CEE2;
	Sat, 26 Apr 2025 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670530;
	bh=44gRQXHmjU599W1FzWtYTLfeRPiNOJ8OSvboqazC2Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QbdbB6xgxessSw9Q5prEE/drdKGxcL6YWXlwkA5c37yzG25/n/Fp2fjx39IbIwRMi
	 5/nImXAcHxZX+jiDB8ituxHqzpTRSLOlnDEmshuIeTzX5JABfu8wq0AlPyfhR9LG/8
	 GYWgye2slLBlUD9UoY/2u0vPi+ZvIkhPMnZc34aoIa2PCbhmjV6fh9eJ5X93KgjbqD
	 +h0q4lUGfBhw6MViJSJV9mK0BwM783IKhIxh/8OwOz5hdM9yMSBuAOkyaMq+f1Z9FL
	 4gSPn0iivEdjPrKlj+TPF1z5nPstHz9S1C/Iu/k0ryz2ifG2vzZhiusUkt8IsJgwGO
	 37pCaWDwtIGew==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeG-0092VH-8J;
	Sat, 26 Apr 2025 13:28:48 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 01/42] arm64: sysreg: Add ID_AA64ISAR1_EL1.LS64 encoding for FEAT_LS64WB
Date: Sat, 26 Apr 2025 13:27:55 +0100
Message-Id: <20250426122836.3341523-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The 2024 extensions are adding yet another variant of LS64
(aptly named FEAT_LS64WB) supporting LS64 accesses to write-back
memory, as well as 32 byte single-copy atomic accesses using pairs
of FP registers.

Add the relevant encoding to ID_AA64ISAR1_EL1.LS64.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bdf044c5d11b6..e5da8848b66b5 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1466,6 +1466,7 @@ UnsignedEnum	63:60	LS64
 	0b0001	LS64
 	0b0010	LS64_V
 	0b0011	LS64_ACCDATA
+	0b0100	LS64WB
 EndEnum
 UnsignedEnum	59:56	XS
 	0b0000	NI
-- 
2.39.2


