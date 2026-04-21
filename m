Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C13AF327CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQRJCRvh3+3CqcYUQP1X03mbeiUmVDNq8eF/XFKkSTI=; b=JvYPSwqFGRy2qnSgDIcRxRdfOQ
	tiQYjmAOiPgaVlmJJRohHXq04c2cWfNeAa1Lhtzk73mA2LbuLEbDom1cCTS2SGx/+adCote4qZwux
	iiPEDb4gLuOokhabJpWDDVh+I/HXAWmauzMVHPwtiokrUUqUmRCEV0Hd/t9baAENyuHN7l7qS/lsp
	+Cn3cG3mvGtpEewIrESzNpCQjuzB+g44wwQzsTXmiH17eqAblU3JONu6W4RjAvtr62tT62sYITji1
	scBHRFFz0/PYBj060ZLwHvk9LF0lorRxiFoaID2bCFvZ6Hn4WRBJdayKZdR3Ttj1oA3VTK8g12iRP
	+yHpKqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7Xq-00000008LU8-474R;
	Tue, 21 Apr 2026 09:37:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7Xp-00000008LU2-4AzM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Apr 2026 09:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JQRJCRvh3+3CqcYUQP1X03mbeiUmVDNq8eF/XFKkSTI=; b=EKd23v6UXEoEk3uzNIdxCxnoQW
	ekPkRmJ01BoJK+W0JulQzgBQ1dncYrsoCPwr2Mixnm6LIe4Wwopq9H0vWSi/ejLlbJcj6EDp4Phrl
	KSdIOR+T1wACfXhWJ7UZe6amuCHb25EHxa5pQrSaZPssCGoEbTtV7v463fqpDESu2Et1KhB/jw6+C
	CMU0rV25mUuE33KQshT5Lvk/yQMdeF9Mbf9+88GeRNMIGRTTO11mTgw3b2JsI4Z7C6iuZPeshOBkD
	qkMVOr+W9nP2bOPx1i2ckPhkqUD9cza4EtNgFUGBVsfgQYwanGkG0dwC7tRQcwBVMhj4w5dvFLIfj
	Qy63ez0w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7Xe-00000009V27-1ugA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:37:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A89325E4;
	Tue, 21 Apr 2026 02:37:06 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AE493F641;
	Tue, 21 Apr 2026 02:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776764232; bh=QkpWi8ED+jPXeiW/oTqfzU9UcXZCIKOl4ggmomHOz4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7AqUJ81h3Z+O8hkCQVPSTNfKNcpscfJBocVsdr9hbj5Z4ZClbTA71NtCHa9zLamI
	 DTP65cyiQArSP8wL1Loi0bDMmnYsLnDhSQIU3Bgg8bGTCGRgvlIZrG1TweSv1tOoWK
	 bh3xv2XmTV5SnYH4b7wHOkoypvfSSO54Cxkp64QE=
Date: Tue, 21 Apr 2026 10:37:08 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 02/12] coresight: etm4x: fix underflow for nrseqstate
Message-ID: <aedFRFlBfQfOvwjp@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-3-yeoreum.yun@arm.com>
 <20260416151102.GL356832@e132581.arm.com>
 <fdfd353d-f198-4806-81d2-61f26b678dea@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdfd353d-f198-4806-81d2-61f26b678dea@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_103714_928353_73443C1A 
X-CRM114-Status: GOOD (  17.42  )
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

Hi Suzuki,

> On 16/04/2026 16:11, Leo Yan wrote:
> > On Wed, Apr 15, 2026 at 05:55:18PM +0100, Yeoreum Yun wrote:
> > > TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
> > > in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.
> >
> > My suggestion in previous version is not quite right, thanks for
> > making this correct.
> >
> > [...]
> >
> > > @@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
> > >   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > >   	struct etmv4_config *config = &drvdata->config;
> > > +	if (!drvdata->nrseqstate)
> > > +		return -EINVAL;
> >
> > For "nrseqstate = 0" case, would it return -EOPNOTSUPP instead?
>
> Or should we make this only visible if the nrseqstore is meaningful ?

We could by chanige the attributes permission and nullify the store
operation for that device attributes.

Not only this, we can apply similar approach to other sysfs entries too:
  - vinst_pe_cmp_start_stop_store (when nr_pe_cmp == 0)
  - seq_event_reset_store (when nrseqstate == 0)
  - ctxid_pid_store (when !caps->ctxid_size || !caps->numcidc)
  - ctxid_masks_store (when !caps->ctxid_size || !caps->numcidc)

  and others..

Would you like to include those changes in this patchset?
I think it would be better to send seperate patchset..

Thanks!

--
Sincerely,
Yeoreum Yun

