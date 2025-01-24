Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A56C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 12:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khC5X3l9+f5KZD4zQX9V4C3Ijmp6FQETCPFYDtgLoRs=; b=jcF8yCdCM1l+j2NiNh6+6KH5zb
	kgFvfbUmhDz08Pj46UgtlfuT48Y7kUJrn7rMThD4ExepCroAzpVBMcpP5rLAuWWCRXq2Eh0jPJYJ6
	m5PcG6EDSYjC74FUuUWoeElD7REDzCDtTCEeGmXhGG7ZhPu2Xwia22JPy/c8gDcL0gvnEf32lQqet
	ZxdkW48caljNsZ0nFmYAFcIviK0QETqXjpI0L6nyUI3vcZ57yGn4y/t+CkxVPC5E8uHBRll5Yw0N6
	DgeGjWGDJrOBkbmu0HJMg/YTG/yl6W7GRiulMT/IK+3DLztPMkqZRVQ0WX9a7z6/rBX5ESdhH8e5u
	wWav1Oew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbIsj-0000000EfdP-44dc;
	Fri, 24 Jan 2025 12:33:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbIox-0000000Ef7G-0Gji
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 12:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E3C65C5F01;
	Fri, 24 Jan 2025 12:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9E7C4CEDD;
	Fri, 24 Jan 2025 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737721798;
	bh=JwX8musVq+spcpO8VEXeNqq9bKiTj5rJbdsNNvyFCe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPk6UeVAOQKa1tW5jlmsBHMAt3+ItJAXlrnRL1MiTQ3pif3Umq9lNV7NaUyMR6ULD
	 pdX9+U9vARyY7/FoIUj+wtcNKU5mMDwwtGgq0B7tkk//7mEWTt0fEg7GdnQLo/jkx8
	 vZvD3VETn337V8QK1vqeHcWIHTYvJGPDqjG2Gku5o6DxBOe9NA9ebCpaX4YFVXYYQ+
	 mTM49i0A+GlsQV7CtpAVcq/fit7WH44CunvhJflOz5xm7KlDaJHOxJAqld3/DMzwkK
	 GPj37EI1pb7NF+4y/+XI4pKqFfR6WsLwrNuOgr8hfXjyROzoAl6SdlDhMK2dQNCevx
	 IFUcaaPKwz3Qg==
Date: Fri, 24 Jan 2025 12:29:53 +0000
From: Will Deacon <will@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, renyu.zj@linux.alibaba.com,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] perf/dwc_pcie: fix duplicate pci_dev
 devices
Message-ID: <20250124122952.GB23438@willie-the-truck>
References: <20250123074830.90923-1-cuiyunhui@bytedance.com>
 <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com>
 <CAEEQ3wmDej9bbPUmkx-ZrD4FG9Z7gTHMeCrVszx64g90O0RyiQ@mail.gmail.com>
 <31e00081-8695-4ca6-a1ef-af5a007a7565@linux.alibaba.com>
 <CAEEQ3wm+f_SM7evwL=YrGy8gPLS5YdJm=qhJNT8bbMH7QBOzEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEEQ3wm+f_SM7evwL=YrGy8gPLS5YdJm=qhJNT8bbMH7QBOzEA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_042959_148113_DEE268F5 
X-CRM114-Status: GOOD (  14.07  )
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

On Fri, Jan 24, 2025 at 05:11:05PM +0800, yunhui cui wrote:
> > >>>        vsec = dwc_pcie_des_cap(pdev);
> > >>>        if (!vsec)
> > >>>                return -ENODEV;
> > >>>
> > >>>        sbdf = plat_dev->id;
> > >>> -     name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
> > >>> +     name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%d_pmu", sbdf);
> > >>
> > >> A new name will break previous user tools.
> > > This name isn't suitable. It can't clearly show which is the PMU
> > > device. Userspace tools don't have binding relationships, like perf.
> > > Tools must traverse PMU devices before use.
> >
> > The device is under /sys/bus/event_source/ which indates it is PMU device.
> > As far as I know, most of PMU devices do not endup with a '_pmu' prefix.
> 
> The point is the name "dwc_rootport_" is misleading, suggesting an
> extra PCIE RP in the system. Best to change the name to intuitive
> "xx_pmu".

As pointed out above, changing the name will break userspace. So it's
simply not an option, sorry.

Will

