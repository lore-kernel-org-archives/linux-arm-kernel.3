Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CC460A380B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Usy4U9Qi;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N1s297oY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gpaAuh2fOXwrcHbmDYDRiGqkaVYt/5u6+l0Qi75BqpM=; b=Usy4U9QiVWqETW
	HTENcHpZYa3feePvM6gInKzdQ2vC2grnAEZXaLe2DNOALgQiV0LGatEQ2XwpV4lGDkDN7jU2Q2AgG
	BkRPTyzi1p4r4T4VaSd1zEgkxOACd8j/ZO+V7YG0991kQut2XZssOLPqJ6JZcUAJibeIBS0kq3pdZ
	Gwg+ayP3ow8qNkW+Kyux20//rcebihRjhPrrT/hM6EV8f40+9VE9pQnPP1tSAVOEcyJPGbfx9fqHz
	KJT/MclFvaTKc/xp6W8DZt7WIYSIAYO7rWi1thjBBaybo0Y1/5PThMw/wDEFfAgPehnwihohqB341
	+SeSHQuYfPwWxXIUuMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsAn-0000000Gcjd-2JZi;
	Mon, 02 Nov 2026 13:34:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsAk-0000000GciB-1VkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:34:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4056C293B;
	Mon,  2 Nov 2026 05:33:58 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EC473F632;
	Mon,  2 Nov 2026 05:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793626441; bh=cwIKq7uEVGikrcixQ23Qo9duokZSRm0jxI8WtgrhzLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N1s297oYlTqGLGTfiY+OEttSaJb0UdhNK724z3zOzGIDP3XapPLeJNX76ebo7epCX
	 q4AXggsPllUCzTtN6LHh+PaQtM5l/Xc75WXZN3tORVXVW3l1hFZUgg7luce2jprP5l
	 r5Sz2/j6R2vUonu4aZ8o0kCrUoYUjQRi72XqRZ2U=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Mon, 02 Nov 2026 13:32:55 +0000
Subject: [PATCH 02/10] irqchip/gic-v5: Only set IRS DPS when 1ofN routing
 is supported
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-host_gicv5_fixes-v1-2-743b61626fc5@arm.com>
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
X-CRM114-CacheID: sfid-20261102_053402_448488_DE60F4A4 
X-CRM114-Status: GOOD (  12.88  )
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

IRS_PE_CR0.DPS is RES0 when the IRS does not support 1ofN routing.
Read the capability from IRS_IDR0 and skip programming DPS on systems
without support for 1ofN routing, rather than blindly writing it.

Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-irs.c   | 14 +++++++++-----
 include/linux/irqchip/arm-gic-v5.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 9d60f474aa4f6..4edf787f3f97f 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -541,12 +541,15 @@ int gicv5_irs_register_cpu(int cpuid)
 		return -ENXIO;
 	}
 
-	cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
-	irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
+	/* IRS_PE_CR0.DPS is RES0 when 1ofN routing is unsupported. */
+	if (gicv5_global_data.one_of_n) {
+		cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
+		irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
 
-	ret = gicv5_irs_wait_for_pe_cr0(irs_data);
-	if (ret)
-		return ret;
+		ret = gicv5_irs_wait_for_pe_cr0(irs_data);
+		if (ret)
+			return ret;
+	}
 
 	pr_debug("CPU %d enabled PE IAFFID 0x%x\n", cpuid, iaffid);
 
@@ -725,6 +728,7 @@ static int __init gicv5_irs_init(struct gicv5_irs_chip_data *irs_data)
 	if (list_empty(&irs_nodes)) {
 		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR0);
 		gicv5_global_data.virt_capable = !!FIELD_GET(GICV5_IRS_IDR0_VIRT, idr);
+		gicv5_global_data.one_of_n = !!FIELD_GET(GICV5_IRS_IDR0_ONE_N, idr);
 
 		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
 		irs_setup_pri_bits(idr);
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index 299e75bc95255..34e22e7d4a4c7 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -532,6 +532,7 @@ struct gicv5_chip_data {
 	u8			cpuif_id_bits;
 	u8			irs_pri_bits;
 	bool			virt_capable;
+	bool			one_of_n;
 	struct {
 		__le64 *l1ist_addr;
 		u32 l2_size;

-- 
2.34.1


