Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66605CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 14:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rf1zxpmZxhU8kb2GUm4ig3h0L/GcsL20Cabsuz7TTEY=; b=q1ytjX5Wj0qzkIOKOzRL7l7ymp
	EtNOMNetKDI4jbCoPunuFhmnKQR7tA0WDElOR7H9XC6D+MUJ6EzbVsk1gSml5OoNtnOcii7kAzHdV
	E7I2em4m8FUQfDP5OnxgV9e5QEmch7upAVPAhZTLLaniz+JTK56hQxVfTuswzBWJSjWL92rIC9jT1
	n6LOGsiB4Jkt5Q3dHwQBr8Q4fI13YvWXimOkuFR6/3cuhBVFaN21bslfd5Cz1KZmtsBPapZc15afh
	PkEsCefaXvpbKWovaPkcRgiAfYyiSBB4haGwVEePdWj5A+HkR7DiNcS1rD3sDXK7XZ+kmk+WbuhCT
	W2FvrweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6UvO-0000000413A-1xMK;
	Wed, 08 Oct 2025 14:13:50 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6UvL-0000000410z-0Mcz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 14:13:48 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4chZfv4gGzz6L4vx;
	Wed,  8 Oct 2025 22:11:03 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 964541400DB;
	Wed,  8 Oct 2025 22:13:36 +0800 (CST)
Received: from localhost (10.122.19.247) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 8 Oct
 2025 15:13:35 +0100
Date: Wed, 8 Oct 2025 15:13:33 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <dan.j.williams@intel.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Davidlohr Bueso
	<dave@stgolabs.net>, "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
	<peterz@infradead.org>, "Yicong Yang" <yangyicong@huawei.com>,
	<linuxarm@huawei.com>, Yushan Wang <wangyushan12@huawei.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v3 6/8] cache: Support cache maintenance for HiSilicon
 SoC Hydra Home Agent
Message-ID: <20251008151333.00001b94@huawei.com>
In-Reply-To: <68bf52fa851d9_75e3100ac@dwillia2-mobl4.notmuch>
References: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
	<20250820102950.175065-7-Jonathan.Cameron@huawei.com>
	<68bf52fa851d9_75e3100ac@dwillia2-mobl4.notmuch>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_071347_407181_E2CC419C 
X-CRM114-Status: GOOD (  30.09  )
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

On Mon, 8 Sep 2025 15:04:42 -0700
dan.j.williams@intel.com wrote:

> Jonathan Cameron wrote:
> > From: Yushan Wang <wangyushan12@huawei.com>
> > 
> > Hydra Home Agent is a device used to maintain cache coherency. Add support
> > of explicit cache maintenance operations for it.
> > 
> > Memory resource of HHA conflicts with that of HHA PMU. A workaround is
> > implemented here by replacing devm_ioremap_resource() to devm_ioremap() to
> > workaround the resource conflict check.
> > 
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > Co-developed-by: Yicong Yang <yangyicong@hisilicon.com>
> > Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> [..]
> > +static int hisi_soc_hha_probe(struct platform_device *pdev)
> > +{
> > +	struct hisi_soc_hha *soc_hha;
> > +	struct resource *mem;
> > +	int ret;
> > +
> > +	soc_hha = cache_coherency_device_alloc(&hha_ops, struct hisi_soc_hha,
> > +					       ccd);
> > +	if (!soc_hha)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, soc_hha);
> > +
> > +	mutex_init(&soc_hha->lock);
> > +
> > +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!mem)
> > +		return -ENODEV;
> > +
> > +	/*
> > +	 * HHA cache driver share the same register region with HHA uncore PMU
> > +	 * driver in hardware's perspective, none of them should reserve the
> > +	 * resource to itself only.  Here exclusive access verification is
> > +	 * avoided by calling devm_ioremap instead of devm_ioremap_resource to
> > +	 * allow both drivers to exist at the same time.
> > +	 */
> > +	soc_hha->base = ioremap(mem->start, resource_size(mem));
> > +	if (IS_ERR_OR_NULL(soc_hha->base)) {
> > +		ret = dev_err_probe(&pdev->dev, PTR_ERR(soc_hha->base),
> > +				"failed to remap io memory");
> > +		goto err_free_ccd;
> > +	}
> > +
> > +	ret = cache_coherency_device_register(&soc_hha->ccd);
> > +	if (ret)
> > +		goto err_iounmap;
> > +
> > +	return 0;
> > +
> > +err_iounmap:
> > +	iounmap(soc_hha->base);
> > +err_free_ccd:
> > +	cache_coherency_device_free(&soc_hha->ccd);  
> 
> I understand that this scheme works because ccd is the first member and
> that is forced at alloc the same way fwctl does it. However, fwctl hides
> confusing code like this behind put_device() in the free path. So I would
> say if you want to borrow the "_alloc(ops, drv_struct, member)" approach do
> also hide the "offsetof(drv_struct, member) == 0" in the object release
> path and not have eye-popping code like:
> 
>     cache_coherency_device_free(&soc_hha->ccd)
> 
> ...that throws away the allocation side cleverness into a cloud of reader
> confusion. Either make this an actual "device" or otherwise have a kref.
> 
The device option is out because Greg KH was not keen on me using that
infrastructure when we don't have any userspace ABI. 

Kref seems fine but because we have to pass an explicit release to kref_put()
we end up either with the odd looking

kfree_put(&soc_hha->cci, cache_coherency_ops_inst_free);

or wrapping it up with a helper along the lines of
cache_coherency_ops_instance_put(&soc_hha->cci);

That seems reasonable but given there is no real reference counting going on
(the reference count == 1 from alloc to this call) using an actual kref is
perhaps overkill because this is really the same as having no kref and
just implementing.

void cache_coherency_ops_instance_put(struct cache_coherency_ops_inst *cci)
{
	kfree(cci);
}

So other than a rename it is the same as current implementation. :(

So for now I'm thinking have the helper and use a kref even if it's rather
silly just because it will then behave how people (hopefully) expect it to.

Jonathan





