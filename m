Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158EDC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zxld5MK5nl7RVPnOXXCg5A1OmUF2muw/uPgyMfoYRo=; b=sQMh1nJN5IWNWVkewzCm1j5rZL
	eZ8U52KxrH0KMZ9JLltU3NdNprNx8v6zIzNDqF2ziIwBsrQQrMNpVIuScEX5TUpQXfoagt0xk6Nt1
	cvO4HCaV3J9sEMJThcPkeoaghcbtAFkTBQDKBEYaAntlXhjEBLnMJ6AMMQ00HBJkVgnHOF5b4u4Pt
	EPPpvixkj919qjF3S+wy9GMoA372yzGlgkjOt5SrVBlnnqtL9OJPDABsFyRpowH/9bQ29SEYbbv8k
	b1VAd58xUptKwQgWsfHkMjCRG5C4DeSWSeqtn66tZumPHGnl5FOSIDFbim7XGmBCS18U8jeGVjw9f
	eFjCDdkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28lk-000000045yg-1ary;
	Tue, 08 Apr 2025 13:13:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26YP-00000003kIh-2Urx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:51:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 454CCA4391D;
	Tue,  8 Apr 2025 10:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96949C4CEE5;
	Tue,  8 Apr 2025 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109500;
	bh=9zWp7WGj091+ZG2FSlP0T7J3sn+1tw+UEtNEfbmUjxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nqlpQpc1SEMWis8VXKD3OnJH1X5KYSi+9N9gfPHksaZ6ekQ2RN6rNygsuiZpMx5Bb
	 SX/sGi0Os0mb8ZDQC3ickjOESKwD4P5gzt98oAbOovsDGLK11Z4WnlS/l4Z9Aa8dTU
	 vqK7cx686WtbvVdn4cEjU36P44gVnD8ThbKS7w63kBc7qUcqUDbA/SwbKliM79DsWQ
	 bHHMFgS2HeNh1hi1FH1fR8Oa4Q+ZyGYQQgOI9oO2aIWGaHWP/IdPMe814VFjMcnfj4
	 Aw+P09xsa3MKaZw9yq1sQoLh8aHPjC4KTo/GPWaB2j+g/ZIBXY3ZANsmfrjbEo+Ph0
	 /QnSwZbk7PuwA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:13 +0200
Subject: [PATCH 14/24] arm64/sysreg: Add ICH_HFGITR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-14-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_035141_701165_9FF382AD 
X-CRM114-Status: UNSURE (   8.06  )
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

Add ICH_HFGITR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1b519e35000be328acfe26d51e098059f9cf9ef2..5af0dea6e775ea680686dbe4bc836b5f5b69fbc7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3616,6 +3616,21 @@ Res0	1
 Field	0	ICC_APR_EL1
 EndSysreg
 
+Sysreg	ICH_HFGITR_EL2	3	4	12	9	7
+Res0	63:11
+Field	10	GICRCDNMIA
+Field	9	GICRCDIA
+Field	8	GICCDDI
+Field	7	GICCDEOI
+Field	6	GICCDHM
+Field	5	GICCRDRCFG
+Field	4	GICCDPEND
+Field	3	GICCDAFF
+Field	2	GICCDPRI
+Field	1	GICCDDIS
+Field	0	GICCDEN
+EndSysreg
+
 Sysreg	ICH_HCR_EL2	3	4	12	11	0
 Res0	63:32
 Field	31:27	EOIcount

-- 
2.48.0


