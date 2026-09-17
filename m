Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904B0C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dWYS3ZZvJkfTmwwGBzOMGNsuxhzxqg/70St3SRcFJY=; b=AxKHUb0KmNn2R/rHymy95EKUeD
	b1fDpTuFBEfW33rcd3I7Ud6HB9ez8bXJq22qHh0/hzeTG3HinULon1Yjj6Kq4azao1PszTyViPj97
	DW7GelT8Bb/ih1gPEzYQTAt1sUbTmm5x5b3wNWFKa3vfYIV9q4YOlJSn1ymOwJ2M4VjGhCSaSOk5Q
	bfOA0RcW7tUCOUYhnldgmtH4+cXPb9zhnaV8l6mhDo+ig0ijvTc772ROtewZZniLdTznfjlJdvKNh
	ZSC4Y72nSQWrmzhzy6KuBk1TfKWBhKwax/mpZYXskHHOnRRJKGysqmUq3W5tsneqSSP9itJtrekyV
	R0zf0aRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DPG-0000000BaKj-1zH2;
	Thu, 17 Sep 2026 14:48:10 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DPD-0000000BaJi-1p7R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:48:08 +0000
Received: by mail-qk2-x11.google.com with SMTP id af79cd13be357-93910ca5aa8so76504785a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789656486; x=1790261286; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3dWYS3ZZvJkfTmwwGBzOMGNsuxhzxqg/70St3SRcFJY=;
        b=Sh8h8ziuGOlUVNgXxHeH6PNDV/cTxVbAG335wQEtmZz5Z/iNLUjmbLLqev35i6+TK+
         8YOC+BwWWoMB5jBnj881Sfuvg3qm8EfAe2cXgJtsVP75pS2cP8EF5AFsGTwAF6M2Nov4
         gV3S3MpqceO45ZDX+MOnwaXa2i11I1yqJCRyOkA0I5dtOl577RplFnwWEaQSBx3/23NN
         CPD5UcWbzkK3UT8Ux92n+jmk+8oriegAKt0xMniOIguZwNclqkl+HydJbecNNFZDpFzk
         CnVJda/OWbcGsclYK3Zr91600IluBKCxgiLPCSepENMVMb6UmRgLGK18I6lA75yd2r8j
         aaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656486; x=1790261286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dWYS3ZZvJkfTmwwGBzOMGNsuxhzxqg/70St3SRcFJY=;
        b=M+kdMHigEz++2PPZkRYrSFdN/0MhHLGJZV18qJKTBn1pFfmJUZ5pOP8/s7UTNDHzu/
         WiUdEi/mLq13TDY0CZ9I2FJsRvffkVd3iH1OpLXRt5O+ipDoFVcRxUb2rSTpixoalm/E
         JiTe5TtIy5MSLIyOy4hhkpMvOraRGEvoSJO+AZmUkACvl7/rV1mG/8NI+MzjQNq4Y2qM
         CFUSfCDSBG4KC2l+Dehde4I4mAiaiz4Gkx2WhpBizAz6/D3bdsjO6P9e765wt2os3opp
         n0r7RReRXdfW/V4ZDsj5w6JLspxmMz6Ygy6m/32eNr3trtw/7znhbC/WchAPUrWc073g
         vtmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOQugOvy+pfBHiUzpc7ZzzpA/7nDmvzCd373lNE8+Nn2pJ+zHxeXFND6xIjn/WIqROyS1gTf0pdUK3ZhIYoFHg@lists.infradead.org
X-Gm-Message-State: AFuF++l9L1DAYzYchgf6r96y0Rcilit91kBmsuKEbWR3/jdcJuJQITp2
	ieD1q2nDf9zooeSlq7kDUBJ2AzWB7c+P2BXfzHSRo3iwNsDZOmHOphTdBi2oItng5ZviiHykqWj
	Vh4hZ
X-Gm-Gg: AYBFou133Qsf4DJAQ6FKTTjN52oSC23m0Mj8pY3qBsgQOHdUbD6I9BFQ07FYiZw+dSM
	xWEVHoniRIOytoes7U0sPAusnqrvEVwP6gtdG5mR9id9qC2Ohdr4k/mlmLQg8p2MYhVCIuFdpWi
	8DOtF+y/SvzxX+nn4HQHXKfkZBPDYkZzW6KrwqqWzspPXrsYNqfzquD46d87BAe0oBVE9KtaeJh
	orqCdVHTgLiq9NP7ICokc5JfYgFBNmafmGnNGw5uO2kH8LdMjv57UEZSWXFy/0VXznvvlak5VKH
	J0xQ//b643yR2H7F64XS9J4KsPknRbExQiXc0zaPtKP87QWv4kT48CDPw7x7l0xyySxPW5VlN69
	CLg4jbT2X780s2lBogjMLWBCaJ92ibL6Ee3wbi2I9QsnjeGdv7z/aRlRR6jOgkEC+uvsYOIIKDo
	7HqtUc8P9BgDYaPk6r2mDHJ82f2bipOqbpIM1O/MoajpX35bVQLrJnuP2gXx84zhfrHkLBW+zES
	JWxC/y7IkwSqG1dLfgld51wulanTEd729NlPjN04CsdZwre6KnO50mc
X-Received: by 2002:a05:620a:800e:b0:939:5c62:fddd with SMTP id af79cd13be357-93bb772cd8cmr1243423385a.19.1789656485922;
        Thu, 17 Sep 2026 07:48:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7821d231sm483562385a.21.2026.09.17.07.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:48:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7DPA-0000000Ctlh-2V45;
	Thu, 17 Sep 2026 11:48:04 -0300
Date: Thu, 17 Sep 2026 11:48:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@oss.nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/4] iommu/arm-smmu-v3: Support shared Stream IDs
Message-ID: <20260917144804.GI3196566@ziepe.ca>
References: <20260916-smmu-shared-sid-v1-0-517384504aee@nxp.com>
 <20260916161018.GE3196566@ziepe.ca>
 <aqtDg1EH95RYOdCJ@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqtDg1EH95RYOdCJ@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_074807_485249_CB6CE9EE 
X-CRM114-Status: GOOD (  26.38  )
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

On Thu, Sep 17, 2026 at 09:33:55AM +0800, Peng Fan wrote:
> Hi Jason,
> 
> On Wed, Sep 16, 2026 at 01:10:18PM -0300, Jason Gunthorpe wrote:
> >On Wed, Sep 16, 2026 at 11:12:33PM +0800, Peng Fan (OSS) wrote:
> >> Some SoCs have a limited number of IOMMU Stream IDs (SIDs) and
> >> hardware that inherently shares them. For example, the NXP i.MX95
> >> eDMA controller has 64 channels where each TX/RX pair is assigned
> >> a single SID by the hardware - the two channel devices are distinct
> >> from Linux's perspective but present the same SID to the SMMU.
> >
> >Is that a reflection of poor DT modelling though?
> >
> >Why must a TX/RX *PAIR* have two platform_devices nodes?
> >
> >Fix it there and you don't need any of this? Or is there more?
> 
> I think there may be a misunderstanding about the device topology here.
> 
> There is only one platform device node for the eDMA controller
> (dma-controller@42000000). There are no separate platform device nodes per
> channel pair.
> 
> What happens instead:
> The fsl-edma driver probes the single platform device. During
> dmaenginem_async_device_register(), the dmaengine core calls

Yes, and if your DT is correct then that platform device should have a
single iommus = [] listing all the SIDs for that logical device.

Using iommu-map to describe synthetic dma_chan_dev devices that the
kernel creates is the same kind of DT abuse from over here:

https://lore.kernel.org/linux-iommu/20260618151745.GD231643@ziepe.ca/

So the problem is self created, by using iommu-map instead of iommus
and using DT to describe linux SW expectations you end up in this
strange place of asking for aliases.

> The iommu-map property sits on the eDMA controller's DT node. At channel
> allocation time (xlate), the driver calls of_dma_configure_id(chan_dev,
> edma_np, true, &chan_id) to look up the channel index in the eDMA node's
> iommu-map and attach an IOMMU domain to that specific channel device. The
> dmaengine framework's dmaengine_get_dma_device() API
> (which checks chan->dev->chan_dma_dev) then returns the per-channel device
> instead of the parent platform device, so DMA clients map buffers through
> the correct IOMMU context.

So go back to the basics, why did this platform use iommu-map instead
of iommus? The only real difference is you get a DMA translation per
queue. Is that required? Are you short IOVA? Some other reason?

You can read what I wrote about this general problem before:

https://lore.kernel.org/linux-iommu/20260818130724.GA5482@ziepe.ca/

It would be really nice if you all could work together to figure out a
better way to handle this than through DT abuses.

If you really need unique translations per sub-compoment of a logical
device from some pool of SIDs that feels like a weird version of PASID
to me, it may be an interesting to explore.

Jason

