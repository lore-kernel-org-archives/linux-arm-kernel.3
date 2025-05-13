Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156ADC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Zqwj3C2xw4Sgd6JUIbfVeDHW1gzwC3AJOp1LVLCFmk=; b=f8iFA4AmwvCoCCURf5BO0xoQjT
	lJ65fg/koX+erwUMzpd3PEbiK2cV6HJrGBU5monVoZycDaxnirJpUbTTolJOabSeV5wVOalFScv1/
	2Bb+h7zNt5GmSJq6Zx7Xs4iWIVOI/m7AvElh8PjczOd8j/1nAkRnJ+JvQ5GPiD5kpvPqWpR7mupbB
	JXgyQKsfaMTwgfNX8FWSt7M7Sd8+T6GQwiBw3DS/EByL7URBA43CCpZ7CncHDbjGyY8daPcnWUbKp
	0MssFOI8jmjih94YCledq4x6oNPnqU8z8bN8d9AWPvHWTSbhmr7+qm4C5rGdDHD/woDqSEHiYq/fK
	Ba8IlcqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtzF-0000000DBxJ-00Bf;
	Tue, 13 May 2025 18:04:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtkC-0000000D93G-2hPV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:48:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 304F443B07;
	Tue, 13 May 2025 17:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59099C4CEE4;
	Tue, 13 May 2025 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158524;
	bh=2YTGxvNsFd02iaNjDUmMIj9h6dgCA0z3/xkUeoHi+gs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GW0ZpR9VCMB0gv7WPg525ZHC8LatSaJkjsxzGw1v/y90b7vubWmA2+SmDxTDX4MgN
	 8Dk2y9LvRlZDV3WZzfmiDCmREoeEdVY6TU74OX7GxMpVNKRfki+na47I3L0MMsPGWc
	 qt++tOUe5jiITTb6lr9Ic/QEXud3fjTdzJfYnpemqX/CvuQsUQgFLLPQlKks5CYP4f
	 59dMk57kqGj/gzbu12haOXAo5nW4HKxP9R/mphBiXdynF3RJE7LtfO/F0fbou/Djy8
	 xtmcruEIMYyRz83vpCkAeV63E3Qg2VrI6cdYI1U1fTJRFXB848Nxgx/gLk9xcDlCyO
	 2dExUnewTdjGQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:47:57 +0200
Subject: [PATCH v4 04/26] arm64/sysreg: Add ICC_ICSR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-4-b36e9b15a6c3@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_104844_723004_CFCEA895 
X-CRM114-Status: UNSURE (   8.05  )
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

Add ICC_ICSR_EL1 register sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index ca6d81b1c6a3d7d66d4b02479123e842aa2bbe62..6f18ceeff0de324ab954b14136b44da102bc0539 100644
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


