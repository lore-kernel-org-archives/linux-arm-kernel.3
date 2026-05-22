Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586F0CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OVgXaIjnKTC975MfdRgmXFyZkQKLmkaHxhR1b9izJDM=; b=QQueOqi5kOIj7oJhmxIZRgoJHm
	RPs4h1iui/hI8uatKMJL5jQ7DXHyXn+MFVMBlCDc79YZaVQ0ysuVD4Q9yjICaDSLA3gPMzWdUDy5i
	JnK7lXZazW6g7rIdxrXah2YyewEatXO3+Y6F1Z3Jp1Uti+pgRXBoUE64P+NgDSc1YLKlINZ+Jiyvl
	+aP0GZDkiT3NVrpzXt15WJEBZUwuFHQrYVfVQR5xtyIZYU77fUyXmGHKTrokEi2NgXlRZssUHrOTy
	WCDndxcbW4oMu5XE+j0HvJKso/y2KAT78i5NBQk4fVHNOBwqWqPYj0wIlbV51oC97XkVCrL8KGLj/
	nRN/deXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZKR-0000000CE2o-49fD;
	Fri, 22 May 2026 23:30:55 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZKP-0000000CE27-0cc7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:30:54 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-65c0bda7f15so7907116d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779492652; x=1780097452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVgXaIjnKTC975MfdRgmXFyZkQKLmkaHxhR1b9izJDM=;
        b=Dis+BHhcQbg3gJLJgQlCVLoRByefdgnLEQp6Q1PLX0PcYcSoUkQnRNubUknV36rNOT
         OcVG2ydESir2NBK1EHYpWBO1Dtde0hMdz8/Xm2eCmalAkHk1Me/Kt9X+xIhZ/I88xfzm
         Ihniy4W8VEm+UDgXqEga80RW3sdejdRT/Saw2qt5vWN7uz5NLa/2uKGxWsRErMU7P+Wh
         KDCmuSVhyWLHQtjmMdtQYMh/iRvP0KPhO0cpE4QZrmdc7gOdhJEld4kh80uC256kUUAI
         aJmhTzUkBiTK5oGEOCLKz/iJj0GdlDAiRfla9F6wx0VloWYxtaesGkqR5nlNtwUKpcR5
         R+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779492652; x=1780097452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVgXaIjnKTC975MfdRgmXFyZkQKLmkaHxhR1b9izJDM=;
        b=ZTS6yqdqUDpjDdVzmACydof0SnRwTwHrpANgkG1vFtnh2jZJ0rmXzjh3XLaEjGb1oQ
         ZM1fUZGu7UkEeZ+LL5CgdrKHruqB05edc7568KxLlwbzvmEu+E4gh5ODf1N8wVy8Rm7p
         p3NUKKdEypfrgTS5rNznfSVtZGfVu7Di42f6KoFLgRK5a6uxGK6RS1iKhRXzeNAPxyTM
         i/KymZDwCP/25ecQzEJoTHM+0z5Yu7fuUa6xi3BcPZrQlWFuvLdhbfqf+aTgry6mu4vb
         KvG+07DWdUGoY2aHZZ1j6YGX/G8K9U1j+ngclA+CokeOEEhpJtgngTZ5gCU66dWVfaLb
         0XPg==
X-Forwarded-Encrypted: i=1; AFNElJ+0Iu0W2zRzfgJTg9WwYE3/22YU4l2bSEY0TEY0tpJfcQW1Cd/Cz27nFdB5VbTXrm4xsOrNcpuS2YnV4cHr58oU@lists.infradead.org
X-Gm-Message-State: AOJu0YzDxbawmiBtDpSro1PRxEOPIAaIke0EZlBlGEwmBq4Kl3HqSgGJ
	c20VGWez4CHtDmS8BBthtv8kYRMVUOzN4cNIUM7EMfJl7GbYNSHzX+yg
X-Gm-Gg: Acq92OH8x+Aedos+Y1pJBKPGh1wioSKEbJglGqmxNoDXd+4AZq14VRsi2Pxoe7sKbhl
	qJatIzEEc4VhZxb1dLCTCFjUJcXbgcya59rpdeAHLVCGxz/uZsog3CBSagceLYszdhorfs1qEXe
	pJ7enWGoEWa+lU7hyCuAM4Wv/2r9AwLU7LJ/uAKMYcP+RPKds0dWl1mzTnGCVgrS/ue4Ob5NrxO
	Fzje73kwmN74Z7TqMGb2SU1qyXRr6eCeeW9DN0tSHiJHkixgUcUV4p7xmy4sqW1mevmijxwje2a
	xFhi9bUSP8K8e59Zfk4UJNt9CP2pt7kPpKHJW+Xe02WBeaWQmTZeZcaop6Vt5IEuS4mhX4CoRXY
	OUvryCG2kjgZT2haK4h5nnOtaXQVDySBNhzMUZtSb1s1ls10/jO85OoCDFm9+biIs/iy1oRhNzn
	Ihr1WcWJDzkxcH7TDtPbC8hgZ3jZK9JU0cPHDuce+oluwIfbSOzRjaUvpyG0VULW7kEtij9Sjg9
	AZEwDFnBhymaG9pMg1CDvV22WwbJMlBbdKUK3AhMYtayXWwiRuh/v/8lAGq63srK7EB6g==
X-Received: by 2002:a05:690e:418e:b0:65c:5b88:849f with SMTP id 956f58d0204a3-65ec9931107mr5745827d50.45.1779492651865;
        Fri, 22 May 2026 16:30:51 -0700 (PDT)
Received: from localhost.localdomain (99-61-165-33.lightspeed.sntcca.sbcglobal.net. [99.61.165.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65ecfdfc74csm1341853d50.21.2026.05.22.16.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:30:51 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mithil Bavishi <bavishimithil@gmail.com>
Subject: [PATCH v2] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Date: Fri, 22 May 2026 16:30:36 -0700
Message-ID: <20260522233036.12277-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_163053_193532_087F4703 
X-CRM114-Status: GOOD (  11.49  )
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

With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
because omap_pm_ops.finish_suspend points directly to the assembly
routine omap4_finish_suspend, which lacks the expected KCFI type
metadata.

Annotate omap4_finish_suspend with SYM_TYPED_FUNC_START so the assembly
routine carries the KCFI type metadata.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/mach-omap2/sleep44xx.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/sleep44xx.S b/arch/arm/mach-omap2/sleep44xx.S
index f09c91978..0b48df6fc 100644
--- a/arch/arm/mach-omap2/sleep44xx.S
+++ b/arch/arm/mach-omap2/sleep44xx.S
@@ -58,7 +58,7 @@
  * stack frame and it expects the caller to take care of it. Hence the entire
  * stack frame is saved to avoid possible stack corruption.
  */
-ENTRY(omap4_finish_suspend)
+SYM_TYPED_FUNC_START(omap4_finish_suspend)
 	stmfd	sp!, {r4-r12, lr}
 	cmp	r0, #0x0
 	beq	do_WFI				@ No lowpower state, jump to WFI
@@ -223,7 +223,7 @@ skip_scu_gp_clear:
 	isb
 	dsb
 	ldmfd	sp!, {r4-r12, pc}
-ENDPROC(omap4_finish_suspend)
+SYM_FUNC_END(omap4_finish_suspend)
 
 /*
  * ============================
-- 
2.43.0


