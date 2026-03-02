Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B66EEA4E04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1zRTXmeQCbtkPZiqRqHWxQMxoWFGt3hTwtVnY/mfXE=; b=FauXAiRxC+niBDC8nOHPPfMRMZ
	MmDpd18IrGh5/qi4ytmgfevi+gHKnduaG65YXE7y62IpzxSr+qUE1H3PG4HjRakzbhAhvr3fZetii
	ynkub7kjXuUUqP5IQ3H9c6kIMBv4M3paYHXLd5JVdHB7rMf9GLU+EbXGXsGIHhN/tD77W7wCQazo+
	/pAy3xzuxzexlhrYJDT2xtEwjzIoLyf0Po3BWOM7NKFlPGPF/mIjPz/HePzuwLXD38T5NBbegaTHl
	qkjLvRz7E3WgogOBKndk7/DDfoGDNTJUGo6f9kOIdA5FQS16OqusOvLtWhvo0eyq4NX8YTvP7cYcR
	s9v1Gf0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4fM-0000000DGlp-0YyS;
	Mon, 02 Mar 2026 14:54:36 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4fJ-0000000DGlQ-03SH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:54:34 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fPhl51Y1VzHnGdP;
	Mon,  2 Mar 2026 22:53:37 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C32140086;
	Mon,  2 Mar 2026 22:54:29 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 2 Mar
 2026 14:54:28 +0000
Date: Mon, 2 Mar 2026 14:54:26 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Nicolin Chen <nicolinc@nvidia.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <bhelgaas@google.com>, <joro@8bytes.org>,
	<praan@google.com>, <baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <20260302145426.00001960@huawei.com>
In-Reply-To: <aZ3NS4GhxhElWhh2@nvidia.com>
References: <cover.1771886695.git.nicolinc@nvidia.com>
	<bdeebd35e81cfa5f76d16706a775b23ee1f01fdd.1771886695.git.nicolinc@nvidia.com>
	<20260224120615.00003ad9@huawei.com>
	<aZ261odHq5gwQYXg@nvidia.com>
	<20260224155742.00000282@huawei.com>
	<aZ3NS4GhxhElWhh2@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_065433_208886_4304D9B1 
X-CRM114-Status: GOOD (  19.43  )
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

On Tue, 24 Feb 2026 12:09:47 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Feb 24, 2026 at 03:57:42PM +0000, Jonathan Cameron wrote:
> > On Tue, 24 Feb 2026 10:51:02 -0400
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Tue, Feb 24, 2026 at 12:06:15PM +0000, Jonathan Cameron wrote:
> > >   
> > > > In my head at least, it would be nice if a driver had to explicitly opt in
> > > > to this behavior. The presence of CXL.cache support for instance doesn't
> > > > actually mean the driver is going to enable it.  However it is probably
> > > > harmless so lets go with this as path of least resistance.    
> > > 
> > > That same remark applies to ATS in general, we have no idea if the
> > > device is going to use it when turned on or not..  
> > 
> > Yup. Understood. That's the bit that smells bad to me.  
> 
> Do you have thoughts on when this is a problem (aside from device
> pre-acceptance security already discussed)? So far I haven't heard
> complaining on this point..

Nothing explicit.  It was a very minor smells wrong moan on basis of
assumptions of what an IOMMU is doing in the way of ATS checking if
we have a malicious device.  So principle of not turning anything on
we don't know we need.

Jonathan

> 
> Jason
> 


