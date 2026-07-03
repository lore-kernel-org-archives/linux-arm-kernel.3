Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3F3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Wz1aK/tf1uvIhKBfTbncNP+19T9GSAicaVpAAdBkS4=; b=nAjRLvyCSyYc6WmS0pZj7mesLe
	7mFjZNsoOB2CaD+QnJsoLSoYjgpMRxIx3N5aq1ceYUAMnMPqiRUz0orRLJ3vHjg5GChjplD01l7/t
	Ip+3YUGFW4PzTiAsn3hlhEN5AaTpVe0XH7oKJWqUtvhN4MzbxoZ3kBveObtCAZpy1Z105BDa6DyFf
	t4Ei2hkO1MGboyUYyHfCTyvANRReFbFlLNlVAwz4iQwBHHmCqAU4ksRUa1r3b7eY2rb6rdHIhyfFH
	AO/1qYECV7z4zetqAhfFiTKwQU3FaQz+UBsMIXKlHOgSkkKpR+LHjLTfY+ZZ3Voekt28u1YE2gCA2
	5qVVzUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeGB-000000079XY-1BYJ;
	Fri, 03 Jul 2026 13:48:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeG8-000000079Wa-2bR7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:48:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0C861570;
	Fri,  3 Jul 2026 06:48:41 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.29.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 600693FAA1;
	Fri,  3 Jul 2026 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783086526; bh=XxkgONwo/+IxkTEmohscjRa0/9XApUUoF/50Es1jlUk=;
	h=From:To:Cc:Subject:Date:From;
	b=rGnfz1jaa2REG4VHXxh0ZrShg9jIeFdm4kN/hwpHtggoCLgHNtEO2mfY8nlgs38hH
	 65ePFicQWL75k60ZmR/y4cuWJzs0ka/It+VEX2UHPsbzbXe7IyQEG4rSgj6z2xVXdD
	 1BS0VobwZNdZF/5AhaG54//HWkPYGH3m8IJ7tjXU=
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Subject: [PATCH] arm64: Correct value returned by ESR_ELx_FSC_ADDRSZ_nL()
Date: Fri,  3 Jul 2026 14:48:35 +0100
Message-ID: <20260703134837.100109-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064848_693408_A2795511 
X-CRM114-Status: GOOD (  10.03  )
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

Address size fault, level -1 is encoded as 0b101001 or 0x29 according to
the Arm ARM. Correct the value to match the spec. This also matches the
offset of "level -1 address size fault" in the fault_info array in
fault.c.

Fixes: fb8a3eba9c81 ("KVM: arm64: Only read HPFAR_EL2 when value is architecturally valid")
Signed-off-by: Steven Price <steven.price@arm.com>
---
The following hideous link takes you to the relevant chapter of the Arm
ARM:

https://developer.arm.com/documentation/ddi0487/mc/-Part-D-The-AArch64-System-Level-Architecture/-Chapter-D24-AArch64-System-Register-Descriptions/-D24-2-General-system-control-registers/-D24-2-44-ESR-EL1--Exception-Syndrome-Register--EL1-?lang=en

---
 arch/arm64/include/asm/esr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index 81c17320a588..f816f5d77f1a 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -131,7 +131,7 @@
  * Annoyingly, the negative levels for Address size faults aren't laid out
  * contiguously (or in the desired order)
  */
-#define ESR_ELx_FSC_ADDRSZ_nL(n)	((n) == -1 ? 0x25 : 0x2C)
+#define ESR_ELx_FSC_ADDRSZ_nL(n)	((n) == -1 ? 0x29 : 0x2C)
 #define ESR_ELx_FSC_ADDRSZ_L(n)		((n) < 0 ? ESR_ELx_FSC_ADDRSZ_nL(n) : \
 						   (ESR_ELx_FSC_ADDRSZ + (n)))
 
-- 
2.43.0


