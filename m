Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5870DC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aA8vLI7MAtOEMjRIQWw1T8YssBKmDitylE36RcPCelE=; b=qkJWqL6PLIL2T/
	xKSBCupDt06Z6fq9UDYGzL1HpiQnKe5jObWmKyqrzUXjLqCl0dvnAbqmt9QAtAz36LIcY1tgNkVXY
	oI8r+VeB+xM9pwFo2jr5KQOVjasVY/NNL9WoKNBd9/X2jIaaa1AAr/o0rDBWR+7jf14jT6JP+KQSd
	olK/9dnfJjnylYRhkQjnuAZXHMGpjZb001Abm2Hp37AaynHHS5un+0G2kmeLbwTcVkysoMaACStZE
	0aT9rBl7P1SvVAC4Gf3QmCTnMdxJEkKU9sneGzPpm0L2DUjH2ekSQCIHIlfBSyDUYumGtLTiXtAnP
	FMrdv+B/9BFbSXTheGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bF5-0000000EzNt-3vH0;
	Fri, 18 Sep 2026 16:15:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEl-0000000Ez5Y-0OM7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A01060A55;
	Fri, 18 Sep 2026 16:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F871F00898;
	Fri, 18 Sep 2026 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748094;
	bh=aA8vLI7MAtOEMjRIQWw1T8YssBKmDitylE36RcPCelE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U9ViQKP605sp41Kl+OYIXFTMHNkjsPaN2gmL80+h0GHT4bi0XhukSKAuCSKudzw6/
	 mNbemGeBBrsxCsLMXXsm6OTFprr7uZGpyNidrH8gkohXkQgyfCSw9azU3Owq1X01pZ
	 alemikg424ug7GwLvdrtHnzWS8vmSx88qc3pvpjedEiXydpPjvY5UZOwvyN1iyIShg
	 bCoYirL5Dx6eXBb8efux4ufgjE34cX11PprEfTcSMG4+kNSDIDCPJCL2H239Gaho+E
	 AZbEBytGNJBIo0AnucpJq525EwCsHX07AFmmPOyz2QCzPGYwoB8aMKeRD/Z4cczfkq
	 mPcYCVUXFieYA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 11/21] arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'
Date: Fri, 18 Sep 2026 17:13:55 +0100
Message-ID: <20260918161407.2300-12-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Allow the use of per-cpu variables from noinstr functions by marking
__kern_my_cpu_offset() as '__always_inline'. This will later be relied
upon to detect stack overflow of the overflow stack from noinstr C code.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/percpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3dc7291b16e9..cb9ae8a1ae87 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -21,7 +21,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 	return read_sysreg(tpidr_el2);
 }
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __always_inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
-- 
2.55.0.1082.g2b9226bbc0-goog


