Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614EDE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63Dz4jjbRwX5CQLNLC40wvOTv92feQluubf1HWJS80s=; b=GfaNhrVy4msNSwzEt/mWp46wpK
	CNwYGVNUc4zs4tfWMj4aeiriwfLrz4X53nwzXk/puTXR0b61aUInMKqAmmiRxKF90Sw/CS6dhVSvl
	LVgeQi06FKzqzROq0YRfMqIiL6TIBb4CvaGpSdjgc+FgkbWOMNajkXN0mVOSlC9Y6D19b8irDVqY+
	5zT3FZlnpJUo0fqZXRW49MGgOnp+me3PYUvoB/R2lJYrN87mRXgDvBF/oEzSHKK3DDwiLMA5FYQnq
	B88ISAiqCqk+IvpLKsPKyYRoAhz0DvdvWojR2/iqV2iLxP6XA3UjVYfBmULtyGCBrtyJDqYJ4JW58
	aFJjPrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrFr-0000000Czc4-2jQW;
	Wed, 04 Dec 2024 15:25:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrCu-0000000CysS-3FnR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D22C5C5649;
	Wed,  4 Dec 2024 15:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B18C4CED2;
	Wed,  4 Dec 2024 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733325748;
	bh=fwkQ2FXE6pq57Zq+2np3KAdjth1F3BAf6kMutQobcPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=epS7muEeP9lQIxwVtpBOEZfTUD0dsC90heQReQpjO5hSMDjQjehvJiOWNMEt5EZyV
	 Qzd1J2/mQ9EsWaCv7SFchHqtBbmUlRZ2c0o4hSqohK7YgGEjJ86kAqC35Stjhmxuwi
	 xIGiafCiyU6PJ/8ytGtdm5v64UKhjDqweVbn+3j2/ZCNwPM+miTwgqM5jUTOq1yBVD
	 bs5kHwXSsZKZEx70b4p0EUneQwhGzEDx4v48roXtTQ2SrGYp/W/DgsD+ZOKUmMFXsW
	 jHwnlx9WcXcLg6psEzSmW5j89JD3B+fyoO/xkl1vl+Aep0W5R3ksHMHKQ9FyvxT4T8
	 P2+F7BSdD6K3Q==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Dec 2024 15:20:50 +0000
Subject: [PATCH v2 2/6] arm64/fp: Don't corrupt FPMR when streaming mode
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-arm64-sme-reenable-v2-2-bae87728251d@kernel.org>
References: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
In-Reply-To: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Martin <Dave.Martin@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fwkQ2FXE6pq57Zq+2np3KAdjth1F3BAf6kMutQobcPY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnUHOpaUAs0CFqi8g5AEDwSl46+wYe2DIE2hvmh1nQ
 7ZNS+yOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1BzqQAKCRAk1otyXVSH0Hn0B/
 9VJPrFKOwDan2vT7C2sJe2gkAlzuDlnRvwYUVmOmEC+hyjxz0oxkJ72W+vZD/3ARoKBOO2aJyXtkFg
 X/4cmj2Y7cBdf9sPaTiqHG5lCSKOwptrpInRbgvIviUQqiTsMvY5G2i1c5jDCFu/30qASLdspMVGzF
 YSRBEdob0x1qVbfN5V5sytxnsV/txBc3wzGywRnNjwc9hGdEv3EOKAYhqyKBk3lorL7GpDsX2eTSbb
 w73NyNm5JxQLhQiKQTUXYVsNzaOni64A45ufDLjOfrmA1mYyJVmH6OiHnoFOLqqt6f5z/I+DhKk0YB
 pZVdXllCnDoQZM2Oz5zWMzAyJFHuBT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_072228_853325_40D6CF13 
X-CRM114-Status: GOOD (  12.01  )
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

When we enter or exit streaming more FPMR is reset to 0.  This means
that when restoring the floating point state from memory we need to
restore FPMR after we restore SVCR, otherwise if we are entering or
exiting streaming mode as part of loading the new state the value of
FPMR will be corrupted.

Fixes: 203f2b95a882 ("arm64/fpsimd: Support FEAT_FPMR")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index eca0b6a2fc6fa25d8c850a5b9e109b4d58809f54..a3bb17c88942eba031d26e9f75ad46f37b6dc621 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -359,9 +359,6 @@ static void task_fpsimd_load(void)
 	WARN_ON(preemptible());
 	WARN_ON(test_thread_flag(TIF_KERNEL_FPSTATE));
 
-	if (system_supports_fpmr())
-		write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
-
 	if (system_supports_sve() || system_supports_sme()) {
 		switch (current->thread.fp_type) {
 		case FP_STATE_FPSIMD:
@@ -413,6 +410,9 @@ static void task_fpsimd_load(void)
 			restore_ffr = system_supports_fa64();
 	}
 
+	if (system_supports_fpmr())
+		write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
+
 	if (restore_sve_regs) {
 		WARN_ON_ONCE(current->thread.fp_type != FP_STATE_SVE);
 		sve_load_state(sve_pffr(&current->thread),

-- 
2.39.5


