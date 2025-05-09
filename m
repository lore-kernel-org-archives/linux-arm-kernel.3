Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E61DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zv5z2USbq3NNsMOLj5wmCHmNUi3Ax93CYP9A9UEq8FI=; b=0+MZbLgVFec7gunYxrEzByRfml
	73JivBBMTmWyhoPRoyjpi6a4DmUYDukfD0R0mifj3BjYLtfvZ/zV0QquSl/rc3mZ5aHdTKt6oo2XN
	/q1Jdu54QUzlV/+bD4XNuseyxSDV1/4qf6k9hIzQkXzq8gn1V+inJ375Lkq/u/dBNQI28xNUDIsNs
	L77tu6Wn0tlVbWwnipkGsfM2mfqarbii6XGC+wW/6fyZAWD9o4kEBTbXTlAyp1At32SmtYXUXpTrQ
	lQSVbmvrkiVpibvXOLXUkwp8M0tX9DXgChOSdLoYV9ufLe7ySmAUMpLe+xvSm1M5wZ677w7qLfPTE
	kg83QrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRz1-00000004VUN-45lQ;
	Fri, 09 May 2025 17:58:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPw0-000000049SW-0x6L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:46:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD4F5175D;
	Fri,  9 May 2025 08:46:36 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA5733F58B;
	Fri,  9 May 2025 08:46:46 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 3/3] arm64: dts: fvp: Reserve 64MB for the FF-A firmware in memory map
Date: Fri,  9 May 2025 16:46:40 +0100
Message-Id: <20250509154640.836093-3-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509154640.836093-1-sudeep.holla@arm.com>
References: <20250509154640.836093-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_084648_309058_2C4C4EC1 
X-CRM114-Status: GOOD (  11.96  )
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

Reserve 64MB of memory at the end of the first bank of DRAM on FVP model.
This is mainly for FF-A firmware use, as required by various firmware
configurations using the Firmware Framework for Arm (FF-A). This prevents
the kernel from overwriting the firmware region.

This is also useful when running other firmware configurations(non FF-A
based) that rely on usage of 64MB at the end of first DRAM bank.

Necessary for proper coexistence of firmware(FF-A partitions) and the OS.

Message-Id: <20250508103225.354925-3-sudeep.holla@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 755b1407c4dc..a5024075e3f3 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -201,7 +201,7 @@ C1_L2: l2-cache1 {
 
 	memory@80000000 {
 		device_type = "memory";
-		reg = <0x00000000 0x80000000 0 0x80000000>,
+		reg = <0x00000000 0x80000000 0 0x7c000000>,
 		      <0x00000008 0x80000000 0 0x80000000>;
 	};
 
-- 
2.34.1


