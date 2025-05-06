Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887A7C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jsw0FSR9woHqc5bWyZKdlSiTFj83koekic9ue8wNFX0=; b=mFsuIfiXHFNP5+8v8BR8PAWobQ
	ltOo7HriL9bVuqHyOjhGhDKx9HNs4l/ReuJCYnr7RN18KCPtmyuE//ESQiS8wTX6wFROyttU4I/Pg
	jVVzJB8DVEIrmhenn8jR9viwzQkzFNTjw+V9+OogZCkjZ/yNbLtHfNVORLkQvI612UUVUIsUkUKGl
	WpE8EZIthgbsSWEV4ddBTQ8DE1n0VUkfX8/qL8uh7zzR1ReiKExelrTIV4g7WcMorQ0AAhM7e/BtV
	ROWIHq7rY/XDzeROH4Nuz9oFGHWpYZWAW2CUNXDofK03xGazyBNlrHXU9Ogdhis54uLlgZZuLPFDs
	rOR0uFpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCH8D-0000000BrEU-1m5P;
	Tue, 06 May 2025 12:10:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFHa-0000000BWsI-19lw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:12:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BD16113E;
	Tue,  6 May 2025 03:12:02 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D3AF3F5A1;
	Tue,  6 May 2025 03:12:09 -0700 (PDT)
Date: Tue, 6 May 2025 11:12:07 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Mike Tipton <quic_mdtipton@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@oss.nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <20250506-stirring-competent-ladybug-9cadb5@sudeepholla>
References: <20250428144728.871404-1-quic_mdtipton@quicinc.com>
 <aBllHt7A2nP/9x3N@hu-mdtipton-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBllHt7A2nP/9x3N@hu-mdtipton-lv.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_031214_356621_8BD03D06 
X-CRM114-Status: GOOD (  17.94  )
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

On Mon, May 05, 2025 at 06:25:50PM -0700, Mike Tipton wrote:
> On Mon, Apr 28, 2025 at 07:47:28AM -0700, Mike Tipton wrote:
> > Currently, all SCMI devices with performance domains attempt to register
> > a cpufreq driver, even if their performance domains aren't used to
> > control the CPUs. The cpufreq framework only supports registering a
> > single driver, so only the first device will succeed. And if that device
> > isn't used for the CPUs, then cpufreq will scale the wrong domains.
> > 
> > To avoid this, return early from scmi_cpufreq_probe() if the probing
> > SCMI device isn't referenced by the CPU device phandles.
> > 
> > This keeps the existing assumption that all CPUs are controlled by a
> > single SCMI device.
> > 
> > Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> 
> Hi Sudeep / Viresh,
> 
> Any thoughts on this?
> 

I have actually queued and forgot to respond. Though I realise the change
is not dependent on any other changes now.

Viresh, hope you are OK with me taking this change or do you prefer to take
it via your tree ? I am fine with that as well.

-- 
Regards,
Sudeep

