Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03FDC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5coaleiFMg4BJ0Ht6OeqyY9Mjs/E0Feiwpirc+lS1Tg=; b=g9dckUEcCKmGoVbtk9DJEUjT+t
	8cAebNCZvijPbHv9dcrAjkY3YS/BnRvwTwzFXPfxgZvJoQgy12rT+xH3ralaL+2OMn/GTeJjQ63uj
	TQdKmTswwvxDfEeNvx2iNyiQQF3lZxGKjEXe2na0r5DP6yZMLCRM/4kzitCBlreuce6TOe1jC431l
	GMKoYdzENtXQ1ipOFA0XNMUm1fQ81IQtzHKI7GhiiU7JPK8MGCutZ6JaLIKHDY0yfwwTulo8VRT78
	hXGieV0Pl5v6cyWsciyT00TtrGZOGNfPxeAEcCRZv202Yodu+WCQDFZCn/PiFPoCPwKR+sENHCW34
	5hNjGUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpI-0000000Dfr3-37Yt;
	Tue, 06 May 2025 23:35:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOs-0000000CiHm-1S1x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CD865C58CD;
	Tue,  6 May 2025 16:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494D1C4CEF3;
	Tue,  6 May 2025 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549849;
	bh=jJkIDne2hoOcyn91XOfMc176KV1oYdB63I9cuKD1rVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bTFwxWv0B2E+RPBVdqgncmqMCp93NF/Xbl9jtyZtptrQQVn2QI/l7A6higB6p+9/K
	 TRI8QR0FTtRO8Z4iwghRwx7eTRK8FYgQgqTYosSVR59iDPhEJcep80DMpacF99+MKY
	 oxy7pP4KLU2H1wz1hGi71fKoB3udW3+TbPB0p+7Tdu2xx7dU0a+FAcMj7FwScla425
	 fBy5W+73LjaywMBUqUIY42gZ8Y6owU57Q6N3f6bqvcIpFN6WX3wGiy+/cvPiyxRwTW
	 Y10owDuIEVhsRVjoejWjimV6A6AfFTxskJZwmbUK+JqmkA8tkLuYwInMC2JZbELzuy
	 eakochRwYEhRQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOp-00CJkN-3n;
	Tue, 06 May 2025 17:44:07 +0100
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 05/43] arm64: sysreg: Update ID_AA64PFR0_EL1 description
Date: Tue,  6 May 2025 17:43:10 +0100
Message-Id: <20250506164348.346001-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094410_447192_3F90055B 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Add the missing RASv2 description.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 4c51d9a67b14d..6c64fd7d84951 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -907,6 +907,7 @@ UnsignedEnum	31:28	RAS
 	0b0000	NI
 	0b0001	IMP
 	0b0010	V1P1
+	0b0011	V2
 EndEnum
 UnsignedEnum	27:24	GIC
 	0b0000	NI
-- 
2.39.2


