Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B56ECAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6p2T2t8gN7fvP/pU/SNL7LD30a8Wt7LjcHIVejA1gKs=; b=ACMK/DaeWPRQJdVOtKgKDisxfx
	CffGd8NVueYDld3hHCYi/3Auwux1Oz/QistZ42K5L7Jua8nT9X1/da6OeEWxoIfZrxhLUnxRtmtqj
	a2nt4A3oCND0VjxzJa4RSOQNU6QFAKYtvhn2oIMFZI3Vhn74DQgjcredaQJlHKpSpkdeMVi5Ogb/D
	D9LslBgEra8PqZevhcqVc347hN0TF2ktoUW8Lwn1SMkMA28a+jIHL5WVlPdA2ykhWfhBWbeUEedo1
	ma+K2eo1Ds7iPOZwduu+JyhjvNLfwHyXaMmHLa5Yc/xOu6X2JFulB1zJS2XkS59P7c4yk2F6cQNNs
	ZRCsb1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yc-00000008s1S-0ull;
	Tue, 09 Sep 2025 17:17:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxuQ-00000007Dzu-26Q1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 12:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8FF743915;
	Tue,  9 Sep 2025 12:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644BCC4CEF4;
	Tue,  9 Sep 2025 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757422637;
	bh=8QS4xAENwRAuWHx2PONshZzPg+6Wl4OLWnziKlPHJOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rqaubvdzpt2E6sZzI6ANiROrCU6b9g7XHQlhQCE4MqlOYTpA+ei6nIaFbE4YQrIMA
	 rWiZ/wvrGy9aGk/ShRg9FlPR0JrG/bODYU1oCMj+z+WiPd8bwizMxKnYTeGbXywy4d
	 K/eUscOPuhowcdbLXS6N1L/D/AydnLKWd/3/QkENlL0VGL62UeYhF9rbWTw+HCmuOF
	 TZy4kiM5B1Hw6nK6LBC1az//u057HvVYhBhWfr2/mSuBERBiiqgktiP6fJL2VE+67+
	 z3hkG7OszNU53Z2BhAD1PTvTvcl1no4q6uqh8fs/p6xcEIYBcbzqtmPaIyHz7D7Iis
	 /zV6Xz4tSi2sg==
Date: Tue, 9 Sep 2025 13:57:11 +0100
From: Will Deacon <will@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
Message-ID: <aMAkJ7CfPQuhvhfm@willie-the-truck>
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_055718_580417_08ED350D 
X-CRM114-Status: GOOD (  19.39  )
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

On Thu, Aug 21, 2025 at 10:33:53AM +0200, Stephan Gerhold wrote:
> Some platforms (e.g. SC8280XP and X1E) support more than 128 stream
> matching groups. This is more than what is defined as maximum by the ARM
> SMMU architecture specification. Commit 122611347326 ("iommu/arm-smmu-qcom:
> Limit the SMR groups to 128") disabled use of the additional groups because
> they don't exhibit the same behavior as the architecture supported ones.
> 
> It seems like this is just another quirk of the hypervisor: When running
> bare-metal without the hypervisor, the additional groups appear to behave
> just like all others. The boot firmware uses some of the additional groups,
> so ignoring them in this situation leads to stream match conflicts whenever
> we allocate a new SMR group for the same SID.
> 
> The workaround exists primarily because the bypass quirk detection fails
> when using a S2CR register from the additional matching groups, so let's
> perform the test with the last reliable S2CR (127) and then limit the
> number of SMR groups only if we detect that we are running below the
> hypervisor (because of the bypass quirk).
> 
> Fixes: 122611347326 ("iommu/arm-smmu-qcom: Limit the SMR groups to 128")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> I modified arm_smmu_find_sme() to prefer allocating from the SMR groups
> above 128 (until they are all used). I did not see any issues, so I don't
> see any indication that they behave any different from the others.
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)

Is the existing workaround causing you problems somehow? Limiting the SMR
groups to what the architecture allows still seems like the best bet to
me unless there's a compelling reason to do something else.

Will

