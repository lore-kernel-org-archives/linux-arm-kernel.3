Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F168CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APsB50ihhU3A5Y/b7mc2nvs0/aMHP/B00/9rsQ9YSxA=; b=XfpYaL3nkcmyRA8G7F3L2Jjzlv
	jT8j3XEDlSzBTYWg5GZtq5f4QxvLsQgQTc8B0Nlph/Jelyqz5o4rfjwrJw7Jc+CrIQ5QpwrkQBCkk
	KK8yPjgB02ZSTypJ4p9SwHGISbP7HAp3zHdceF6tlyYuDTwx44Bv/1ofkuXr4iwsfwsRZRD6Ya/6Z
	7bmPkWo6ODtggGfPE3za3YQne97KWOabQx86rg6wkE3VNtbK/Bc8wG+qOO0WeQV4yBywZLLsgeD+f
	c9IsrFCk7nk6wGp825rg6ddRuSGPR7xXLDGNJpgei91iYZInCpTfORReiHe/fzGcrL1nV0ZqYBJYk
	3GMcx2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOXo-000000028B9-3xRZ;
	Wed, 07 Oct 2026 10:06:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOXn-000000028B1-22fS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:06:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E91EF601FF;
	Wed,  7 Oct 2026 10:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9BE1F0089B;
	Wed,  7 Oct 2026 10:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791367598;
	bh=APsB50ihhU3A5Y/b7mc2nvs0/aMHP/B00/9rsQ9YSxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Peb6+4o/Fn/871ib2bcjk6CVPyHsZ+t3auV/PL1ronyahYmQVdjngxwCs6X//kxNr
	 YK0UXr80xdGYqWr//KVL1FP4ErY2mQ3/Yi0Hp9C4cZAaaJzP6pe2wFn2Tled1Abeyf
	 fvf0gD+qSIk1LN2XC3lJzu/OlZ4x9OhnY3BNyumK3QDKj3ncenA92PbkY0hxofvgVj
	 uu4kbhRA5MxkCbm2sFKurjTlNHl1IObRD+Qg9PBEwxFOMB5nZa6E2Au4YzlJ8FcMtm
	 yR2R2CBs6YwiLLbvPt8TRczYHbMIOkmBaWOy0pOXhldTOrH8Nvq6G872nFft8g6/sf
	 d7GT5kCx2W/cg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xEOXk-00000000Den-0sAt;
	Wed, 07 Oct 2026 10:06:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Oliver Upton <oupton@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Will Deacon <will@kernel.org>,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] KVM: Replace VCPU_RUN with KVM_RUN in comments and docs
Date: Wed,  7 Oct 2026 11:06:33 +0100
Message-ID: <179136758616.696606.4614783559462928506.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915084441.3846947-1-fuad.tabba@linux.dev>
References: <20260915084441.3846947-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, oupton@kernel.org, maddy@linux.ibm.com, fuad.tabba@linux.dev, seanjc@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seiden@linux.ibm.com, npiggin@gmail.com, will@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Tue, 15 Sep 2026 09:44:38 +0100, Fuad Tabba wrote:
> This one has been bugging me for a while. Five comments and doc lines
> name a VCPU_RUN ioctl (KVM_VCPU_RUN in book3s_hv.c, VCPU RUN in
> kvm_host.h). The ioctl that enters the guest is KVM_RUN.
> 
> The patches are independent and split by tree, one each for generic
> KVM, KVM/arm64 and Book3S HV, so each can go through its own
> maintainer. Nothing else in the tree refers to the ioctl by a wrong
> name.
> 
> [...]

Applied to next, thanks!

[1/3] KVM: Fix comments that refer to the non-existent VCPU_RUN ioctl
      commit: 8233000034a630432a7da0311d94e8725207a095
[2/3] KVM: arm64: Fix references to the non-existent VCPU_RUN ioctl
      commit: 0ab1034969130967bda8e6eab5b8dd6745604f1b
[3/3] KVM: PPC: Book3S HV: Fix comment naming a non-existent KVM_VCPU_RUN ioctl
      commit: 6ce8b5c0effb227f5625b35965c0f74c0e953efb

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



