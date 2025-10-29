Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6016DCCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P7QSE5GitQoizTRY+UiaUB+DuiXQRLwxlaK7Yf2TPOU=; b=AJ5gM72eh4uC49yUvKeQSDBOAq
	mdhdJ/UO/CWtbYA4oBA0z5/Pxmkr6AJohqemdN1aPLnGYlgaeJdIwkvboshVCHiwQ/frUNFLcXCid
	zfSXMCgQtQqhUFouxiwa0xw3YUTCpIdHcI4xOIG60w4KXWZe735dhjiwqJEkyy7a0/043T5MLl+j7
	2rGmJW25UkXdHKmdmOq7HNTkB4agAmXkHEPHdXajTpnR71W8IH9+2HnR+AjvysCGmn/AzknAGlkoM
	p4oLhP8ee85i8Y3eOYLTi+Z+eEAZSfFvg93l4SxgOWSHeOxbrakePqbUru1ip5eWCPEmKEX8RZ4Wi
	r8xiUbvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8aY-00000001u2N-2ejg;
	Wed, 29 Oct 2025 15:59:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8aH-00000001ttq-41VJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:59:39 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761753571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P7QSE5GitQoizTRY+UiaUB+DuiXQRLwxlaK7Yf2TPOU=;
	b=I8VgbjUWIFCSy9buZfGEyMySBhKNoAJ6VlFGMQfG695cIg9PUvjbLXz8mfdEFKAlAXw9VT
	ia21WhZz4sSjBCZPumK3wY6fgUNCLVjE6R4zYuXALP6IuonyPZqKfYqQsvlArQpd7GVDOQ
	IfeyN4T/TzbxjXfzHr0q1weAxsM6IQQPSFlnaRDoI53jlzLTe4OWhplajZnDfIg4Y7kjpF
	Bn3xzpvcdHtIVObcz9HoHPO+RwW/nX9hey/Lu8mOSlTKfYVI/3FxmVwhgb0Qf3RMHZu9xi
	CBEQvPll4AD5AyEdwLyJLj79HK3qimroQ715s+vvlkrcgHF4MaGiV8VQT1PWzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761753571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P7QSE5GitQoizTRY+UiaUB+DuiXQRLwxlaK7Yf2TPOU=;
	b=dfg7i97OZWnPJey5pK8tIADFa26jADWeUamW9j8gXgtfMqXeIvOyvvji1Ff+fKWdSuAlXk
	7ZulXM4OHL/MkWDg==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 0/5] ARM: Remaining PREEMPT_RT bits
Date: Wed, 29 Oct 2025 16:59:13 +0100
Message-ID: <20251029155918.503060-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_085938_321556_1C4AE5D8 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

Hi,

this is the last batch I have to enable PREEMPT_RT on the ARM
architecture.
Last time I posted them there was some discussion about making the
branch predictor hardening worse. I redid it hoping it improved now and
does not make it worse.

Sebastian Andrzej Siewior (3):
  ARM: mm: fault: Move harden_branch_predictor() before interrupts are
    enabled
  arm: Disable FAST_GUP on PREEMPT_RT if HIGHPTE is also enabled.
  ARM: Allow to enable RT

Thomas Gleixner (1):
  arm: Disable jump-label on PREEMPT_RT.

Yadi.hu (1):
  ARM: mm: fault: Enable interrupts before invoking __do_user_fault()

 arch/arm/Kconfig    |  6 ++++--
 arch/arm/mm/fault.c | 16 ++++++++++------
 2 files changed, 14 insertions(+), 8 deletions(-)

--=20
2.51.0


