Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3443E60A260D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VhGQj1m6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBbfLRUi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vCbJtWSQWA+dOppoLln3XQQI8iTRF07B0RxyzIkvfdc=; b=VhGQj1m6lbhD8P
	E/UQjC9N5Bkh2TO4eFCIYIti6r/W4E22kXkkGWAtEms/9C45iG/5xog1AR7/WJqBRN/ByKqqfFCf0
	dVdvVfXGF20ZjbasS7mScppDe2fCoC2BcNCgidyY7Nznpmx5GZaV/6aTNwezvGU0z7pPRR8t/P5zm
	omqE/DF/tf3yhQlh1Kse/UbW/f41yzMFUfm9wJqump/uRMyKA9JSxULCUjPscpKTl5RoPWUJvjRQW
	WSpdhHVDUxoMZL1cFbMIQz9djL1ahtOp2MYUdobreljlVOLcTZrv3kcudj+in0lfzENmKbD4SaG2M
	dlNmR+K6mfkWZTpTshsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDc-00000002T8p-08fS;
	Tue, 03 Nov 2026 13:06:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDW-00000002SxZ-2rGu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 716FF43F63;
	Tue,  3 Nov 2026 13:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E851F00A27;
	Tue,  3 Nov 2026 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711182;
	bh=vCbJtWSQWA+dOppoLln3XQQI8iTRF07B0RxyzIkvfdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QBbfLRUiPpiCX6Fgou3CvHgZue94Mcmz5/yGZPxQwvZlXGb/5yhGuBKNC8FB4xvwZ
	 JL8SF1aFcUvfyulmDMwjCP2erGQpbn53D2cU8Yl80yS3FPdp+M3/XJ6xPnxEtxzz8h
	 gM+jbu8sK5xGqcOn0+7hzQ4ylcHb45bjcy6o9NmwLv0cnd1ygqP3Sc9PqBUsCJxqnD
	 tbsDK1V0TojW9vS43YezrF6i3peXHhwymukFNBDcLuh2Y0LC1NTyM0g2mlIsR8+f5S
	 3skV73lZgAa/gQKm2LvzH5XRlVuqx8s6DFsy0kJ8w8YGn/CNhU9gr+2DVsGWHA8kRa
	 fqnCmlLDKgyig==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDU-0000000ATWs-2dNj;
	Tue, 03 Nov 2026 13:06:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: nd <nd@arm.com>,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	Joey Gouly <Joey.Gouly@arm.com>,
	seiden@linux.ibm.com,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] KVM: arm64: vgic: Serialise CTRL_INIT against vCPU creation
Date: Tue,  3 Nov 2026 13:05:42 +0000
Message-ID: <179371111236.2844725.3353773125671356763.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904174419.76057-1-sascha.bischoff@arm.com>
References: <20260904174419.76057-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sascha.Bischoff@arm.com, nd@arm.com, oupton@kernel.org, fuad.tabba@linux.dev, Joey.Gouly@arm.com, seiden@linux.ibm.com, Suzuki.Poulose@arm.com, yuzenghui@huawei.com, sashiko-bot@kernel.org
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

On Fri, 04 Sep 2026 17:44:20 +0000, Sascha Bischoff wrote:
> vgic_init() compares created_vcpus with online_vcpus to detect a vCPU
> being created. However, CTRL_INIT only holds config_lock, while
> admission of new vCPUs and updates to created_vcpus are protected by
> kvm->lock.
> 
> A concurrent KVM_CREATE_VCPU can therefore increment created_vcpus
> after vgic_init() checks the counters, then block on config_lock before
> publishing the new vCPU. For a GICv4 VM, vgic_v4_init() consequently
> sizes its vPE array using a stale online_vcpus value, leaving no vPE
> entry for the new vCPU once its creation completes. The upcoming GICv5
> IRS support would hit the same issue when sizing its doorbell domain.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: vgic: Serialise CTRL_INIT against vCPU creation
      commit: 5f54835d94db2e896ec27415b9de2e81cb56009a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



