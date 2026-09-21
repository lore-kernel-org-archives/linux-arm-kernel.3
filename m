Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329F6C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GFSIsMQcKZfV6HFvSNGKjPObHTYhy+3ZyOIcsVhIHz8=; b=aTsFepJjG8kyIyYaFq5n+4E55W
	Igjf1NoDk8dyzeFUhZaTeoYpblLqeEQVLVgip9n6r+S0+qh9tz9pp6Ho1DhnCB/yHvPVsy6gWDH2t
	44S/mAA51VE73MEry39U5ou+yGYYHlvIf833w7Y/o6hG+SUJ5wNgHDvbOhKAnc4Q7Z17fCiqYPOCT
	ZUwqYHwCXuRcosKCOshWg2ZCtGdI66ZnGHNXUbpKlsW+DJ7ov4zm5PZXTJ6qTWbLXsclc9neAymar
	Fmli3ejs2ZejdNldFWCrxlZYFDqkt9y/OSu9xiOxdef7ExTxktiS5VljBLAulaIxkv6FLMIym4UzX
	bopCsNWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aDL-00000001UQn-2Lbk;
	Mon, 21 Sep 2026 09:21:31 +0000
Received: from mail-8141.vip.126.com ([60.191.81.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aDI-00000001UPU-3RG5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GFSIsMQcKZfV6HFvSNGKjPObHTYhy+3ZyOIcsVhIHz8=;
	b=lW8SsG4/82mGFu85K2dkdcA9wXqw5hVQbf2hwEuT1nnrj7SVa/24nyljLpNw/z
	yE3LcRMshosKcDPmOxoLfQ8c6LpYtt0zKhUEnBeO+qdi+CuZjvdVHH2VrFIPDBWd
	MHFkQ5u9Gf6mORiYZveMClE20sbL/F/Z1Sbo7SXANK334=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDXpxjk9rBq1NUKAg--.36668S2;
	Mon, 21 Sep 2026 17:20:37 +0800 (CST)
Date: Mon, 21 Sep 2026 17:20:34 +0800
From: Hao Zhang <hao_zhang_kdev@163.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: pvtime: Don't lose stolen time on failed
 updates
Message-ID: <arD24ru13owcE1Ms@192.168.1.215>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CM-TRANSID: PCgvCgDXpxjk9rBq1NUKAg--.36668S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4fuF1rAFWxXr47KF4DJwb_yoW8tw18pr
	ZakrWqgw1xK3yIqw4UKrn5Xw45uayqyr1YqryxGF4Ikr4Yqws3Jr4FgFyUuF43Zr9avayk
	XF1FyFy7ur1qy3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUl1kUUUUU=
X-Originating-IP: [240e:380:920:8000:415e:fb59:2223:6c2e]
X-CM-SenderInfo: pkdrs65kdqwshngh4qqrwthudrp/xtbC+QW9sGqw9uUi9QAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_022129_108712_BF110CA0 
X-CRM114-Status: GOOD (  12.31  )
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

From: Hao Zhang <zhanghao1@kylinos.cn>

kvm_update_stolen_time() advances last_steal before checking whether
kvm_put_guest() successfully writes the updated value to guest memory.

If the write fails, the updated stolen time is not visible to the guest,
but the corresponding run delay has already been consumed from KVM's
accounting state.  A later successful update therefore starts from the
advanced last_steal value and permanently loses that interval.

Stolen-time updates are best-effort, but a failed update must not
consume accounting state.  Otherwise, a transient write failure turns
into a permanent loss even if a later update succeeds.

Read the current run delay into a local variable and update last_steal
only after kvm_put_guest() succeeds.  This leaves the unreported delay
pending so that a later update can account for it.

Fixes: 53f985584e3c ("KVM: arm64: pvtime: Fix stolen time accounting across migration")
Signed-off-by: Hao Zhang <zhanghao1@kylinos.cn>
---
 arch/arm64/kvm/pvtime.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pvtime.c b/arch/arm64/kvm/pvtime.c
index 4ceabaa4c30b..9b4f0645d92b 100644
--- a/arch/arm64/kvm/pvtime.c
+++ b/arch/arm64/kvm/pvtime.c
@@ -17,6 +17,7 @@ void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
 	u64 last_steal = vcpu->arch.steal.last_steal;
 	u64 offset = offsetof(struct pvclock_vcpu_stolen_time, stolen_time);
 	u64 steal = 0;
+	u64 run_delay;
 	int idx;
 
 	if (base == INVALID_GPA)
@@ -25,9 +26,10 @@ void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
 	idx = srcu_read_lock(&kvm->srcu);
 	if (!kvm_get_guest(kvm, base + offset, steal)) {
 		steal = le64_to_cpu(steal);
-		vcpu->arch.steal.last_steal = READ_ONCE(current->sched_info.run_delay);
-		steal += vcpu->arch.steal.last_steal - last_steal;
-		kvm_put_guest(kvm, base + offset, cpu_to_le64(steal));
+		run_delay = READ_ONCE(current->sched_info.run_delay);
+		steal += run_delay - last_steal;
+		if (!kvm_put_guest(kvm, base + offset, cpu_to_le64(steal)))
+			vcpu->arch.steal.last_steal = run_delay;
 	}
 	srcu_read_unlock(&kvm->srcu, idx);
 }

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.15.0


