Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC45CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRhny657KMJ/3QUZUXW7phQNGZQNpkS3Ro94+dLb7OQ=; b=rxJcP5NTvvFSEcRd/DOO6zk1sc
	qySGzzad+8ccQg6Ny5MEFrjQc45Ta1vF6Q2Z6cK2aJInNz5WwUE9g2Omsc5sumx74onxP8hpTHRXK
	VZ7jpjwB1+JosFDRJEY0JpWcPgyShDfTsjvgwvSMuU4yfMnngRFc3mJGCcaSNfXlTXLq2Tt8pwJ+3
	x30Iccc1HhVR8+R4kR5z1l7ePrkpZ1ivpAa3QIMK/56DGmYSyrqct1bjPKcTn6S6C2/Y/GrzJUXnb
	GyOX/pXfPy/9V05oG7CLW7bAdMrkSRmjhvoyJp/vJMItBItYQtabhTXs7n1EGmFJzkOCAxlHUINWR
	Sv5oxhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTS1-00000000yaz-3yN4;
	Fri, 05 Sep 2025 10:13:50 +0000
Received: from p-west1-cluster2-host11-snip4-10.eps.apple.com ([57.103.64.161] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRtU-00000000OkV-2ayR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:34:06 +0000
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-10 (Postfix) with ESMTPS id 84E201800DFC;
	Fri,  5 Sep 2025 08:33:57 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sswd.pw; s=sig1; bh=VRhny657KMJ/3QUZUXW7phQNGZQNpkS3Ro94+dLb7OQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=CNbNI95hOX64j3G0lcHrSX8407b90+/hvNsndpSfbr4IYS6vWaqm2Q/Cv2wBJFCK+M1DFi8kK1imrKz4ornOqv8QQuUBTWA0QkFw9csaCpayeORo8MO+pg7vsb8IiKtrF1iYbS+xHjcE8lNrvTpiL4wHH92OPm8FsIjNcPi3L+a8jX6n1TIWxa3Pr6NBD1gLmlY9BRWA7c5DdEbu5AspvutIHBjW7zVfhLX3xRXda96F8d/mz9Jhi70oR11rIOQ+wUPpgXoXlBAGfHBS6iRTnF3UzGH28Pof3rL9NS3KvGW5Rvz0dMaIFsoKcjA8Af3vT/9g5nm36rPoO9O6k36U8w==
mail-alias-created-date: 1750314795890
Received: from localhost.localdomain (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-10 (Postfix) with ESMTPSA id 32DC71803289;
	Fri,  5 Sep 2025 08:33:55 +0000 (UTC)
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
	leedongha <p@sswd.pw>
Subject: [PATCH v2] KVM: arm64: nv: Fix incorrect VNCR invalidation range calculation
Date: Fri,  5 Sep 2025 17:30:08 +0900
Message-ID: <20250905083008.27725-1-p@sswd.pw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903123949.24858-1-p@sswd.pw>
References: <20250903123949.24858-1-p@sswd.pw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA4MyBTYWx0ZWRfX9RVHZxx6LYKK
 9w9osGC1Uq1aWvzJvDHg/bKp0TIWcK7e7U7hpuJFjJsgUmhbce3NHrzGFcGnTxYuN7HDqYIgB7A
 obE79Hf6U4DKQgjSa0Tn1S90jwvqBCK3BysDXSFz+sR1jOMZSKjMt35dqiBpDSuPoecD9zRlPak
 sSMIqRWNtp8F1GPzikTUTKlIaZVVFeOpuHp4Ew3smjm4WOv2x1Hs0bd5rSofUwZZljGzgTigiGt
 sccWvXNEYCU3lz9Ephh8wNq/CyEMt4c+j/BuQkh9dxGR6IBbUC1l0FGNg5NH1MPeOHGWhOwKo=
X-Proofpoint-GUID: mOuqhCCTYtsLmGtNq1ve75MeUh0jj3pX
X-Proofpoint-ORIG-GUID: mOuqhCCTYtsLmGtNq1ve75MeUh0jj3pX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 clxscore=1030 bulkscore=0
 mlxscore=0 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509050083
X-JNJ: AAAAAAABu5f+nQstViWEtN3TyFaRJ81iPoABm9wMibMo0BNrsfRxcOEwYI9ZXRkgNOtgIfcqug0Yt7QZqmwLNU9y0ux/w8EL42X9WyBs5Li0LOE2sp92LYi5TZ8se+w5Q4IEL39u4Ml3DAifchzhRiBCIxyBg9hHDjrQzgnahGJOFJMUq2M5bNJxT6QxjB8MzXyDho7o4rLT5ACXuDQQPLiP+/q8NPo1S8N7BuM3qHewyPHL7vBknFUWCcdGoNkreu9glYraDG1yvSuaPP9a5SKSDbJgbHUeX8f656WwdHtMOkmAeZmNZj67BiPP/Vh6frn3oxUrXHP9Z1ITMMm8TMJK6ezjUbKefIPmzDtHywmsuyCSghkTAxLmKU2xXUTQkP9L9NtWMDmEOjqwuv9lufo7tPoTQ18+JC+4B+nSQPpeUGAKp8VnA4v3nLzOIUplzL3vdo7cHQssaz6JgSVilb7JKgEzWOxEXcYB1syuI9CFM1Su0W/R4mqBfYcFn/OU4rpYQbx0KbYCSHjDazYt3D3JfiREKym+dYJozGptEfZiDXbVKnWOnOnJ0gTLOfMQ6qFErEvMDRxsESqjqRC22mYKojLZ0+g5N6K1YW+BAv0S585jrh3Q7R38NeD81+yzzQZCbswOt4XNXoZUDOPCGuPrNDOLKuK+bZESJr2ukQvuI5vVyZeI1UGZTc+yrZlx7HfpIlnhW6LXWDE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_013404_985152_68C279E0 
X-CRM114-Status: GOOD (  13.98  )
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

From: leedongha <p@sswd.pw>

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
Changes in v2:
- Match DCO with From: (p@sswd.pw)
- Use KVM: arm64: nv: prefix for clarity
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


