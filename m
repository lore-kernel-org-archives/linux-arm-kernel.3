Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEFAD59D8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEbB1MH9XGDpJM4oMQNVsN7bK44BZtG/FPTM+kXGBuM=; b=e45FO0tlHh4fAVQs00eo6tJdIa
	3k75aCR1MopgUZhurkLCSH7lWtoRXIjyrrqwpn0L0JFMAlKstxng5eBrDjhveVCZ3XlUIr2NJzayO
	PWOO+rAnS/jRm4rR5CZOqQfL2BVEcqLzWV7QnA9SjnQeSBq1qkJLlpPMY74XbKRrknQnhW3fm4D8r
	BxcozpMh2qYozZBnTGcsJG+TwtsTI1nABjqcRXmyNoUp3Xec/HSmyiIBCLXonpS1AHLjAQ3RZr1c0
	myfXXYSGF7Proy2ja7v+eCDQcdOF5l6+zvMoOrDyZkajERTrtGkDV8MqD41ikVwQUSrOYJ6cJIqam
	Sw10E8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9Rp-000000011zt-20MS;
	Fri, 12 Dec 2025 20:09:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9Ro-000000011zl-0zEq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6290E60017;
	Fri, 12 Dec 2025 20:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9179C4CEF1;
	Fri, 12 Dec 2025 20:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765570143;
	bh=YYMImzrZ+6ZKJx4/H0T7um10BEk1uBLaINM4peWTmaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXFsLIVYJcYusP2Gb6FtTIV1/ytUmaKR3NTRfaufIx2hH50LC3BWxd5wb0ELal9ux
	 grAZqZGWR0LNamNy2pAdRglzn5xlUUR/lmd1DvzQ/VLN4fx2UxVOehR0s7c7S2nMzG
	 vHlfbiumk2SKA7P4JNzfKf6zeKSc1MZabHp8srjt4qK4WYMuC4D87lJBZGcjJDnXce
	 o3iI54qz/CP0fb2iiXWL+0v9Jm727DVp4Mqe+FwRU1VvZFaMW/9EpiccALwmoYqFSH
	 RJ6vwHZGD5x96rblKNv0r8HUL71B4YkGqbdZ+/SMVyTOCyCXIo3YcsbAfJpIgUTrtV
	 rT3sINvqQ5F8A==
Date: Sat, 13 Dec 2025 05:08:55 +0900
From: Will Deacon <will@kernel.org>
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: catalin.marinas@arm.com, Beata Michalska <beata.michalska@arm.com>,
	rafael@kernel.org, viresh.kumar@linaro.org, sudeep.holla@arm.com,
	gregkh@linuxfoundation.org, dakr@kernel.org,
	ionela.voinescu@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, vincent.guittot@linaro.org,
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com,
	zhangpengjie2@huawei.com, wangzhi12@huawei.com,
	linhongye@h-partners.com
Subject: Re: [PATCH v6 0/3] arm64: topology: Handle AMU FIE setup on CPU
 hotplug
Message-ID: <aTx2V4am0FNHm03R@google.com>
References: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
 <aS2z0EURwHbbGZab@arm.com>
 <9b6882dc-a91a-42d6-bf76-347338930d71@huawei.com>
 <aS8GZOuaS1-j14MD@arm.com>
 <29253319-ced9-4ab6-a58e-28afdf235cde@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29253319-ced9-4ab6-a58e-28afdf235cde@huawei.com>
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

On Fri, Dec 12, 2025 at 05:27:09PM +0800, zhenglifeng (A) wrote:
> On 2025/12/2 23:31, Beata Michalska wrote:
> > On Tue, Dec 02, 2025 at 11:05:25AM +0800, zhenglifeng (A) wrote:
> >> On 2025/12/1 23:27, Beata Michalska wrote:
> >>> Hi,
> >>>
> >>> Apologies for the delay in reviewing this - currently in progress....
> >>> Out of curiosity: what's the cpufreq driver used for testing this series ?
> >>
> >> I used cppc_cpufreq for testing this. But with some modifications in
> >> processor_driver.c, or you'll find that the driver will fail to load with
> >> maxcpus set. The modification below is only a temporary solution. I'm still
> >> working on that.
> >>
> > Right, so overall the implementation looks good - thanks for that.
> > There are two issues though with the cppc cpufreq driver.
> > 
> > One: as you have already noticed - it fails to register when
> > cpumask_present != cpumask_online.
> > 
> > Second: it will mix the sources of the freq scale if not all CPUs within the
> > policy have AMUs enabled/valid. This is due to the fact that at the time of
> > registering the driver and initializing the FIE support policy->cpus ==
> > policy->related_cpus. Assuming scenario when there are two CPUs within the
> > policy, one being offline and missing valid AMU counters,
> > the topology_set_scale_freq_source from cppc cpufreq driver will register
> > the tick handler for both CPUs, whereas AMU support will (rightly so) register
> > only for the firs one. When the second CPU comes online, the mismatch will be
> > detected and the arch callback will get cleared for the first CPU, but the
> > second one will remain unchanged.
> > 
> > That said, I do not think any of those issues is a blocker for this series.
> > But both would need fixing.
> 
> I believe Beata is OK with this series. So I think we can move ahead with it
> now.

Please repost at -rc1. It would be nice to have an Ack from Beata...

Will

