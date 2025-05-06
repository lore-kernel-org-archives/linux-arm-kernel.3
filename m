Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AEFC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nRhmDAiY6EALiPEzzhlX/2K9/FLfFCaZ+Ovuz2Aon0=; b=cVJas+2V6KWa4lp+UjPvRbqGzO
	g2urXIjX4FLlfWJUcTSjsTSG/bK4NP30A3GhnO+ycIHJ2HUrci7P5rhQ7nne9oecqqDI0lXTlrpJw
	fX62UewmV3T428Z6fXAsvDaPFCQbFtHu1l3aOeThXT3py9F1eVUapI+LcVdi0BhR+P/ghg+3RafxT
	jvFd1SkzrX3bQf6zh8XpPhMwWFi5m7DAqmVDB9nIXvrAaQ8zkeLd4TMeTyNXFYHZGGXlFySOScQKQ
	Mi//cf7Nw53PR05ySYVFvDG2s66yDVbit4UTwEVaHmJNLKErxau0rj8PdFQr9me+wevBd97hRTSLL
	yhsLfmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQgi-0000000DWQB-3b0W;
	Tue, 06 May 2025 22:22:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOt-0000000CiIy-0ucV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1B87A4D6D9;
	Tue,  6 May 2025 16:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A738CC4CEEB;
	Tue,  6 May 2025 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549849;
	bh=IC/sbdjlRxGlbPcYnZe6UUMLYD3r/rULHfthHQdque4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OxdX5f4ky8jWFlVOBTx7zzZvzqYiNzKPZ48XKtdIggTLpA5CsWXJobe3WHOL3Y8r2
	 6/csPA5DvaqYa75pQ3mUy4BB5Be097i3OYf/4WHbmzCmWR3p+HqDtP+RdWJHSg6SFT
	 NAAn3DqoJjdm6X3el+gIwkl98CrbN55W0/KBoNNiTWSXeWZgFy7xFjfacvsKWkjZwM
	 6Ymd6kwE1NbTnjjDWWN7uwohSzcWjblPwWhxQt2kBcwpoH86THij0Uz8o4q+IViKus
	 ZMKILXY1hCS9q3JsI5T9oEv0oRVgaoUYVl096d15NoAV61ycjAqViF4Pnkynwz5MRx
	 MzBCBvDlXELsA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOp-00CJkN-QO;
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
Subject: [PATCH v4 08/43] arm64: sysreg: Update CPACR_EL1 description
Date: Tue,  6 May 2025 17:43:13 +0100
Message-Id: <20250506164348.346001-9-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250506_094411_406895_740DD483 
X-CRM114-Status: GOOD (  10.49  )
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

Add the couple of fields introduced with FEAT_NV2p1.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 10052d2eacdf7..bb92464fc9abf 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2069,7 +2069,9 @@ Field	0	M
 EndSysreg
 
 Sysreg	CPACR_EL1	3	0	1	0	2
-Res0	63:30
+Res0	63:32
+Field	31	TCPAC
+Field	30	TAM
 Field	29	E0POE
 Field	28	TTA
 Res0	27:26
-- 
2.39.2


