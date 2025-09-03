Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A8BCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zkbWduFk8ozX1oSl6OLe8t0wpi3qXVuq+LzyBUgCb+M=; b=XYgDy54S+ZvwLsd0TlEvY8mkJD
	WYx0PS2eAA+RDBXVWU6pqoFiElvWzUb6LHPMwKNEvI1vQPZLyK2MWlewkyaCzVA+1U/j2TqP1DTSQ
	2oFXR8Nl9ca8HY+ulW6gCkAQ2Hj/dttWN1DDfFIbRFHRpAM5oXbpcB1eS+qmxSDWIap6XpXf+GHj5
	gt7Ow/TCRQgI7AVi1ftdiEk/uIVllVVK16qeGoUkzH5kuV8A+C5DkPHlgWsoU1v6Oq2XHrW3yCXH4
	bmXMN2oKjjn2EgEDXdT4UiEjtS7dCyxKFOIKVkiPFvzF0B49pSegY1aUV7ZZ/AZKLi7z/ELMYoAdI
	VyMcYtag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomt-00000006m1f-0hjz;
	Wed, 03 Sep 2025 14:48:39 +0000
Received: from p-west1-cluster6-host12-snip4-1.eps.apple.com ([57.103.67.14] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmmv-00000006QHu-4B6y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:40:35 +0000
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-11 (Postfix) with ESMTPS id 7A5251800858;
	Wed,  3 Sep 2025 12:40:22 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sswd.pw; s=sig1; bh=zkbWduFk8ozX1oSl6OLe8t0wpi3qXVuq+LzyBUgCb+M=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=hcZ7S69pM88GpDkrUueb4EjUWG2tS5fu9VVySXomdVU9A3aTlATcEqPOmESn8ka+pbfk3cmVL0qSOOMjy+58IOAtylQ280ZLfQegkoRKsDHcLTreCMPiM4t+EvfL60TFNd/4KDeSoi4OYEidW3I07BIVrvMyyLVMCq60ePslX1hvPPJE8WU4Mb+ZUYP4ZGKxZd7pvqUkZ2RZ512y943c27Mlg6i338FCRr25/cBJnjclVkeebS/c90tA96SKdKTYx8UWigIAht10HXT8xQCG12jhCx5ZDeSId4aQfCK7xVu8wPj77L0kaDt+dF0FPPEUwoY6VnJrblnUhlekHm27HQ==
mail-alias-created-date: 1750314795890
Received: from localhost.localdomain (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-11 (Postfix) with ESMTPSA id 2854E180016F;
	Wed,  3 Sep 2025 12:40:20 +0000 (UTC)
From: p@sswd.pw
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	leedongha <gapdev2004@gmail.com>
Subject: [PATCH] arm64: kvm: Fix incorrect VNCR invalidation range calculation
Date: Wed,  3 Sep 2025 21:39:49 +0900
Message-ID: <20250903123949.24858-1-p@sswd.pw>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CsZx7LOoZ-aqYzrD7XXVTM3fT-9sCVi2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDEyNyBTYWx0ZWRfXzCI9zaT0AJ/I
 sWLbJg8s9vK+GTv/4HxVPukUvphLoRmoFeI+kfZn2/6T7ee1ch2ie618ghhiZv0RQZL3HJk+JoT
 SbLtxnRI/euUyL8UlwXX/uN21I3gotcU99k9TqDjACERoA4/njX4whFL4yEbtVkVaf9SQ0lgTpA
 DiG9FGyE8NrZPwvsLbfxz/Toj8yxjm8wk61YKVzXK1084xzQr6gH2xQ/YmDK1dZaABn3VzezigA
 0TJ/xJoEApddQbNHRWulAzZEtixtUNnsIY/xSijKaq2ScMKtDSelu2bkjVyAMhkg/GCRT/OeE=
X-Proofpoint-GUID: CsZx7LOoZ-aqYzrD7XXVTM3fT-9sCVi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1030 mlxlogscore=955 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509030127
X-JNJ: AAAAAAABRuhrF1q2p1yBnvoa7/bmADHgJtUTVO9igOrLr4Pd5YRLRDm0Prs5q5ESz7qqchzNl1o+pcsImxY+l47ydiKWMCeotRdwZI3C8IRdQAGIMOMTVPV3lvjLPW3miwKpp/me9o5+BOzf+uGfX1mlQclc0t5/VvtxR4tYnWiaH5o6XTvflxSmt86v3tdDw74fG8zsJKoFOhmwvOuB2ZWW/0cPEPULE+54qyyQ1I28dydHJjxexnUlIjxROVPzQARlobCwX8zyzS0j06fy5eZ2afR0e9+CZoRLGGM3gyfCKHui77UuVKvKYOI/uAWqnib2TF/b0SkQnG2f5Y9Qg1O8hJC6OBsKVbQburFJSNDKuK9Riz8IkG8C696PVRS2e2yhXkJ+gI/ANNQ+EX4ONzfB2dUEa7zdrVb+01YZByesw/sGcSUViHiUvnko/O/qGn1BwnnHhaf9txXdMz6Q9UbXk4dbNXhsU/10MvhwRVWS9BvPQ98mx09KMzNQZM8oKBnN/Z+aFL923XloD5TmoZFgUdUDHYrJIHK0zfHVhvRRWVmjG9jWLSLlX1bIOrD0vq+EOU2+hi8zHiYY9HxFf2xiDNRM0t+KpULR41j5huyaQHiitd5KwW+uG+iSzGxG96PRr0tkqXI6CIJYzDis4m1zWkpc/Hijt7se4ERCcmTx5sawAEUmI39O8fkNbbAXrOC+FdCXfj2V4VbX/bIYSxft1gLHFm6a2Zn/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054034_374135_59D92CE0 
X-CRM114-Status: GOOD (  13.43  )
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

From: leedongha <gapdev2004@gmail.com>

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
Gyujeong Jin (@G1uN4sh)
Daehyeon Ko (@4ncienth)
Geonha Lee (@leegn4a)
Hyungyu Oh (@DQPC_lover)
Jaewon Yang (@R4mbb1)

Signed-off-by: leedongha <gapdev2004@gmail.com>
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


