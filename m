Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB38C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUpu6+nXInPhG0brd/ajbIFScuDOf75tvKhvQ+EDI+A=; b=hFn9xFB+IlrAzTrcqF99OJC3JQ
	Bf5kViNeR3I+sEmwlqgZ/puq9TXZpR9G60HulYITj36wt58Jxmew4F1c2BBoz7YPpZ/2Md8bbJXQU
	eM01wQJecKWcyxWdizib6HR+NRHj0bBk7rqYOthvXJ2tzdUxBkmEG2vpO698T2tEpS4yk+tNB9CKJ
	/P9aEWPiMDGaJF6LUOFRgQNfHAbBoS77n9YCGj84+6vJ3DyyCLj9iWiAR98oXK77aeyq8ST/iswcU
	lYirgb6uDeYTHLxHoU7XdfPkvKKVuEM5aHMwBYVnplGry0KojxSJG1Wjy+msH7eIW4gT3HjCOvgS0
	JHKaWwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCK9v-0000000CU3i-21wL;
	Tue, 06 May 2025 15:24:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHLO-0000000BtIZ-3yHO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:24:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DF6C615F2;
	Tue,  6 May 2025 12:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5583C4CEF1;
	Tue,  6 May 2025 12:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534257;
	bh=Tv02OqEETUJL5RhGfHRLiUOkxm6hkdgtGZBz124yXQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SOQBh9snkrf3L/khzAK2xTex7xKK5U9wBZZAS+718Pk/0V5ruvIFHPS1jTTnWuPSg
	 YW8WlWLCQs3i5Ja4yGWCDLvLKLl/lm1hZRMMsRAj3VxGe7pLjHwjkxNhFaARgkywX/
	 7l9XytBILzWT4DSxXEUpP4ry9NxXoLHa6mzElGs6h8iWYQNfzZ5TgniBaTgXEUOpAz
	 g7cG1/wpRWNPbeOkGn1iOWEj37AnH69RF/wWE/Iop2US5QfkjaGOp76pyrjM8nJ6XA
	 xTWUR0soSIzXmy5aPJ2UDe2Nbl3fZW6RYFPTGx9OrKArmOIiC71tHrJ3NRA7GRTK54
	 xGUiZYHhBml7A==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:33 +0200
Subject: [PATCH v3 04/25] arm64/sysreg: Add ICC_ICSR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-4-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
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


