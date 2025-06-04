Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE27AC61CE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 03:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMYBgZlr981PtbcoVMO0rIw7tUs857+MBQFkNZrmYP8=; b=SSvY++x+sqlJNCKilIIEv63Mon
	M9qAYe+gxvkvjRH83rkycIVFZTmFoHHpFvZO6mQwsKAZ59PyNnGNTBJChhjKcl2s1sYT6gu3SgQYE
	uKMKa5Zk1SK2BGOCNu0dtszauphm1bP8CZUXtRE4PeZ3BoURQ6RJzm+NM//aWzPsZ8Yi4WaBzpTog
	b1d3dPVhoNNdIbrWGD0UGW3Im2SvLzseqXgMhVMmEpOlM3TaS4HvMgNZMuOfQZb5md0i8UqClCWTM
	QNzyXVlLT7bJOBBAjSWLlLTsV5QblOn1lZxdF0ZGCJeu4pbvrM9VlIg6zS6iNjau8RpvJxDfi3pZo
	JDkaxwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfHS-0000000CUUy-2L7E;
	Wed, 04 Jun 2025 03:59:10 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdIo-0000000CFgt-1duN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 01:52:28 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bBr8C5Mgqz1BFj9;
	Wed,  4 Jun 2025 09:48:27 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id EB4C1180237;
	Wed,  4 Jun 2025 09:52:15 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Jun 2025 09:52:15 +0800
Subject: Re: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device
 allocation
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
	<timothy.hayes@arm.com>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-4-maz@kernel.org>
 <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
 <aD7B96BiSb6mK9Bj@lpieralisi> <87jz5tdl9d.wl-maz@kernel.org>
 <aD8Ioy+v8k/i0e8B@lpieralisi>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <7b9710fb-9438-6158-1e79-4f28674a5077@huawei.com>
Date: Wed, 4 Jun 2025 09:52:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <aD8Ioy+v8k/i0e8B@lpieralisi>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_185226_598672_1CA42B13 
X-CRM114-Status: GOOD (  20.37  )
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

On 2025/6/3 22:37, Lorenzo Pieralisi wrote:
> On Tue, Jun 03, 2025 at 02:09:50PM +0100, Marc Zyngier wrote:
> > On Tue, 03 Jun 2025 10:35:51 +0100,
> > Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > >
> > > On Tue, Jun 03, 2025 at 04:22:47PM +0800, Zenghui Yu wrote:
> > > > > +	domain->dev = dev;
> > > > > +	dev->msi.data->__domains[domid].domain = domain;
> > > > > +
> > > > > +	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
> > > >
> > > > Does it work for MSI?
> > >
> > > This means that it does not work for MSI for you as it stands, right ?
> > >
> > > If you spotted an issue, thanks for that, report it fully please.
> >
> > Honestly, you're barking up the wrong tree. Zenghui points us to a
> > glaring bug in the core code, with detailed information on what could
> > go wrong, as well as what is wrong in the code. It doesn't get better
> > than that.
> >
> > The usual level of bug reports is "its b0rken", sometimes followed by
> > a trace with lots of hex and no information. Spot the difference?
> 
> Agreed, thanks again Zenghui for reporting it and forgive me if the
> message sounded a bit patronizing, I did not mean it.

Never mind :-)

Zenghui

