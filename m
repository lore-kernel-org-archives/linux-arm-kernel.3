Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4CDC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fP9RrMtnMNUBbLpi0MAg198BQEmDu3kfIDjkxYz1Khk=; b=PZsCpQx/1OB0q7pRkytmTYDDM8
	RLYlv/4C+0WFqzIRifHpynjcRkVR9qSu51ymzr7xJYnhH2lH480SKQrEwY8PXwBwcUmacbirqK88+
	nHMiUq6PgcuB+5uBFCXQWTYKwu4gCFwqFJrX7dGAvGKxebAZuvq3DzIxxar5X8Avvmo5eGBDKH0nx
	Zh8J+PONkcQ3Zteum4nNhTvVQbaYzYGXOXc9LH2YbCz5l+WnH9ZtHG3GGV2SXpLY5TUEExXZdY8Oh
	3Muk2IVC1Rc8sgKD+Ql6yS++wg7KvJsKVb7PBuLXA9PwRxjHSyU7naEDok7NPMu4KtkqUgl07V/5z
	x6H2VMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpJ-0000000DfrM-1Izf;
	Tue, 06 May 2025 23:35:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOs-0000000CiHn-1rEg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A95CDA4D6D0;
	Tue,  6 May 2025 16:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD8CC4CEF6;
	Tue,  6 May 2025 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549849;
	bh=DLdRGSDVjuu7YR3c64XHblWDklv45C0aSRJf6NI0fX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hI34H/Ozjz+y4aCAsC5QuH9H5TghVoz3ZTkJQcLV5Z8iYFmUXKhIGHaABkxqxIfzx
	 h8UpWdaoPqfs48eeu7GXuRloPsbnMWelXgoc6HP8X6l9UBYvPHGnlDPeI/CWNaRktl
	 zH1B3JP8ox1S9dclBMMFqjlynQ/reSXRIvq1ctwHcCKNl7m46ARTAL3cIohYPJOrbY
	 67jRq8Q20Hwba67YqVvBPO4BIv6V3BtIEdir2GzEbGRqXnJhUypZk8VUFKVUqVl1hw
	 gPotTaVL/FIx67G2vyOtc7fR5pLPkaTMBepQfKgcnmn35i8kAoHfVHcObKXWCAnn5V
	 w8cEEH24bFK9Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOp-00CJkN-Hw;
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
Subject: [PATCH v4 07/43] arm64: sysreg: Update TRBIDR_EL1 description
Date: Tue,  6 May 2025 17:43:12 +0100
Message-Id: <20250506164348.346001-8-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250506_094410_549405_C2FBAD35 
X-CRM114-Status: UNSURE (   9.87  )
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

Add the missing MPAM field.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index dbb96e15198aa..10052d2eacdf7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3688,7 +3688,12 @@ Field	31:0	TRG
 EndSysreg
 
 Sysreg	TRBIDR_EL1	3	0	9	11	7
-Res0	63:12
+Res0	63:16
+UnsignedEnum	15:12	MPAM
+	0b0000	NI
+	0b0001	DEFAULT
+	0b0010	IMP
+EndEnum
 Enum	11:8	EA
 	0b0000	NON_DESC
 	0b0001	IGNORE
-- 
2.39.2


