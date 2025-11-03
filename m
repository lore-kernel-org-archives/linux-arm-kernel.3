Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D82FCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tS0MhUe7KY1JxyB8FA5hPJlAGmWi888eRvQYge3RUY0=; b=KQ1oyqk9niPNGv82HPyOrQEVCO
	n3DnlsyDqiXXErqYHMi7AIufP73QZzGyrB5KhkssX4a9Og+q6xI1lUoUL/bMYqFQCSXQmo3xyonxg
	cU8G6E+atnbtfZe72UhABVc9Efxw/4PqAZpvShzlzLe5GpH8ibRaKFm13BfY6Cl7wExt0DWvwy+Lw
	KORIpvfHn1pE3Z/n8m4wrQ9kXuDHpUFZoch9hyBJ993A9p28+kBcoPNmVPiPsQq2WCH5ki4c4W26W
	e/OnM1c+WjIXcMjDm01R5CPSIx6I9F714P/LKnW1RmXOUs5to5m0MLCBohpgHAfjBXd8ITBlPekrw
	6nFweVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbV-00000009azD-0NuZ;
	Mon, 03 Nov 2025 10:16:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbM-00000009akb-1vbi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:15:55 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762164947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tS0MhUe7KY1JxyB8FA5hPJlAGmWi888eRvQYge3RUY0=;
	b=Lktdhd8Ogqpeh2d00Mj+SWegbA0xdE0cfDr+m25Q0+W/aAuq+IUiY1yQcQPFp/Fz2ySg3f
	2SJRhUBWE/C/ghEHkwaKL5M89DWv2J61e3yu4iT+nuhU9bw/ZYYePIqNv/j1YPV5F/ETTr
	VZm8vBhyfSkTwo77BPNlK6daYcpUnnQTRHTSKpWSJX+mq/2cMYa9VHxtjvdBNNe/HI82Q2
	EaYYv+4jdcFrqpwqm0Hb7J9TEe93/v5nFP4nz5L+hdjLYEGNoRc5V9DcS3qrfATHtl8nnx
	M0s+QvdqVIxCP6lBCgGHuok7uks9ARoFLfvKsKG1E/TCE6S6tPwWA0bFmqgpkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762164947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tS0MhUe7KY1JxyB8FA5hPJlAGmWi888eRvQYge3RUY0=;
	b=22tKgmVTCnMRRdsnLTJmuJkSqEuvGcL6DUOl2QpHhdeWDtupClhiy6NDcuEUAJXI+dOY2v
	POdYR1saXF5MRTBw==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 0/5] ARM: Remaining PREEMPT_RT bits
Date: Mon,  3 Nov 2025 11:15:40 +0100
Message-ID: <20251103101545.760243-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_021552_645617_97321A8F 
X-CRM114-Status: UNSURE (   9.36  )
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

this is the last batch I have to enable PREEMPT_RT on the ARM
architecture.
Last time I posted them there was some discussion about making the
branch predictor hardening worse. I redid it hoping it improved now and
does not make it worse.

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


