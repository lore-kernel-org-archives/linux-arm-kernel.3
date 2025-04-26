Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA26C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 12:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sSpxxLXJ74+OGSvVP73l7lwl2/BSlAXjymPZmGGCfw=; b=sEp9inPg9ni3MAE/o97p5cDw/a
	ZnY6xbduE8FLYdK9Dx4nPBvt1HouelLdtFRa2x84/PeB6mmhZ/mdDNv0k3cDxQa8P3QjANSaSTpNl
	SQyWBlGcRAlaTYW/MKscNwV4oNZdxCydFcE8Z0SG9CHe2FjoLErQ3J+QWel1ODGYVCmWoeo0YGAx7
	hx5JUWG0eZyJwQqPEh3pfG5wjWT1joIbZL5QVP/uGyHkCxx4WfuGakUtEmujGJpZ9vaST1FKmautf
	WwGHgYv5dLtXPhELSszOFMHQMC7QS5ZM8YyNB6peuj/oGt8BRV0Iy2KKToMmbTL5q4NmVdhBMOwzX
	bF2mUHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8euw-000000021PM-3Gx2;
	Sat, 26 Apr 2025 12:46:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeL-00000001yzG-3Dkj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12C4649EB8;
	Sat, 26 Apr 2025 12:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC01C4CEEE;
	Sat, 26 Apr 2025 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670531;
	bh=ZbARnllWLTKpfbUxJiKayVvvwz1uYCkC8EnHfBZoQ6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8H1FWjYEGJoSe5HqG+KhuQV68fisTmGjuDRtaUV1cEOoU7gzUtRQgXXR0VVpP6mR
	 rE0HLJU4aGQAneZDQtBDfdDvQPgQZD63dfl1eN+uBIoWU3fkdrCie1mli1E3ZxdaVC
	 HGr0tynZWOTzhxGi/AXAjTD3EwRURnTtavTpcG4Y6HbSZYPTK2R0DBBSvs1YyElvMl
	 Dmk3GgWV//9fFybdOUSMEFQTStRMiPobbe548f7Yn/mR0uWHsjnJ0SXXuVZC60WZ2E
	 MECHcIu+bve5I6Yz/VOfJDLIIySbGDbMhFyAOFLHDXlAn4QHRrmufeXZyP/i/+vLzo
	 noz4ZR9AV89yA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeH-0092VH-PH;
	Sat, 26 Apr 2025 13:28:49 +0100
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
Subject: [PATCH v3 06/42] arm64: sysreg: Update PMSIDR_EL1 description
Date: Sat, 26 Apr 2025 13:28:00 +0100
Message-Id: <20250426122836.3341523-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052853_852889_AA7F26B8 
X-CRM114-Status: UNSURE (   9.61  )
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

Add the missing SME, ALTCLK, FPF, EFT. CRR and FDS fields.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bdfc02bd1eb10..668a6f397362c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2241,7 +2241,28 @@ Field	15:0	MINLAT
 EndSysreg
 
 Sysreg	PMSIDR_EL1	3	0	9	9	7
-Res0	63:25
+Res0	63:33
+UnsignedEnum	32	SME
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	31:28	ALTCLK
+	0b0000	NI
+	0b0001	IMP
+	0b1111	IMPDEF
+EndEnum
+UnsignedEnum	27	FPF
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	26	EFT
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	25	CRR
+	0b0	NI
+	0b1	IMP
+EndEnum
 Field	24	PBT
 Field	23:20	FORMAT
 Enum	19:16	COUNTSIZE
@@ -2259,7 +2280,10 @@ Enum	11:8	INTERVAL
 	0b0111	3072
 	0b1000	4096
 EndEnum
-Res0	7
+UnsignedEnum	7	FDS
+	0b0	NI
+	0b1	IMP
+EndEnum
 Field	6	FnE
 Field	5	ERND
 Field	4	LDS
-- 
2.39.2


