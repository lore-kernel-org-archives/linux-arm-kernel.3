Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8AA6083616
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dx67/ayS;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GmUeDqRi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jpC9vuyM0oDYGwUVcqxTgssTiCR7zkzLjAhyFTXihMI=; b=dx67/ayS+bNeWv
	Tj494W7yDmQs6cBfG2D7VCXSLkFVoolAN9y8re4GrxSTVjXPoE7T/0kXa0B3p/93Au9axhkTNS7Bq
	tZInDMDgoDujNPyRJsl+Cy6Ub7wldNobM2ATAvZlyfL63Y42i+fFckvmc4KEQFLmx7xNe8ICRntkP
	RhtldOn1cYzcODNhDQ9fz4oQc/60DFCZwcx+KuEFtlgtrO7gp+/i/tRkUByQRc2WPG3VOTgO4YrS1
	FSbOOY/jVF+9Mb8ED6Nxx48BZaceo7ldD4anV6RfKC7Ow07kHKpMsi/Uc9t08RRynNQiMxESSCkaP
	FQFeOhmY5hycpGHwSFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDU-00000002Sw4-15rL;
	Tue, 03 Nov 2026 13:06:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDT-00000002SvW-2xPF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C2A543DC1;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F32C1F00A18;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711179;
	bh=jpC9vuyM0oDYGwUVcqxTgssTiCR7zkzLjAhyFTXihMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GmUeDqRiqyFQcvTbGC+coMj8CxGZAvxnQJCXNyGsRAh2/9RZN9iQJC6jihMnZPCtx
	 wJdP7j6kbof2dCwHOVI1q7tEfu4pQwjxrL9mxx1PMRIQGy4WQy9no+TZqt8wRnn4Rj
	 ChnfVoeB7d3roJXeLq8GVrRU1rdytqyTiqYQ5ypRiRV5hsdYlN/3rlVQ8jRLcuLDXG
	 RSMDPxtnaeGUjMOeIGY2BChfgsCjx1XAl82QfobI2T2+XUD/e6ekVIzvafsY6ngpA9
	 +o0/yuN04ouux4/5H71nw5Us7I9FxnZIEWBSh5mNZTntn+RkZZiCU4eYnQrIU8Az6s
	 NYnXul8JBksnw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDR-0000000ATWs-1t0Z;
	Tue, 03 Nov 2026 13:06:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: vgic: LPI fixes for redistributors with LPIs disabled
Date: Tue,  3 Nov 2026 13:05:30 +0000
Message-ID: <179371111251.2844725.11327747024377032677.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026092802.2636798-1-fuad.tabba@linux.dev>
References: <20261026092802.2636798-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, fuad.tabba@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seiden@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, andre.przywara@arm.com, eric.auger@redhat.com, ndaugoing@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, 26 Oct 2026 09:28:00 +0000, Fuad Tabba wrote:
> Two fixes on top of Marc's cross-CPU vcpu pausing series [1], for LPIs
> whose redistributor has LPIs disabled. Without them, the guest can take
> such an LPI with EnableLPIs clear, or lose one mapped before it enables
> them.
> 
> The first is the vgic_target_oracle() change Oliver suggested on v2 of
> that series [2]. It stops an LPI from being queued to a redistributor
> with EnableLPIs clear once the disable path has retired the vCPU's AP
> list. With that check, the path has to pause the vCPU before clearing
> EnableLPIs, so that the retire still finds its LPIs.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: vgic: Don't forward LPIs to a redistributor with LPIs disabled
      commit: bf9c9ed5204fe8155bfff96a737faaae6afe07d8
[2/2] KVM: arm64: vgic-v3: Don't drop a pending LPI mapped with LPIs disabled
      commit: b4c9f30194a421b069bcfef18ccbee004c97b9f2

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



