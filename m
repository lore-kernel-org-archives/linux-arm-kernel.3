Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DA760A2600
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xB5B79Nd;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q3OX7KbB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pdXx2sQwsc/FyGiF5q/4Ot4c5kPe0svLfhw7mmVF68c=; b=xB5B79Ndt/nN8N
	zmF4KKLuu+nO1GYPyZ1ObRzRdASCvJ4sZzSm0dm6uo6lod8/C4zLmWja+rGrV5VTI0jLBaJYNO+iz
	sKLeuqkGbB7U+L3+/wpLIhFmkgSnXFvtw60SY0IssP3xFcbxRi0riPZP7SgSqSm7hXF3/71wyY+2Y
	8ARYFlGDzCsCXxtfnFWzKN1KEOJc3hZqF6yOM8v+Kd25zIC2f3/PaIYs+CfqQdqJFVec02fk4rvOQ
	gYBq5nzf66Pb/GNLfuDdfquQXjNvXbNZxvw1TRFhgdAG3nVoGvD25ueSSSPhbMBCzQgIAEEmaNfXe
	cnvM12pgwlCfX9OkwBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsAr-0000000GcmE-3Him;
	Mon, 02 Nov 2026 13:34:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsAk-0000000Gchu-3RTp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:34:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F3D719F0;
	Mon,  2 Nov 2026 05:33:56 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D6463F632;
	Mon,  2 Nov 2026 05:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793626439; bh=+DjkWaHm5k69JfbssIC/07x1x3OslL+cMhF9l4xETqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q3OX7KbBB5gJndWLhynSMRwIf0T1hjh62z35YC3kfvHI45fiQADqn0y6rXkmZ/lmO
	 57hHMuQmesoWK82Ig5hLfx/XrUAePkg0lbjtxvqpRIoxOE91rpUpC4EJI7YZ/apBqy
	 4IDWuZnvGLb4GZwksWeHWMw5U4Thqwfz5JXC1Hjc=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Mon, 02 Nov 2026 13:32:54 +0000
Subject: [PATCH 01/10] irqchip/gic-v5: Reject SPIs not backed by an IRS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-host_gicv5_fixes-v1-1-743b61626fc5@arm.com>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
In-Reply-To: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_053402_920597_FA896263 
X-CRM114-Status: GOOD (  14.29  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

It is possible to build a multi-IRS GICv5 system where there are gaps
in the global SPI range that are not backed by any IRS. In the current
incarnation, this results in dereferencing a null pointer.

Reject cases where the firmware attempts to use those SPIs during IRQ
allocation by catching the case where there is no chip_data associated
with the irq (meaning that there is no IRS to back it). Spit out a
warning about broken firmware when this is encountered as it shouldn't
be using non-existent SPIs in the first place.

Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 8c0303af71e7d..f3cce2bd28cc3 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -727,6 +727,15 @@ static int gicv5_irq_spi_domain_alloc(struct irq_domain *domain, unsigned int vi
 
 	irqd = irq_desc_get_irq_data(irq_to_desc(virq));
 	chip_data = gicv5_irs_lookup_by_spi_id(hwirq);
+	/*
+	 * The global SPI range may contain IDs not covered by any IRS, i.e., it
+	 * may have gaps, in which case there is no IRS to back the SPI. Catch
+	 * broken firmware trying to use any of those SPIs.
+	 */
+	if (!chip_data) {
+		pr_warn("Firmware bug! Unimplemented SPI (0x%lx)!\n", hwirq);
+		return -EINVAL;
+	}
 
 	irq_domain_set_info(domain, virq, hwirq, &gicv5_spi_irq_chip, chip_data,
 			    handle_fasteoi_irq, NULL, NULL);

-- 
2.34.1


