Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1285C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/7s7snSE2sic8H+4mdbOOwvug6u3AFI2zdl9/vVtMc=; b=U3Vs1scmiEOhlHaNvlJ64tbmSN
	zaaZqzAp0CDOsWMS/x6XTLGbpkFVWub5wfv1fWqlWYnCRqusSYNlMJIUHJti0oJ1sX30DRiHDSL0x
	6+B1qGMioN6ss33Z6W4vcgkdxMAnrNC9TJS/PK3fS4V4d4IrIvdFNkRoLZUp3EWtyjTRza7jYkpox
	39AZT0c2eud9SceOhU8QcEm7wpA3mgvk7UyF+/2Y+cpCcqI9Gg9rs52ZGk3z7CEutpezjXtDzFWpG
	jW4ODs2JEpuOxYAhkDcWK69O10S3BlPOuQK/vSYhm/yu3hkumcUu+EqWPu/ByS2NJec/UYqwjfMpF
	C7p+Pcbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSMV-00000002p0B-0qk8;
	Mon, 27 Jan 2025 16:53:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSLC-00000002osr-1FJy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 16:52:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D89C5C5861;
	Mon, 27 Jan 2025 16:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BAFC4CEE0;
	Mon, 27 Jan 2025 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737996721;
	bh=edqYJfrVotNUf8DCzv4lTc39ww3u3IUd6Qrm7OINrvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpXN14xdKnrob1tV4xs/up/06b6D1Gir3JJdEkZqbhw5yakHbwF59EYIeh6MSyT1M
	 O9CaQQAkHl2P3lK6H96A4tVqAv77nJKi2yTclbyKai4zZV0ucvPJOgSCC6ucK6bk+Q
	 d2HTIDiNPBZoJjfMtxUEMymrRpKe+Dy58Q8uyVq8Tef7/ONlipLVYar2QuOSBbHNdL
	 v+8g4IKbSgqBTWDe4lZIYGP3oM/fRY18CcU0ryGHskIRh9raB5RP8qjudJU3tesa7p
	 qC2QIQ9CO1Q9WhrYFa6Q3TrIoARftIJ04oq52hAtWkdOrPCfWGX/7BedufvBc883wG
	 vuKnYEGoSTdMg==
Date: Mon, 27 Jan 2025 16:51:57 +0000
From: Will Deacon <will@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, renyu.zj@linux.alibaba.com,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] perf/dwc_pcie: fix duplicate pci_dev
 devices
Message-ID: <20250127165156.GE25757@willie-the-truck>
References: <20250123074830.90923-1-cuiyunhui@bytedance.com>
 <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com>
 <CAEEQ3wmDej9bbPUmkx-ZrD4FG9Z7gTHMeCrVszx64g90O0RyiQ@mail.gmail.com>
 <31e00081-8695-4ca6-a1ef-af5a007a7565@linux.alibaba.com>
 <CAEEQ3wm+f_SM7evwL=YrGy8gPLS5YdJm=qhJNT8bbMH7QBOzEA@mail.gmail.com>
 <20250124122952.GB23438@willie-the-truck>
 <CAEEQ3wnTMfWSZRhTax3N60W=m3a=zxnJF6dOfiGnqJzBQs8WEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEQ3wnTMfWSZRhTax3N60W=m3a=zxnJF6dOfiGnqJzBQs8WEg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_085202_383439_AB9FE657 
X-CRM114-Status: GOOD (  19.32  )
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

On Sun, Jan 26, 2025 at 09:54:35AM +0800, yunhui cui wrote:
> Hi Will,
> 
> On Fri, Jan 24, 2025 at 8:30 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Jan 24, 2025 at 05:11:05PM +0800, yunhui cui wrote:
> > > > >>>        vsec = dwc_pcie_des_cap(pdev);
> > > > >>>        if (!vsec)
> > > > >>>                return -ENODEV;
> > > > >>>
> > > > >>>        sbdf = plat_dev->id;
> > > > >>> -     name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
> > > > >>> +     name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%d_pmu", sbdf);
> > > > >>
> > > > >> A new name will break previous user tools.
> > > > > This name isn't suitable. It can't clearly show which is the PMU
> > > > > device. Userspace tools don't have binding relationships, like perf.
> > > > > Tools must traverse PMU devices before use.
> > > >
> > > > The device is under /sys/bus/event_source/ which indates it is PMU device.
> > > > As far as I know, most of PMU devices do not endup with a '_pmu' prefix.
> > >
> > > The point is the name "dwc_rootport_" is misleading, suggesting an
> > > extra PCIE RP in the system. Best to change the name to intuitive
> > > "xx_pmu".
> >
> > As pointed out above, changing the name will break userspace. So it's
> > simply not an option, sorry.
> 
> Could you specify what in the userspace is broken and give an example?

Can't I just take the documented example from dwc_pcie_pmu.rst:

$# perf stat -a -e dwc_rootport_13018/Rx_PCIe_TLP_Data_Payload/

If I have a script that uses that command on a machine today, then
applying your kernel patch will break the script, no?

Will

