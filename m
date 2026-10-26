Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F43606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3H+znAk2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VigbS57Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dpLOTP82eRJvi4Uq9n3UH445ps38/OhN0J6cr44J4xk=; b=3H+znAk2IIYjRx
	Id9aoY+00MP+RQeefDwZnYZs4OvXO4/EJoe5Z1JMwdMlUx+sA/7l1mRaS88AjF+Ye9onVLFfZJEpI
	QkKIbKLZxqs0noXmlcXeb7izukIefqUSPq+nYhp2qANaevSDtWSK6z+7Dr8kxa/s8m/NaadzTiHrO
	NxCH7hVTVnFjWSazk5pCLgnouX14/+kP5ezgdz/g61IZofKduwazzY433BhU2yX5K5Ap2ZEzL9zli
	6Kp0f/gdsN+8gb2Vc09/tOEo/4PZumWi1miH+RnIhYCvUBZohF4ZDbLdC9UWlU5nfKioDq7V/N8ip
	r2ZMKDP0G5+Lkdz+aQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOf-00000002RcO-3KIN;
	Mon, 26 Oct 2026 12:01:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOC-00000002RLW-43pz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A633A43EF0;
	Mon, 26 Oct 2026 12:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855C01F031E2;
	Mon, 26 Oct 2026 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016080;
	bh=dpLOTP82eRJvi4Uq9n3UH445ps38/OhN0J6cr44J4xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VigbS57Y2M4p7kdTrkQ5zk+RxRQbAKeILy0kPiq9BCs7kYiZuPU2R7XNOYt/bGmuH
	 iRbMcRAPs7Of86JVjOJbufl10kk8EFsqjUmpf3gzi1T/2IjUMq9m0viEGOV4lLBtIZ
	 rM5jrp9dSvSUXb/TXc95RJ4xHyasbgKECyMEFjyeV0dScTh/B6IAkjDSAiMcc8pcod
	 KoXfMZaHUnt4cpdCNAna9zyl6IzGtIGTNTNx+XMy7o9O2Vs7mWv+4A+MAl7D57kxfl
	 Zwl/FlvEAi3+HyZuLcrzvU2dD91K6TqntoKb7l9OwUdIbcjekKUqgxvJtuSPCydvsU
	 CNgKHKoyVCwnA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJOA-00000007Fr6-2moL;
	Mon, 26 Oct 2026 12:01:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	fuad.tabba@linux.dev
Subject: Re: [PATCH v1] KVM: arm64: Move pkvm_selftests() after all CPUs have initialized EL2
Date: Mon, 26 Oct 2026 12:01:09 +0000
Message-ID: <179301587192.2527370.2928933252575532589.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019094258.1582756-1-vdonnefort@google.com>
References: <20261019094258.1582756-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, fuad.tabba@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 10:42:58 +0100, Vincent Donnefort wrote:
> init_subsystems() installs the hyp vector on all CPUs. By running
> pkvm_selftests() in init_hyp_mode(), there's a risk for a migration to a
> CPU where the hyp stub is still in place which would fail to run one of
> the HVCs necessary for the selftest.
> 
> While init_subsystems() is the earliest we can call pkvm_selftests(),
> move it to finalize_pkvm() to avoid having to export the selftest
> function out of pkvm.c.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Move pkvm_selftests() after all CPUs have initialized EL2
      commit: 0fa4e506a054702d03d46aac9272a37f820fc2e5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



