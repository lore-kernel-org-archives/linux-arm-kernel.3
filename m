Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59AFCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 05:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWLz/zW9pGxu4MmyMeLIaL8QlovD/EAbOQwnVjK0tNk=; b=rRYJBN9eU8+Swu0EfN60dnpDBs
	iCDxtU6MPrmabqDsLCsj4Zrd2M1B9VxYZPmevLTmbM/as8A/j84dUBOHGekE1Jt4VxeQxx+7Ix/lk
	RVTI2UfOPBUWr8uyayO3I4nRgTh/82bNZfj6Wy48KKaNMyjJBPj7wphGLBAlEC/sb9grWpCZnmEok
	bFqD1YxEm9GL9mFYNENDnmeLZ/a+YXk25beJmxQ+ye/pW2teo6nqEq9EsIutTKbicw+y/U/bB7zdT
	nXSgzl5u9NyC3XFpNKjYpgAixe9gSdwsh8u6mIjbg+/yvwLMl0XUwS1lMsp08qOCo1t6Zplbba8oq
	7v8GPOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbtxL-00000005jiC-1WLk;
	Tue, 23 Jun 2026 05:45:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbtxK-00000005ji1-17K3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 05:45:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DD2F40124;
	Tue, 23 Jun 2026 05:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A91C1F000E9;
	Tue, 23 Jun 2026 05:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782193552;
	bh=dWLz/zW9pGxu4MmyMeLIaL8QlovD/EAbOQwnVjK0tNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qa/BeaHWnD+OP69bjLycHVUVXra6sZJV5iK9JntBBfOuED5JtAVeCw58o6uJnrRvi
	 cULVIyuOAAsRkkC/COasS2mMKt4NE3XmNDak8jO/Bw0lNczHMM+qJValCE2JZ3UH23
	 tbbhVdKC5KhO/ti5OsMLaP9L06YZk4UApZKs0s0HtUYWEvFx7AzgZyIMki7VJfv6kY
	 6kjr2LW7g4r4cEVSvzePZ9gIXjI3Ia3n9hVtwYPJpUll1IXCzatilu1XfKHVlMOmUX
	 qAsmTzfyaBFYkT5542j0KI8Hf0Suwxd2l4pClW6VvsWvGow0J/dPFgnIuBxejSLL4t
	 ZQ8POrFrSNMmw==
Date: Tue, 23 Jun 2026 07:45:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, vigneshr@ti.com, s-vadapalli@ti.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	mpillai@cadence.com, unicorn_wang@outlook.com, me@ziyao.cc, 18255117159@163.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com
Subject: Re: [PATCH] PCI: cadence: skip the link polling when endpoint not
 connected
Message-ID: <pocwd4v7iqlixcpaikjo6vqmnwsb7rfjt42qvlmxsn6xnvtrpf@zgch2iwu7itw>
References: <20260605071922.1724499-1-a-garg7@ti.com>
 <4lijgllolvtbvmzmluuslhkc7empdpizxhva6ysau7kssuqd5z@drkzb5afd4ba>
 <1ad01870-e2f9-485c-9206-23ee6de1d1ba@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ad01870-e2f9-485c-9206-23ee6de1d1ba@ti.com>
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

On Tue, Jun 23, 2026 at 10:53:48AM +0530, Aksh Garg wrote:
> 
> 
> On 22/06/26 20:22, Manivannan Sadhasivam wrote:
> > On Fri, Jun 05, 2026 at 12:49:22PM +0530, Aksh Garg wrote:
> > > cdns_pcie_host_wait_for_link() polls on link-up for 10 retries with a
> > > delay of 90-100ms each (~1 second). A call to cdns_pcie_host_link_setup()
> > > during the resume operation blocks the resume operation unnecessarily for
> > > ~1s even when no endpoint device is connected.
> > > 
> > > Add skip_link_polling flag to track link state across suspend/resume
> > > cycles. If link was down before suspend, skip the expensive polling
> > > in resume since no endpoint was present.
> > > 
> > 
> > Won't you need the delay if a device gets plugged while the host was suspended?
> > We had this same concern with the DWC drivers and we left the delay as-is as
> > nothing prevents an user to connect a device when the host was suspended.
> 
> Yes, that is true. However, the platforms that do not support hot-plug can
> skip the delay during resume since no device could have been connected while
> suspended (only those platform's driver would be expected to set
> 'rc->skip_link_polling) just like what Tegra264 PCIe driver tries to do at
> [1], where the driver sets "pcie->link_up = false" if the link is down
> during the probe and if the controller doesn't support hot-plug.
> 

If the platform doesn't support hotplug, then it is perfectly fine to skip the
delay. But you need to name the flag as like 'no_hotplug' or something
relevant, not 'skip_link_polling'.

> Even if a user connects a device (when the host was suspended) to a platform
> which doesn't support hotplug, the user is expected to run a bus rescan,
> which doesn't call cdns_pcie_host_link_setup() anyway, hence the flag
> 'skip_link_polling' is not taken into account in that case.
> 

This is not about running the rescan, but about initializing the device. The 1s
delay in cdns_pcie_host_wait_for_link() is mandated by the PCIe spec after
starting LTSSM and before issuing the config read to the device. If this delay
is skipped and if a config read is issued to the device, then the device may not
respond and the failure may lead to PCI stack assuming that the device is dead.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

