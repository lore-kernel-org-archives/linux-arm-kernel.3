Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B31C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zxk5AAieBrq1hEmNM/LcPDvSBVW+xmIZOfcz9deyjg=; b=EE6s6v3m53ejZUAO0itmjRZmJJ
	4+olGwBQwXw3UZ55ZqVIAoRVqzxShuXejRpjMKY5lTbk02rVCrcoigEkzp2v2O540imIb66W7cgXE
	IbDO7BelnMCKE/NLYjZf+5gUWr9t7dxmmpaC61mrV76QSlnHvj7a0e1D/nShvi9n59PoN3t0lb+n8
	Jn5C62criRSC/lIm3hSKHI6vuh+dZmElRI5gO9HS5ZvWW4EJCRflXWyJ5Ht/gYgktQC0e58NVUriQ
	F8oK7HZe2Q0t81GlRgrEt6RM+YOVv/0oDLQCkt2jf4our8x2IxvtdOI2WBVHLFSNRG54L/a56t1Ke
	rBpKF05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCexi-0000000FamL-2lq1;
	Wed, 07 May 2025 13:37:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeZo-0000000FWry-0tdm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:12:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41AE5339;
	Wed,  7 May 2025 06:12:31 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96DFB3F58B;
	Wed,  7 May 2025 06:12:39 -0700 (PDT)
Date: Wed, 7 May 2025 14:12:36 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Mike Tipton <quic_mdtipton@quicinc.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@oss.nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <20250507-analytic-practical-carp-5cddaf@sudeepholla>
References: <20250428144728.871404-1-quic_mdtipton@quicinc.com>
 <aBtLMYqcnwacGJuy@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBtLMYqcnwacGJuy@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_061244_291401_D0E1112B 
X-CRM114-Status: GOOD (  12.15  )
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

On Wed, May 07, 2025 at 12:59:45PM +0100, Cristian Marussi wrote:
> On Mon, Apr 28, 2025 at 07:47:28AM -0700, Mike Tipton wrote:
> > +static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
> > +{
> > +	struct device_node *scmi_np = dev_of_node(scmi_dev);
> > +	struct device_node *np;
> > +	struct device *cpu_dev;
> > +	int cpu, idx;
> > +
> > +	if (!scmi_np)
> > +		return false;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		cpu_dev = get_cpu_device(cpu);
> > +		if (!cpu_dev)
> > +			continue;
> > +
> > +		np = dev_of_node(cpu_dev);
> > +
> > +		if (of_parse_phandle(np, "clocks", 0) == scmi_np)
> 
> Shouldn't this, on Success, be released by an of_node_put() (or, BETTER,
> by some OF-related cleanup.h magic...)
> 

Good catch, I missed this.

With the above issue fixed, you can add and post new version:
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

I will drop this patch now that you need to fix and repost. Also Viresh
may be away, so better to route via his tree when he is back as I can't
take it without his ack. I was holding off my PR for this, but I will
send SCMI PR without this now.

-- 
Regards,
Sudeep

