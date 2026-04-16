Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7D1F8D763
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 17:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RukyPoOZ9qo8mxPquRbIiUvY88OfoFmZHRJ2dPg6rc0=; b=heDVw4ChgkOt77yn9neckOv1Qg
	o2jKExVrmZqfA2uVcKfuPDZDte0z+jn82HCU9OTjx2QS6y/SUzPbpQxzrVy6EV/LSOQggObcrlPSZ
	tl0AUS6DYPTr+scjjiU1ki9t5axgL6GK84B4BQC3KjgNCCPKTXVzCyAC8YhQqDA9lQF5oxZGjjzyl
	3TNF/o20ObmpBw+2JEF4LgMNvadGeZMvuuNGeEm+eV9sFs9D/Unp1LP5TYugZ9XtNScDQcWkhqtCt
	WNHEke5kX/qdahJGdhEPjF3Zo+G9Sg+7uZ7SKlEWMf3F65Y0Fmya7Hklt2vafe8+vqAvpmpd7nOBl
	0DmOxpxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQBu-00000002hd9-26RB;
	Thu, 16 Apr 2026 17:07:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQBs-00000002hcd-29jx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 17:07:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36CBF24E9;
	Thu, 16 Apr 2026 10:07:37 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 634C13F7B4;
	Thu, 16 Apr 2026 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776359262; bh=nDteDOdJ6WLwX1WgNSqExb0QSln8I4f8AiInBzL0914=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nn07vt5TJP1Doge5mqk1fbgOpaHirrwXWwE0rEsPhtJt6BjthqZakDg2KW1qLgBgg
	 CgrzpNmsYRGMB7XeiXn4B/tU9OjvwOku/aGvaqZ4rbPVKX4caimqgPAE5NAalW3LiO
	 7tw/7/dooFJBfN/uNdAEvEmkCx4BGEMvOVu/6UHg=
Date: Thu, 16 Apr 2026 18:07:38 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 02/12] coresight: etm4x: fix underflow for nrseqstate
Message-ID: <aeEXWnrFEwgja3al@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-3-yeoreum.yun@arm.com>
 <20260416151102.GL356832@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416151102.GL356832@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_100744_594046_B558862D 
X-CRM114-Status: GOOD (  13.53  )
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

Hi Leo,

> On Wed, Apr 15, 2026 at 05:55:18PM +0100, Yeoreum Yun wrote:
> > TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
> > in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.
>
> My suggestion in previous version is not quite right, thanks for
> making this correct.
>
> [...]
>
> > @@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
> >  	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> >  	struct etmv4_config *config = &drvdata->config;
> >
> > +	if (!drvdata->nrseqstate)
> > +		return -EINVAL;
>
> For "nrseqstate = 0" case, would it return -EOPNOTSUPP instead?
>
> Otherwise, LGTM:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Yeap. It's much better to return -ENOTSUPP in here.
I'll change it.

--
Sincerely,
Yeoreum Yun

