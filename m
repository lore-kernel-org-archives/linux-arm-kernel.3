Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE36D3A678
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EojMp4gyNolyaDmPK3SmEo0i9b5ZAwDw/7LOyZr3t1I=; b=ycVsIj7/sKyZ59bTcATbreeSQ6
	THtdU5NiarzZq0c2EcVq/VCN4P/8glziixjTMJZatI86+DxswcPvdjr+NTFFeVMWHioq7IifSJw0I
	HuEJ8oPPVlz/2XX2Jlx6gXhPpfkaScLsaCz5lm+2JHGUbDSDXYXJxtZMEFGQ5kDn+Gcm8XBKUKtzI
	c+0r+R8c8cbpg/ZxD2bW4XWODkJBNdYI/Mr+hEJilbe2470KnZafdDnyq1DKbigF35VPQS6iCNjsg
	jrS43KdTmBsoHG45XslNxTFYPmQutOwKZ9Pr8qT0e8hiE599Tq6HhHPjMb+UWXKIp4www1x3iovpE
	z5Kc2uwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qCh-0000000FLPB-2Pi8;
	Tue, 29 Oct 2024 17:40:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5osT-0000000F5CC-23En
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:15:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6AE43A42FD1;
	Tue, 29 Oct 2024 16:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DA2C4CEE4;
	Tue, 29 Oct 2024 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730218528;
	bh=i9WM0s810nFXSxm0IvLGmYRKqPNMDw16wIj+exh5hto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b/+Zrme6lq1K/IkcOZ5fvRy8Lxiz/RQhLrmWdupPapsplmm40A7NZSSYjWLrDVcnF
	 /HEVieklcc/gIKMua3hOfZCAMpdyKeb0PlTJN5ve8GhcwG9yx+iMrnPgTQR8BT+g1Z
	 zSrYwuzy+07BgWrJ22Tzf/q45E8npT+Ob3L5b0+K7qCvZIg3ywJmCPGt9Q4lUdHSWl
	 K2IS3E9OI6MaWYjrRkf/VHIN+nVyY6SFvSwbiF7qXcfe4RynwR8yKS/J/Rq9hEJXwd
	 FSm2ZK+WAK9/CdcloXYX28GhSvZbfaVAAX7qPjOARBQOSM8raKi6gqZD0s6F7H7qWY
	 LG35ad6meUoKw==
From: Will Deacon <will@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	jgg@ziepe.ca,
	jsnitsel@redhat.com,
	robdclark@chromium.org,
	quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	quic_charante@quicinc.com,
	stable@vger.kernel.org,
	Prakash Gupta <quic_guptap@quicinc.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Defer probe of clients after smmu device bound
Date: Tue, 29 Oct 2024 16:15:13 +0000
Message-Id: <173021496151.4097715.14758035881649445798.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241004090428.2035-1-quic_pbrahma@quicinc.com>
References: <20241004090428.2035-1-quic_pbrahma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_091529_616670_45B3E5ED 
X-CRM114-Status: UNSURE (   8.44  )
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

On Fri, 04 Oct 2024 14:34:28 +0530, Pratyush Brahma wrote:
> Null pointer dereference occurs due to a race between smmu
> driver probe and client driver probe, when of_dma_configure()
> for client is called after the iommu_device_register() for smmu driver
> probe has executed but before the driver_bound() for smmu driver
> has been called.
> 
> Following is how the race occurs:
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu: Defer probe of clients after smmu device bound
      https://git.kernel.org/will/c/229e6ee43d2a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

