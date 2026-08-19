Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA55C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 21:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vi5QAYiMDnF99Mnv4hD7NRbZKx+oy6oJnuMEE5F+H70=; b=ilf3obO88TGwibzvzTBS8Pbw5t
	UFNAOWV+KePh1AWJx8W3OYFUpsiWGUXf2SXCgZKbwGptMrAb2IzqOxASx68BIGz014dMxUJNQHldu
	Zo0AygvStdaggysetwghaxBKMjMPl7e86i3HMgZvHOAVb3ob+I46txzeaXdDVvcBSKejGkbAmv8fx
	d3EzbIDDzG/KYbGlh+63D/gNyHzlfSoIyaghvOeri0+eAmjyUJXbJNn8x4JA3lR1kxlI9A+35zRAE
	qMcHEYm23mC/YZTl1OmzuFpTQjUy55IjBcgzaOGMJbOSJyFtNo0WVZzN/3tLKvZxhuhlUVqa+PF2t
	2HPHH56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwo4H-0000000AZc2-2AeR;
	Wed, 19 Aug 2026 21:43:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwo4G-0000000AZbS-0xgN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 21:43:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9F7C4052C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 21:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D161F000E9;
	Wed, 19 Aug 2026 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787175807;
	bh=vi5QAYiMDnF99Mnv4hD7NRbZKx+oy6oJnuMEE5F+H70=;
	h=From:Date:Subject:To:Cc;
	b=GIAixZTJIpKaqc1+bLP9cAGF6QFzFJMnRSPKsJwqewuzEKyBjYe5oLebB7Xbd67uO
	 9qCwM3Lx2o0NkdIh3f//S+BCXcAIFRSa6zYPy0xQhMOYfVjWIgpG5rFHxR3voKcQTG
	 ADL4JTUqXe0vYX3eSYgobQQdMjn13WjC2WHv3yfGuYOegNCfQ8Tkv12sSFNyzKmzl3
	 kaYRwU7Y+FiAwpciIWV3FAAKxX8dISz9EnJV4C9q14MbCGUH18MjDMsCbPwrN+nZnK
	 mza5FC4VqV/rrATbQw8EltPxEa4oqog5GetBBxwPRq0GbFVbDav0xMcdMAkkKeQLf8
	 TZL/iIn/JuVNw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 19 Aug 2026 14:43:21 -0700
Subject: [PATCH] ARM: Fix get_cycles() after delay_read_timer() conversion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-fix-arm-get_cycles-v1-1-208bf07ac540@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfXYhqVASryIi6TqtK1ol2xal9
 O5G+/jBzL+QISuMDtVCGbOaPocCv6tIrmnowXopptrVjQs+cqdvTvnBPcazfOQOYwl7FxtI8Cl
 SOb4yyuofPZ4229TeIOOvROv6Bci62eF2AAAA
X-Change-ID: 20260819-fix-arm-get_cycles-c83096ec81a9
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=nathan@kernel.org;
 h=from:subject:message-id; bh=MYnAPnoNMKML0+3kgfTLZViy+yttVpW5NVcsf68p3aQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFltyjVKb/b49adt00n6s7gzaNGBGNtXSz5P1isJetkcn
 XVCU4K5o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzE5jEjw61v398/jgtW5ktR
 fBO+OLpoizHH6d9dZw9+Fd65Xvfn/zqG/8Grg7RjAiOYg/kuP+6VtVrsv3ADw81ZFXWZFTeYD56
 5zwYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

After commit dfc256dac54c ("calibrate: Rework delay timer calibration"),
certain ARM configurations (such as multi_v5_defconfig) hang during
boot. The use of read_current_timer() in arch/arm's get_cycles() was
improperly converted to delay_read_timer(), resulting in get_cycles()
returning 0 even when the timer has been read or an uninitialized stack
value when delay_read_timer() returns false.

Flip the branches of the ternary condition to fix get_cycles().

Fixes: dfc256dac54c ("calibrate: Rework delay timer calibration")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/include/asm/timex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/timex.h b/arch/arm/include/asm/timex.h
index 94e40c19cfc5..4d31eab9dba2 100644
--- a/arch/arm/include/asm/timex.h
+++ b/arch/arm/include/asm/timex.h
@@ -13,7 +13,7 @@ typedef unsigned long cycles_t;
 // Temporary workaround until timex.h is cleaned up
 bool delay_read_timer(unsigned long *t);
 
-#define get_cycles()	({ cycles_t c; delay_read_timer(&c) ? 0 : c; })
+#define get_cycles()	({ cycles_t c; delay_read_timer(&c) ? c : 0; })
 #define random_get_entropy() (((unsigned long)get_cycles()) ?: random_get_entropy_fallback())
 
 #endif

---
base-commit: dfc256dac54c8b692110bf905c64cb130e15963d
change-id: 20260819-fix-arm-get_cycles-c83096ec81a9

Best regards,
--  
Cheers,
Nathan


