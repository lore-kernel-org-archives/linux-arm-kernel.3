Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7780660A2624
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IbGoOiME;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sPqrhyT8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2SKyudsQT7hJSBIFwaZaYBFABRNCtMtBW8qSgv2VxvY=; b=IbGoOiME0OVcx9
	FMxamubm0bhRwDLBFFJP6WXAt6gSMjpv2uZo0D9vAkYaAvZVyiwfp6nDRe5YtlREvxdX+zuLlwLRS
	BMvmUwXdMVSA128Y8zXUBLIPha8SSvrjmNiK6qXk5XpwvWswLNIB2pAFT9oE98KJv7R16JVQ8b8Fo
	BsrAQ7Lk4k8wkvuW3+HbkgbSh0dViI9AjqMLQbNVL4hOto+woKZ3UQxuVY9gubi57pdHaKhL6Q0YU
	Z0tscZOMCJxaqvKw1fU5ahPyF01JOHa70vme1wDG5zbZKvmOx0u5U2ZM1IceGfRKI+XUeG1skFQ3h
	Jp5HhNXKg+0Q0LvBCldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsB0-0000000GczT-2I1V;
	Mon, 02 Nov 2026 13:34:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsAv-0000000Gcjl-34oK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:34:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FA9719F0;
	Mon,  2 Nov 2026 05:34:10 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFA903F632;
	Mon,  2 Nov 2026 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793626453; bh=YMtFF5YusNfOp7alil9V2pUVHaqO5KLltDonqshBJFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sPqrhyT8Um/uLLVfoazVQZhlmsNWCHi2UN9yUdKM8TDB/a9qxGIDM8F8IUowx26mD
	 QjgrdovxBCAmbOMBC/YXgDCvkiHWAZ0cl1Fgcxee0QgNACxrbF06+TWn9bmhj41rAF
	 P0PnYPYW8y626/d278+0QKjXZG17hty6tFZLwxnY=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Mon, 02 Nov 2026 13:33:02 +0000
Subject: [PATCH 09/10] irqchip/gic-v5: Clean the allocated linear device
 table size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-host_gicv5_fixes-v1-9-743b61626fc5@arm.com>
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
X-CRM114-CacheID: sfid-20261102_053413_821908_6FDFB5E6 
X-CRM114-Status: GOOD (  10.03  )
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

When the linear device table exceeds the kmalloc limit, the driver
caps the DeviceID width before allocation but keeps the original size
for cache maintenance. On a noncoherent ITS, this cleans beyond the
allocated table.

Recalculate the size after capping the DeviceID width.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 4de07bbdc4923..c0f3982229194 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -601,6 +601,7 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
 		pr_warn("Limiting device ID bits from %u to %u\n",
 			device_id_bits, device_id_cap);
 		device_id_bits = device_id_cap;
+		sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
 	}
 
 	devtab = kcalloc(BIT(device_id_bits), sizeof(*devtab), GFP_KERNEL);

-- 
2.34.1


