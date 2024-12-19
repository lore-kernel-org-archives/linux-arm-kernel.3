Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF85E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IDrMSiZoyFZaA7bq5d0wjpk5dlFJMhba1VmRyryKrk=; b=TeTFNAvmCuoPs8hi0E4ckH/BKD
	0R2tup3Hzn3GeyS2IsFbAUo8JPQEjoRJ4Vhkp6S6CHP3O5fkKsW17NI49lymwpwCkcd//VvzeHeR+
	OwD78BGHdP4oBzh7KtXasZjCj0VuLErj+cEDsmfxKCdXAyu9argPb2pYcRNhYVfSiXW9mKm9kl7OP
	sI6zqgLRaCVndjLkeivELcyKFbk8tr2fbbiurRAubIZfKKG4H8YS2GMmqfaC+toSuYKd50fJkoOCO
	CZGu0rv5MME4z6Vt1ZxvKQVevawwoZzXoLoMKxt8QAs8rz6z5NJJqEBa7NYX9xeHsOURLDT2U7DQS
	MP0QVVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMYq-00000002u3N-1sbC;
	Thu, 19 Dec 2024 19:51:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMUk-00000002tTR-0T1c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 797705C6891;
	Thu, 19 Dec 2024 19:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D3AC4CED0;
	Thu, 19 Dec 2024 19:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637657;
	bh=n6fXX5iTrXVlOQZyCTM9uWLSoLQaF9F51R34lpyH96Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IGFpgnCPFV7xeFXDkuH5D9jtMK39U2xQ1OoO/jq379E59s0SlR8UymO3id8whAqVH
	 Fu+e48vSHmm2lCQkSHrEMRpMIGgubREiyVja0/AuBvlsAe4UZRnKtXeFwI0T1JGZPf
	 8QaHNtKYwdkbVG541n76EQK9iioqPxS/boTgEv0gDNNtOX8cuuyodTrIJGDhJ/F99g
	 ZZWW31sS8J9RDdBIhXODoie6Wx9ZvHOLei+Owc2N18hteqlA96GK18XlbskH9K8T0h
	 HBZ0tDWwwtf7qDIE0CH21/HQ3euzIMDCFZFEnIWmfdnE6JlKGfvZ1KSmgJ7j335fnl
	 t8n+A9U0R4Q7Q==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	thierry.reding@gmail.com,
	vdumpa@nvidia.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org,
	ikalinowski@nvidia.com,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/tegra241-cmdqv: Read SMMU IDR1.CMDQS instead of hardcoding
Date: Thu, 19 Dec 2024 19:47:11 +0000
Message-Id: <173462305169.3912600.1369814969067145717.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241219051421.1850267-1-nicolinc@nvidia.com>
References: <20241219051421.1850267-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_114738_217420_50B5F3C3 
X-CRM114-Status: GOOD (  11.87  )
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

On Wed, 18 Dec 2024 21:14:21 -0800, Nicolin Chen wrote:
> The hardware limitation "max=19" actually comes from SMMU Command Queue.
> So, it'd be more natural for tegra241-cmdqv driver to read it out rather
> than hardcoding it itself.
> 
> This is not an issue yet for a kernel on a baremetal system, but a guest
> kernel setting the queue base/size in form of IPA/gPA might result in a
> noncontiguous queue in the physical address space, if underlying physical
> pages backing up the guest RAM aren't contiguous entirely: e.g. 2MB-page
> backed guest RAM cannot guarantee a contiguous queue if it is 8MB (capped
> to VCMDQ_LOG2SIZE_MAX=19). This might lead to command errors when HW does
> linear-read from a noncontiguous queue memory.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/tegra241-cmdqv: Read SMMU IDR1.CMDQS instead of hardcoding
      https://git.kernel.org/will/c/e94dc6ddda8d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

