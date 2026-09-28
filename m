Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CA0CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zF/6IC2SeTU0B+urJcyGkGRcEXYtJz+si/MBYr/+z8=; b=IqDNejN73hiJbm
	Q2f9+MgUnEtRuScS30BT5yD4H8kkp64C/5rhJ7yofr95Leidu5Vrt7WhxZy4pdpzEbtiZppw3uNCn
	n2FQeeZUVKUmZiaYol1gb1ootVLYLk3sGBptU/yGcV5PqVEfOU/1LglgI//brzTxw5P3BOsZgestO
	SWZPj8H4fXBhJBSG0McwJrUP5ylJrHJ60kS8DVftlvvghNJ6jgWn+x6YO4VXj2MLgwEYDNqpF9hZp
	0XMjrvTPiDJoFLWOCQOBnTZ7ue+lB/N2LGjy6gxBEwcbRK4P6AxbHAS++JsOLkHiOZ0I5JRP8riRJ
	Jl7MwW9OJZp6UJbPU+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRc-00000000eTz-04zz;
	Mon, 28 Sep 2026 13:31:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRS-00000000ePv-09nU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:30:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B7FE1A00;
	Mon, 28 Sep 2026 06:30:45 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.11.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 43D363F763;
	Mon, 28 Sep 2026 06:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790602248; bh=OMzQs4eE/eN8dgFJJ2DYLmpNckox+5PSpOyWyPfAh30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bp8ILJnSaqpAQHgEFocnS1F7jVveZyZbj7nFatRY8Tvjv2FFj5yuDaSKM3ybF+Uxr
	 BpsAs3mEvTd4udzFBXMgN0HXMXiAC+zQYtB4zFzecdvFPP8W/F+v+EcVZ1o7PN1TNp
	 MThlki3DSE3O8jiSPBIgbFFLyhg2L/J24v3AO10g=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/6] arm64: insn: remove deprecated memory barrier types
Date: Mon, 28 Sep 2026 14:30:29 +0100
Message-ID: <20260928133034.243541-2-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928133034.243541-1-ada.coupriediaz@arm.com>
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_063050_114728_85369833 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Oliver Upton <oupton@kernel.org>, James Morse <james.morse@arm.com>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Lucas Wei <lucaswei@google.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Arm ARM DDI 0487 version M.c[0] deprecated a number of types
used as options for the DMB and DSB instructions, with no change
in behaviour.
The deprecated types are not used in the kernel, so remove them
from our instruction generation framework and add the missing
`AARCH64_INSN_MB_OSH` case in `__get_barrier_crm_val()`.

This simplifies the switch-case and now covers all the enum types,
which allows for making the DSB and DMB generation non instrumentable
in a follow-up commit.

[0]: https://support.arm.com/documentation/ddi0487/mc/
     (See C6.2.150, C6.2.152)

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h |  6 ------
 arch/arm64/lib/insn.c         | 10 ++--------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 1ce75a4426387..8ec9d86cc575c 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -302,14 +302,8 @@ enum aarch64_insn_mb_type {
 	AARCH64_INSN_MB_ST,
 	AARCH64_INSN_MB_LD,
 	AARCH64_INSN_MB_ISH,
-	AARCH64_INSN_MB_ISHST,
-	AARCH64_INSN_MB_ISHLD,
 	AARCH64_INSN_MB_NSH,
-	AARCH64_INSN_MB_NSHST,
-	AARCH64_INSN_MB_NSHLD,
 	AARCH64_INSN_MB_OSH,
-	AARCH64_INSN_MB_OSHST,
-	AARCH64_INSN_MB_OSHLD,
 };
 
 #define	__AARCH64_INSN_FUNCS(abbr, mask, val)				\
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index e70ac02385153..c70820d65805f 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -1572,16 +1572,10 @@ static u32 __get_barrier_crm_val(enum aarch64_insn_mb_type type)
 		return 0xd;
 	case AARCH64_INSN_MB_ISH:
 		return 0xb;
-	case AARCH64_INSN_MB_ISHST:
-		return 0xa;
-	case AARCH64_INSN_MB_ISHLD:
-		return 0x9;
 	case AARCH64_INSN_MB_NSH:
 		return 0x7;
-	case AARCH64_INSN_MB_NSHST:
-		return 0x6;
-	case AARCH64_INSN_MB_NSHLD:
-		return 0x5;
+	case AARCH64_INSN_MB_OSH:
+		return 0x3;
 	default:
 		pr_err("%s: unknown barrier type %d\n", __func__, type);
 		return AARCH64_BREAK_FAULT;
-- 
2.43.0


