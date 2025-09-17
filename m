Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91B3CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLzT3if3EFq0Vy+MGKYHVpTD3ltYkpip8ZLDrNzE6OA=; b=a34Eb4xVKofOGndbvsygtvKkBW
	YYIB/Gf2bW27lXEE+iGzDKcOzKiavlf02xrLDr0txYGc5l2v++m0gPxCmxl5qWEOByXFlFLZY8ytz
	HUIbez91KI36LqU8l94ruejZP0a0Wx6AmnjIblYAA9/jxruq+WkzCiHsLYKxtQ855Cnz7pDlMq5sP
	Ykg455R7pGzdmC2keYqvC63SsOQXU1Tr9ZckBiWMJYTbBVm/QUoDh1kH76XL7JYB8iprtdr0GwPQK
	derynfyuChX2NKDvqtpSOaQ12uxjRJ4LJBEw9tM6YIfaWpyloSRnHjE78GWobu8n0357ilsNQn2id
	7AE/E5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyobi-0000000AoLN-2K9i;
	Wed, 17 Sep 2025 09:37:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyobg-0000000AoKx-1N6d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 09:37:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBFC925DC;
	Wed, 17 Sep 2025 02:37:34 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D55F3F66E;
	Wed, 17 Sep 2025 02:37:42 -0700 (PDT)
Date: Wed, 17 Sep 2025 10:37:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Carl Worth <carl@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Sabrina Dubroca <sd@queasysnail.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: Fix data argument to coresight_enable_helpers
Message-ID: <20250917093740.GP12516@e132581.arm.com>
References: <20250916224441.3008824-1-carl@os.amperecomputing.com>
 <a331eceb-ec49-4396-a61d-78a75789b090@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a331eceb-ec49-4396-a61d-78a75789b090@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_023744_408344_191C5089 
X-CRM114-Status: GOOD (  16.33  )
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

On Wed, Sep 17, 2025 at 09:35:55AM +0800, Jie Gan wrote:

[...]

> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > index fa758cc21827..b1077d73c988 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -510,7 +510,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >   		type = csdev->type;
> >   		/* Enable all helpers adjacent to the path first */
> > -		ret = coresight_enable_helpers(csdev, mode, path);
> > +		ret = coresight_enable_helpers(csdev, mode, sink_data);
> 
> I dont think we can change back to sink_data since we introduced
> coresight_path to wrap 'data' which is needed by the path.

This change can fix catu issue but will cause regression for ctcu
driver.

> I suggest you to add the struct perf_output_handle to the coresight_path,
> then retrieving it with data->perf_handle in tmc_etr_get_buffer.
> 
> before:
> struct perf_output_handle *handle = data;
> 
> after:
> struct coresight_path *path = data;
> struct perf_output_handle *handle = path->perf_handle;
> 
> We can assign the perf_output_handle to the coresight_path after we
> constructed the coresight_path in perf mode.

The suggestion looks good to me.

Thanks,
Leo

