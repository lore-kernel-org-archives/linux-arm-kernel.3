Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FED60A260D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rnPwkvJE;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GnJy1aiA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y83TXB3pI0gHj1un5pNeNwtJKzO6fTfsM92MJn/Tr6Y=; b=rnPwkvJEH/mWaW
	UqNhWo/SJFeuUp1OVkPLZBfsu2Zm+xLrMCNiRpqew1W9vGSNxd3BckKAsPwwDLtU+qSI4v6VfR9AR
	DGgaaOn5O5Aft9+cJU1/pn5bJJHWZrbydZ+db7lbuN7XOnSSBKGt2pJJrE7KBRYCQyGXT7fYWGyeE
	Q2pcmnMXwl0+gqED/KYwDU2f9cHSKnq/nXowLYvnuI8h6lVptDqrAP3CCmr6XzIy2CSB3puwhtmB9
	jI67kczgBXvHhqXo4KPQf+fZUUMbijQ88ZTjsN/KvWLDtZQh7jd+mmPu6ntGgRfNYya511b1vUWFp
	uihuWLULYFSZGC/vHB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDZ-00000002T3b-2Nea;
	Tue, 03 Nov 2026 13:06:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDV-00000002Sx8-3H0U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8455443F7C;
	Tue,  3 Nov 2026 13:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A111F00A1D;
	Tue,  3 Nov 2026 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711181;
	bh=Y83TXB3pI0gHj1un5pNeNwtJKzO6fTfsM92MJn/Tr6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GnJy1aiAn3tS1izjvwAFeQRs4WPdoYFWRPqCYu9Ni9pa57b6xnevbXiGLzngqongj
	 mu9m6EBmj4WtrJADo1Kc1Qb6nO1mDuggsDjIqmNN9oE8Z0QMmdYMP+iy9doreS/sBV
	 f1iIXdTNoaqQZKaDWaeS80wa5mKYpDYZp6fnXO5SN5wB9UMkrkIgkWxTzThTMADf4R
	 6yvxnu9E2fmEBZ226q7TXQ5DtsdbKRrpjc74Ctq/KzBViT0VcOZbS2EnmqqpJPnkeZ
	 3JyPwcfwHrcRlyOlMZMT89i29rE7VMBp8xMpHQBDoNOa2xuW/PU/8Q2ccdDc+TAE0b
	 dzrY0eYamlyow==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDT-0000000ATWs-2dTM;
	Tue, 03 Nov 2026 13:06:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] irqchip/gic-v4, KVM: arm64: Fix the vgic init error paths
Date: Tue,  3 Nov 2026 13:05:38 +0000
Message-ID: <179371111256.2844725.10760972508293645316.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921072958.2918477-1-fuad.tabba@linux.dev>
References: <20260921072958.2918477-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, tglx@kernel.org, eauger@redhat.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, Sascha.Bischoff@arm.com, sebastianene@google.com, yaoyuan@linux.alibaba.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, 21 Sep 2026 08:29:54 +0100, Fuad Tabba wrote:
> Changes since v2 [1]:
>   - Patch 3: a vgic_v4_init() failure now frees only the SPI array,
>     since that function unwinds its own state; the teardown label is
>     for the routing failure. (Yuan Yao)
>   - Rebased on kvmarm/next, where the routing failure already tears
>     down the GICv5 state. Patch 3 moves that into the shared label, so
>     the SPI array is freed on that path too.
>   - Collected Reviewed-by from Yuan Yao on patches 1 and 2. (thanks!)
> 
> [...]

Applied to fixes, thanks!

[1/4] irqchip/gic-v4: Clear the domain and fwnode pointers after freeing them
      commit: 861bebd1fac5f5a25c11e40aec3c3291542045d1
[2/4] irqchip/gic-v4: Unwind what its_alloc_vcpu_irqs() allocated on failure
      commit: fd86d69c951765e24e89a162c53dfe33a8aba976
[3/4] KVM: arm64: vgic: Tear down what vgic_init() created when it fails
      commit: 9f63ac1e31c370d5ed9d49caec4faa469d0007fc
[4/4] KVM: arm64: vgic-v4: Restore nr_vpes before freeing the vPE resources
      commit: 1ad8b8b8827e72b7d5907ee47c43ca0e2506b4f5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



