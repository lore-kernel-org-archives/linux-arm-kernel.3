Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B018CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:Date:Subject:
	In-Reply-To:Message-Id:Content-Type:References:Content-Transfer-Encoding:From
	:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCo5NPKaCfP7g9DBT1HMo+1v4Rsy+b8BT+qecwvrSuI=; b=O+FWhZlfmUDT/L6bu+THOPRrWW
	XO5ZOAnADooQYGewU07gKtD+FPRaYXxVIlw9bJ8BjTsUO0vfpSYNcqZ/8iGAKWABTwy1RIQY3ZMG0
	7gIu9NoUc8bfwx3REGMWUpx8pZy36bGDYdUtnTrq/63zwwhnzqzVQBTafRmrSXVSYAAZVZ4oBY6l3
	SJ088Ml5L3HYtFOTfIEzp7qtvfSq3QgzMGXqslnaZ0HhpoHlUlZ72ZE8d1daEtRQfTr6s0zS//Dd/
	XbV6X1uryda4jICgatkjJPOp6n3e0mmKBTiSHIKAJm10oR87eChfa4e4CSkIev5kC0A40hzcFuzUw
	r/nYMEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSkE-00000007hgp-3mkK;
	Sat, 10 Oct 2026 08:47:54 +0000
Received: from va-2-111.ptr.blmpb.com ([209.127.231.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSkC-00000007hfg-2Bjt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 08:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791622067; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=WCo5NPKaCfP7g9DBT1HMo+1v4Rsy+b8BT+qecwvrSuI=;
 b=Dz7OK+FCLL3nAY72Q7e5wpk5GDDSYjdAeUUorkpN8Q6UtoUx8jRFpV+EBhEOfGVRqTeq0T
 fSJEcf7hZWP3wtCSRs4tJUyLIsWL4S/8nrW5GfD8T4mG/FX7Yq4qCO3k8Q/l6B1c2/zD5C
 YEZv6vuZfIGOOm4Lbwv5y0LObz4SkI5p2q+5OzZgyN/EiAzyICNgpxHi6pVOAiMPgnqN4b
 GmHqMmt0Vc3jy9OEsmzooe1WzbOPFA2P/DEuHW4NIZgbdMrYBn0qgnW9B/2GxoYN0J1e8B
 I+teL+8sgVCXDzk2qmvLwJ1p/yzXTvDQf9k+HyU8BFPfAF+IdECqcjE+rh5T6Q==
To: <catalin.marinas@arm.com>, <will@kernel.org>
Cc: <mark.rutland@arm.com>, <ardb@kernel.org>, <song@kernel.org>, 
	<dylanbhatch@google.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>, 
	<stable@vger.kernel.org>
From: "Rui Qi" <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26ac9fbb1+067fce+lists.infradead.org+qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Original-From: Rui Qi <qirui.001@bytedance.com>
References: <20261010084721.2197683-1-qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <20261010084721.2197683-2-qirui.001@bytedance.com>
In-Reply-To: <20261010084721.2197683-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
Subject: [PATCH 1/3] arm64/module: Fix big-endian breakage in late data relocations
Date: Sat, 10 Oct 2026 16:47:19 +0800
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_014752_651512_D9F89366 
X-CRM114-Status: GOOD (  12.64  )
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

The WRITE_PLACE macro declares its temporary value with the type of the
source argument:

    __typeof__(val) __val = (val);

For the 16-bit and 32-bit data relocations in reloc_data(), val is the
s64 result of do_reloc(), so __val is an 8-byte integer.  When the
module is already loaded (state != MODULE_STATE_UNFORMED), the macro
hands the address of __val to aarch64_insn_copy() and asks it to copy
only sizeof(*place) -- 2 or 4 -- bytes.

aarch64_insn_copy() performs a raw byte copy with no endian conversion.
On a big-endian kernel the most significant bytes of the s64 sit at the
lowest address, so copying only the first 2/4 bytes grabs the
sign-extension upper half instead of the computed relocation value,
corrupting the patched location.  The UNFORMED direct-assignment path
is unaffected because the compiler narrows the s64 to the destination
type.

Type the temporary after the destination element instead.

Fixes: 91b89a634487d5614e51ee773a889ed57f5551ca ("arm64/module: Use text-poke API for late relocations.")
Cc: stable@vger.kernel.org
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/arm64/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 24adb581af0e..0fdf4c1c4e05 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -50,7 +50,7 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
 }
 
 #define WRITE_PLACE(place, val, mod) do {				\
-	__typeof__(val) __val = (val);					\
+	__typeof__(*place) __val = (val);					\
 									\
 	if (mod->state == MODULE_STATE_UNFORMED)			\
 		*(place) = __val;					\
-- 
2.20.1

