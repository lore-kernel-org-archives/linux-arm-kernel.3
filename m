Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A9FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4n/jYyIhfc/6T0ZjEV+WvOqRBdza2O7cUMYEHIHiTlw=; b=1Fju/1Yg9kqCu/nSedVIsPkqAy
	u/msgG5sHVqZ09L1qEDfwgbYdn/oFU3sCFizSVCrwsu3CqVpFr/XKdQ2fnjavqZzcrOLef7cNYU66
	sSUsQ1PYAO8qrI84gZx0Y5OTIRs1pTaUzka179EAH5sRtCssZ6fivfbHvWUZKz8umRB5KcIQSh6ju
	cBiY3ZQ/m7YDOWT/pTpEz1oy4wSleCLBQifwoRBnR97SLwmDyEDGBCZAVseSFh6LzT7v+hRhKal/+
	kJJnd0GTddXWwsjIrtWem/8VJzqnfmfFyg/RH1N+yHjloo5J1rGHtlc3GKr0YFVJLhJsRo5MzVfCq
	0PoTsJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjmL-0000000DJrl-1Qr7;
	Fri, 03 Jan 2025 15:40:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjjo-0000000DJNS-05m5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 15:37:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09D05A40E21;
	Fri,  3 Jan 2025 15:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7EAC4CECE;
	Fri,  3 Jan 2025 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735918642;
	bh=KnHv5oQRaYx4DU4fQ9sL4Q1OxVgQhnnH0NGST/QZixk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWKUa1MzSSp98zFZJn6r0t5w4VFvnZ3vGnndiVea73h68oea9nfH/0EvHg+RWHpOd
	 byr1RTLZqoBgvYlOk9N3XjOLUnGlxqYqdLtkED9/XjE13dfiYdUTe0r2OwNR8RP2Pu
	 VR6dGqCOPos9xSrTZ1LtQAb4i8VBMkdqlKzPFKkzsFigUgAdXmC2Z1yG17ZsrgNrEB
	 o3mI52ODbFV1eGnZDob3GG4deQ28s3M5EmE75MbbMPeYUwcOEpwSSWM1Wh/FVcktrn
	 Pv9EE30V2ew2k9HkaJLbE6M3GX7kZSuBVwgT14LZ2rvNdXoLKe+603UVNj9piP5o+O
	 Mx6BKHL3vjOXQ==
Date: Fri, 3 Jan 2025 15:37:17 +0000
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
Message-ID: <20250103153716.GE3816@willie-the-truck>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <28bd756a-e0bc-49e7-9415-4c05d38c5e28@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28bd756a-e0bc-49e7-9415-4c05d38c5e28@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_073724_126081_CA00F88D 
X-CRM114-Status: GOOD (  16.53  )
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

(please don't top-post...)

On Mon, Dec 30, 2024 at 06:45:29PM +0530, Bibek Kumar Patro wrote:
> On 12/12/2024 8:43 PM, Bibek Kumar Patro wrote:
> > This patch series consist of six parts and covers the following:
> > 
> > 1. Provide option to re-enable context caching to retain prefetcher
> >     settings during reset and runtime suspend.
> > 
> > 2. Remove cfg inside qcom_smmu structure and replace it with single
> >     pointer to qcom_smmu_match_data avoiding replication of multiple
> >     members from same.
> > 
> > 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
> > 
> > 4. Introduce intital set of driver changes to implement ACTLR register
> >     for custom prefetcher settings in Qualcomm SoCs.
> > 
> > 5. Add ACTLR data and support for qcom_smmu_500.
> > 
> > Changes in v18 from v17_RESEND:
> >   - 1/5 : No changes
> >   - 2/5 : No changes - reviewed-by tags collected
> >   - 3/5 : Addition of
> >     pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
> >     around register access of PRR related private interfaces
> >     as discussed in v17_RESEND.
> >   - 4/5, 5/5 : No changes - reviewed-by tags collected
> >   Link to v17_RESEND:
> >   https://lore.kernel.org/all/20241114160721.1527934-1-quic_bibekkum@quicinc.com/
>
> Thought to follow up on this thread to highlight the latest version (v18) of
> this series, in case it was missed during the vacation period.


I'm waiting for Rob (Clark) to ack the last patch, as he had comments on
the previous version.

Will

