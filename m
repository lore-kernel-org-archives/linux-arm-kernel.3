Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E37EC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vt2ftUzXwwEiNRXjnC8qV9jrJvkIkUdpYX0jSjdAkkA=; b=1rd3sGghbAR+H5xU7BFVZ+pHum
	QbxPx2/ieFJp/pRcJt2mWtbFEpxgPa+2oUDmX1K2/+5FtWw0cwL4+gTlqTqbs+axPytoPhe+nw7TM
	mazjpwtqqu4F/QUYv62J8iusKBALGuRqYuzYBH6n0Ndc8AylJE6I1HgLNH3G9qkOrDE/RLzr47ZmC
	X0HxueHSKEd2KyhalK8hSN/Z6KmgoUfoeiSCOvDyLF1lvRF+TRZQRukcVqAjBJph+6RwDQiR18V09
	JTvvu7mq+I+hIeHZaNCYzouVIOo9E18yXlI403z36R/tV9nHja/Dc3S36MNI8bBejKGSZg7zpNcKV
	6YgYuQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655K-00000003LSI-1Q5i;
	Mon, 14 Sep 2026 11:42:54 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x654z-00000003LBv-2g1o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:39 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjs5084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:52 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=Vt2ftUzXwwEiNRXjnC8qV9jrJvkIkUdpYX0jSjdAkkA=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386112; v=1;
        b=JSvOxMcluoJkyChBZQ3Jczt1nauvL3PDS2eiLK5MKehlRHQ71w55mlC8XjfhJap0
         t5gptykxB/CvL5DFqs5pDhqrS85hz6m/TMilwvngUxgT9YEjV3YX4PeITiPrTxSl
         zms5Q/C9UV12Q1x9Jy1b0cTymJ80/0yGR+oerdDm0sydrdc8aDRaxm8gmvG4be36
         izmTWXsEdtKv3JfcLS7Z8YXNkAXKN2wuTKFHknQB1VK/KcRmrVyeBXE8fSUNIcc9
         ZXO5W7AGiY7iuhNxRRWtV9xfK9oXyvhTFeGLmwnpGJYe/UFpKnkM6dsap0CuODUu
         8ThylWGJOr9WkCOZc15T2w==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:42 +0900
Subject: [PATCH v10 03/20] KVM: arm64: PMU: Freeze counter count after
 first run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-3-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
References: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Andrew Jones <drjones@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
        Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=MrNqsf8vl79pbAxP49QCfE5TLu/s5O9EUAaIBtYYaqg=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byuzk3ch/zHiueYa99X0ZV3zZfS2wi1wkDgenvL7/51
 CnGzL2ko5SFQYyLQVZMkSWlaDe3RnTtp8KE+BaYOaxMIEMYuDgFYCJ/ljL84fKTknkjfTXJexFP
 gvH9Ko+rUpz7V8of+dht6t8XeFhFguF/TcZf1beKHo/9LPrMtv6c/2e93oG+SGc9O0fTKZ8nrZV
 iAgA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_044233_980294_F154D834 
X-CRM114-Status: GOOD (  10.26  )
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

PMU configuration is VM-scoped, but SET_NR_COUNTERS can be issued
through any vCPU. Checking only whether that vCPU's PMU has been
initialized allows userspace to change the counter count through an idle
sibling after another vCPU has run.

Reject the attribute once any vCPU has run. This keeps the VM-wide
implemented counter mask and the PMCR_EL0.N value stable after guest
execution begins.

Fixes: b7628c797376 ("KVM: arm64: Allow userspace to limit the number of PMU counters for EL2 VMs")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 832dd145af2a..950b7a349659 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1112,6 +1112,9 @@ static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
 {
 	struct kvm *kvm = vcpu->kvm;
 
+	if (kvm_vm_has_ran_once(kvm))
+		return -EBUSY;
+
 	if (!kvm->arch.arm_pmu)
 		return -EINVAL;
 

-- 
2.55.0


