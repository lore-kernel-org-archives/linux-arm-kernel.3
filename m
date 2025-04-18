Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6C4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 05:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K4adI7ccpTdRfN3HSGkuNWOP+075nSqil0uuYEAUuVI=; b=WuRUg2Yv6MkKwxWqZhMGZkr6sL
	gBkUrhoogq5QumDXA8FjgEsop184Y1r6fIm2ZCSfRDg89K/fRpAp89aJeRVB5WkhWNkLPPMKiHAqB
	j/RKiIMMkj1+KJivuYn9MBkHgkdoIDebMcP+3neFVvXGBgJ7cpQLB0m9/cGGbJieh6XhR06cjKefx
	+kVEU/Cv7yMzt63mWbiJioWfzfSE2uZQl0517ciDuP1fQINSQnXChqHcXXw4sy/iFebb/QmGLfcVh
	BeYsdG/F+JDOuqtrx+ewcbsgOwoEiUO8Kw4CofOUJ6TDBAaRYgz7H0U2XK3Y4Nri6OaomUQj7DYOc
	a56ONOHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5efq-0000000FC4w-2j4B;
	Fri, 18 Apr 2025 05:54:02 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ec6-0000000FBll-2Exv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 05:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=K4adI
	7ccpTdRfN3HSGkuNWOP+075nSqil0uuYEAUuVI=; b=NiRpihx+WrSnQ0gVx8mQU
	6xaRUwEJSZnsh0r36jVLpU5RCqE6uhJ52PWJU5s8wzCWpJsFQpbKMVXNIDbLdMED
	qsgSsJWHX6CmCKY50dnRNicHCkHdlH1tm96KbocDbUOyJnXTuG83UGY0gWuZWDF9
	PP96lrO+51LNYD7SCKD5H4=
Received: from node-1.domain.tld (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wBHS2cE6AFodXCPAw--.34969S2;
	Fri, 18 Apr 2025 13:49:57 +0800 (CST)
From: Jiayuan <ljykernel@163.com>
To: kvm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	marc.zyngier@arm.com
Subject: [Question] arm64: KVM: Optimizing cache flush during MMU enable to single vCPU
Date: Fri, 18 Apr 2025 13:49:55 +0800
Message-ID: <20250418054955.1883037-1-ljykernel@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHS2cE6AFodXCPAw--.34969S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy7JF1DXFW8tFW8uFyfJFb_yoW5Jr4fpF
	Z7CF15tw4vgryIkanrtw48tr1FqrWkJF12q3s8Gw1Fvw15ZFn7WrykCrW8XFyDurs5Aa13
	Ga129FyDZr4DX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UpuWJUUUUU=
X-Originating-IP: [211.103.135.98]
X-CM-SenderInfo: 5om1yvhuqhzqqrwthudrp/1tbiSg8zbmgB5iM5+QAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_225010_959024_175A7DAA 
X-CRM114-Status: UNSURE (   8.74  )
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

Hi,

I'm investigating the cache flush behavior in the ARM64 KVM implementation, 
specifically regarding the commit 9d218a1fcf4c6b759d442ef702842fae92e1ea61 by 
Marc Zyngier that addresses cache flushing when guests enable caches.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/kvm/mmu.c?id=9d218a1fcf4c6b759d442ef702842fae92e1ea61

In the current implementation, the function kvm_toggle_cache() in arch/arm/kvm/mmu.c 
flushes the entire VM's stage2 page tables when any vCPU toggles its cache state:

void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
{
	bool now_enabled = vcpu_has_cache_enabled(vcpu);

	/*
	 * If switching the MMU+caches on, need to invalidate the caches.
	 * If switching it off, need to clean the caches.
	 * Clean + invalidate does the trick always.
	 */
	if (now_enabled != was_enabled)
		stage2_flush_vm(vcpu->kvm);

	/* Caches are now on, stop trapping VM ops (until a S/W op) */
	if (now_enabled)
		*vcpu_hcr(vcpu) &= ~HCR_TVM;

	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
}

I'm wondering if it would be feasible to optimize this by only performing the 
flush on the first vCPU (vcpu0) that enables caches? My reasoning is:

1. During guest boot, typically vcpu0 is the first to enable caches
2. Other vCPUs would follow after vcpu0 has already flushed the caches
3. This could potentially reduce redundant cache flushes in multi-vCPU guests

Specifically, I'm considering a change like this:

void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
{
	bool now_enabled = vcpu_has_cache_enabled(vcpu);

	/*
	 * If switching the MMU+caches on, need to invalidate the caches.
	 * If switching it off, need to clean the caches.
	 * Clean + invalidate does the trick always.
	 */
	if (now_enabled != was_enabled) {
		if (vcpu->vcpu_id == 0)
			stage2_flush_vm(vcpu->kvm);
	}

	/* Caches are now on, stop trapping VM ops (until a S/W op) */
	if (now_enabled)
		*vcpu_hcr(vcpu) &= ~HCR_TVM;

	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
}

Would such an optimization be correct from a cache coherency perspective? 
Are there scenarios where each vCPU needs to perform its own flush when 
enabling caches?

I'm working on optimizing KVM performance for ARM64 systems and noticed this 
potential area for improvement.

Thank you for your insights.

Best regards,
Jiayuan Liang


