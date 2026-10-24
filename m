Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78827606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1gQluOvj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oTFwYNPlYqH4fydSmyNWVQUc+Q4ImkmN8RwZXxCJdcY=; b=1gQluOvjAWh2n7nDwhjMusGkZ4
	3bU3mkBA9JAzNPaaKh0W4vjY1bYfqcW/EhXuabPm/i8qBnqGW2Lx5yAy5Fq/WEzr9wsrtXk2IzmzU
	VYwpawFGndifC1tlV84RZf+6V7kQyTSWcvx5W0Io9PAXGJHTSI+lN9MbbZTkL2muklRj2JAS9ucWs
	obP9e0eyJMtbkCfTYmRs5M9CvnkDhEnm9WaDRNHwUD9HTHs3ZK+CHOi+6Y4DB+RsBE1TLJ/4GRw1h
	MDP4KuKGsFEhFHBU2m2I0hoWOlhMlxboqyhb4tculK9szw+0yQ1s+IxcQe40siEYvkTlURfgBgFbq
	11LUveIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKd24-00000000GsX-1u32;
	Sat, 24 Oct 2026 14:47:40 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKd21-00000000Grc-2P6p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 14:47:39 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with UTF8SMTP id AQAAfwC3mX4Hxdxqf2ZrAQ--.59738S2;
	Sat, 24 Oct 2026 22:47:35 +0800 (CST)
Received: from WIN-B62RPRBL2BM.localdomain (unknown [218.76.62.144])
	by mail (Coremail) with SMTP id AQAAf8DwanUExdxqpOjwAA--.14665S3;
	Sat, 24 Oct 2026 22:47:33 +0800 (CST)
From: Zhu Ling <zhuling2709@phytium.com.cn>
To: maz@kernel.org
Cc: Zhu Ling <zhuling2709@phytium.com.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] irqchip/gic-v3: Preserve SPI state across hibernation
Date: Sat, 24 Oct 2026 22:47:12 +0800
Message-ID: <20261024144720.113165-1-zhuling2709@phytium.com.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DwanUExdxqpOjwAA--.14665S3
X-CM-SenderInfo: x2kxzxlqjsliuz6sx5pwlxzhxfrphubq/1tbiAQAPAWrXwUoEpgAosz
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=zhuling270
	9@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxCF13Aw1xKr1rAr4xuryUKFg_yoW5AFyfpF
	WqqrWFvayDJw1xtayfAw47Zry5Zws3GrWUJ3Z3G3srZwn8CFyvyrnagr1UAa48CrZ3A3Zx
	Xr1YgryUu3Z8uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_074737_738552_21906D05 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.6 (--)
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This v2 replaces my earlier genirq/PM proposal. Please do not apply
v1. The new revision restores distributor configuration in the GICv3
driver and leaves generic IRQ PM policy unchanged.

Previous review:
https://lists.openwall.net/linux-kernel/2026/09/08/2938

Test platform: Phytium E2000Q.
Base: 17bb0e2f6c8043f70a693a5f3797471cbed354c8.
Setup: GICv3 SPI 189, level-high, CPU0 only, SATA root/swap and serial
console; disk=shutdown, pm_test=none. Serial captures confirm poweroff,
a new boot and hibernation-image restoration.

An independent module installs either request_irq() or a chained
handler on the same idle SPI. It injects one real GIC pending event
before S4 and another after restoration. It has no PM callbacks or
automatic recovery. GPIOLIB is disabled; no vendor GPIO driver or
PAD configuration participates in the test.

After-S4 results, with separate fresh boots for each registration mode:

                         hits/injected  hw_masked  pending  rescued
  unpatched ordinary          2/2           0         0        0
  unpatched chained           1/2           1         1        0
  patched chained             2/2           0         0        0
  patched ordinary            2/2           0         0        0

In the failing run the descriptor remains started=1, disabled=0 and
sw_masked=0. A separate explicit unmask delivers the queued event
without another injection or handler reinstallation. Neither patched
run needs this rescue; the SPI is already unmasked before injection.
No unsolicited interrupts were observed.

The fix saves SPI/ESPI enable, trigger, priority and routing state in
the image and restores it during syscore resume. It does not rely on
the module being probed by the boot kernel. v2 changes only GICv3,
instead of forcing chained IRQs through generic resume as v1 did.

Validation: one real S4 cycle per patched mode; ARM64 Image/modules;
W=1 GICv3 builds for ARM32 with hibernation and ARM64 without
hibernation or PM; strict checkpatch and clean-base apply checks.
Mock-MMIO ASan/UBSan checks also pass; these are not hardware tests.
Sparse was skipped by Kbuild because the installed checker is too old.

The test kernels also contain the same 8-line USB host enablement,
not included in this patch. Taint is 0 before loading the external
test module and 4096 (O) afterwards. The fixed runs use the same
Image and byte-identical full configurations.

Scope: SPI distributor configuration, not complete GICv3/ITS S4
support. ESPI hardware, PPI/SGI/LPI, deep S3, dedicated disabled-IRQ,
rollback/fault-injection, non-default configurations and repeated S4
have not been validated. No introducing commit or Fixes tag is guessed.
The reproducer and original logs are retained and can be supplied.

v1 used zhuling0805@qq.com; v2 uses zhuling2709@phytium.com.cn.

Zhu Ling (1):
  irqchip/gic-v3: Preserve SPI configuration across hibernation

 drivers/irqchip/irq-gic-v3.c | 161 +++++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)


base-commit: 17bb0e2f6c8043f70a693a5f3797471cbed354c8


