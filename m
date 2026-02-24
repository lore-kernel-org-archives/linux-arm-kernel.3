Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D110DF3C9A8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tv9tDjFPNsZB0EIWyR3fsFVW00y9HH6AxTenWSD/bjI=; b=elc1oKZCUdxDyzU6r787GU6NSh
	SePycd9IB1HkiEUOQ6XHFWZSPrwZbUWQNMX50sBpk0Fync6IQY9ezLJoQAhy4mjD31qG9bTFkCi0D
	xMQmSrj0e1eABPoOQNe8mUYeBewcQ41HJYEzrdGa3goiNBHfmWQXtATmrsxmgUg96daoGplBYApx4
	pTYt7LHnb9DVo8WDcKIejx0g9taTOlTOrUGDgbcMZMXtn+V2Cy3kg85EMnI/lR0S+Ay6rYcMQ9lxu
	SgEud5IQt3SnJmatTFQv+NCfOmGVQ1iwIk616y1yinytghL4BK7n0ztF6C9dKQNI0LtjFPeNIUcg/
	EyDAd6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuunF-00000002MSY-0Hgw;
	Tue, 24 Feb 2026 15:57:49 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuunC-00000002MRy-1TVS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:57:47 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fL2RQ5VB5zJ46Zj;
	Tue, 24 Feb 2026 23:57:22 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 8DCEA40539;
	Tue, 24 Feb 2026 23:57:44 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 15:57:43 +0000
Date: Tue, 24 Feb 2026 15:57:42 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Nicolin Chen <nicolinc@nvidia.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <bhelgaas@google.com>, <joro@8bytes.org>,
	<praan@google.com>, <baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <20260224155742.00000282@huawei.com>
In-Reply-To: <aZ261odHq5gwQYXg@nvidia.com>
References: <cover.1771886695.git.nicolinc@nvidia.com>
	<bdeebd35e81cfa5f76d16706a775b23ee1f01fdd.1771886695.git.nicolinc@nvidia.com>
	<20260224120615.00003ad9@huawei.com>
	<aZ261odHq5gwQYXg@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_075746_543516_4BE53BDC 
X-CRM114-Status: GOOD (  15.35  )
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

On Tue, 24 Feb 2026 10:51:02 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Feb 24, 2026 at 12:06:15PM +0000, Jonathan Cameron wrote:
> 
> > In my head at least, it would be nice if a driver had to explicitly opt in
> > to this behavior. The presence of CXL.cache support for instance doesn't
> > actually mean the driver is going to enable it.  However it is probably
> > harmless so lets go with this as path of least resistance.  
> 
> That same remark applies to ATS in general, we have no idea if the
> device is going to use it when turned on or not..

Yup. Understood. That's the bit that smells bad to me.

> 
> Generally Linux has taken the approach of almost always enabling ATS
> if the device offers the PCIe capability.
> 
> The purpose of this series is to close of the few "almost" cases so it
> is always on.
Absolutely understood.  I just took the opportunity to moan!

J
> 
> Jason
> 


