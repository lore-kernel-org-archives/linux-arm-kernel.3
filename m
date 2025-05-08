Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57818C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BobD5BhKMIqHX7UdhpnmPHxBN7MIZLYeqhA/PchGjkM=; b=mIqNNcGXQFAXw5d7HKNjNIQsay
	IdJdI0BlHb83E32FmB3CNZ/645+5TQph9IykhcAcwhIMvUq3XIp0geqsiU0+dL2cm4Jijl73LKLSj
	ekQPpCJSKMn0y76LEIL9peO0CCFtvKeDMRtkwWfNdLnZVmUSUdoKZBBTrw7KsMQ+RAh1Ytml0+tr/
	Cqby+T/kfVlPj2Iv78Ds/oEYrd6dvyAinvtbc8lqUCCqnama3+3pnJKSv8tLM5D0jvWOLojE9GCor
	xo13cpt8AH3juKKDASIRgtNxyHvHur/t8ePBn/2J4DW7LNcK9tlNujQk34DypB1T7/53xLD031xcc
	/nHBPumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD23p-00000000t1N-3k4v;
	Thu, 08 May 2025 14:17:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1IU-00000000kaw-2Tal
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 13:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BobD5BhKMIqHX7UdhpnmPHxBN7MIZLYeqhA/PchGjkM=; b=ioHqT0Xd5E/IYwGtG+nt65fmJH
	FyBAYHs9i8Ob/aaHY7mR1NJeHs4S8re73Ec4P4P5aX9K/gkGqPzTox0HLt2YKGP65mlgQkCI3ipdv
	fOHKFBUuW8ujsRhHvPzzGRk6Y+Y9nnlD0hexrZvLfiJw52VgUEa3LivLtuYpcWMGbu5363DoLnNcT
	7uWlHhIe5qfjse3HDme+oMAb+5fIxNPB6t6OU92vu2zpXplUsXUw7MGRjAmeiGbUV16nqDJv4eXb8
	n2pe3DCWb9QDZdzsnfpqz29SQo0MUm4QO1BM8ZKUfp0CSf0t+vFG8+vW7+IvLgbBgiRS2fOtVPnTl
	uUljCS/g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD1IR-0000000G3vj-2tAh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:28:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94EA6106F;
	Thu,  8 May 2025 06:28:08 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 942733F58B;
	Thu,  8 May 2025 06:28:16 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	will@kernel.org,
	yury.khrustalev@arm.com
Subject: [PATCH v2 23/24] kselftest/arm64: fp-ptrace: Adjust to new VL change behaviour
Date: Thu,  8 May 2025 14:26:43 +0100
Message-Id: <20250508132644.1395904-24-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_142819_982541_5B836D40 
X-CRM114-Status: GOOD (  10.96  )
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

In order to fix an ABI problem, we recently changed the way that
changing the SVE/SME vector length affects PSTATE.SM. Historically,
changing the SME vector length would clear PSTATE.SM. Now, changing the
SME vector length preserves PSTATE.SM.

Update the fp-ptrace test for the new behaviour.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Spickett <david.spickett@arm.com>
Cc: Luis Machado <luis.machado@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 762048eb354ff..c2882a5a5cc0a 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1183,18 +1183,8 @@ static void sve_write(pid_t child, struct test_config *config)
 
 static bool za_write_supported(struct test_config *config)
 {
-	if (config->sme_vl_in != config->sme_vl_expected) {
-		/* Changing the SME VL exits streaming mode. */
-		if (config->svcr_expected & SVCR_SM) {
-			return false;
-		}
-	} else {
-		/* Otherwise we can't change streaming mode */
-		if ((config->svcr_in & SVCR_SM) !=
-		    (config->svcr_expected & SVCR_SM)) {
-			return false;
-		}
-	}
+	if ((config->svcr_in & SVCR_SM) != (config->svcr_expected & SVCR_SM))
+		return false;
 
 	return true;
 }
@@ -1212,10 +1202,8 @@ static void za_write_expected(struct test_config *config)
 		memset(zt_expected, 0, sizeof(zt_expected));
 	}
 
-	/* Changing the SME VL flushes ZT, SVE state and exits SM */
+	/* Changing the SME VL flushes ZT, SVE state */
 	if (config->sme_vl_in != config->sme_vl_expected) {
-		svcr_expected &= ~SVCR_SM;
-
 		sve_vq = __sve_vq_from_vl(vl_expected(config));
 		memset(z_expected, 0, __SVE_ZREGS_SIZE(sve_vq));
 		memset(p_expected, 0, __SVE_PREGS_SIZE(sve_vq));
-- 
2.30.2


