Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687C7D0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QpnzL4BKVIPxAPzUtv1iNJAYHMrRnj7MsnxPep+htdY=; b=kIPQ6b0dT+9VcqxgQ5IizqVekQ
	/V2rXqnMAAF2VHPJKfwewj243ALnhxv1iYrmi2WmczoYl2VBjgulF72/vdEo8F68TYqWTEbBYtfY3
	zjnxT1XKA+ODKMWiA+X/yL+XD16v9lSycxBInwZG/6XnB2yezi/xd/KkV4Uv6NcbnGA1Wgw9MhCfD
	OKXQ9l60P2GGbuFXy0S4shYBM1O4QOu6cQ2q/suLrefH23FDO1hTCWxktG/7nN50vEGc9JMVovf+s
	jWD+KC4qsXWskyxwYhOMee6paEXBKeMQzOdxIR7MOX5tDPiKEJ1UA4vS8yG/RTP4xv16j4fCqMiB1
	kGYAghiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwQe-0000000DdWQ-1oc8;
	Tue, 25 Nov 2025 17:02:12 +0000
Received: from sender3-of-o54.zoho.com ([136.143.184.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwQa-0000000DdVy-143Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764090103; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FoOTnr9zX436nWi32XEE3wJpQnQ76UKdU6WKriPe+/mNgZK67S21zO6RAh6mRfBKvbTwz6WJ00i7LGR+W1D5dyzcw+1gw1KFDyBRqYfrTtigE6+AqQf1KfeDN3M4AoYTdkU0rCmbhmjjZ4+8LYSwc+BiIq6lt4eVLUd9/e4IZJc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764090103; h=Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=QpnzL4BKVIPxAPzUtv1iNJAYHMrRnj7MsnxPep+htdY=; 
	b=S8K8SvmUeDFgZQHQeFR4P/XLQ/bLQG9FWLiWA9bAsklKgvqonJM4cZbG7CcdmU/8u2/9UVXZ7uSmfG89UkPJRfhMk01vnB2+/1G7mY48I/Jp6gBMnTXvYX5yzEoG+VMDa2C4xrTMIBTfukquga/zwnWOBAyBgUIGn/AbtGBzSWw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=anirudhrb.com;
	spf=pass  smtp.mailfrom=anirudh@anirudhrb.com;
	dmarc=pass header.from=<anirudh@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764090103;
	s=zoho; d=anirudhrb.com; i=anirudh@anirudhrb.com;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To:Cc;
	bh=QpnzL4BKVIPxAPzUtv1iNJAYHMrRnj7MsnxPep+htdY=;
	b=en8zfJWZRFXv4RTvzvj1JXuUoz3cjd+JtkWAYpbhChXfJGz0242MwtK+3mVy57cb
	w79NbBli6x/8v/yGlsbLBfhRGZMrFBfgrQCsbKnY4TOAcwn3PGDS1Jhd5217VzLvexr
	6gQrJqGoQrVkw9KatgnW+utjZvTlZFlaz1M0jax8=
Received: by mx.zohomail.com with SMTPS id 176409010041736.77905415459679;
	Tue, 25 Nov 2025 09:01:40 -0800 (PST)
From: Anirudh Raybharam <anirudh@anirudhrb.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	Arnd Bergmann <arnd@arndb.de>,
	akpm@linux-foundation.org,
	anirudh@anirudhrb.com,
	agordeev@linux.ibm.com,
	guoweikang.kernel@gmail.com,
	osandov@fb.com,
	bsz@amazon.de,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 0/3] MSHV intercepts support on arm64
Date: Tue, 25 Nov 2025 17:01:21 +0000
Message-Id: <20251125170124.2443340-1-anirudh@anirudhrb.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_090208_537234_A29564C9 
X-CRM114-Status: UNSURE (   9.46  )
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

From: Anirudh Rayabharam <anirudh@anirudhrb.com>

To receive hypervisor intercept interrupts on arm64 under MSHV, the parent
partition must allocate an interrupt in the SGI or PPI range and program it
into the SYNIC. Currently, Linux provides no mechanism for drivers to
dynamically allocate either SGIs or PPIs. SGIs are allocated exclusively by
the GIC driver for use by the SMP subsystem as IPIs, while PPIs must be
described in firmware (DT or ACPI), leaving the OS unable to allocate new
ones at runtime.

This series introduces support for MSHV by extending the GICv3 driver to
reserve one additional SGI specifically for use by the MSHV driver. The
reserved SGI is then used by the MSHV driver to program the SYNIC and
receive hypervisor intercept notifications.

This mechanism allows the MSHV driver to function correctly on arm64
without requiring firmware changes or altering the semantics of PPIs, while
keeping the SGI allocation model self-contained within the GIC driver.

Anirudh Rayabharam (Microsoft) (3):
  arm64: hyperv: move hyperv detection earlier in boot
  irqchip/gic-v3: allocate one SGI for MSHV
  mshv: add support for VMEXIT interrupts on aarch64

 arch/arm64/hyperv/mshyperv.c      | 31 +++++++++++++---
 arch/arm64/include/asm/mshyperv.h | 10 ++++++
 arch/arm64/kernel/setup.c         |  6 ++++
 drivers/hv/mshv_root_main.c       | 59 +++++++++++++++++++++++++++++++
 drivers/hv/mshv_synic.c           | 15 ++++----
 drivers/irqchip/irq-gic-v3.c      | 29 +++++++++++++--
 include/asm-generic/mshyperv.h    |  3 ++
 7 files changed, 139 insertions(+), 14 deletions(-)

-- 
2.34.1


