Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174D860A2621
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=taFuYYrH;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=C7dnPns2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MatOHa22WtG+l0uamrIjaG0NC2JllSJQL/SZcG1SYnk=; b=taFuYYrHRI4gPf7FjhXlamnetH
	Q06SuW7Oor+LVa99aULMhJIeamjq+ofVNbGimzSrB4lD+VyBFRqntPuCRAWzkXEQPi4v8jQzMWuME
	IL46Jms22C163F78wUMBySCF+yDqtfN3bQuo1IJDFP98vs8/MMml4aebeOUEP6ZYNqtYLdkLoEOG0
	W/px1+ppAlQCeDUJcpZJfqcUl7PBv5re+OURdeM8Lz/Ic5Abt++xbvwibyWeN5rP5Oq8YNgpMYsTt
	2G9XktWKlMNmblLeL3DiRT6KEyggGIaa03dsQ+ILbsftYnlh3fPd1P1FuDmj1o16lU7O9ZyBLPVmv
	pkW4GLAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXZo-0000000C8H9-28TU;
	Wed, 21 Oct 2026 14:46:00 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXZl-0000000C8FU-3gZo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ma
	tOHa22WtG+l0uamrIjaG0NC2JllSJQL/SZcG1SYnk=; b=C7dnPns2P32vgzywFe
	bpTQKcDN75V5x/VBveIBCSruYf8OzOrgR262scCIwAvYaqs+0+tdTr8ohNNM3Av4
	07sh41SFyfhUji91XZ6dAxI93JFYQUxVLj69+zwqs1ioP/IS//+UZWolm3OKG+f1
	W2uMr0gGy7vTtktpeCdobykE4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3998G0NhqjItXBw--.10228S2;
	Wed, 21 Oct 2026 22:45:27 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Tomasz Nowicki <tn@semihalf.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Julien Grall <julien.grall@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 0/6] irqchip: validate ACPI MADT entries before use
Date: Wed, 21 Oct 2026 22:45:18 +0800
Message-Id: <20261021144524.364143-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3998G0NhqjItXBw--.10228S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar15XFWUXr1UtF18uFW7Jwb_yoW8CrWxpF
	W5KayYvr4fGrW7Arn3Aw4UXFy5Ja95JrW7tFWfta45ur1rK3WDXay2yFWYqF13Ar13G3ZF
	9r4jqF1xuFZ8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeLvNUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQcGQGrY0Aci1gAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_074558_283482_7449A6E1 
X-CRM114-Status: UNSURE (   9.86  )
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

IRQ chip ACPI probing receives MADT records supplied by firmware. The
common probe path does not currently verify that the complete declared
entry is contained in the table, and several callbacks access fixed-size
or version-dependent records without checking their minimum size.
Malformed entries can therefore cause out-of-bounds reads during early
boot.

Add the common declared-range check first, then validate the concrete ITS,
GIC, LIO-PIC, and BIO-PIC records in their respective callbacks. Each patch
remains independently buildable and limits its changes to one parser
implementation.

The series was checked with scripts/checkpatch.pl. Each patch was also
checked individually and in series for application to the base commit
below.

Jiale Yao (6):
  ACPI: irqchip: validate MADT entry bounds before probing
  irqchip/gic-v3-its: validate MADT ITS entries
  irqchip/gic-v3: validate MADT records before use
  irqchip/gic-v5-its: validate MADT translate frames
  irqchip/loongarch-cpu: validate MADT LIO-PIC entries
  irqchip/loongson-eiointc: validate MADT BIO-PIC entries

---
Changes in v2:
- Use BAD_MADT_GICC_ENTRY() for version-dependent GICC records.
- Replace the open-coded distributor size check with BAD_MADT_ENTRY().
- Remove the redundant distributor check from gic_acpi_init().
- Add Fixes and Cc: stable@vger.kernel.org trailers.
- Rebase the series on the current tree.

 drivers/acpi/scan.c                    |  7 +++++++
 drivers/irqchip/irq-gic-v3-its.c       |  3 +++
 drivers/irqchip/irq-gic-v3.c           | 15 +++++++++++++++
 drivers/irqchip/irq-gic-v5-its.c       |  3 +++
 drivers/irqchip/irq-loongarch-cpu.c    |  3 +++
 drivers/irqchip/irq-loongson-eiointc.c | 10 ++++++++--
 6 files changed, 39 insertions(+), 2 deletions(-)


base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
-- 
2.34.1


