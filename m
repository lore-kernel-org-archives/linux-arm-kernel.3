Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23BFD149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 19:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvBdGV/fEuM1t1ncHOm4+9FLFUwv2pJggZf0gOiw5tU=; b=tA66XIxm0GUSiJR7OpabDhwW/+
	J35Wqby+Km8hnl3p7TUcLSr/ZOVav/gC4JyY8kZluyHPR7hJ3gLAC7mvMSqPIxzaass34BIb6RkXx
	GQTUSgp38GxBFKpVpM9FM8AzEp5AC2cAIwyT++88jWWEllBLmgcBQzGoBTsUSaNqNGPcob24awZ0y
	Nc947gYYcFacvANa6Rbc3zwtGk748lEgU3OZqS5KYJBJXASEBZBoS8ZwqKz+BRSqabKVpKJeJBR8X
	mPSlp/vsdFrls17n1tN6KIwdkM1jBmyrsNQH/eApqFwMyDs6rL59by/qg4JW8zMuM57ZX1EUfS6K7
	njW6QONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Pf0-00000004tgD-3lX0;
	Fri, 25 Oct 2024 19:07:46 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oyv-00000004moI-1eiB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WvBdGV/fEuM1t1ncHOm4+9FLFUwv2pJggZf0gOiw5tU=;
	b=n7nmhSXYNWWwPRgwzEdAF6dz9klA0M5XAE3gthqTLWz1eb3m758VfO+i4G0qjXjatishgW
	luSdCFMukzAqipU76CQu054hbuPD4HAzci8qf8xhT34g5HUXaxv9vU+/dzJTlYu9wvTpih
	3bxhITS8dxoq/HJAGeW6WG8tbdaiV94=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v4 04/18] arm64: sysreg: Add new definitions for ID_AA64DFR0_EL1
Date: Fri, 25 Oct 2024 18:23:39 +0000
Message-ID: <20241025182354.3364124-5-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112417_599665_F3A998AC 
X-CRM114-Status: UNSURE (   6.49  )
X-CRM114-Notice: Please train this message.
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

Align the field definitions w/ DDI0601 2024-09 and opportunistically
declare MTPMU as a signed field.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/tools/sysreg | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 7061cf2d8444..e5d2c25fe463 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1200,7 +1200,7 @@ UnsignedEnum	55:52	BRBE
 	0b0001	IMP
 	0b0010	BRBE_V1P1
 EndEnum
-Enum	51:48	MTPMU
+SignedEnum	51:48	MTPMU
 	0b0000	NI_IMPDEF
 	0b0001	IMP
 	0b1111	NI
@@ -1208,6 +1208,7 @@ EndEnum
 UnsignedEnum	47:44	TraceBuffer
 	0b0000	NI
 	0b0001	IMP
+	0b0010	TRBE_V1P1
 EndEnum
 UnsignedEnum	43:40	TraceFilt
 	0b0000	NI
@@ -1224,11 +1225,18 @@ UnsignedEnum	35:32	PMSVer
 	0b0011	V1P2
 	0b0100	V1P3
 	0b0101	V1P4
+	0b0110	V1P5
 EndEnum
 Field	31:28	CTX_CMPs
-Res0	27:24
+UnsignedEnum	27:24	SEBEP
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 Field	23:20	WRPs
-Res0	19:16
+UnsignedEnum	19:16	PMSS
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 Field	15:12	BRPs
 UnsignedEnum	11:8	PMUVer
 	0b0000	NI
@@ -1238,6 +1246,7 @@ UnsignedEnum	11:8	PMUVer
 	0b0110	V3P5
 	0b0111	V3P7
 	0b1000	V3P8
+	0b1001	V3P9
 	0b1111	IMP_DEF
 EndEnum
 UnsignedEnum	7:4	TraceVer
-- 
2.47.0.163.g1226f6d8fa-goog


