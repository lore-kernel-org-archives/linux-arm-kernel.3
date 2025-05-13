Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFD4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/0Ugqs1ITmwlj8p8OQbyv2be0pFPEpIgJyzjZb3fRc=; b=hx5li3uMu20CDDW8xgAeTI0UvV
	LytJ/CWB2/BjczQaViFTuk+ZgBy6dIXQp672iUvUURVd1CFXk5v1IflE8q0zs0iAE4lG9jbo2waht
	ExRjRLjLdquChXk3jA7MhGZB+GQ7gPurh0nElYAKJsoBzz4n6bCeLA/Ev/BmMHjWzHPnS/VR+8KB2
	ZCoPwKFe7lYA+hHtVm0aLred3P/o4lJ1l6Z/oDdhvpSPOowKbbIr0ueTc6Dx3mq+E8MMTBJNv0SeY
	Y/jbvXEO7nmqVwvIuR44Qmyb8aWlzLqGAK9tuLFc/jHgqd2LakrtbXivUIILilJP+4tJhKKYEFq9Q
	3tlGZZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuK0-0000000DEZb-325F;
	Tue, 13 May 2025 18:25:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtl2-0000000D9MD-1Xqm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:49:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBE586116E;
	Tue, 13 May 2025 17:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F038C4CEEB;
	Tue, 13 May 2025 17:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158575;
	bh=mdkTMbIN+57B3kZ//NeOWEWqaYazGWHS3ni+iWa/mOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J2UkiN5DPxECSjDIsqlPfEWelsxc3sAqnSoU0Hu1/ltbUnkQSF+yEdn4LL2eYyLoG
	 J85h+45Pncv8itLXzebTiV5mu4rF4hZn9xQITRv75NIUNT5VoDI9odwvVmJpbH57Rw
	 lQP2C6ypMoxtUhuFPbky8c0c/4OKdgeTt9uAlQhTg22R03QtmmxA0IyeIIpsPQkAtU
	 xhJ44p1vKPrrqGdPvToXnOi8lL6v5ZdMSmS5BYokHs9YDifTj1Epjqsse884xyktSk
	 OvE98V3d5fQFGPOgYYrj2ImRWAC31s8muX90KFp2BM8lbiVBmvmgNG99MxTeb7VHfy
	 PKYEQ7gKyB0NA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:07 +0200
Subject: [PATCH v4 14/26] arm64/sysreg: Add ICH_HFGITR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-14-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
In-Reply-To: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
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
index 0927754d9fe2c5addbd9693d83b7324f1af66d3e..d2f53fb7929c69895fe8a21ba625d058a844d447 100644
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


