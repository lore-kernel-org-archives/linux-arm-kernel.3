Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A249C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8iaf9ro/LaoaqS0DXSj6YpmMhISALf3u5gefIdzEOO8=; b=tc8yWam8sQJB8jX/WPj7Hoi19i
	d8gxvWHTW01bhqsUQ5k7DHNf6bZ4l6MghNyQRI7ogBt3zWdBiEUkfe4odwj5YyoCRAvA0v0XsnoGf
	ywCceMJV+kDRS8guDtMta9ALqfRPIMDPgRH7W+OcRFV+oSHx/EOi16ovAeaiAHm1NgGBK6uzGFsDz
	QLTKjQ53SNdpWWot0GWNSfirwr9JBmTqqiVqDvfC05oPfeeOOe40c8LinS+4pqEOXOp/6N+1livWq
	cl+q9G7bn7O3UctC5xBPU8mqjUSBgyOvBp3nMfxmFXypQVVIfwJCcFu8wcSsmRKuvfeA5DzHekVmn
	0I0SyryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRHH-00000008cjM-0R2Y;
	Wed, 26 Mar 2025 13:58:44 +0000
Received: from fanzine.igalia.com ([178.60.130.6] helo=fanzine2.igalia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQv3-00000008a2T-11DQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8iaf9ro/LaoaqS0DXSj6YpmMhISALf3u5gefIdzEOO8=; b=VFG1W4wY9CohezqY6dqQJKgcgf
	vaddf2QGhhZodLX8lwBWM60J9IKaR+A1FT+ytvDlDnzo1jqxEPfM9/ciEJd/yxc4dHTjB8K6w2EMY
	pYhfGNYFeSiKwhDHRYqL9GXlIazCmLgwngUaivHI4cMPIgmJ+Lme1JDQt414cJPv3jqD2G+91hSIi
	6sBKrO3ud5GlF+7+FlTssFG5RfOF32qqY1vRkl4xE3SZlJpSl9FuPYaZpD3DdorH9lOCkXIN+9j4D
	3nHhHO2d+fycJFOdMtOTNDuSdygDNYfIEF2LvsS404O8AxAwLPTI5F6O6p2tvDa+H2crG7Oj/9ZZ9
	xzmaaxXA==;
Received: from i59f7adba.versanet.de ([89.247.173.186] helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1txQuu-006mop-6e; Wed, 26 Mar 2025 14:35:36 +0100
From: Angelos Oikonomopoulos <angelos@igalia.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Angelos Oikonomopoulos <angelos@igalia.com>
Subject: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
Date: Wed, 26 Mar 2025 14:35:21 +0100
Message-ID: <20250326133521.13637-1-angelos@igalia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_063545_276650_F9944CB2 
X-CRM114-Status: GOOD (  10.19  )
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

do_alignment_t32_to_handler only fixes up alignment faults for specific
instructions; it returns NULL otherwise. When that's the case, signal to
the caller that it needs to proceed with the regular alignment fault
handling (i.e. SIGBUS).

Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
---
 arch/arm64/kernel/compat_alignment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
index deff21bfa680..76cf1c1b5bc6 100644
--- a/arch/arm64/kernel/compat_alignment.c
+++ b/arch/arm64/kernel/compat_alignment.c
@@ -34,7 +34,7 @@
 
 #define REGMASK_BITS(i)	(i & 0xffff)
 
-#define BAD_INSTR 	0xdeadc0de
+#define BAD_INSTR	0xdeadc0de
 
 /* Thumb-2 32 bit format per ARMv7 DDI0406A A6.3, either f800h,e800h,f800h */
 #define IS_T32(hi16) \
@@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
 		return 1;
 	}
 
+	if (!handler)
+		return 1;
 	type = handler(addr, instr, regs);
 
 	if (type == TYPE_ERROR || type == TYPE_FAULT)
-- 
2.49.0


