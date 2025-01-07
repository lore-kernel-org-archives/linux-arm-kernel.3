Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8F6E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGyFzBYLbkttK/LRowrkGp5iXsZgG3F1AvMS083cHCE=; b=P0Utaf5FJcyIXrVdnkYgja4P+f
	8V3IIpb4H21rWe1jhQm2CVjTHP7sUUF7PyV+8hHQfsxXzBh/wIl1BooglI2gMZCjcG/3QuYhGA9ev
	DK7exa7RdxLgnW9BMzkfzmi65nlfuxcQfD+8F5M/CY+xMiEQpch6eHLu9aGD11wMKoNwYkL54RNGh
	oYu3N9pGIUPWZNQaOOCEmddW68tEMN0FRvIg++eHF2PmXfiw2WTyBqMlm5zMq827ArgdOG5XQB7KM
	Z63+1ar/dZh+h8dgAZ39Y/78jlijkh6rbJ6GSRmGqmLyqZ1IIRGhT9sW5Yayh4K9cW8nho2Z6KrZ4
	Jx8cwOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV651-00000004ABs-1kLT;
	Tue, 07 Jan 2025 09:40:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV63o-000000049r2-1uWB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:39:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53D175C551E;
	Tue,  7 Jan 2025 09:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0D4C4CED6;
	Tue,  7 Jan 2025 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736242779;
	bh=kqqn99pnJM0rkF1It5qQUKFSbiZOaPNoOD3RfHi+LAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Non02Xq9vfAyxaxzlq7noOiILjr0HYoodgY+Z+X7m3H3dnAw7skS7A/8R7ADS6GtO
	 ywYB47LXlHzouPnCPtk3O+vdEUi+tBUTFPFI7jljT9oB4bNsr2WHLol98KRY/PvEMv
	 9pIAKvEY4UXSfnL8ufhLhZeUWWjXYpOJUD7Yw48Di3PBdg5Us65vjgra+1YECNe5v+
	 9WoZrc1enHWnm0sIXqqqRIdmICp0PFl6n3bWrBt5AaXBdd9Q0GYEo79rNQeRAodZIO
	 2coIdV+IPB/QZOBj5AlfenAh3OFfKQDxqAoS+pitPyE3WMEVEkCnAOPneIc7LHIB+o
	 pMuV4RMRJSAxQ==
Date: Tue, 7 Jan 2025 09:39:33 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robin.murphy@arm.com,
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
Message-ID: <20250107093932.GA6713@willie-the-truck>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <28bd756a-e0bc-49e7-9415-4c05d38c5e28@quicinc.com>
 <20250103153716.GE3816@willie-the-truck>
 <CAF6AEGua_WfLd2PQv42NK3R1oOgJ8wNf6yt6We4tH0GFkHPnoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGua_WfLd2PQv42NK3R1oOgJ8wNf6yt6We4tH0GFkHPnoA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_013940_535913_2905C06C 
X-CRM114-Status: GOOD (  20.76  )
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

On Fri, Jan 03, 2025 at 10:16:43AM -0800, Rob Clark wrote:
> On Fri, Jan 3, 2025 at 7:37 AM Will Deacon <will@kernel.org> wrote:
> >
> > (please don't top-post...)
> >
> > On Mon, Dec 30, 2024 at 06:45:29PM +0530, Bibek Kumar Patro wrote:
> > > On 12/12/2024 8:43 PM, Bibek Kumar Patro wrote:
> > > > This patch series consist of six parts and covers the following:
> > > >
> > > > 1. Provide option to re-enable context caching to retain prefetcher
> > > >     settings during reset and runtime suspend.
> > > >
> > > > 2. Remove cfg inside qcom_smmu structure and replace it with single
> > > >     pointer to qcom_smmu_match_data avoiding replication of multiple
> > > >     members from same.
> > > >
> > > > 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
> > > >
> > > > 4. Introduce intital set of driver changes to implement ACTLR register
> > > >     for custom prefetcher settings in Qualcomm SoCs.
> > > >
> > > > 5. Add ACTLR data and support for qcom_smmu_500.
> > > >
> > > > Changes in v18 from v17_RESEND:
> > > >   - 1/5 : No changes
> > > >   - 2/5 : No changes - reviewed-by tags collected
> > > >   - 3/5 : Addition of
> > > >     pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
> > > >     around register access of PRR related private interfaces
> > > >     as discussed in v17_RESEND.
> > > >   - 4/5, 5/5 : No changes - reviewed-by tags collected
> > > >   Link to v17_RESEND:
> > > >   https://lore.kernel.org/all/20241114160721.1527934-1-quic_bibekkum@quicinc.com/
> > >
> > > Thought to follow up on this thread to highlight the latest version (v18) of
> > > this series, in case it was missed during the vacation period.
> >
> >
> > I'm waiting for Rob (Clark) to ack the last patch, as he had comments on
> > the previous version.
> 
> You mean 3/5?  The latest (v18) lgtm, a-b

Sorry, yes, I meant 3/5. Thanks for having a look!

Will

