Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733CBCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BqbaGd3ujMFfuQvly4MTGTSUQZsIXSUIxiFKueQlRMI=; b=y/gEgk0tWUC1QqMODY9Hc6fAvY
	bsTV/pMjJmT0ysevgMGLayR/Dzcz33H0pAZWRBmxuJArOY29TlOg8Vdbjt8dw3pORBzlCiTa8MpcR
	mstpN0UAHrRtWWji54aQuWr8ADvPsMcmfJR8J2a/pzmQVeflz3b3iKY5kC1D7wQvYtwQj8PlSAh3T
	gV4gfiBndLOh1rZZWiK+pD1FLHa7wXeiPKRFMtE10OdltcLMFfFvZIlBUW+8Zyp91DJT/1+kdc73Z
	0vDl+IN4j2V1XArvDERBwuQSKI990Rkak8jzi7YY/CHjxx72AN+5I97JXQ/APNvtJ3jY9xHM9c+3/
	a4oUebTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYBB-0000000DDjS-4AK4;
	Wed, 05 Nov 2025 07:43:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYB9-0000000DDj5-1CQR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 07:43:40 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-294df925292so58897935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 23:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762328618; x=1762933418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BqbaGd3ujMFfuQvly4MTGTSUQZsIXSUIxiFKueQlRMI=;
        b=VRwPTiWuUl8kEEJVYA6myRMROFFGLGB9ClzkqRccz6rWjQjyNt+3R0VEAuMOp+Wjox
         k44YIZcDXbB3X1duWLdOOt9ULLm9CDxMaU0hfMonL774vLFebwBpiXvkjQo3X2bgFjFJ
         Hlpp/XTW3s7YiuxJD4+MkiVcOq+2iPuCQTJIT9BSnPuoTVZXXlMnlkMGMg5IKHs86pC6
         SRMOXw9DrdM6TnIQPyoPJgaOdmTPIGiU4U+/w7ONXJC1P9vZ5mcVChEaobRn6rMqPnZZ
         73tsj+hpOR9dtQvUaxLdkZTOKoZ38VNtHC5Y+boPjbHVMEsvEIZEqaVMeyP4KLH8bVF3
         ORLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762328618; x=1762933418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqbaGd3ujMFfuQvly4MTGTSUQZsIXSUIxiFKueQlRMI=;
        b=Zt5XVX1ugw6V3NoPbkIPJbom5Ezov79r/wxe5QicA9NiN2PIk9O7QYjDzeTsGu/GG+
         o905HURnVak3EcCPPSxPGO4ZicNIqfgYM1y915Fq9O618jbSrwnyuuIsLZfLuzT0Ru+q
         hV6QqXoK4AzHZzviRQMvqdno8iSmSwelsK+kOU8282PRY+7X65Zn5fnMcpWvqy/vuRhg
         dPDIdcWD5ditCbHN7W9ZAI1WngvffP7/1udfX//n2R5FVNHzfzjBiPvRCOJ4aydA8GfP
         /Oh1+v00gusCHdQ5czhAYOmi4B0mhw/zKs4NUs9gwXayqrZZ4rA5NDUUZUswQl5wMsk6
         mahg==
X-Gm-Message-State: AOJu0Yw2rGetK5NeAi3VMeu//0/aGu+8FEgplHK7gX++lNkwIGM25uRB
	k9HIijkhtGXH7I9QhpRMTJ3pUGPSV0R8y/SgvFy54lWNICbkUqcDaNy5
X-Gm-Gg: ASbGnctgvbhfKZYM24G0u+9w8YfB/HZYDGKxSPKDeLG4rymPZY3sMwpzhkghXFlJ/He
	JyIpA4gmxlZT/351xwkbeKMb1stFI5lRRbxiWkscwx5A1BMkJmEnTBlytTXfHTUdg1vd3Hv5XVx
	RwxanzDpsdbGZ/dfXgBNxC7fq8YxOKnzx7s9r/SJEDvoOqZaykRNLNB3gqG3jHs0Zn5vJJKrIIm
	jOxBcBXRefyAGc2a0xf/uas3CTzVdUOvKNZJtikydVlmu3KBjopmGdPDF5ceZxSNpYoa0UCvSxS
	+WSxOvZkW4PbABvEYINCzm6EEt0czqLDuUX/wAFzi9MbFryers7age1osJk05Km3QWWeUz2l2yJ
	idfgtG031OBFGnPV4XyRQ3+/zGJXa7Swu53hk8hgHio28Sq6CvMUYQwmYxUkcdLBa23ITzzDauF
	Dxr1ysrksSuEI7HJnboEN/1LMRCxnLQHzYCq4f7NIrt+rTfA==
X-Google-Smtp-Source: AGHT+IEPd474pPje7iLLe9uuqifhc8lmW7a9y+LRT4XgZRgbuby6o4bf268JRA/KDPXfx02yR6dTsw==
X-Received: by 2002:a17:902:dacc:b0:27e:c27f:b834 with SMTP id d9443c01a7336-2962add0774mr36068595ad.56.1762328618318;
        Tue, 04 Nov 2025 23:43:38 -0800 (PST)
Received: from DESKTOP-NBGHJ1C.local.valinux.co.jp (vagw.valinux.co.jp. [210.128.90.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998eb6sm51062025ad.29.2025.11.04.23.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:43:38 -0800 (PST)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: will@kernel.org,
	ardb@kernel.org,
	bigeasy@linutronix.de,
	catalin.marinas@arm.com,
	clrkwllms@kernel.org,
	leitao@debian.org,
	mark.rutland@arm.com,
	rostedt@goodmis.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	ryotkkr98@gmail.com
Subject: [PATCH v2] arm64: use SOFTIRQ_ON_OWN_STACK for enabling softirq stack
Date: Wed,  5 Nov 2025 16:42:59 +0900
Message-Id: <20251105074259.209131-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_234339_325706_BB4C16D7 
X-CRM114-Status: GOOD (  12.49  )
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

For those architectures with HAVE_SOFTIRQ_ON_OWN_STACK use
their dedicated softirq stack when !PREEMPT_RT. This condition
is ensured by SOFTIRQ_ON_OWN_STACK.

Let arm64 use SOFTIRQ_ON_OWN_STACK as well to select its
usage of the stack.

Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Acked-by: Will Deacon <will@kernel.org>
---

Changes since v1:
[1] https://lore.kernel.org/linux-rt-devel/20251013013508.74677-1-ryotkkr98@gmail.com/

- Add <Reviewed-by> by Sebastian.
- Add <Acked-by> by Will.

---
 arch/arm64/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index c0065a1d7..15dedb385 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -62,7 +62,7 @@ static void __init init_irq_stacks(void)
 	}
 }
 
-#ifndef CONFIG_PREEMPT_RT
+#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
 static void ____do_softirq(struct pt_regs *regs)
 {
 	__do_softirq();
-- 
2.34.1


