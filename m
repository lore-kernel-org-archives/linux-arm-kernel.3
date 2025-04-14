Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE1AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 08:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRjxIsjDv/+PcKK97QYejBhHnd+r4kHElZN+p0QN6Q4=; b=qgPgrvha5w+LKSYcJXAfEmwgWA
	sMBIZhNGq/QsDgkMSdBbZ00Cl9nv5T6wdWM5pCP/zvMyu22oU/jc5ZPUXhkdIcN36EJ9yy03ImSLA
	CkpYEM/PHiqEOTuUuUuUVRbJ14Z4hgxjjSnrKQy9THfCHx08jTjnNpEBJdHHDi3sASCDUyk0qyws/
	lyZk2dwk1CEFG7fv6eAE3kWFKI5069gn+RSF5t3Ilc4uU/kRe2kd4vIDzG9CFB2lEA8CCzUGbW12c
	lcVs4uGLoZgr7Au6XgK4fWRqaAt/gFNW5Lrx+XXSUzY02L+t5OiBPywBXATwEqGh8LowAunypgRwW
	qt9i8wAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F8B-000000014Kq-0T7L;
	Mon, 14 Apr 2025 08:25:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F6J-0000000149z-44ny
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 08:23:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C92C1007;
	Mon, 14 Apr 2025 01:23:28 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BCAC3F694;
	Mon, 14 Apr 2025 01:23:27 -0700 (PDT)
Date: Mon, 14 Apr 2025 09:23:24 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mike Tipton <quic_mdtipton@quicinc.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: scmi: Skip SCMI devices that aren't used by the
 CPUs
Message-ID: <20250414-splendid-clam-of-democracy-dacf96@sudeepholla>
References: <20250411212941.1275572-1-quic_mdtipton@quicinc.com>
 <20250414083832.GA19563@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414083832.GA19563@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_012332_057334_F316E952 
X-CRM114-Status: GOOD (  11.77  )
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

Hi Peng,

On Mon, Apr 14, 2025 at 04:38:32PM +0800, Peng Fan wrote:
> Hi Mike,
> On Fri, Apr 11, 2025 at 02:29:41PM -0700, Mike Tipton wrote:
> >Currently, all SCMI devices with performance domains attempt to register
> >a cpufreq driver,
> 
> The scmi cpufreq device is created based on entry
> { SCMI_PROTOCOL_PERF, "cpufreq" },
> 
> So the scmi-cpufreq driver could only probe the upper single device.
> 
> How could the driver work with all SCMI devices with performance domains?
> 

IIUC, this is on a system with multiple SCMI servers/providers some of
which don't deal with CPU performance domains at all.

-- 
Regards,
Sudeep

