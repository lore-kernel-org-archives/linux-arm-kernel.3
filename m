Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493EE606D83D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GRsIZySo;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MnAkAzcz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BTkNktWDKcUZl7Dn/5iy3nlFeUBooGmydxvaPYQQPMs=; b=GRsIZySoFt+Rrm
	sXo9cYJJzMX/qORUXzeRT7X1wMSiKPryawRXQjLYJUI2CihMYssyirl1fBuGILHqGubciT8hoIvy5
	th2o5QHTom+m6PXJhWDf5kWA/Nb8ZpdNHiTgGASYh1hFV1Hxrb+ODAG1E4mE2RypU0dhEjYPESihL
	4r/LI16rxSoNRnU/j6JQQmiTe0G93tQrP2oWaAPUA8TnfpPHrD/i4xx7p0JrEipTrs8atsIQ3x7Li
	CBfobBzY+A+s8/rMmLpEJplyU9biUyrMPzb3ZyEMIEX3DB7WL5gDG9tOCOTOfLX1H6Bpegj0UIowg
	q2nejFdJdRxW245EENhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDY-00000002T0N-0ugo;
	Tue, 03 Nov 2026 13:06:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDU-00000002Sva-11zq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F4E560616;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF3B1F00A17;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711179;
	bh=BTkNktWDKcUZl7Dn/5iy3nlFeUBooGmydxvaPYQQPMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MnAkAzczNJRLyDpmgrGNenNN/k+Ap0dBRU//KHOMjsporYHUex06eOWSqy3oa/AWQ
	 rTyYhYyCNVNGVvI0Evkt206+MF4OfVUGcu1A61j1V678cDND8wqUhM5AfnzThslU3I
	 Y0LTEstlyRvP7S6gbmLx9Y6ltuxzl+HrjQ1Gscpa333Vu8+WIlpcaIjTiyfWCfSuIL
	 jBBoQpLWkn+vAJrQ3QRSUbEClSpl5YLLHKdptUyLp0U2jzX8s/KIYUsfG7PDGlbn3b
	 rDi96fKMm+xgqfAT8hpmACd1S9TP1o5IgmBCPATyzoOmi0shA44d1k4Web+9pSfcs0
	 maJSzGExxYBag==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDQ-0000000ATWs-31XY;
	Tue, 03 Nov 2026 13:06:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	will@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2] KVM: arm64: Don't livelock when AT can't resolve a fault IPA
Date: Tue,  3 Nov 2026 13:05:27 +0000
Message-ID: <179371111288.2844725.13597429882644149907.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103114411.3642140-2-ardb+git@google.com>
References: <20261103114411.3642140-2-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, ardb+git@google.com, linux-arm-kernel@lists.infradead.org, will@kernel.org, ardb@kernel.org, stable@vger.kernel.org, fuad.tabba@linux.dev, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 03 Nov 2026 12:44:12 +0100, Ard Biesheuvel wrote:
> When a stage-2 permission fault doesn't report its IPA in HPFAR_EL2,
> __get_fault_info() recovers it with an AT S1E1R/S1E1A on FAR_EL2. If that
> fails, kvm_hyp_handle_memory_fault() goes straight back to the guest, on
> the assumption that the replayed access will either succeed or take a
> fault that the slow path can handle.
> 
> That assumption doesn't hold when the AT fails because its stage-1 walk
> takes a stage-2 fault on one of the guest's page-table pages, while the
> guest still holds a cached translation for the faulting VA. The guest
> doesn't walk its page tables, so it never takes the S1PTW fault that
> would let the slow path fix things up. It takes the same permission fault
> again, the AT fails again, and the vCPU livelocks in the world switch.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Don't livelock when AT can't resolve a fault IPA
      commit: 36b225a9b1c41a71d80e2cc17b3f0fcde4bd598e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



