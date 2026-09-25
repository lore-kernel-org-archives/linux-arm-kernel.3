Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFBEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDPeS3KsTd5jTAjH7wQqYPnOP77l/2BPC3nDAy/sItU=; b=v4ycfqMLukW8cLMv6vBgDh2TPu
	82kSD4zfv7NJuwrlj0RJct/WT65S5Oglt/rl9TCIjcrRJgxtIhLy27N/tWczxmx1FOuEgyB/bD4R4
	1B8XUy3COZLOw9KuwNA3dKaXBdGjYOe/oajH6jppleJfYVBaNZ6JI/zHs3lD0YOda9HM+oBlO44Zx
	1wfiTvrdGeJmmtPxpSBt+BXxTwBw9+yk4sNIs6xH8PI6ff/K0arN0NsdeWHRW5RUFb2MGJnY7mByj
	KPHmZtdxEdT3fJ1EgRLLxzdp0+KKDrIrOrZ8iiPLO90dieAWP5de7UKSYoDetDLUKheUjHhyyNnSt
	YW9ZeONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7yf-0000000DofF-2kua;
	Fri, 25 Sep 2026 15:36:45 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7yd-0000000Dodz-2EgV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UDPeS3KsTd5jTAjH7wQqYPnOP77l/2BPC3nDAy/sItU=; b=UlWdXKNL4bEfhh3dNLYxyqQhoi
	evNMj8YqERVvjzibqqueJBqM61g/u8W6Ha19QAVlyCasHGObLS2+rlS8ATPkNVRTF5fubVCjvUFhO
	3nzn+8jrAcSHjgBded2+r8IRMEuZagFNzlADnLnFIhE9oPg3ZcuyDk2IPmGQAm6hUJeqYYk3TbJu0
	QpRzS4nSe/hGjAvCHus/qu7IsPIfcaELfWJWazaHXUA0KG+84j6lBUBnlyvxZH1JzzHRI122x7l3h
	omLug+fUPTtpQ22w3t0XGia48Ouida2ZB4b9Y0FF1tEv73lX+OB8i4ZkbC0VQweOBmhLG5Q3ONb8o
	RT+sg1WA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xA7yH-005OzL-39;
	Fri, 25 Sep 2026 15:36:22 +0000
Date: Fri, 25 Sep 2026 08:36:15 -0700
From: Breno Leitao <leitao@debian.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
	Krishna Reddy <vdumpa@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	Shameer Kolothum <skolothumtho@nvidia.com>, Yuanhe Shu <xiangzao@linux.alibaba.com>, 
	Kyle McMartin <jkkm@meta.com>, Usama Arif <usama.arif@linux.dev>, kernel-team@meta.com, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] iommu/arm-smmu-v3: Default queue depths to one
 page in a kdump kernel
Message-ID: <araUqf6BsJHP7BN1@gmail.com>
References: <20260925141532.1274962-1-kirill@shutemov.name>
 <20260925141532.1274962-3-kirill@shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925141532.1274962-3-kirill@shutemov.name>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_083643_595791_2F78D6FE 
X-CRM114-Status: GOOD (  14.27  )
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

On Fri, Sep 25, 2026 at 03:15:30PM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> All three queues are sized from the maxima the hardware advertises in IDR1
> and allocated at probe, up to 4 MB each on a 4K-page kernel. The capture
> kernel already disables two of them: arm_smmu_device_reset() drops
> CR0_EVTQEN and CR0_PRIQEN. It still allocates both at full size.
> 
> A kdump capture kernel runs from a small crashkernel reservation, and every
> SMMUv3 instance pays that cost again, up to 12 MB apiece. It goes to queues
> that either serve the handful of devices used to save the dump or are
> switched off outright, and it is memory the dump itself needs.
> 
> Size all three queues at one page worth of entries when is_kdump_kernel().
> The queues carry commands and fault records rather than DMA data, so dump
> throughput is unaffected. A shallower command queue only bounds how many
> commands may be in flight before a sync, which does not matter for the few
> devices that save the dump. The cmdq_max_n_shift parameter therefore does
> not apply in a capture kernel.
> 
> Suggested-by: Kyle McMartin <jkkm@meta.com>
> Assisted-by: LLM
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>

