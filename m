Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E6CC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP1tOZJXAzIWRPGMG1yM00lt5p/Sn0OcgF4eKbccC7I=; b=TynMuswFl8iHZRSAgfa+d055S8
	W2rgTHwsVpByahWcKABA+GWwsN9EyoCNUvZ19CzL2HBZORvcxfg2orR5BNGhNkYdB8mAvFbmHydAZ
	GuEwj7Pm1IoF6X8KS339RDeMVDbDHA0ukBLixrACT3Wt8mFGDVkc6sSzsaouFZ09UMtXieQKu9JYY
	fRKslUrTiMyw0bTdOZg4acUvrfQ7QkyUT60L4loLVweGN9wpFY5fJ81XbB1S7rEFiwMHJmDd/2xKc
	ujpEwZ6raHAzUBIIRQmYBfna6guh/0mwcub6dVfql0xdWI9Sjbx4bzwQopKijuWaUTaFyjjLQXiwh
	t2g7GiLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf9G-0000000FdAC-3WyW;
	Wed, 07 May 2025 13:49:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeoE-0000000FZW4-3StO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:27:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D093339;
	Wed,  7 May 2025 06:27:27 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A83EF3F58B;
	Wed,  7 May 2025 06:27:35 -0700 (PDT)
Date: Wed, 7 May 2025 14:27:26 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <aBtfvuzO54XK6KOd@pluto>
References: <20250428144728.871404-1-quic_mdtipton@quicinc.com>
 <aBtLMYqcnwacGJuy@pluto>
 <aBtdqvyT4Ded8Lht@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBtdqvyT4Ded8Lht@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_062738_906230_BA64CF64 
X-CRM114-Status: GOOD (  13.41  )
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

On Wed, May 07, 2025 at 04:18:34PM +0300, Dan Carpenter wrote:
> On Wed, May 07, 2025 at 12:59:45PM +0100, Cristian Marussi wrote:
> > > +static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
> > > +{
> > > +	struct device_node *scmi_np = dev_of_node(scmi_dev);
> > > +	struct device_node *np;
> > > +	struct device *cpu_dev;
> > > +	int cpu, idx;
> > > +
> > > +	if (!scmi_np)
> > > +		return false;
> > > +
> > > +	for_each_possible_cpu(cpu) {
> > > +		cpu_dev = get_cpu_device(cpu);
> > > +		if (!cpu_dev)
> > > +			continue;
> > > +
> > > +		np = dev_of_node(cpu_dev);
> > > +
> > > +		if (of_parse_phandle(np, "clocks", 0) == scmi_np)
> > 
> > Shouldn't this, on Success, be released by an of_node_put() (or, BETTER,
> > by some OF-related cleanup.h magic...)
> > 
> 
> The cleanup.h magic is __free(of_node_put) but dev_of_node() doesn't
> take a reference so I don't think it's required.
> 
 
I was referrring to the 2 (possibly) successfull of_parse_phandle() needs an
of_put() before returning. (at least looking at of_parse_phandle() comments)

Thanks,
Cristian

