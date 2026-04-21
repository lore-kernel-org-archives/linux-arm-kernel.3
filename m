Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23214F89220
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNjjiRmHFAVsekADJqma64aVwQrk+ERG2MMcqqQqegQ=; b=JdpzTXaCNIoCcnTjbZE5sEnIip
	6QMN2hBFtra2Xenn3MArO0BwVmTypcwf0xgBHDewTS9pchQOE5cWxilO0izhAT2US+vkHeAUQkbI5
	1Wb3zNRsBRizYnc9Fl2/D3GZI27EAUzA4Lhzw/YFbb6nSf1EpRGY/SiIiaAPoOBZcE68Mdccm/XjR
	cpeLcPg2tYajP1OCMA4jU09ew20o/WGnay57giTNENHtRHdQADhrahd8MkHANNjFQku4rz4CSXxmA
	/lXLVf8qW9mC/NK7Vcnla7aN1N1dOJnW+gXv6xo2aRokky9/zVOPuy253og2lzlINkMZ9IIlBrFDM
	RRjXzgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7qP-00000008NWB-1aNh;
	Tue, 21 Apr 2026 09:56:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7qN-00000008NVd-0gxa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:56:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D59E326A4;
	Tue, 21 Apr 2026 02:56:27 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBA2A3FBCB;
	Tue, 21 Apr 2026 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776765393; bh=FNjjiRmHFAVsekADJqma64aVwQrk+ERG2MMcqqQqegQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VqAtaml1dSiFEsuIRFZ2zH/DkJzvYlrZMQoiSGGxdx/s8mNw/dQ1OTTZ54vgim+o6
	 gkHfaInNl3cGvxxwssFYQ6SsNh3vsXpdd4UyjHltmdmFAeuQqyN9inBmw3vxGR/pQJ
	 nMuDWrcDoQYgPeN2rXRgOQKOyXCBpw/unAMZwvgc=
Date: Tue, 21 Apr 2026 10:56:29 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 02/12] coresight: etm4x: fix underflow for nrseqstate
Message-ID: <aedJzZoBQlw0Ql07@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-3-yeoreum.yun@arm.com>
 <20260416151102.GL356832@e132581.arm.com>
 <fdfd353d-f198-4806-81d2-61f26b678dea@arm.com>
 <6dcb14c1-0759-4f2a-8bbc-b85adf3d12f4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dcb14c1-0759-4f2a-8bbc-b85adf3d12f4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_025635_256509_84EF601F 
X-CRM114-Status: GOOD (  16.60  )
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

On Tue, Apr 21, 2026 at 09:50:56AM +0100, Suzuki K Poulose wrote:
> On 21/04/2026 09:50, Suzuki K Poulose wrote:
> > On 16/04/2026 16:11, Leo Yan wrote:
> > > On Wed, Apr 15, 2026 at 05:55:18PM +0100, Yeoreum Yun wrote:
> > > > TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
> > > > in which case n ranges from 0 to 2; otherwise,
> > > > TCRIDR5.NUMSEQSTATE is 0b000.
> > >
> > > My suggestion in previous version is not quite right, thanks for
> > > making this correct.
> > >
> > > [...]
> > >
> > > > @@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
> > > >       struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > > >       struct etmv4_config *config = &drvdata->config;
> > > > +    if (!drvdata->nrseqstate)
> > > > +        return -EINVAL;
> > >
> > > For "nrseqstate = 0" case, would it return -EOPNOTSUPP instead?
> >
> > Or should we make this only visible if the nrseqstore is meaningful ?
> >
> > Suzuki
> >
> > >
> > > Otherwise, LGTM:
> > >
> > > Reviewed-by: Leo Yan <leo.yan@arm.com>
> >
>
> Also, please add Fixes: tag for these bug fixes

Okay. I'll add the tag. Thanks!

--
Sincerely,
Yeoreum Yun

