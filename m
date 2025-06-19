Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6BBC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dy004rdfokRQoHtVAUCkxXOFrIA41maIvxj3KdUNHcI=; b=ZFjjKcSMgeLBmWG38KjOF8VKvz
	oh79ynWBYdbRmKLeUKlPAILLRQm1YRzZct4sKrLQ0UTnJPZX3LMKf3gW260iB5D6lzx8tTkWkVY12
	RsvpmLMWFZb3ZIcrlgzh7OBhfHRUstPcnxiGPTU724iSOMohkc1dks2gRxcYBvRFTbcwkFVouasP2
	N2E3uXxDdSq4mUFWxDDFDl0Ki3/7rptboMPW+Ii44dFkB6/DkKvPjNo950Gydlf8xVhBuqrPU4uId
	DesDs/DePKO/GX/7x2AelMOGq3kLgEs4ug1l/8qtiQ4IxJjw0LtAt6RvCgbKDaap3cY0/QG//uzJ7
	IztQnYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUQ-0000000DW5a-4Bdu;
	Thu, 19 Jun 2025 15:47:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEUz-0000000D4aA-1ndZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 154134ABDF;
	Thu, 19 Jun 2025 12:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63BAC4CEEF;
	Thu, 19 Jun 2025 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750336568;
	bh=/VJpImzxCawSJoEGcFeP8vUU7BIQ4dI0KhLFtoTx7bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1Y/hTGyqUZJGUEUZUgtVqR3Lm17+BC5/oGuq7U0MY9mRxFOpx8TksxBQFWzwj+wt
	 jEy76Nl7yxYCsizm6p1ACyoakPYuXbaHyea8vjawdVUwUEXB67cLo2mywRNSRPnZZR
	 jLvvtZc3noD9GTNNvl/P2i9D4sEs9Glcc1Hos1IRliawpbMyMzUncJM2dRGOg1R+wi
	 WDyRAmJPSXOpjxL5i1hijcLxC1hQjvyrbcSxVaD0s8v3p9iR2sytHkUnZOi7d/HRBt
	 0JzkIRCsINQ33XXUgJXpOXUCnrVVnQMN3OBk33vSIgVcw/c7e0wtYxln1z+nKqk7J2
	 Hp79FJ1Q3IldQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uSEUw-008Fdk-8C;
	Thu, 19 Jun 2025 13:36:06 +0100
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sairaj Kodilkar <sarunkod@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	David Matlack <dmatlack@google.com>
Subject: Re: (subset) [PATCH v3 01/62] KVM: arm64: Explicitly treat routing entry type changes as changes
Date: Thu, 19 Jun 2025 13:36:02 +0100
Message-Id: <175033652435.3069576.5168060744496766238.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250611224604.313496-3-seanjc@google.com>
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-3-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, pbonzini@redhat.com, joro@8bytes.org, dwmw2@infradead.org, baolu.lu@linux.intel.com, seanjc@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, sarunkod@amd.com, vasant.hegde@amd.com, mlevitsk@redhat.com, joao.m.martins@oracle.com, francescolavra.fl@gmail.com, dmatlack@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_053609_488979_B628C50D 
X-CRM114-Status: UNSURE (   9.91  )
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

On Wed, 11 Jun 2025 15:45:04 -0700, Sean Christopherson wrote:
> Explicitly treat type differences as GSI routing changes, as comparing MSI
> data between two entries could get a false negative, e.g. if userspace
> changed the type but left the type-specific data as-
> 
> Note, the same bug was fixed in x86 by commit bcda70c56f3e ("KVM: x86:
> Explicitly treat routing entry type changes as changes").
> 
> [...]

Applied to fixes, thanks!

[01/62] KVM: arm64: Explicitly treat routing entry type changes as changes
        commit: 1fbe6861a6d9a942fb8ab8677ddf1ecb86b1af60

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



