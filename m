Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D7ECD342C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 02:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GCmcW1pt13Ko7auYZo8l25buglPfqCkQlFvWWCuyZr8=; b=epQSkFkZRk9QAQTTGMIskr2ULW
	5wCi+xCxGz4PT8WHcKlD7+CV/SNjGvjG3Z1s15MIfLrTR5ZTOexa0/rcSjq2FdVpxokXg0MdgrlFb
	pTCtAL8z/6fWmyIGFH3WQJSOOvx0b8mEU41TjMdYV+Wu3DfQJsE+4y3bPa9zWpGfIPAuaG1Xd7roN
	mrPACzy9xNmiPQc9Q3EkWIE2eXHjLL/wzYO4ZNYwctCtmDdDOj4yOeVE3/EMyf3db+Ihqd32zXxi4
	U/SMdFZf3juPjfFmRHllNjmMv6Um6QOrpqCpNk/yCKQkUVED1WmT0rmnP1CGMFy6ajopMxnF8BBNZ
	Qwa1TJmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKoXI-00000002XZq-1Rc2;
	Thu, 07 May 2026 02:32:24 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKoXG-00000002XZH-2nVV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 02:32:22 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-12dfee30612so1208372c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 19:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778121141; x=1778725941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GCmcW1pt13Ko7auYZo8l25buglPfqCkQlFvWWCuyZr8=;
        b=U8Npze68Wou0TvcII+KaanYdA9WVW9qVIxRlts1/v0GzvFPL5SoYYBqNausHEIybQl
         z9IIWZ0ES+I/Ha09r0M9ttxR+RY93LEQOh6fmopNNYUs6ZsAG5YoUBrX5ulgAcriOLOV
         VRBmxlmCCJM681OMWIFtfYHgQ4dweGfbnrgDwweoGufmhOuZijo/fTA6h2UQxoMdoEWw
         BdvUEIPvZsd5awVNfS+JIErmHpmhYNij0nXiPo8XEHKtgLdIbnLU56pxIZe3XX3zERjF
         r8kqheZLvM79vElhxDPlvI1DcDd2UqRA06GkrjeC+eB2t1BHAgxnITppJ/lRq7gOeLd+
         sUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778121141; x=1778725941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCmcW1pt13Ko7auYZo8l25buglPfqCkQlFvWWCuyZr8=;
        b=Bcnl/13LRd/ufKDNzu8Nag4Vuy9QZx/EJSa3DbspGPczo3vhlZt/fGCaKqrjyLGcIX
         7HXMOuowKAOWpwsT/9pJfBe6aEXQk2t4worcCTiQcZErD6AsAW6bdjR+YrU2aTE+gqWl
         to25ZkX/vy0WnlgvJqOuy9wel+L+ANxHXpkd2wTxj0m4eK9GVh5pyewkDlGqCLvjPMr1
         kACqfv1gCkIhBEtAEmhAK7bYP6s466100MXYMlE4Z2jC3Fvd/pf2RmuO5DG+EsyU6xWg
         Ad2mgJDbdO+NVk0LXG9ChkFMDZkN92MBQAqLRbwCSRprVXz6xsknbv89VZrJPKZ8sXM1
         w2Yg==
X-Gm-Message-State: AOJu0YySvYKm1F5kNtVrGu9srKRHnzMACWip5v66q18czf37JMIX2S1t
	GFmVK11+4P6SaWRjBISLmBxygDrH/NgcJUVWxh/WzSmmBbH0Al5O+B0aKzUugRqV7T4=
X-Gm-Gg: AeBDietO2k1vXY/p7ttFyKl/f6ursFi8tevr8VMHsMU74GNF2x3hBneijdotLSCT2Ha
	T0jo5Cdb3zvfiKs7zQPIMaYatFlr3hrlt2ReFZNfcdl5rQqyQgvfbKEzE/vW+D/FFov0xBUIlwa
	gWWQtSy5sv6kTje4PbVeiVzxfTjCJf7kPy+opui+D6xe3eUkTK+USjKIlLZ+zQeTwAjvMKi3TuR
	HVICM6mYyPWDlwqWMPDINWY8LR2tSlb1a10yIYUBq0JL6UwIbksYO95cYwoCDNqbqhlHuF/WBRR
	3GAl/vjX1JHqrHXIUk2iNAveDb10gmWTFqoxBHA4tio8uu7MFM+I/j/Oug53zR4KpzgCzBRaE+R
	+5Fr62ZEC1Gz/9jEZdMMj/DXviuPA5Pq+OktYGxOVQzP24VVlwaTM3EN2+YziuVc9HzZDqi/OrE
	st1nhJYc+Dti9u5vc/MXmTpAMBqQaaGfaJccrbZwjk0SjAo3b7XBe05XBsUnZlWVewlAu2CtDyP
	5LGvR7ZUAEuQD1evACveOgeLLqE7G7hN9nKT4WW9ERnJrhmGOtgAqZ6V1q63TSUPol4Us0cOR5X
	PkkY2/gbXz+8SYxw1Rey/YS0lATK
X-Received: by 2002:a05:7022:2396:b0:11d:fd26:234e with SMTP id a92af1059eb24-1318e913bc1mr3262987c88.16.1778121141077;
        Wed, 06 May 2026 19:32:21 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1321e00e146sm4291896c88.0.2026.05.06.19.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 19:32:20 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] arm: <asm/floppy.h>: remove unused DMA_FLOPPYDISK macro
Date: Wed,  6 May 2026 19:32:05 -0700
Message-ID: <20260507023206.52502-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_193222_702794_CD0DA0C3 
X-CRM114-Status: GOOD (  10.22  )
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

This macro is not used anywhere in the kernel. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/include/asm/floppy.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/include/asm/floppy.h b/arch/arm/include/asm/floppy.h
index e579f77162e9..c208925e4d98 100644
--- a/arch/arm/include/asm/floppy.h
+++ b/arch/arm/include/asm/floppy.h
@@ -45,9 +45,6 @@ static inline int fd_dma_setup(void *data, unsigned int length,
 #define fd_free_dma()		free_dma(DMA_FLOPPY)
 #define fd_disable_dma()	disable_dma(DMA_FLOPPY)
 
-/* need to clean up dma.h */
-#define DMA_FLOPPYDISK		DMA_FLOPPY
-
 /* Floppy_selects is the list of DOR's to select drive fd
  *
  * On initialisation, the floppy list is scanned, and the drives allocated
-- 
2.43.0


