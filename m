Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363D3C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+pGX1kR1YWXhGrmpKIk1Ega27SLYogpSDSn/oUaopE=; b=HT7PUZIPhg7ESKh7Rx+Jxm50zf
	+ByqlLQ90Z0xSUZpnMiiSZAOQx87x/4XNlBebNRN8DlWorsUWS7u8K8kzdYZypZgbQR1C9igl3b/j
	9pJYHDzS4YUJkKSeF4L6RhYKZg44W7J8b5y4DF/EaWCng7O/c91lSz7/66XAQvuPQ3j5LKSG+cK/I
	viD5CnVaVGcz/glcw5HXvn9LvTP2xmPQtIDwAXxOfjSBe3qf0eVVDik9qiLuUERCSn7pR8NfHstUi
	yqR/7Ew6hTdRPuSA6uBI8lbpYV0XZQWqcqbbhlW/MVboEHinbtf+cAiMAEdLkCTiqXLDfCXYI3aGD
	MtuVyRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24P8-0000000H2pb-0zKn;
	Thu, 03 Sep 2026 10:10:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24P4-0000000H2oa-2Q1H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:10:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so979345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788430241; x=1789035041; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v+pGX1kR1YWXhGrmpKIk1Ega27SLYogpSDSn/oUaopE=;
        b=qAZqxo2d/uOUmi6TbKNNMCfMcIwc9IBa2NvC+B7s4qXRQKVs8AcrSdgN4slHApSsUE
         1JrpGN8MwufiDnqEe49ImHrb+l6L35YMiQr89idY8F66NfACjTZvlDcX4uH6VsOgnaJ7
         hhdrP3JmxS5zzja90r/UEmlP59Slp8cgiYhs0LRgZlQGw5BfdeudB709vaRwsQ25xNqR
         AvmnWh3OiRxPYPHQF3qOS7F756vSM1UVBmMw5C0hXhFxqg/QhJvUZtDoRYr1KSaaGYRg
         dqKu2k5+Dif71Qdzpp+0t0ClnZMBHWGJ5vwOVF/t64yQS23+ts/ZtSCrb+2G6ys8YbmJ
         legA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430241; x=1789035041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+pGX1kR1YWXhGrmpKIk1Ega27SLYogpSDSn/oUaopE=;
        b=X1/fOhVo+UVc2GumCfkhqzeY8Nogbz8koXmf49j3WZ/kFWeFei2WalCZeMHvI7Nz6R
         oYvCq/JoLlap1wkttuBsNsmecRVcuZcrFvW2FMo8IYWvfM7ScfVzIuR1cdWjg4cHIgeX
         5nyAwxnT2dLQAqT0FPfYdsU5mHiAvJcr99RmZV7QVWX64zjIkjJnI+oCh1iKbdeFNwul
         07P7eppyS2jEQ5rP//ijiqsH8SSfooz0ld+5uoIe1sogEg91hS/jcZQ5nKh/Fr/iHG7O
         gJ4XvrVLf9k+/yGixS774/4PeHP9kYeLTvjDPaqSABAmu4R6Ix+LNWzu+hGZLKcNESF7
         03kw==
X-Forwarded-Encrypted: i=1; AKwUvBx4pOnY4DcnRMf9pD0igvF3SDGX1b9B495qGS/CKN0ZQHvN6XixtUMEDtDjuDC60Swr8pTwhvnQqDkOZwOTgW97@lists.infradead.org
X-Gm-Message-State: AFuF++ksHK6O2zFWMY19H/xXsCq7e7LP+vXVsUUXoULhEb37cs+F19Yh
	CVpAZ3He0vuBCCsTotZXl+CU54zcTYm+l3XuksZ2frFQd+TX0SrVBiIQnewkk07HIw==
X-Gm-Gg: AYBFou2dVPJ6tijA7pAWdXjo71UiTfo1l2NUp+9GJixiDg6pSmiJTiJBDcZ3UlwIIRb
	h2EDm90NlgmwNvK5v5T/hB0JQAiK5Z3wcB5jHVvmjeLN7hgxy4+y0YocD5nIY1RZwUsUuOhTeRr
	Q57O9yq4dbXB3h1muZv21tTn+d+Z/GDKCP6wDXfRjkLWf9LXqwF6A933pZtPjJzuMD5tiwex2yc
	baAvLqE2982MvybBFw0KGYUZObIioj9Mbp0bN6pVzwqa9TZrs/vA4s3Ol2nO6Olsv6DASWBGkX1
	MDy2MqlLWWP80ufQ/0JLpu5r/9IPtAjE+DZjtpEwNax7Sb+9n5lA5eMVUAam9324pgbgzz3Bs36
	8ab09g8OzM0aEq3uQHALY8A0vYhe8MpxQU+LW1czT5sjDrUlWEinLz2LIVcKqKi4jXL93WZQTP8
	rn6pdgoVy36LtdG8FXkQV5Q0inyfhkt0jytVb8MvaPyonXEp2vvrk/5Z8/sKKrIjeSiftz7EpP5
	rygi4Ahgp6C5kc8UmQgeDsxmGoWPqkoluyRgjkYqmvIJw==
X-Received: by 2002:a05:600c:1906:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49ce57e7a9dmr190171115e9.4.1788430240105;
        Thu, 03 Sep 2026 03:10:40 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf2531232sm33980375e9.7.2026.09.03.03.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:10:39 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:10:36 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Rob Herring <robh@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 09/10] firmware: arm_ffa: Introduce ffa-lend-pool
Message-ID: <aplHnDS2e-Cd5yPC@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-10-vdonnefort@google.com>
 <20260902173826.GC1440252-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902173826.GC1440252-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_031042_630961_AC2EA2C7 
X-CRM114-Status: GOOD (  20.53  )
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

On Wed, Sep 02, 2026 at 12:38:26PM -0500, Rob Herring wrote:
> On Wed, Sep 02, 2026 at 11:47:11AM +0100, Vincent Donnefort wrote:
> > When memory is lent to the Secure world via FF-A, fatal CPU speculative
> > reads from Non-Secure can still occur as long as it retains a cacheable
> > mapping to that memory. Introduce the "arm,ffa-lend-pool"
> > reserved-memory CMA driver to unmap pages before lending
> > (ffa_prepare_lend()) and restore them upon reclaim
> > (ffa_lend_reclaimed()). Devices bind to the pool via the "memory-region"
> > DT property or via ffa_lend_pool_attach().
> > 
> >   reserved-memory {
> >       #address-cells = <0x2>;
> >       #size-cells = <0x2>;
> >       ranges;
> > 
> >       ffa_lend: ffa-lend-pool {
> >           compatible = "arm,ffa-lend-pool";
> 
> Needs a binding schema...

Ack

> 
> >           reusable;
> >           ll-map;
> >           size = <0x0 0x4000000>;
> >       };
> >   };
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> [...]
> 
> > +static int __init ffa_lend_pool_setup(unsigned long node, struct reserved_mem *rmem)
> > +{
> > +	struct cma *cma;
> > +	int ret;
> > +
> > +	if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
> > +	    of_get_flat_dt_prop(node, "no-map", NULL)) {
> > +		pr_err("FF-A lend pool: node must be 'reusable' and not 'no-map'\n");
> > +		return -EINVAL;
> 
> Your schema should enforce/check this.
> 
> [...]
> 
> > +static const struct reserved_mem_ops ffa_lend_pool_ops = {
> > +	.node_init	= ffa_lend_pool_setup,
> > +	.device_init	= ffa_lend_pool_device_init,
> > +	.device_release = ffa_lend_pool_device_release,
> > +};
> > +RESERVEDMEM_OF_DECLARE(ffa_lend_pool, "arm,ffa-lend-pool", &ffa_lend_pool_ops);
> 
> Do you need this early? If not, you can create a platform driver for 
> "arm,ffa-lend-pool". ramoops is implemented that way for example.
> 
> Rob

Only memblock_mark_llmap() must be called very early.

The rest just need to be in place before the TEE driver probed. So a platform
driver should work.

Thanks!

-- 
Vincent

