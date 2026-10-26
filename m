Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68269606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dHnkIqqo;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jbyzkPZe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wlK4J5+u27LNMsvRQXEEEMIC66E4N0DC/9wfhCw0BeY=; b=dHnkIqqoSAN6E9
	cdEI9xVRpujrP/EB+KA2Rpaqd2BdcqhsXZRoZUdAOQjPISu/h46m82W84XLIWLFvDC7EHxWRdJzjd
	XWDCnswf2LPTkXYmeya38kP4ogeLSqxHFZU3U0sB04ismGJ4bezpw1i8md9rE100qJXUYYVN2VgmQ
	NvvNylqtNFfs6rtX4Eh25G3b60RrdAxCOvUlPRRzs9n0fOmSivX0A8jBxCJi8SSMXnB3+YUgQsk3h
	ERRNeKAYYJzFckMFpfFiV6S5t4HpMcdsbCFZw9uM02AW0zmOjWtLb4CQTcYoRQtOT2lCe358TKdYq
	eeubvoXrVlalvcXXe2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOe-00000002Raf-3Oe9;
	Mon, 26 Oct 2026 12:01:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOC-00000002RJS-0x2l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3F3D43FAE;
	Mon, 26 Oct 2026 12:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70501F01828;
	Mon, 26 Oct 2026 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016079;
	bh=wlK4J5+u27LNMsvRQXEEEMIC66E4N0DC/9wfhCw0BeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jbyzkPZe6foy50XtTP9CpXx4hvabTiJl7PmzZzs0+hz/Vw0IYK/3YaR4jznmU4gE6
	 owoMZot7uL5NWe8yELeqdFDQjlxc0uUAm0TvfYszXhYnYCUpeXba8jiRRIwLb9yWiJ
	 s1TasvE9jh1C6EmxBzBlX3swxc+3anPAy3marb64KvJOm4UhvlRb1zHyR+oJsVjiUe
	 r7ecFk678xweiS/cW0IqMNtwxIcpV/jBszlAEZjT78prDnnhg4rebyVRH1C0GXDORm
	 CJumswHuuCm1ozrecgRDPAt4WpDRF+aTyL9St/PaBKOI1Uu7qmNlYJyYTbrp/eGlq9
	 zX6Ba+OQNZerg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJOA-00000007Fr6-0Y6d;
	Mon, 26 Oct 2026 12:01:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Take a protected vCPU's TWI and TWE only at vCPU load
Date: Mon, 26 Oct 2026 12:01:07 +0000
Message-ID: <179301587188.2527370.14948250574472478110.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017165204.3343275-1-sashal@kernel.org>
References: <20261017165204.3343275-1-sashal@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, sashal@kernel.org, fuad.tabba@linux.dev, pbonzini@redhat.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, vdonnefort@google.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sat, 17 Oct 2026 12:52:04 -0400, Sasha Levin wrote:
> Commit 06499de8f998 ("KVM: arm64: Skip fixed-feature state flush for
> protected vCPUs") moved the copy of the host's TWI and TWE in
> flush_hyp_vcpu() into the non-protected branch: a protected vCPU takes
> them in __pkvm_vcpu_load() instead, and only VSE comes from the host on
> each entry.
> 
> Commit 04447b95c62b ("KVM: arm64: Use the host's HCR_EL2 for
> non-protected VMs in pKVM") was written against the old code, where
> both VM types took TWI, TWE and VSE on each entry, and kept that for a
> protected VM as PKVM_HCR_EL2_HOST_PVM. The merge of the two applies
> PKVM_HCR_EL2_HOST_PVM in the common path, so a protected vCPU takes TWI
> and TWE from the host's vCPU on every entry again.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Take a protected vCPU's TWI and TWE only at vCPU load
      commit: 5b34f0b4adbf983174e53721f68b617113376f2f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



