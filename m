Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8EBE92FD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 22:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5e3+JrsfjcY8Yrf/Recn5oGZCMrDihuEaUMy6DZ3rw=; b=CPixgSvXjB5sq6nSgqJ1wTKIy4
	1x29XF0Eg3pYfFUnTD0UWCmSqzlldmMlEHEQ/8X8wPiha+78OhrgRRjO2lVs6OJso64CW0oAXC3LF
	coCCLUgRe7YvP8TH4J0pAdhGhh6QAIsdlGf+f2vLNOQRk/sH9ysVEb3Gc7/7DUsnkae3jdVZVnHiO
	TYKkGJ2rDI+2MYYiWLXF6pZ2RXnCgZmU+d7hRBmkPc+DD1KwKD44RgXB8XaIIKnEpJaEtkB2RzuxV
	CallJx9RmCs5m0Wjjh9OHybqIH1j7My551lDGnz6VFjEaI4YbfhVXSybpgE0vmeOfGp+VgYt5qoXp
	JFJOucsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaLTL-000000046o4-3TjL;
	Mon, 29 Dec 2025 22:12:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaLTJ-000000046nf-079h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 22:12:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFEB4497;
	Mon, 29 Dec 2025 14:12:02 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBCC23F694;
	Mon, 29 Dec 2025 14:12:04 -0800 (PST)
Date: Mon, 29 Dec 2025 23:12:06 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
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
Message-ID: <aVL8tp7k1ne9DWSX@arm.com>
References: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
 <aS2z0EURwHbbGZab@arm.com>
 <9b6882dc-a91a-42d6-bf76-347338930d71@huawei.com>
 <aS8GZOuaS1-j14MD@arm.com>
 <29253319-ced9-4ab6-a58e-28afdf235cde@huawei.com>
 <aTx2V4am0FNHm03R@google.com>
 <62ad0257-aa50-4ab6-bd46-64c3963e4b94@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62ad0257-aa50-4ab6-bd46-64c3963e4b94@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_141213_105210_425B5110 
X-CRM114-Status: GOOD (  27.42  )
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

On Sat, Dec 20, 2025 at 05:09:52PM +0800, zhenglifeng (A) wrote:
> On 2025/12/13 4:08, Will Deacon wrote:
> > On Fri, Dec 12, 2025 at 05:27:09PM +0800, zhenglifeng (A) wrote:
> >> On 2025/12/2 23:31, Beata Michalska wrote:
> >>> On Tue, Dec 02, 2025 at 11:05:25AM +0800, zhenglifeng (A) wrote:
> >>>> On 2025/12/1 23:27, Beata Michalska wrote:
> >>>>> Hi,
> >>>>>
> >>>>> Apologies for the delay in reviewing this - currently in progress....
> >>>>> Out of curiosity: what's the cpufreq driver used for testing this series ?
> >>>>
> >>>> I used cppc_cpufreq for testing this. But with some modifications in
> >>>> processor_driver.c, or you'll find that the driver will fail to load with
> >>>> maxcpus set. The modification below is only a temporary solution. I'm still
> >>>> working on that.
> >>>>
> >>> Right, so overall the implementation looks good - thanks for that.
> >>> There are two issues though with the cppc cpufreq driver.
> >>>
> >>> One: as you have already noticed - it fails to register when
> >>> cpumask_present != cpumask_online.
> >>>
> >>> Second: it will mix the sources of the freq scale if not all CPUs within the
> >>> policy have AMUs enabled/valid. This is due to the fact that at the time of
> >>> registering the driver and initializing the FIE support policy->cpus ==
> >>> policy->related_cpus. Assuming scenario when there are two CPUs within the
> >>> policy, one being offline and missing valid AMU counters,
> >>> the topology_set_scale_freq_source from cppc cpufreq driver will register
> >>> the tick handler for both CPUs, whereas AMU support will (rightly so) register
> >>> only for the firs one. When the second CPU comes online, the mismatch will be
> >>> detected and the arch callback will get cleared for the first CPU, but the
> >>> second one will remain unchanged.
> >>>
> >>> That said, I do not think any of those issues is a blocker for this series.
> >>> But both would need fixing.
> >>
> >> I believe Beata is OK with this series. So I think we can move ahead with it
> >> now.
> > 
> > Please repost at -rc1. It would be nice to have an Ack from Beata...
> 
> Hi Beata,
> 
> It would be nice if you could give this patch an Ack.
> 
> Thanks.
> 
Apologies, 've been away.

Acked-by: Beata Michalska <beata.michalska@arm.com>

---
BR
Beata
> > 
> > Will
> > 
> 

