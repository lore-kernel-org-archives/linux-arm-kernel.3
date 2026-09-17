Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A63FC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aW6omBPx2DgEVAeKB9wylBGo7vBPPHskEc2g29/KzWo=; b=E/DVEuAp6fZpkX4r5PtNZ0odFR
	ogn61JHbho46vXX/81cDe0xVeP07rKyf/8oGheMa0d/AbM7JP5Y+Mi4V9WGLeajjmm+r7dW/x+vc9
	YqunGUITnGb2iYobkIpTETYZcGQvUd8UbGY9peB6RSF08eL17ZTqyHvZkvPGE8TijwbYOVvv7OOa6
	sr1VIhYBgFyioa/CTj2Ng2b27utpIMcG3/GdwyISweY1UGN6OkYjDeHv5K9dLsDyPGZH0CCt01Lzh
	XVc29TbYBGdLL38c/wH+YG0BYWU8BhJO6YdRVqUR+ihAGxPP5Y/ZAlMkV7QRZQ3a4VuMEjwnbMK06
	KghCoWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EN9-0000000Bkrf-05XG;
	Thu, 17 Sep 2026 15:50:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EN3-0000000BkoQ-3uWy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:49:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBC221F02;
	Thu, 17 Sep 2026 08:49:53 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5B8D3F7B4;
	Thu, 17 Sep 2026 08:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789660197; bh=Lo6AV22VRneWsIefgdLEObQ+PyLMSU+PUdesn29k7vU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HqMQ7y1NjYYhNLV6P6MSdQ0gKeXAB3leFW40Y01KSRjD6ov9xcgPVxsdlzsUqmS/P
	 TooQLQJwZDxxFT6jvlRFOiyW0aUahgVayPy5Mq/YirIzLr4hbqPia4ydi7vvEyJ/DY
	 aN/vQEaDGYPwO5nCFB5enf8Js0PwQhL11rGtuE8k=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	kvm@vger.kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool 3/7] arm64: Free the temporary cpumask in vcpu_affinity_parser()
Date: Thu, 17 Sep 2026 16:49:28 +0100
Message-ID: <20260917154932.193943-4-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917154932.193943-1-alexandru.elisei@arm.com>
References: <20260917154932.193943-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084958_009792_0894A41B 
X-CRM114-Status: GOOD (  10.18  )
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

Free the local variable 'cpumask' when the function is successful.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm64/kvm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arm64/kvm.c b/arm64/kvm.c
index 5f3ed9f6d201..88b3622766bf 100644
--- a/arm64/kvm.c
+++ b/arm64/kvm.c
@@ -451,7 +451,8 @@ int vcpu_affinity_parser(const struct option *opt, const char *arg, int unset)
 	const char *cpulist = arg;
 	cpumask_t *cpumask;
 	size_t setsize;
-	int cpu, ret;
+	int ret = 0;
+	int cpu;
 
 	kvm->cfg.arch.vcpu_affinity = cpulist;
 
@@ -460,10 +461,8 @@ int vcpu_affinity_parser(const struct option *opt, const char *arg, int unset)
 		die_perror("calloc");
 
 	ret = cpulist_parse(cpulist, cpumask);
-	if (ret) {
-		free(cpumask);
-		return ret;
-	}
+	if (ret)
+		goto out_free;
 
 	kvm->arch.vcpu_affinity_cpuset = CPU_ALLOC(NR_CPUS);
 	if (!kvm->arch.vcpu_affinity_cpuset)
@@ -474,7 +473,9 @@ int vcpu_affinity_parser(const struct option *opt, const char *arg, int unset)
 	for_each_cpu(cpu, cpumask)
 		CPU_SET_S(cpu, setsize, kvm->arch.vcpu_affinity_cpuset);
 
-	return 0;
+out_free:
+	free(cpumask);
+	return ret;
 }
 
 void kvm__arch_validate_cfg(struct kvm *kvm)
-- 
2.55.0


