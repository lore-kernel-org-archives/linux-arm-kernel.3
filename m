Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CEAC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lko4S3JXCbaDPFC67x8f+DdUyvpSccgX1F0nFB9KHqk=; b=oDML8S8z0sCqbNBiETwgZV77ix
	vK1OiXkhQfYcm+xVAVu2xtsKPz7KccS9Ro4jy53rO7927vaZl5R20inhyxpyWEl0PxQgODq8BeVPN
	cWsynum0jQPITiEmemyXnxuyac+F/ZW/1YpYYz40zyh3cUGUcj5K4R9j8nQ0Hu2up9JGt8zgNyFgt
	YiNf8DzlvB8TQcalFB1H3PqcaOjQUEXYEb6nGbZHNTtI29Kn61NcVOOWd040TDkllWLByeNQHTj0u
	s1ChZ8QVcPNPOxPeNGevdTxo8yvaRAYQ+87au2cOFqzlGJ4klW0fUg0Ci8KlBW3QuWyTJ3GD6qmtn
	8jPj5dXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoVK-0000000BFeZ-33df;
	Thu, 27 Mar 2025 14:46:46 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoQQ-0000000BEi0-2Rfd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086502; x=1774622502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lko4S3JXCbaDPFC67x8f+DdUyvpSccgX1F0nFB9KHqk=;
  b=kIJJ1OPrBTsV0mSQbOdQubUpnwT/FeLp9ePS3sGflaw5UKp2XRKYbKrt
   RMTdDf9jmGzJ5fvrBLDmFrIandEUuTZx4afTGEmrG09PRYqmPGHP8691k
   b/beQvWTmBnxASOANo/x4RcsT00y3g7uDLg8x7zQ2eNMIl4JhfQ2zOpfr
   PEIP6qqCtUeMQeyjasb2IriEoOnAag1HRY+8KwkKRZqGQ3bNAZ6QzoW3q
   QNN2PEPbnWTFQlPAFI27FmvEfECGlAlPxv53FLTsKvWcbu9YNl1SQvwsD
   SuAiOMLxUCYprH21X30Ux0i8pf5vLHlvoj8abZpKCZNT16+F8KvjXVj5Q
   w==;
X-CSE-ConnectionGUID: dMFUxNSQTY2H3YJbn8He0Q==
X-CSE-MsgGUID: +msudIjTQFq1QwyZnlTCfg==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199507"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:41:41 +0100
X-CheckPoint: {67E563A5-17-7141A0B0-E6EDEC14}
X-MAIL-CPID: B57B04C1DD94BB85C77A4C766094C62D_3
X-Control-Analysis: str=0001.0A006397.67E5639E.0002,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 379D816C181;
	Thu, 27 Mar 2025 15:41:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lko4S3JXCbaDPFC67x8f+DdUyvpSccgX1F0nFB9KHqk=;
	b=TY5X0g23Q+YmYeDMOKgTjh1xMwFkiLrS8sOWDei2PWP/yjNRaUX1t4J1o3qbg8zUt2CiCg
	ZoAEnY+rDpi2RoMbAJy6wWav537sC2LaBaYBVMm9WFVRsOQx7OCT9gnDnxbyRiveGzXjOB
	jN4FBuMfFa6Wr36vFA9MbbD1H6m+BTGe5V3XBda6QWWGo2PmawI4mIEWpKktMTYHNp5eC5
	x06Jt+KZ2k1aTOcVccqJfxFYwafl4goEWSCo+w+qX2WxE6OBXoG2NPGYsG5l5jy5uk7Rll
	aKoflzewZcCXgXRBnsveSTPArzg0/7cELp5aDxtZFIvEdfnv0DfoG2zmiFLUAQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] ARM: dts: ls1021a-tqmals1021a: Fix license
Date: Thu, 27 Mar 2025 15:41:07 +0100
Message-ID: <20250327144118.504260-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_074142_919858_EA0C6628 
X-CRM114-Status: GOOD (  11.45  )
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


