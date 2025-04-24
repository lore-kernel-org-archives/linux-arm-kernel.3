Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2B8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Naj+/c+DmeWzjH0iSWv3H6bTHR9+JTgYDr3R1wUOTo=; b=d9sS7x32XvmZ3t1VuFHorpZKTv
	wtYj6jfEdYaUCv7Dop9635iclBZ7NaERGc85nzq4EqbQE369AnyRUCr99SWuMzx9blVETWxvi7Eyb
	FbJ8zQWuyih8QGTIZ2llzhuOfGLVvwpWtwtiXSKECmT2+3H/CyO62Y9zgZhsZMNBS2mPPEt/dv08r
	1hbL5zgMLYlj1IdzCrFe63VAK2GIDD1hbb7StctH/yWcJNCHf5ywvf5wMsiHwGOaerTFqXAaXreMT
	l3j/mc3JPcNs8Ag3EoJGPSE71Ul0GrMPQWNAGEzKWjDeHfaZpcsaqj7iDQcCeZAFvGiFiQPIRbUzP
	M4IQuhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vd2-0000000E1dR-43ah;
	Thu, 24 Apr 2025 12:24:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tmE-0000000DfbQ-3Dhg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D87B64A225;
	Thu, 24 Apr 2025 10:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8258BC4CEE4;
	Thu, 24 Apr 2025 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490354;
	bh=gXuthZuxBZQLsvBkFkEhlBn3G2hxd3VqLQiwIZeC8vM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DN/PzKxjvI3evpwtZN4r2tZUQEoS/a2Zx/DdzZy7YH0sh0/iWXis7bsoCy09pK4m/
	 ggaeHfMfW5gljpOg1my/dbM8zKMQLtSyZhAW0YPD+BoRtEmzxoHocArQC7oO1za/BD
	 y883D9Ztguhx7mbShUtMZr0wVP+q9D9nDVs/1yFJ98vGIT3KzZV6PBfQ4TGtbkRm67
	 OGSr/x8vzXTzEyCUyZ2FY1OcnfbLoLNlLXzGx9Y/xYPutQX1xLZyqQl0OPmMCkkUY/
	 uvZaYSGZ7XZY0Y8B7vmjsltbyAdOHHjouprr/ZGrdkjxuTU6VD3mdgdBUgr33oGxjb
	 WniyC0bcVCHfg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:13 +0200
Subject: [PATCH v2 02/22] arm64/sysreg: Add GCIE field to ID_AA64PFR2_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-2-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032554_830829_A6384308 
X-CRM114-Status: GOOD (  10.22  )
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

Add field reporting the GCIE feature to ID_AA64PFR2_EL1 sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index f9476848a2edfad53bb4af7f68bc05cb2a4af9ce..06e1fb5e126b41b7e41fffa0a00553d73197ac3c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1023,7 +1023,10 @@ UnsignedEnum	19:16	UINJ
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	15:12
+UnsignedEnum	15:12	GCIE
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	11:8	MTEFAR
 	0b0000	NI
 	0b0001	IMP

-- 
2.48.0


