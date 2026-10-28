Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D00606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pdOQqjTu;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cvOsB5qB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zLz0pazdOfTsdwtCAGyvlkZm5M8fg99B0g197ylxLwk=; b=pdOQqjTu52MJ0lqdI1tZ4uQ3Ct
	hDPOmDwnDyNgAvLZXLPFUbO1MnHHh0FTDjUTgwn/PtHnNpr51EFDoYd3UJcPukU7bOXaPTRP9K9kp
	iiCAgSeeViAcS6JNJc1QlW/2i0hWLDopP6/cZAjrscSo3uYnBmDIlDBV/ra3vmgIyKoi/HdwbEfbH
	2V6NCokgiNT1AwoJP0F99anHy9jYwwJLT7hLKJ88XQqgkAVFeWecDdhbZEgm2X9Rx/Ro1XrgNljWD
	mngLTLlQqcI8OL29vVETxzJfBCNU53WdNcOh21abOnnMtHMstaBj7O+h51XhWrLYDQUgVCmHZ6LAP
	RZIWyq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvnW-00000006JnG-37hK;
	Wed, 28 Oct 2026 05:02:02 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvnS-00000006JhB-48Do;
	Wed, 28 Oct 2026 05:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zL
	z0pazdOfTsdwtCAGyvlkZm5M8fg99B0g197ylxLwk=; b=cvOsB5qB2Wj0hI7UKh
	cXipRRM+LqlaGC7zY6lk5NhWTd/Fk4JoYV1WoHQFW2yGikSPLyrb+nbEMzsuHn3x
	KEKyXypvLKwXWCHdhELadpwFBJe8I8jQp97Pz56Nn87m11JYg8+A2XoxD6VfZaUy
	d1OwkiDViz6VKQ2r33g0xjJvM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD31_V5geFquXTKDA--.16748S2;
	Wed, 28 Oct 2026 13:00:43 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Jonathan Cameron <jic23@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Tomasz Nowicki <tomasz.nowicki@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Jason Cooper <jason@lakedaemon.net>,
	Robert Richter <rrichter@cavium.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Liupu Wang <wangliupu@loongson.cn>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: [PATCH 00/12] irqchip: validate remaining MADT records before use
Date: Wed, 28 Oct 2026 13:00:27 +0800
Message-Id: <20261028050039.121080-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD31_V5geFquXTKDA--.16748S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr45CF4DXr17tryDKF1Utrb_yoW8Cr4kpF
	W5ua4Fyry5CFW7CwnxAw1UZFy5Jr1rKrW2qa93tw13ZrZ7K3WDXay7AFWrXF4xJw1xW3Wj
	9F4FgFW7CF98uaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URCJQUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xuRy2rhgXvKVwAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220159_470109_219B6C12 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several ACPI interrupt-controller callbacks cast generic MADT subtable
headers to controller-specific records and access typed fields without
first checking that the firmware supplied the complete structure. A
truncated entry can therefore cause an out-of-bounds read during early
interrupt-controller and CPU discovery.

Add the missing minimum-size checks at the callback boundaries. Records
which are passed from a probe validator to an initialization callback are
validated once in the validator, before either callback accesses them.

The issues were found by code inspection and have not been tested on real
hardware.

Jiale Yao (12):
  riscv: acpi: validate RINTC entries before use
  irqchip/gic-v5-irs: validate MADT GICC entries
  irqchip/gic-v5-irs: validate MADT IRS entries
  irqchip/gic-v5: validate MADT IRS records
  irqchip/gic: validate MADT distributor records
  irqchip/loongarch-avec: validate MADT MSI-PIC entries
  irqchip/loongarch-ir: validate MADT MSI-PIC entries
  irqchip/loongson-htvec: validate MADT BIO-PIC entries
  irqchip/loongson-htvec: validate MADT MSI-PIC entries
  irqchip/loongson-liointc: validate MADT HT-PIC entries
  irqchip/loongson-pch-pic: validate MADT LPC-PIC entries
  irqchip/riscv-intc: validate MADT RINTC entries

 arch/riscv/kernel/acpi.c               | 3 +++
 drivers/irqchip/irq-gic-v5-irs.c       | 6 ++++++
 drivers/irqchip/irq-gic-v5.c           | 3 +++
 drivers/irqchip/irq-gic.c              | 3 +++
 drivers/irqchip/irq-loongarch-avec.c   | 3 +++
 drivers/irqchip/irq-loongarch-ir.c     | 3 +++
 drivers/irqchip/irq-loongson-htvec.c   | 6 ++++++
 drivers/irqchip/irq-loongson-liointc.c | 3 +++
 drivers/irqchip/irq-loongson-pch-pic.c | 3 +++
 drivers/irqchip/irq-riscv-intc.c       | 5 ++++-
 10 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.34.1


