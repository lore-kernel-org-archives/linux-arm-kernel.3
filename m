Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C14CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1lkkQRCTGiBG6Fz5uRh6m6A6GAOwOb7hDHgz+EhABhk=; b=TzjBmVNSLqWghCLkppH+E9Q+2w
	WHwR7cau0SA9/q+qklU6NELLhLKy/uSflp6lQrNlgAOFxOk2wGALypxfceYYiNRobyZu6AcwrFgUm
	mOzaE8CPc+3vbeK2EbXpyCz8lK0IyFff93wtrwgJIhEU5ocW0fMI2TVpTesskEzzn8sI+ADZzoHc7
	4EXz2Ou/bktU19sYvmBNDjYEqEiFqU84DF+epL8nBBIL3aKhid0sxG9RbViFDxwXu+QAnn8/XjOjx
	2pN7Q9eO/Es9t486qCUyyUmvGF+KHsROOi55E7qElk9rqSdDI4yi2Q1k7PpERb8U9e1jBMPp2syS2
	f4U+gFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4MJ-0000000GV2h-0gWs;
	Thu, 04 Jun 2026 09:27:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4MH-0000000GV2X-0IAu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 09:27:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 34193601D6;
	Thu,  4 Jun 2026 09:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3C3F51F00893;
	Thu,  4 Jun 2026 09:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780565243;
	bh=1lkkQRCTGiBG6Fz5uRh6m6A6GAOwOb7hDHgz+EhABhk=;
	h=From:To:Cc:Subject:Date;
	b=dK7C5t8fUFl1dYz1idA8ezDuF1cexqTuuYvp2e7gpFoUCnDP940YEK8tVFUq1C+MD
	 OhW9nYCzc6lTg00C2jjyUbd4/2XsUTzFAtQ19gt+jG8fS/87YbIkwHJAVDucVHsjX5
	 fZIC4PR52EDt/AQ/tSKzK1leWMJzLvEHS2QrKdRVRtEFELBXv1FXnvzapobHEmhyqM
	 P8/bVHRUqUigrRbbH6LY4YDF/qntO+UU8GFja5fb0IMgoOSkiemQd07B/gw7ZMIeI4
	 q6iOCxqC4GfPt12Bc7UJOZB+pNeggy29riQl/EafxXOeMSc1eVzodrWBFqHaTRBK5d
	 /+DmZ7DloqlSw==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Fix order of arguments to ktime_get_snapshot_id()
Date: Thu,  4 Jun 2026 11:27:13 +0200
Message-ID: <20260604092714.1537457-2-ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=985; i=ukleinek@kernel.org; h=from:subject; bh=a+EzBhxFLZcl5XaOPYou8uHj+E5MMQ3LPc5OodWrA1s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqIUTyqWnHG6n29XEa0HB6eHFdz4FNbj3rk0UYC YtukttUeV+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaiFE8gAKCRCPgPtYfRL+ Tv71B/99vHoxi3OVHI5tDCWZUG76J4SS2Hm3CSyuYe9ONmf+ykLG3cP+aja/+KtkAWBDUON7K6O FvRBucRn5Kb7aA/VZJrrg7ATZKWR0DRPEyg9q1binLKm1kGb2HIbNK0AeIdguL0iPyOlc0xgdfd 00jiN5g8u8CVwffZ/Cy4l7TImfmQU4GHNJCLdt+a8AT9WxOsG6iWf57yX7JkFLLIBxfWe4kE4I6 T1u2yhrbKh1Mnl3+qI71xk9yLWRLrDOC1xLlkFWeHwiWoDxwT/jMo/St3qr2dTe0+27/lOEN7Q1 7l/Ux9rJHuycuV3c9Ism0mEg02p6HOEqhFSP47X1/PMIy76b
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
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

The first argument to ktime_get_snapshot_id() is the clock ID and the
second output parameter. Fix the caller that reversed the order and thus
fix a compiler error.

Fixes: d09439210441 ("KVM: arm64: Use ktime_get_snapshot_id() to retrieve CLOCK_BOOTTIME")
Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 arch/arm64/kvm/hyp_trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 8574db7491bc..2411b4c32932 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -118,7 +118,7 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
 		hyp_clock->running = false;
 	}
 
-	ktime_get_snapshot_id(&snap, CLOCK_BOOTTIME);
+	ktime_get_snapshot_id(CLOCK_BOOTTIME, &snap);
 
 	hyp_clock->boot = ktime_to_ns(snap.systime);
 	hyp_clock->cycles = snap.cycles;

base-commit: d09439210441efbadd8b0aa32c1ddb1eab2f3abd
-- 
2.47.3


