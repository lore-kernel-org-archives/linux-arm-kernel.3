Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C81CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGEd2ctvwFIV9lZCkqIgoelHcMqfqI31DvTGYMHpmGU=; b=Jd4pf2l6PG/SY+OiwjHNEcsyvY
	PkGt4+qnWO66E0cbuny7Wx4NFFffWv7rxs+Ci6ZuawjO10USefvZgsDTVP5IH83aS3yHZ7bdqdi/s
	QmCI52a0RAfvj2i+gezvg+q4E7HeJhKItBOJ3jLj+h9n9Eh+4LO4qdcjKUHHbBkmGVe4e8tTL2Y+N
	D0YCbTAc++Aov8iA7Tzk/PnrxaR7VOjTX88FiQMFTaYY1Z8n8Jbl7YYO2S5wrXLm6qhWmls0/HIfU
	EQ1W3AbVpHF9W4VOdx0zrD0mF+Rjul6LYKs8o7q+bcV1v6x/ShzmrDfTXJ9dOVjFbIoKNT+83ZE1b
	Lb3WuT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJo-00000005dN2-2JZ8;
	Mon, 10 Nov 2025 14:56:32 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJh-00000005dK1-0CkU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:56:27 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762786581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGEd2ctvwFIV9lZCkqIgoelHcMqfqI31DvTGYMHpmGU=;
	b=Z6RXScNgKW7qDh/q7fA53B9NytUe3pY3M7uWoTHpC/cl9yMpyTBr0x8SRnNwRoEvcXtr1X
	RS1wLsk9JtQjXDwdK2O3TfyPXFv8jUUuTmvyML17O8GAe3SvKInkCoDxcjCq/HSYvVGXOh
	hm8OOkaY7zTn1Z57zJv/sL/Q2ftDPFbxCXqzamXRNDhXgARh77sqE3dWYwbeMBPkuJYN6d
	G8sBTxmtYD5nvrUSbaInmwrYls8qM37aLd0mvf1jzjjO/rwdoRB7VRhd1Oqwp8m8PSle6x
	dqkjrSXCSMIdKB69+fE381QlCD+55FjmiVkyamYvUvHfTSrbAOAXyKWrhLnqpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762786581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGEd2ctvwFIV9lZCkqIgoelHcMqfqI31DvTGYMHpmGU=;
	b=lmKEleJ94p+r6QN17FFVuwB7rcYnd8vM2XNPvFelfsuBp2BvoOx2z86kvGOZWoRMj1ShhE
	fcXMd6jXYS3HIPCQ==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v3 4/5] ARM: Disable HIGHPTE on PREEMPT_RT kernels
Date: Mon, 10 Nov 2025 15:55:54 +0100
Message-ID: <20251110145555.2555055-5-bigeasy@linutronix.de>
In-Reply-To: <20251110145555.2555055-1-bigeasy@linutronix.de>
References: <20251110145555.2555055-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_065626_254091_17667505 
X-CRM114-Status: GOOD (  12.86  )
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

gup_pgd_range() is invoked with disabled interrupts and invokes
__kmap_local_page_prot() via pte_offset_map(), gup_p4d_range().
With HIGHPTE enabled, __kmap_local_page_prot() invokes kmap_high_get()
which uses a spinlock_t via lock_kmap_any(). This leads to an
sleeping-while-atomic error on PREEMPT_RT because spinlock_t becomes a
sleeping lock and must not be acquired in atomic context.

The loop in map_new_virtual() uses wait_queue_head_t for wake up which
also is using a spinlock_t.

Since HIGHPTE is rarely needed at all, turn it off for PREEMPT_RT
to allow the use of get_user_pages_fast().

[arnd: rework patch to turn off HIGHPTE instead of HAVE_PAST_GUP]

Co-developed-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 5941566df3ed0..822d378f81ec8 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1215,7 +1215,7 @@ config HIGHMEM
=20
 config HIGHPTE
 	bool "Allocate 2nd-level pagetables from highmem" if EXPERT
-	depends on HIGHMEM
+	depends on HIGHMEM && !PREEMPT_RT
 	default y
 	help
 	  The VM uses one page of physical memory for each page table.
--=20
2.51.0


