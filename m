Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC51606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RcqJhLK0;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=d3Bm2zoE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xccUtcyyESJ3WLR2ftYh3c2qwYLTAfF2p1hWnzXcSII=; b=RcqJhLK0+80q+G
	H5N20ipMaYv4X5FhJMH7n1hegtve3h+mjPjejrNUytlvOFaXJ4YXbMJHniA+Tc07+NGURxxTIRbfC
	csCV17ZXvKxvKVgWODDQshhY7J1U4dtCKOFe3W2ExQnNMBZHZm4gnxskLtMsCzHd3ulULvC8R0CJk
	rT8S8MZAieCL47I7j+fsvAt0U84S2qx/EURvBpy5Rro/KxToqOXGvyItfE550qieeucSq+3+eXVxh
	p/0wZu4ntMiBfSPH0orPWPBfsz6vYMTVtE5E4ef4AATcM78d8Zadm4yh+m4/1j4v74j+Zk3tW29Wl
	8IESGqBrOK5V9FCxw8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvmt-00000006JL3-1Ngg;
	Wed, 28 Oct 2026 05:01:23 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvmr-00000006JJx-0SIa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 05:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=xc
	cUtcyyESJ3WLR2ftYh3c2qwYLTAfF2p1hWnzXcSII=; b=d3Bm2zoEGwx9s/TgRU
	K5StLLE+YGC9M+4bX1bLhtAMe83hliqJpYjhCAWdzKdnemPviqAu0zCfRk0MjQwI
	T/l7tVYDjIE+xtkcBsaUVCIzq+UhSWtlI4cZr7zpz6l++F/GmwoMumZxeE5Simv8
	dY3l319wvlJUy6JqMFzXyckx4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD31_V5geFquXTKDA--.16748S7;
	Wed, 28 Oct 2026 13:00:47 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Jason Cooper <jason@lakedaemon.net>,
	Will Deacon <will@kernel.org>,
	Grant Likely <grant.likely@linaro.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 05/12] irqchip/gic: validate MADT distributor records
Date: Wed, 28 Oct 2026 13:00:32 +0800
Message-Id: <20261028050039.121080-6-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050039.121080-1-yaojiale02@163.com>
References: <20261028050039.121080-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD31_V5geFquXTKDA--.16748S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4kGrWUAw45Xw1fJF45trb_yoW8JF43pF
	WDJrya9r43Ww48Gw17Aw4UZFW5G3yftFW2qayrG34a9r1UGFyDZFy2vFyFgF4xtFn5Ka12
	9F40vFy5CF4kAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmjgxUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzh+SzGrhgX-R0gAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220121_717215_95DB038D 
X-CRM114-Status: GOOD (  10.30  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ACPI probe validator reads the version from a typed distributor
record without first establishing its size. The accepted record is then
passed to the initialization callback, which reads its base address.

Reject incomplete distributor records in the validator before either
callback accesses typed fields.

Fixes: d60fc3892c4de ("irqchip: Add GICv2 specific ACPI boot support")
Fixes: f26527b1428f ("irqchip / GIC: Convert the GIC driver to ACPI probing")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index a5ca04e9be64..21fcbfdc2093 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1583,6 +1583,9 @@ static bool __init gic_validate_dist(struct acpi_subtable_header *header,
 	struct acpi_madt_generic_distributor *dist;
 	dist = (struct acpi_madt_generic_distributor *)header;
 
+	if (BAD_MADT_ENTRY(dist, (unsigned long)header + header->length))
+		return false;
+
 	return (dist->version == ape->driver_data &&
 		(dist->version != ACPI_MADT_GIC_VERSION_NONE ||
 		 !acpi_gic_redist_is_present()));
-- 
2.34.1


