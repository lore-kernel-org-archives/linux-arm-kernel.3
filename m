Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1045ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vd/3FqZBEmb3t88zXyTeUc/Fqx5bvAc+Cgy+ABhvCx4=; b=pCaghLScPNID0Obau1kd1L493v
	dduBLVqMXIG3rc78eLSmeduH7tWSeA2KVghzbHkGRKneYc8SfcJxvqnrKfY+O5mtRr/bkm8tpi0Bk
	/0+INoCbtuKKs58/A6LJJWo1ojFZmSDEK2vjq/PEq3685Cz6cWQTROTIu25stuqReiJ3IqtxZz+uO
	99ARZMNo481ZczH36yeKG+JRNCFMWuFDOY4y2UjRrFlQKbGp+vptpVZYxAm/6SwWNo1wFwuW1sZiM
	g81A6jOiCXf3Tp7W59xlCMv59fH7oVCuXmvaft8s4ADFZNifjBc5uefI4uVaemRpd6vd4KO9bZ6PA
	5b8nY6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJj-00000005dLY-155p;
	Mon, 10 Nov 2025 14:56:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJg-00000005dJy-2hFE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:56:26 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762786579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vd/3FqZBEmb3t88zXyTeUc/Fqx5bvAc+Cgy+ABhvCx4=;
	b=cDtieN82wpdjhzWTPsUOfwZG/p/1+oKraQcT/cbsAlj31MJty6qZD95TIDMDW7dOH+uBqf
	QjmF6NYLuOPR7x+HTyN1n1qc+Zv28p/cyeEDO25RSDhgdMMcNsHsOtKa5l9HM7QRJPZnK2
	eE0z8zPm9lrFYpaMAqxHjPc9Ojh9m4BUM/tr0hxLbk7e39GZo/r2kFWnGBkGmBJOeZReJD
	BDTe+MKaZgnQAIX+nLsxhxCVjk7mP2d2p4EoaNO3mqee1AHG9rc50wygEMIzANos4tgZfb
	0cL04Al0XP9huXLxT42fq3qvgnUnAZ6psvmFX5rbThnVNGxiXl5z5OskZySELg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762786579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vd/3FqZBEmb3t88zXyTeUc/Fqx5bvAc+Cgy+ABhvCx4=;
	b=d/53tPbkWQciAgJehnDhruamFYelbOrDDuj+CR34h0Hy9PlvA4ShfTJj5Z2kiVth0f+rrT
	nbTQICMv6dJrJfBA==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v3 0/5] ARM: Remaining PREEMPT_RT bits 
Date: Mon, 10 Nov 2025 15:55:50 +0100
Message-ID: <20251110145555.2555055-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_065624_819152_E9B36544 
X-CRM114-Status: GOOD (  10.37  )
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

this is the last batch I have to enable PREEMPT_RT on the ARM
architecture.
Last time I posted them there was some discussion about making the
branch predictor hardening worse. I redid it hoping it improved now and
does not make it worse.

Is this okay now?

v2=E2=80=A6v3: https://lore.kernel.org/all/20251103101545.760243-1-bigeasy@=
linutronix.de
  - Collected tags.

v1=E2=80=A6v2: https://lore.kernel.org/all/20251029155918.503060-1-bigeasy@=
linutronix.de
  - Allow to enable jump-labels on UP. The UP build does not involve
    stop_machine(). Reworked by Arnd.

  - Instead of forbidding HAVE_GUP_FAST with HIGHPTE enabled just
    disable HIGHPTE on PREEMPT_RT. As Arnd explained, HIGHPTE is rarely
    needed.

  - Don't let ARCH_SUPPORTS_RT depend on HAVE_POSIX_CPU_TIMERS_TASK_WORK
    which in turn depends on !KVM. Since KVM has been removed from ARM
    it is sufficient to unconditionally allow ARCH_SUPPORTS_RT. Noted
    by Arnd.

Sebastian Andrzej Siewior (3):
  ARM: mm: fault: Move harden_branch_predictor() before interrupts are
    enabled
  ARM: Disable HIGHPTE on PREEMPT_RT kernels
  ARM: Allow to enable RT

Thomas Gleixner (1):
  ARM: Disable jump-label on PREEMPT_RT

Yadi.hu (1):
  ARM: mm: fault: Enable interrupts before invoking __do_user_fault()

 arch/arm/Kconfig    |  5 +++--
 arch/arm/mm/fault.c | 16 ++++++++++------
 2 files changed, 13 insertions(+), 8 deletions(-)

--=20
2.51.0


