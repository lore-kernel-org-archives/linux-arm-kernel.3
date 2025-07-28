Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03CFC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0d4BNZ+Hs5cnLXWiLFj7szZ/knypRx5Jn0mdumOhh2Y=; b=aqKae3Rcg6JRbv183oITUYfY3D
	RYmej2enPV0DVgDNwJbZ7hqmW5paoOlZB8d4u6ucGklFZF4zRaCG1dZRpHw9krWoODlF00A3BAYi9
	8Or8u9UXidqskYWNIVRkP/1MbzwUpPu0z2531rGhxtdcq8RPTPHlYzv9unRsFx7h4HeYXGw6GDXDM
	Fw/zizATi0HjHKwO33HZWiH38/lPKahUBlP2duBhLwm8J2ZTkqhlf+l7LU8WBcbwY4DXcw7+GGRQr
	gTMvRCaBbjDfENupP9b7ZUIT1LCh7wVsDYQBSOgmuN8sGkZ4ad8DjWv8pS3IKD4NANnzbd959+gWt
	sJPtO68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRVJ-0000000F5UG-2bqt;
	Mon, 28 Jul 2025 17:19:13 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQWr-0000000Ex5V-1u1V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 16:16:47 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4brNpn1yDqz6L5Sd;
	Tue, 29 Jul 2025 00:14:41 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 154C51402EB;
	Tue, 29 Jul 2025 00:16:31 +0800 (CST)
Received: from localhost (10.122.19.247) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 28 Jul
 2025 18:16:29 +0200
Date: Mon, 28 Jul 2025 17:16:28 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: James Morse <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, "Rohit
 Mathew" <rohit.mathew@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>, Carl
 Worth <carl@os.amperecomputing.com>, <shameerali.kolothum.thodi@huawei.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, Xin Hao
	<xhao@linux.alibaba.com>, <peternewman@google.com>, <dfustini@baylibre.com>,
	<amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, Rex Nie
	<rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>
Subject: Re: [RFC PATCH 20/36] arm_mpam: Probe the hardware features resctrl
 supports
Message-ID: <20250728171628.00001cd3@huawei.com>
In-Reply-To: <eb8a395c-ca21-43d2-a1f9-739dbdc26dc4@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
	<20250711183648.30766-21-james.morse@arm.com>
	<eb8a395c-ca21-43d2-a1f9-739dbdc26dc4@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_091645_785434_61DD36F7 
X-CRM114-Status: GOOD (  16.96  )
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

}
> >   
> > +/*
> > + * IHI009A.a has this nugget: "If a monitor does not support automatic behaviour
> > + * of NRDY, software can use this bit for any purpose" - so hardware might not
> > + * implement this - but it isn't RES0.
> > + *
> > + * Try and see what values stick in this bit. If we can write either value,
> > + * its probably not implemented by hardware.
> > + */
> > +#define mpam_ris_hw_probe_hw_nrdy(_ris, _mon_reg, _result)			\
> > +do {										\
> > +	u32 now;								\
> > +	u64 mon_sel;								\
> > +	bool can_set, can_clear;						\
> > +	struct mpam_msc *_msc = _ris->vmsc->msc;				\
> > +										\
> > +	if (WARN_ON_ONCE(!mpam_mon_sel_inner_lock(_msc))) {			\
> > +		_result = false;						\
> > +		break;								\
> > +	}									\
> > +	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, 0) |			\
> > +		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, _ris->ris_idx);		\
> > +	mpam_write_monsel_reg(_msc, CFG_MON_SEL, mon_sel);			\
> > +										\
> > +	mpam_write_monsel_reg(_msc, _mon_reg, MSMON___NRDY);			\
> > +	now = mpam_read_monsel_reg(_msc, _mon_reg);				\
> > +	can_set = now & MSMON___NRDY;						\
> > +										\
> > +	mpam_write_monsel_reg(_msc, _mon_reg, 0);				\
> > +	now = mpam_read_monsel_reg(_msc, _mon_reg);				\
> > +	can_clear = !(now & MSMON___NRDY);					\
> > +	mpam_mon_sel_inner_unlock(_msc);					\
> > +										\
> > +	_result = (!can_set || !can_clear);					\
> > +} while (0)  
> It is a bit surprising that something that looks like a function 
> modifies a boolean passed by value. Consider continuing the pattern you 
> have above:
> #define mpam_ris_hw_probe_hw_nrdy(_ris, _mon_reg, _result) 
> _mpam_ris_hw_probe_hw_nrdy(_ris, MSMON##_mon_reg, _result)
> 
> with signature:
> void _mpam_ris_hw_probe_hw_nrdy(struct mpam_msc *msc, u16 reg, bool 
> *hw_managed);
> 
> and using the _mpam functions from the new _mpam_ris_hw_probe_hw_nrdy().
> 

Agreed that this is ugly.  Only a tiny bit of macro stuff is actually going on here.
I'd make it function.

If you really want to construct MSMON_CSU etc then wrap that helper with
a macro that builds reg from the name.

I might have missed something though in converting this.
The version I have has some other changes though so not trivial to post here :(




