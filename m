Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2571BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuzX/2B1C//+iENy5p338mtpUdEXVW/pOaBatY9uies=; b=GKTfwkKsQJrQVVdyn4z3gq6YJ6
	zOnli2heQUopRJa/kI9Zv2IoJwU5NYWxJE2UN1MTeZOMVD98L0k8ER8e+WCRWiNnrUVEUmwfqSfcc
	MqEAAQWWv/QyKsgkERRNjFnJ+qeflsaFEMrXbvZTI5dgBopMtPqkcU8QGBFlm6PBUXjd2JXfxZZp4
	RQ0sdU1jGGfeW2yrYSnNSTp0Eym3yU8XJ5Ao2PAH59VYpYFvjxX5633g3zYOqs7A2tNtxbj2lntk7
	VbUIc4UkLfp1vfOcsFG30O4zbpW3Wfmb3d2DztRxNlQt9rvGwlS4QL0+mNEWFWt1hP/XWAzk3rL8p
	DQUnni/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27aM-00000003uqp-2lMw;
	Tue, 08 Apr 2025 11:57:46 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Ig-00000003S9L-3l8N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104682; x=1775640682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XuzX/2B1C//+iENy5p338mtpUdEXVW/pOaBatY9uies=;
  b=mTA+h/uQcK3QDCzSyvPgem/ioTXS2Tp1ALgstZO1Vf7YPbxVXlkPrNdL
   Vtrkp66R3IUwE4AO1QHkmGtwovn0QcfROgUgRAoowRvvGCAerV0k73qre
   0dP/d4sBMIt2m6W+IbJY6kUe+/XF8AeWZDFqIazo+JZvURfzyaxUeQvr/
   YqWLmXxYKnVCGOvTzPjMBkm/jEYkVGL7pheQ8ooBXSmhHAL0VEDW8F5sj
   O9HGSS6yttpf3rmQzm56l2K7YG1+JvDmA5CH9cvT27D+CYfifoDlkBCvg
   T45DurPMjcuTzBK/KESiUuE/N34xpUyWjLLe0Qgz1xAv+iEPDnmvN9eSH
   w==;
X-CSE-ConnectionGUID: VfUTMTCzT3OxDhSHcKVeSA==
X-CSE-MsgGUID: ZU9egV78T3OwARYeZLf/nQ==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397361"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:21 +0200
X-CheckPoint: {67F4ECE9-41-2417938-F0170C2B}
X-MAIL-CPID: 347FCE5F84C88B12D126220E1586B139_2
X-Control-Analysis: str=0001.0A006375.67F4ECE4.0018,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CFE3169020;
	Tue,  8 Apr 2025 11:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XuzX/2B1C//+iENy5p338mtpUdEXVW/pOaBatY9uies=;
	b=R3gfoDmaIlSg78xQmb6zDI7KMcTVk6P53HNG+DINOEY+pO8oVe3RHOzCu64+dnexA43FhE
	+NeGPiM7AM62JELdyX2D1+04eV14hW4Iwdc1Y9kOzD/LdPC+b/Kv9IT/nsM46VFdBmiVkl
	gIn9beq05AaPU4FpTjt8dV9ju47CIQq3wXLIU8UEt2y7rDOv/BRNwz0eyLbXSx1JNGoYK1
	smp3vWI+xY3d3a+5PNg/Q7TocgcRQDJBwjSQdfGdqSas/179RX8lwqxLdx763x/uY9uj5l
	CF4iUFfhLaPHpp/rXoJtKhe2aPNtzeg1jmiJ3PLzuvEUE94B7kPUSLknKWdbFg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/7] ARM: dts: ls1021a-tqmals1021a: Fix license
Date: Tue,  8 Apr 2025 11:30:48 +0200
Message-ID: <20250408093059.551700-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_023123_235075_864E1FDA 
X-CRM114-Status: GOOD (  10.20  )
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

With commit 784bdc6f2697c ("ARM: dts: ls1021a: change to use SPDX
identifiers") the SoC .dtsi specifies the license using SPDX tags.
Fix license according to the ls1021a.dtsi this platform DT files
are based on.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts | 2 +-
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
index 34636fcdfd6ad..27a55fa638128 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright 2013-2014 Freescale Semiconductor, Inc.
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
index 1b13851ad9970..f7fe8581a23fa 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright 2013-2014 Freescale Semiconductor, Inc.
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
-- 
2.43.0


