Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62065CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 04:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rgj00ZQJ6YXpmj/Fkl8OSXbBHLLgoWXgDDmBKRr58+k=; b=aqjvS2rXuBs/W/EaUkxbAFHdnM
	lNGm6Wlr5Bv7xfXziPxoHJ46hKQ1N6b6h6S5XOEotoKUnDGmz8NjKdHVYH4yhG83nxiFqLNnRC585
	Buunee6Gqzt44l+IFgEAyEikIDJPg4VbXv2WUNFE3PLWj46TiBPduhtbtstRgLtRL9MnrWuDZ8DnS
	MvGbie+Elax2e7BVCbaCtSacAJh8r4qoD9uN1j/WtTBU6mgLfibqRjAvbDy0ge+zaHt3ek3BlxB7y
	0++BuSLi57YnrmfkgImgoRTEI2l/B0SPkcfb1Sl8vi14j+rczXoDhrVsSN9iKlsJpdcMdBY7gr7Ws
	1+t3IYjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uukGo-00000006VRC-1Bop;
	Sat, 06 Sep 2025 04:11:22 +0000
Received: from p-west1-cluster1-host3-snip4-10.eps.apple.com ([57.103.64.113] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uukE0-00000006Uyd-0HhQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 04:08:29 +0000
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-10-percent-0 (Postfix) with ESMTPS id 59B9E180011B;
	Sat,  6 Sep 2025 04:08:23 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sswd.pw; s=sig1; bh=Rgj00ZQJ6YXpmj/Fkl8OSXbBHLLgoWXgDDmBKRr58+k=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=qMKSDCw1cdIj3DK2yvZ++TbDoBlx8E+r7bG3YQzzyzKEMXHV0lqNhfDmgasQIh2b5q814XJWqVgNnlADr7tlTho3V3ihCmkLNpl63m0TP9SeePSEu6HgG3BI9eJWvzDjhv5GAPnFMbR7Zqy8iBObZynQ57h9Z2yAFtlBiCPylfCWNpGBShN/yyYIPy8YdrjDXLld9AtzjyORftHYnTVJX5C1sZDWPkqicvfpxjVhB1oiCfA5TeMBzkuF+u+K/WIQTXbmvP9RyK6+n4LijaWMM7PWIXJ8aC468RyDUs4FSKlxYpP0BWaGmzfdq6OPNN85J9oAyAEhI8y5qABQeGYUTw==
mail-alias-created-date: 1750314795890
Received: from localhost.localdomain (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-10-percent-0 (Postfix) with ESMTPSA id A7B551800102;
	Sat,  6 Sep 2025 04:08:20 +0000 (UTC)
From: p@sswd.pw
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Dongha Lee <p@sswd.pw>
Subject: [PATCH v3] KVM: arm64: nv: Fix incorrect VNCR invalidation range calculation
Date: Sat,  6 Sep 2025 13:07:24 +0900
Message-ID: <20250906040724.72960-1-p@sswd.pw>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CqaMxTFjajy8dA-UyRm0ZEXba6kx_oHN
X-Proofpoint-GUID: CqaMxTFjajy8dA-UyRm0ZEXba6kx_oHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNCBTYWx0ZWRfX9PZK9Wz6rt0n
 CE09kUIpMHLBa7OozCr9w46ADwN5eDD3MC05FwNijOOzeqch9TcEd1ryPhDeZ3STgZwdArsVIE+
 i7V9VaZ+1xet7G3gfR4t4J6RKM+GZTrv7BjkynuvbG6waWsaN5Kxrh2xHXo13cwjAfeBm2+HX1Q
 OUhb4J+WUlcTpObtt+c1cp8GhING1FpbvIkR78VChyeQrqsrKPDn6kGgPl+dvPGShIGAy56yD/L
 lDPrlHrRlQw1QCMGAUYaE0+4mMoiTRl6pJsFsm/X9EDiu3sTbZ5YgUMhPvh4+VcMMJc8KYSD8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_09,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 clxscore=1030 spamscore=0 adultscore=0 mlxlogscore=950
 suspectscore=0 phishscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2509060034
X-JNJ: AAAAAAAByC4YvtSmVYqoO4If7rP+IrxCnQ7wtVXyGE65JkouCZYcHsuqwvg2gFZBkntax+8sgc45lKq7V+tQv7+SMx02IVytv3h4/O7jm0b3oM0SX0hhiC4/M5BO2rCX2VIv89Z6CPeINH5V+iub+mnauRU1Y5p96dWh5vdKW1Jhqx98lEJinxs7j6jqosgNFonmAQQMfq0s/EfpGa29I9xEtXw+d2b2QMIW602T8y8sijbvRwlrI+eL9sZiHDIGEt7iLrr6obY2dpNMvYl5Oy/jfeKRJYR1B5tCMZw2T55sKSzJLHU5lmCkiNX/LB32/8a35gP1L+A1vg5qlIE4ZalqILtSR9YAJ2CoX7yFv4bva5BbdwLlIovFiq82rJCt6Ig68wdDa0nxROeq2PCSJ4l+c9b208YkOrKXb78Aog3UdcjJn9fyEnDyzL9I+V0G4EWsGGTpYFGgdKyRBlbyNj4bx5XB3ZqhjtnAIkhzOH0H4zXB5qvzkzDeTA0zcB876crugnlEtZ9VlOliULiWT9N+wbADtmk/n8JLVzEZN7kqKN2BE+a8+TDX5+vRx569oW9DIwFvIbzOsQpeVvyfWpnt8HAwMMzsj7oBJirrVzBOet7Ux0hI8VS8KQiA7JSwxC9Tt9wrcuuTqTTbVmm64S879DZ93NEN2WSRUvDvgs+VBvyY6b8KoE2Um3wLkWI1rQtRrMcTJ3M71Iky/tatX4s1AcKrjsM7HonhQE4Lwg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_210828_414161_F1650A04 
X-CRM114-Status: GOOD (  11.63  )
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

From: Dongha Lee <p@sswd.pw>

The code for invalidating VNCR entries in both kvm_invalidate_vncr_ipa()
and invalidate_vncr_va() incorrectly uses a bitwise AND with `(size - 1)`
instead of `~(size - 1)` to align the start address. This results
in masking the address bits instead of aligning them down to the start
of the block.

This bug may cause stale VNCR TLB entries to remain valid even after a
TLBI or MMU notifier, leading to incorrect memory translation and
unexpected guest behavior.

Credit
Team 0xB6 in bob14:
DongHa Lee (@GAP-dev)
Gyujeong Jin (@gyutrange)
Daehyeon Ko (@4ncienth)
Geonha Lee (@leegn4a)
Hyungyu Oh (@ohhyungyu)
Jaewon Yang (@R4mbb)

Link: https://lore.kernel.org/r/20250903123949.24858-1-p@sswd.pw
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Dongha Lee <p@sswd.pw>
---
 arch/arm64/kvm/nested.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 77db81bae86f..d0ddce877b5d 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -847,7 +847,7 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
 
 		ipa_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
 							    vt->wr.level));
-		ipa_start = vt->wr.pa & (ipa_size - 1);
+		ipa_start = vt->wr.pa & ~(ipa_size - 1);
 		ipa_end = ipa_start + ipa_size;
 
 		if (ipa_end <= start || ipa_start >= end)
@@ -887,7 +887,7 @@ static void invalidate_vncr_va(struct kvm *kvm,
 
 		va_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
 							   vt->wr.level));
-		va_start = vt->gva & (va_size - 1);
+		va_start = vt->gva & ~(va_size - 1);
 		va_end = va_start + va_size;
 
 		switch (scope->type) {
-- 
2.43.0


