Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5193CA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cUunySTYpZDjqrTyGR9q/erW8H5JOcmFtDtuGm8V1A=; b=nsLKnRReMZXbTaGrF5Pi6TGZsJ
	jYOclC5aEYXidOit9pjtbS1Gm7JxFlHaE0L2VXMihRngNaHBDcTGVEgpZGgP8A0OVEfoZK4oxuvqZ
	kdJuE+t+bXdwlQRCIWLA2uZsi9yW+l2TJwOmqAdAOVUcApzqaQI8YXoFv35t/NP0pz9miG8y7CoQs
	cLVpCPr5OEnNEWrA8OWD2MFd8R19DeSgANFnUQXI+DD6NN/MX3iTnTfwR9heKhVetXkiufQ3oPLQ+
	7eTkO+vejdqPQqUNaWxxKev6MYbHKk0B7Rs3SwDr1mRbKa8feYUg7ofqFs+jV2zgV/JaYGsEwYCUz
	Z7j1oD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyn-00000007HLy-1FMz;
	Fri, 09 Oct 2026 22:22:17 +0000
Received: from chamillionaire.breakpoint.cc ([91.216.245.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyd-00000007HFF-40LS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:22:10 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6cUunySTYpZDjqrTyGR9q/erW8H5JOcmFtDtuGm8V1A=;
	b=jkzZI0DiZPGKkRnxhI7TdCIN1v0DCfkSjlb+eLgMArTRq4BtvZuoXlVGrfnNZ9lP1420ap
	Ki+wwWweOncMtQM+uZAN1IHQpsvWqYGfiwGuBwvpy/Wc0usaTMQzLMqXm186BZdt9V+g+f
	tQDlPcKS1XODfWXnu62mKMucsqUSUGEL/8uwoHvSK4cfYCmElW0dvhYL3ikoOK5n+NOzVs
	Kwt9Wawqvz/8OJNQ1BZHkchVR50Kx/xnSLajQQMpOGlVekonvzSXH6+GdY61IYwLtdHaHh
	tQ2PE6Nhl/nA8Ne3/pwcZXIx6mDXPG18g0tlfvla7CXLfUeHzeG8gxD5UNNvHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6cUunySTYpZDjqrTyGR9q/erW8H5JOcmFtDtuGm8V1A=;
	b=fCoAwNJOFOscZrctVNokS9KAuQKGU+yyItXykzKiK5HdDq2pb/HoSUpGkrCM18A3REGZtT
	C1bBbqiPhY/01jBg==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 08/11] ARM: BUG: Move BUG() into the do-while loop
Date: Sat, 10 Oct 2026 00:21:15 +0200
Message-ID: <20261010-arm_warning-v1-8-ddf4be42ae0d@breakpoint.cc>
In-Reply-To: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
References: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_152208_172086_94ACDF72 
X-CRM114-Status: GOOD (  11.64  )
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

Make the BUG() macro use the do-while loop and make the __BUG_FLAGS()
use the extra indirection. This shift makes it possible to use
__BUG_FLAGS() macro without having the unreachable() macro.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 arch/arm/include/asm/bug.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index b9e58be656360..963365b3158b9 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -19,9 +19,8 @@
 #define BUG_ENCODING() .long ___asm_opcode_to_mem_arm(BUG_INSTR_VALUE)
 #endif
=20
-
-#define BUG() _BUG(__FILE__, __LINE__)
-#define _BUG(file, line) __BUG(file, line)
+#define __BUG_FLAGS(__file, __line, __flags)	__BUG_FLAGS_(__file, __line, =
__flags)
+#define __BUG_FLAGS_(__file, __line, __flags)	__BUG__LINE(__file, __line, =
__flags)
=20
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #define _BUG_VERBOSE_LINE(__file, __line)			\
@@ -60,9 +59,9 @@
  * preferable to this unpleasantness. We use mergeable string sections to
  * avoid multiple copies of the string appearing in the kernel image.
  */
-#define __BUG(__file, __line)					\
+#define BUG()							\
 do {								\
-	asm volatile(__stringify(__BUG__LINE(__file, __line, 0))); \
+	asm volatile(__stringify(__BUG_FLAGS(__FILE__, __LINE__, 0))); \
 	unreachable();						\
 } while (0)
=20

--=20
2.55.0


