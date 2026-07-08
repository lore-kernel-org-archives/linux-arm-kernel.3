Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CE5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I05qd3dKvoVv8NezF39JfUBdPW3JyYP1LxVvtaLf6r0=; b=n4I0dXuRJypdWB+4d6g97c6A/h
	HtMXEjuFIXL0slNHch6yZ8/Q3oY2/WMu43SEUJddYG0dK4vyOrB+ck1kbSX7r4ibauzobYq6vEkaj
	zPNofpCAQPlu7iHzHBJiMZk1J5Xf7eQHrjY5n0ryPsuRqvq0DteXYtto0V3Xb+Ruy/Cx2Opg3YIq2
	3uo7e0l91ugtfEdAN6nwmpQrc4RVZiIjTMXo5QTU1HFCtfW8A/1vz8sMZOMyKbkf99WoRt70zC+hR
	ZFfiz7QzN7orV6b/3/ajuw1VwDNEPagi/YX4WpHiBVlPqRff8en1njkVnTmDp0pp3izyhbjQhrz4S
	29unPtPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMVn-0000000GT7w-1GEW;
	Wed, 08 Jul 2026 07:16:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMVl-0000000GT6A-3q7y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 192D943E58;
	Wed,  8 Jul 2026 07:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD0BFC2BCFB;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783494960;
	bh=/ejZ9kEPzd3EuCno7ps+9xBx6LGHpjeL3VowrnL2/78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EkA2XLCetEn+0X3MLOpEK0EDgDo4DCBZKaerH//y9NGxL+gOzpZ5yDGvIqJY40geb
	 QIStN89D9V9eiOsbg8lhNBXoMcB/vmzUi3vH3IKoJp1G1duTUiFEm4lYkvIRNzJoXA
	 +9cXElE6H+m339LtH8vm0Xp8FdoF43kGu5UVaUkofZ9mSQYO44YcRxOsGB9gtwrS05
	 6yInfa0rxgwvXSvyXJIVI8s0eioZ5l6jTjpXpAooxRjmJOwNBhIa8lamZdtHJm5IqV
	 UHUorOMEs5ZInv4vgyu65aw7g90+h+FKDi058XukEXNhIAF3dzM8Gr2nqJSzBrT0EG
	 gBbUM7aG6pOdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B616BC44503;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Wed, 08 Jul 2026 09:15:40 +0200
Subject: [PATCH RFC 4/6] arm64/efi: Honor EFI_MEMORY_ISA_MASK for
 Device-nGnRnE vs -nGnRE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-efi-psci-v1-4-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
In-Reply-To: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
 asahi@lists.linux.dev, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=/ejZ9kEPzd3EuCno7ps+9xBx6LGHpjeL3VowrnL2/78=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ5bvT20VobN/mkSjXybcUAyb9+Z88s/JF8WfOJrfK1Ge9
 T/5kZhWRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiR68wMsw/Pqu0ZI/KjOyn
 DLbql2JYL5V908i9WRd1+mWnzWJHcUlGhqttB8R9OEyec165K7C9z9xZ4uftR93tR4XKbs1h4mX
 6wQ4A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

On Apple Silicon, access to MMIO requires Device-nGnRnE while Device-nGnRE
results in SErrors. UEFI defines the EFI_MEMORY_ISA_MASK for cases like
that which just contains the MAIR attribute bits. We cannot support any
other Device- types without changing MAIR so just warn and fall back to
the previous default, Device-nGnRE, if we encounter anything else.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/kernel/efi.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index e40885567f9e..50ba8e9112fc 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2013, 2014 Linaro Ltd.
  */
 
+#include <linux/bitfield.h>
 #include <linux/efi.h>
 #include <linux/init.h>
 #include <linux/kmemleak.h>
@@ -16,6 +17,7 @@
 
 #include <asm/efi.h>
 #include <asm/stacktrace.h>
+#include <asm/sysreg.h>
 #include <asm/vmap_stack.h>
 
 
@@ -38,7 +40,27 @@ static __init ptval_t create_mapping_protection(efi_memory_desc_t *md)
 	u32 type = md->type;
 
 	if (type == EFI_MEMORY_MAPPED_IO) {
-		pgprot_t prot = __pgprot(PROT_DEVICE_nGnRE);
+		pgprot_t prot;
+
+		if (attr & EFI_MEMORY_ISA_VALID) {
+			u8 mair = FIELD_GET(EFI_MEMORY_ISA_MASK, attr);
+
+			switch (mair) {
+			case MAIR_ATTR_DEVICE_nGnRnE:
+				prot = __pgprot(PROT_DEVICE_nGnRnE);
+				break;
+			case MAIR_ATTR_DEVICE_nGnRE:
+				prot = __pgprot(PROT_DEVICE_nGnRE);
+				break;
+			default:
+				prot = __pgprot(PROT_DEVICE_nGnRE);
+				pr_warn("unsupported MAIR attribute %#x for EFI MMIO region at 0x%llx, using Device-nGnRE\n",
+					mair, md->phys_addr);
+				break;
+			}
+		} else {
+			prot = __pgprot(PROT_DEVICE_nGnRE);
+		}
 
 		if (arm64_is_protected_mmio(md->phys_addr,
 					    md->num_pages << EFI_PAGE_SHIFT))

-- 
2.55.0



