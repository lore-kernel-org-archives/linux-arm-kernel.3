Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBA4CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3J6B2wwZ8nlMNmtNYnVu0NFww9ipBOtwt+oR1HOegI=; b=ZxvLw9rR/3zWiAVNZCblFZHQEK
	M1BpSm5Mn1bFCshK9Vxc48kU6bnQqkVXuSFran75CzO95aJC8dLPVJBh8s1IdrcGsLhuyVaEDf+Ld
	tXUJBU+F0ggVsRxQB2fe+oPVQtyRn05Va89FCNp/spP5NvNY9pis06ep3+//dNy4OUTN7bwBN5yMp
	2aGHUMq9b2n6zo0Xzhl0mCC2CgzbCrb8MYl1KXpjx92zg+S3HG/cAWQHV9Il0ogp2DvNqjoWZjz0R
	EqXZDtWD/NZOqTMBT+dB4hC96hXMz6TinwnwkHmJlZz5WHTDOGB0MD+fLBpikm+9X9eC6X447gzW2
	AWzLNgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgrA-0000000EZSb-3Sxi;
	Wed, 03 Jun 2026 08:21:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgr6-0000000EZPx-1WRw;
	Wed, 03 Jun 2026 08:21:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01A3940801;
	Wed,  3 Jun 2026 08:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8421F00893;
	Wed,  3 Jun 2026 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780474899;
	bh=G3J6B2wwZ8nlMNmtNYnVu0NFww9ipBOtwt+oR1HOegI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UV7+otxrRpsGFCIT5jwSzDvpOuUbknuas3TVVTutaGY5qRF950r5oSoxcsT2s3sky
	 jeN00ChBJ0TYcBIpvW+l2jUft6/5oe06Ttw7lMuqRdKwhYPAop6cYI4HMSfk7HDegy
	 4T3As6/69X/TDI4Zg5Qmi+iBWaeDZDO3Cjevd9NM89obHjUGLwexu00Egcmb5ZCMm9
	 mCBVxdE7uATNtHCrxUJO6HpL+cU7hs2VP+iDNoY9x3QRqoc2cT5pv16zOtiy83J8C6
	 W0Uxo4mlI3LfrLGfSI6QJ0s2zTcUPmEB/Dp075SZu1xstFtYddmBdlxocXC2JBmjS4
	 cVT0FwyBfIrcQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 03 Jun 2026 10:20:58 +0200
Subject: [PATCH v2 2/6] ACPI: RISC-V: Check acpi_get_handle() status in
 riscv_acpi_add_prt_dep()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-2-23ffa16b6ebb@kernel.org>
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_012140_438488_146D74C6 
X-CRM114-Status: GOOD (  10.04  )
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

In riscv_acpi_add_prt_dep(), the acpi_get_handle() call can fail which
would leave link_handle uninitialized.

Fix it by checking the acpi_get_handle() return status and skip the entry
if it fails.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cd83c3035cf6..75170151c614 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -339,7 +339,9 @@ static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
 	entry = buffer.pointer;
 	while (entry && (entry->length > 0)) {
 		if (entry->source[0]) {
-			acpi_get_handle(handle, entry->source, &link_handle);
+			status = acpi_get_handle(handle, entry->source, &link_handle);
+			if (ACPI_FAILURE(status))
+				continue;
 			dep_devices.count = 1;
 			dep_devices.handles = kzalloc_objs(*dep_devices.handles,
 							   1);

-- 
2.54.0


