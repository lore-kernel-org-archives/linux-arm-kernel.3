Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE12CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZd7J4AzaFEYU3Ld+9eTdSGEiHz3NkF2yxQgL2W2OfI=; b=w/CM5TRpWdovYC9lAjoBi7roMG
	mCuS679ovg4fZb+kFgSZm/MNj9Gs3Wt6xlyalPLsrbGlhTMdsDWZwcY7TcRiqqDCNXbi/xT98ajR8
	NzF0DldXqRq0GIJ1McmBETegHVL01LvYioUcdp0mSYKCgNRGYGZ9+EuwyRPq5MQIH9z8BdjBiRpMX
	gotybicljf7JiUjV5XBLxgPiJ0584BdBSmY0hhlHVHDSNPvMLBM1ms7bn2P5Pc41udU/kgIF5vCL0
	+Wk0fIxzLboeO9UOjHNBjhDPXOcqTmh1ahfhipNBn2LYyYuybahrvAZP1iNT7mTBgdOzqxsNbkCmC
	lUoaisBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdV6-000000025eX-17BY;
	Thu, 11 Sep 2025 09:21:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdV3-000000025ax-3vvV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:21:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4064153B;
	Thu, 11 Sep 2025 02:21:42 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B51DB3F694;
	Thu, 11 Sep 2025 02:21:50 -0700 (PDT)
Date: Thu, 11 Sep 2025 10:21:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] coresight: Explicitly use the parent device
 handler
Message-ID: <20250911092148.GC12516@e132581.arm.com>
References: <20250512154108.23920-1-leo.yan@arm.com>
 <20250512154108.23920-4-leo.yan@arm.com>
 <64186261-3e65-45b5-a68c-8ec236a75f2f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64186261-3e65-45b5-a68c-8ec236a75f2f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_022154_035825_93FC3AC1 
X-CRM114-Status: UNSURE (   8.91  )
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

On Thu, Sep 11, 2025 at 09:52:20AM +0100, Suzuki Kuruppassery Poulose wrote:

[...]

> > @@ -1393,7 +1397,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
> >   err_out:
> >   	/* Cleanup the connection information */
> > -	coresight_release_platform_data(NULL, desc->dev, desc->pdata);
> > +	coresight_release_platform_data(NULL, csdev->dev.parent, desc->pdata);
> 
> This may be problematic, as the csdev could be NULL ?

Indeed. I will drop this change in next version.

Thanks,
Leo

