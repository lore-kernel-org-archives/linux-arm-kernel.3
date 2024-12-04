Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1C5E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zswYcgJLwrXZ5Noz0/+vVn+a499HuoexmUzvToEzvkM=; b=ldEkW1Zdh/X4eho+VC2v/4Orri
	I7uzSXXnuT/c12I/YkiubSvU271WOv7QbKHgihUoZNVoT0g7xoBhzm3PWHRyLCFwjUWDsPRbIiZmt
	I2dnkIxsA4tU8KBYX1jHgF6hXkO72gUolwcb6BSDDJJINmZNSoIXB9mKa1CMhjKFgU9YgdwQtpcii
	KVvBrsE5XPX4diw4P5xpk06rgnag2C9lz0gza7bTCBr6n20gbGCw9FAQ8k7Ox15TKys+QbJQsju1X
	bs3jgCRVS+SpJs+ns9m3TcjpXCTqk0WQiDn0AKn0n3c3kDNFD3s+TtrzE4F6hwCkxhx7vsbnl/NfH
	2v3CU5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqFj-0000000Coip-3heM;
	Wed, 04 Dec 2024 14:21:19 +0000
Received: from smtp-fw-52003.amazon.com ([52.119.213.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqEi-0000000CoSv-0CvY;
	Wed, 04 Dec 2024 14:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1733322015; x=1764858015;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zswYcgJLwrXZ5Noz0/+vVn+a499HuoexmUzvToEzvkM=;
  b=aRA/xVO6D+sknAsNQNaOQ9Q0kh0+P7vnnkek3OsDSXnAUPj9xy1B6Nio
   Aqr/sfXfuIXGyXxoQr7Cog+RGe4mZ2KTnkxBY+Rgt6uszpoCk7erIASJw
   ohiwqeKdp0Q00n0fnfH9gy74/gNmrr+4FXeqI4D65+VxNlcHDF3HoKFbB
   w=;
X-IronPort-AV: E=Sophos;i="6.12,207,1728950400"; 
   d="scan'208";a="46564984"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 14:20:05 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:50901]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.190:2525] with esmtp (Farcaster)
 id 609709e8-0189-4b6b-b1ef-da475ec79ee4; Wed, 4 Dec 2024 14:20:05 +0000 (UTC)
X-Farcaster-Flow-ID: 609709e8-0189-4b6b-b1ef-da475ec79ee4
Received: from EX19D013UWB003.ant.amazon.com (10.13.138.111) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 4 Dec 2024 14:20:04 +0000
Received: from EX19MTAUEC002.ant.amazon.com (10.252.135.146) by
 EX19D013UWB003.ant.amazon.com (10.13.138.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 4 Dec 2024 14:20:04 +0000
Received: from email-imr-corp-prod-iad-all-1a-6ea42a62.us-east-1.amazon.com
 (10.124.125.6) by mail-relay.amazon.com (10.252.135.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Wed, 4 Dec 2024 14:20:04 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com [172.19.116.181])
	by email-imr-corp-prod-iad-all-1a-6ea42a62.us-east-1.amazon.com (Postfix) with ESMTP id DBF344066C;
	Wed,  4 Dec 2024 14:20:03 +0000 (UTC)
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id 98F487591; Wed,  4 Dec 2024 14:20:03 +0000 (UTC)
From: Eliav Farber <farbere@amazon.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <maddy@linux.ibm.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <farbere@amazon.com>,
	<hbathini@linux.ibm.com>, <sourabhjain@linux.ibm.com>,
	<adityag@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<takakura@valinux.co.jp>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>
CC: <jonnyc@amazon.com>
Subject: [PATCH v6 0/2] Improve interrupt handling during machine kexec
Date: Wed, 4 Dec 2024 14:20:01 +0000
Message-ID: <20241204142003.32859-1-farbere@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_062016_360715_B1D34A66 
X-CRM114-Status: GOOD (  13.39  )
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

This patch series focuses on improving the machine_kexec_mask_interrupts()
function by consolidating its implementation and optimizing its behavior to
avoid redundant interrupt masking.

Patch Summary:
[PATCH v6 1/2] Move machine_kexec_mask_interrupts() to kernel/irq/kexec.c,
               removing duplicate architecture-specific implementations.
[PATCH v6 2/2] Refine machine_kexec_mask_interrupts() to avoid re-masking
               already-masked interrupts, resolving specific warnings
               triggered in GPIO IRQ flows.

Changes between v5 and v6:
 - Change GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD to not be user selectable.

Changes between v4 and v5:
 - The function machine_kexec_mask_interrupts() has been moved
   from kernel/kexec_core.c to a new file kernel/irq/kexec.c.
 - A new configuration option, GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD, has been
   added.
 - The parameters for the machine_kexec_mask_interrupts() function have
   been defined in reverse Christmas Tree style.
 - The comment explaining the call to irq_set_irqchip_state() has been
   improved for clarity.
 - The phrase 'This patch' has been removed from the commit message.

Changes between v3 and v4:
 - Add missing <linux/irqdesc.h> and <linux/irq.h> includes.

Eliav Farber (2):
  kexec: Consolidate machine_kexec_mask_interrupts() implementation
  kexec: Prevent redundant IRQ masking by checking state before shutdown

 arch/arm/kernel/machine_kexec.c   | 23 --------------------
 arch/arm64/Kconfig                |  1 +
 arch/arm64/kernel/machine_kexec.c | 31 --------------------------
 arch/powerpc/include/asm/kexec.h  |  1 -
 arch/powerpc/kexec/core.c         | 22 -------------------
 arch/powerpc/kexec/core_32.c      |  1 +
 arch/riscv/kernel/machine_kexec.c | 23 --------------------
 include/linux/irq.h               |  3 +++
 kernel/irq/Kconfig                |  6 ++++++
 kernel/irq/Makefile               |  2 +-
 kernel/irq/kexec.c                | 36 +++++++++++++++++++++++++++++++
 11 files changed, 48 insertions(+), 101 deletions(-)
 create mode 100644 kernel/irq/kexec.c

-- 
2.40.1


