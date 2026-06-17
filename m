Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E008DCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSoCN/yNNnd0t+uZKwuZBg9m7ehh37kmbG1fjTmBLKc=; b=Fq/elcL5xcNf70gXzhtpQHn9xo
	A4kWC8EjQHZPTk0bqfaDkrdeS7+SCHbrVkDYJb315YUhgQgPmxAst3j2zkPULjutrHm8vSPPqkezt
	7HSQBdpsYTvVX087Nq4itKc6FzEmKlfLkKsBv52ETR7I8xIJeoz/suI8CTbUkHst3FvyaTvv5j6QQ
	mWXoYs6e3RzIc/XQtYWB5/LAsOriXG8RBgV+sqoP0Zc2K01yCy8A+3jEiCivlP0t+WwoWEzX+/2XJ
	v4QnXZi9lMtgwRN9rs2+DlejjfnkyRqWBBeRhPQlqBP/V/6jXtFujO2hS45baz8oYF4ftINWgsd9O
	BBPHtQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZp0K-0000000HITv-3Onv;
	Wed, 17 Jun 2026 12:04:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZp0J-0000000HITY-29dN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 12:04:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 146BC4034C;
	Wed, 17 Jun 2026 12:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7201F000E9;
	Wed, 17 Jun 2026 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781697863;
	bh=LSoCN/yNNnd0t+uZKwuZBg9m7ehh37kmbG1fjTmBLKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VGAdk9mWsan0nMEQhyBdfXXvmG5qvQxJtRvfzmxGNWjUpd+Mz21pCXe/6mjvI2Arh
	 6Lm9f3mTpDpbHQqD6hLvY/lCgobbHuyovA8miaxeI3m75l0zixVJ4tfIGBFdwYwhi2
	 HH/b0wUeI1ljXqWtKKJvKmkdK1AymaPEBXT8wlGHWzBh6O6CLTH6vLij1ahPw5VxAy
	 5PNA2Z4dU5aQnm4OW8RvmukQfTXQEDgTRa/pxLWcWqnEzMbdLLWOYvAXTAY4RPHdFL
	 8Akq4kQzoRece66d51+svqaVJlyN0M7rzhr8y78z32YpcW7+6vdpssb4FcG06IgGch
	 IlkTs4tHfYaTg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wZp0H-0000000DfZs-0LWI;
	Wed, 17 Jun 2026 12:04:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: nv: Write ESR_EL2 for injected nested SError exceptions
Date: Wed, 17 Jun 2026 13:04:18 +0100
Message-ID: <178169785204.3049672.18218491677214790234.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615131116.390977-1-tabba@google.com>
References: <20260615131116.390977-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, catalin.marinas@arm.com, will@kernel.org, tabba@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, 15 Jun 2026 14:11:16 +0100, Fuad Tabba wrote:
> kvm_inject_el2_exception() writes ESR_EL2 for synchronous exceptions
> but not for SError. enter_exception64() does not write ESR_ELx for any
> exception type, so the constructed syndrome is dropped. A guest L2
> hypervisor taking a nested SError observes stale ESR_EL2.
> 
> This affects both kvm_inject_nested_serror() and the EASE path in
> kvm_inject_nested_sea().
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: nv: Write ESR_EL2 for injected nested SError exceptions
      commit: e2cb1f4578625e71f461d5c1ce70984193389cbb

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



