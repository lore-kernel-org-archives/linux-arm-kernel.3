Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C582C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUpu6+nXInPhG0brd/ajbIFScuDOf75tvKhvQ+EDI+A=; b=eJEE63sLbHMIER8XH6A9SjS3rY
	LpZw3lLQicHi/8YMa29rItCjR5S3g+KeBjEutyj6ZeVFgZ+7+OFHepDD3Hywy/hEQk/0mlRM0OgR/
	wp1LuRK+GbK3xvDJDPHCu65I1Yursec5qICupk0r2XiST1Wcf81/TC/8mu6dimyn4dPShEV1fBbAV
	CK7JQxa+szIlzTcKkBf0/XSOgWyibz3sTo044mS0oAxPubbYofuHLbSnZdllKOZXROZJc/XtGzMM7
	Q9keTFCMGOzt/4rPeydLON5JYvEVxor1HhScBna7mTYkppt/YNGxUycO4Rti1Hxazb63SJqmcblgB
	0A3LKmog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2737-00000003pkz-3Tcj;
	Tue, 08 Apr 2025 11:23:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Xp-00000003kAe-3Qhq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F2AA614B5;
	Tue,  8 Apr 2025 10:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F63C4CEE7;
	Tue,  8 Apr 2025 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109464;
	bh=Tv02OqEETUJL5RhGfHRLiUOkxm6hkdgtGZBz124yXQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tQXMHk9fNNskMb5ZIzN4/MHk7noFhLHI/ogsrVPQqc6BboroIWnQ0P9VkObRnoHlC
	 puBUSqgUYDOTvahy7fEZrgOhv1YzNp0oAKzxuNHVjEoQpcp7TRwW4fu6OguAy7a+U3
	 lskhmbazxBjqUUCC2PP49TsRzlYP6mV3fzjmsOqZiVsAGWUA8UywX9h2EvXI7Jb3Eh
	 ABdHls/ciZCClLmms/SMw/e4lD/amzS/ifqmSxa/jXV9r6Qt9Wdi6O0nCxwweuOjI3
	 KcqQGtK13cGvbZl2i7kXTL8UI5jJeSkG2wwAYYVT6DttjmZvN36xGY9NnFyDfFtVQU
	 t6eoKBUimZtcw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:03 +0200
Subject: [PATCH 04/24] arm64/sysreg: Add ICC_ICSR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-4-1f26db465f8d@kernel.org>
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

Add ICC_ICSR_EL1 register sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 0cc1268c0bfad8266da47b441e80c603e46c00ae..985f2cdb67cfec6df335a3951ecb63f128f6da55 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2310,6 +2310,20 @@ Field	31	C
 Field	30:0	P
 EndSysreg
 
+Sysreg	ICC_ICSR_EL1	3	0	12	10	4
+Res0	63:48
+Field	47:32	IAFFID
+Res0	31:16
+Field	15:11	Priority
+Res0	10:6
+Field	5	HM
+Field	4	Active
+Field	3	IRM
+Field	2	Pending
+Field	1	Enabled
+Field	0	F
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0


