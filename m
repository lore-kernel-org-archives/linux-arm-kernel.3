Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBF4C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 21:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2Qeaegt7gPI3p1M+fiOMj28QzePyAgRVdlTTwKHzsU=; b=2D+yjLSCOx8Tsq6jiLNZxliqh7
	FKKusAxmWFe0Us3vFUMviPLXNCcVgBteqzJ3pmHceOUft2vLYUvK5BydVWNmvKT65RGg3JiJG0sBl
	Qu84uT5tIt8tSY5tYe+gk+lEGBkUnGPqPzeKWelPmjel1JFr1GWHmSjJTUCqXzi0hwnKXzkblC4cF
	MQZ9Mnb9FB95zVUN33KKjdp8ahrG4aN08Nhud5OwqWQtV1TxeKFZ2C+zeivL9MMqN4LtER1mR6EWy
	oerrdgM8NZLQfWwavW4Gy1iRva1C4mRBRETwQZggtcKoFHCsFgsyFLtZ4Trc/+N1Vsv/MuWXqdaq/
	V0A0tOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigrE-0000000CiK6-39AT;
	Thu, 13 Feb 2025 21:34:52 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigpo-0000000Ci9W-0wWL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 21:33:25 +0000
Received: from DESKTOP-0403QTC. (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id D4288203F3E5;
	Thu, 13 Feb 2025 13:33:21 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D4288203F3E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739482402;
	bh=C2Qeaegt7gPI3p1M+fiOMj28QzePyAgRVdlTTwKHzsU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Reply-To:From;
	b=bNx9G9k2b1k2PvrknvZWUyUuOKi33Pq8K/Yxf4u+Mh57ytYmaCO8Ct8YmR5Vz7tiR
	 hmHm7t++NioulCcTUlm1ahRJLMF083h5rB1Kmlu3WCeT2Pj2k/8MPm5TyVYsv+nCGh
	 okcQsYiSAsGjpyhm/r+dPvd4bv+roNWNqT8vWB6g=
Date: Thu, 13 Feb 2025 13:33:20 -0800
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <jgg@nvidia.com>, <kevin.tian@intel.com>, <tglx@linutronix.de>,
 <maz@kernel.org>, <joro@8bytes.org>, <will@kernel.org>,
 <robin.murphy@arm.com>, <shuah@kernel.org>, <iommu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>, <eric.auger@redhat.com>,
 <baolu.lu@linux.intel.com>, <yi.l.liu@intel.com>, <yury.norov@gmail.com>,
 <patches@lists.linux.dev>, jacob.pan@linux.microsoft.com
Subject: Re: [PATCH v1 01/13] genirq/msi: Store the IOMMU IOVA directly in
 msi_desc instead of iommu_cookie
Message-ID: <20250213133320.5a031289@DESKTOP-0403QTC.>
In-Reply-To: <Z65d4wr1D3F5bBeC@Asurada-Nvidia>
References: <cover.1739005085.git.nicolinc@nvidia.com>
	<a580069c5e494ffffa668218b6fe3a207b01efec.1739005085.git.nicolinc@nvidia.com>
	<20250213122849.34f5d1cb@DESKTOP-0403QTC.>
	<Z65d4wr1D3F5bBeC@Asurada-Nvidia>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_133324_297664_B922EDEA 
X-CRM114-Status: GOOD (  16.68  )
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
Reply-To: jacob.pan@linux.microsoft.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Nicolin,

On Thu, 13 Feb 2025 13:02:27 -0800
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Thu, Feb 13, 2025 at 12:28:49PM -0800, Jacob Pan wrote:
> > Hi Nicolin,
> > 
> > On Sat, 8 Feb 2025 01:02:34 -0800
> > Nicolin Chen <nicolinc@nvidia.com> wrote:
> >   
> > > -static inline void msi_desc_set_iommu_cookie(struct msi_desc
> > > *desc,
> > > -					     const void
> > > *iommu_cookie) +/**
> > > + * iommu_dma_compose_msi_msg() - Apply translation to an MSI
> > > message
> > > + * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
> > > + * @msg: MSI message containing target physical address
> > > + */  
> > Is it IOVA not PA?  
> 
> This is moved from dma-iommu.c so we didn't change that.
> 
> And I think it's correct to say "target physical address" as the
> irqchip driver does pass in a PA via @msg.
> 
> Then iommu_dma_compose_msi_msg() kind of reverse-translates that,
> overwriting the msg with the "IOVA" from @desc.
> 
It is just confusing that the msg can be IOVA, not always PA as the
comment says. I see it gets deleted anyway in the next patch :)

