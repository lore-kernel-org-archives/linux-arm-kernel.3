Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD33CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JFavAtgsloXzh/GLkUVm+0T2OM9EjBVwK5Uur8DR5U=; b=Sea53Vc1m/KWz5CszrKaZx3TvZ
	+oABMgDUNbdNZpYSfL9PA8a3AO27JNxQI9pKZLoHd4fQt3PfUPOUUMokYw86rfD1TsboGKWgkphAe
	1lZzyWAuCz2+q/Vd9AQSGYyIjmVhBZFXnZz5z/aY3XIAQUQbpIz3pm1cP3Ujwiz2neaX286gzdmQz
	uTeScw2Qm+uR+FtgfZNnf8IlYCTMs6o3jDx/kZdDyb2qGecS3N71Mwavlm6l9XrPX/+P+Q5yHsBv8
	Aefdh8y+Mb1IjMUfRM2XGh4mnnSb18mv1B6/Td+qpcvYFC+NowE0IbnyzZ7/pUb2NS4v6mot/tzqI
	C6tghl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vvC-0000000E4FS-0giL;
	Thu, 24 Apr 2025 12:43:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tmr-0000000Dfme-2eeY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F23E6A4C093;
	Thu, 24 Apr 2025 10:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8ACFC4CEE3;
	Thu, 24 Apr 2025 10:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490392;
	bh=aABGEIrWEsGcFFHRxubhJftIId76X0k2qcZSdwnplek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HBybB16+fsCutQzZUOtglVtIX3DMjYHUdACgl8SYiD1QHUtJ0GTMgfNb7I0dzQFxZ
	 bPKQxbwQZRHUlf3FzzE/UvhOztI5wfpHNZDtiF85DCpD9iSNVOQTGJFHLmgInFVyj+
	 cEvSewxpwNtI/1uDJCIm+RGGY0lRjmefMgxBQeaVl8+XWaYZUvLJgTeJqPIQfQ33UZ
	 8tSKTg5tpnJ0H5PE0+ey+Y4u+uNnmbsFqjSDWEUFaqXnSg//FC6xVUgXvI4ANov0Ac
	 fTpzJT3UXuODx5YDMmbnSuHW4ijpk/62PBLfKcl9qo/8lyQE+cMSelTzMejy3wuiSn
	 ri4E5SO2lHENQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:20 +0200
Subject: [PATCH v2 09/22] arm64/sysreg: Add ICC_CR0_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-9-545edcaf012b@kernel.org>
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
X-CRM114-CacheID: sfid-20250424_032633_742432_4A1953EA 
X-CRM114-Status: UNSURE (   8.11  )
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

Add ICC_CR0_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 7acad93718c56729ce2a333ed007243ec554dbc9..c96243505031ea680c04a693fee2c96ad19e30ea 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2798,6 +2798,14 @@ Res0	14:12
 Field	11:0	AFFINITY
 EndSysreg
 
+Sysreg	ICC_CR0_EL1	3	1	12	0	1
+Res0	63:39
+Field	38	PID
+Field	37:32	IPPT
+Res0	31:1
+Field	0	EN
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0


