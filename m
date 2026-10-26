Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6BC606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SvlML+vN;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Okps9Vgd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FHBChhLbuB6TzLDwIH+42vOrmoSeOsBok/XmKTA9HCc=; b=SvlML+vNBUM/L5
	1HLOOjieWHyUAF6YVekkeKReLgGndJe6Vt5f+QytrlhvkRwRztwkK5ff0KT3tlA1jLb16MNx1feS0
	oh28tt74fQJqYqT00RZVbKg+mozwLp9W9t6N5UMdjbMmLJDY9dNBZlC/cNsViEARwNcMN/mrrru79
	+19S07QzDHASLdcNLRZiZOWvTwzPMrdNyN2HxUhkKuLM7gU+j4dwv7dZIXfgrybj/2j+cPm5+Azwf
	xwuBO0kCioYugmp3JnUzICJBSe2VsNJa1s5Sx3ffhvIAAuq5n6bwmwggEwiAF+Vx5QScaCFH4+4mL
	MdzZDhJmI6G4lEkG29Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOd-00000002RY4-2cAr;
	Mon, 26 Oct 2026 12:01:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOB-00000002RIA-0GjU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3598C601F7;
	Mon, 26 Oct 2026 12:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6491F01829;
	Mon, 26 Oct 2026 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016077;
	bh=FHBChhLbuB6TzLDwIH+42vOrmoSeOsBok/XmKTA9HCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Okps9VgdhbOD6me+jQl800n6iIjMigUTKIsrz8CWl87dmXIbPffJKtTnCSETproxl
	 +ZulYUKEDIFyP/4CrfH0I8nfxLrveoZ7pdrBrewqqJmqIBMMFVsB6lNObLwgJDSXpi
	 kthYsdjdCJRr+3k96yGNfqx5N7tp78gRbMEsx8XB1n3dapVKvYbfbxSwGILLpsMtXS
	 4aldojnTas5rbnIsGJL0+rIK92PjZe6O5oaV96RdTd1rfCTuKSZ/23oMHV2seFuqTU
	 LKTKyBczFiuuf4PyZYaUn2h+3ibYSYeMylr5CufZMmEVu4YosYKAQV9ArB10dtBjZz
	 0DaBjXnHX2/1Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJO7-00000007Fr6-435Z;
	Mon, 26 Oct 2026 12:01:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Set HCR_EL2.BSU to Inner Shareable for guests
Date: Mon, 26 Oct 2026 12:00:58 +0000
Message-ID: <179301587176.2527370.16109421648237594785.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016081558.805411-1-fuad.tabba@linux.dev>
References: <20261016081558.805411-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seiden@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri, 16 Oct 2026 09:15:58 +0100, Fuad Tabba wrote:
> KVM sets HCR_EL2.BSU to Inner Shareable for guests, so that a guest's
> barriers cover the TLB and I-cache invalidations that HCR_EL2.FB
> broadcasts. However, since HCR_BSU_IS became an alias of the generated
> HCR_EL2_BSU_IS, it is the unshifted field value 0b01, which sets bit
> 0 (VM, already set) and leaves BSU at 0b00. A guest's DSB NSH is then
> not required to wait for a broadcast TLBI to complete on other CPUs.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Set HCR_EL2.BSU to Inner Shareable for guests
      commit: 00e73757518020273ccf6308a51f214e58c21ad5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



