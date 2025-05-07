Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E3FC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 12:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Uq7vsVFAAZcTKSE6xkXUTxW/fPy/nmrkG0GVVYcJWE=; b=0kZeA6hHYK8qLzvO7xGjkFgzqi
	lQ/ZYaPbcvGc9tlhdc+J713nAQnvuGRgpYq4yVW/TpyHxJ+y9+VCUTy5CqrO2cFAz/URcbT8oma3G
	iRR1D6NBhaXaBGusN0xKPgiL+SJv8LZoy0uatOEiN82KNy8BtWTRkiZASZZ57Sx7Qf9igX6xDLT4+
	QqW1jy2oQ1IdIp2KWjBwHuWbSRzHaBWcSZG7a0UyWbUGY4otStL69knGnrDrGV7o/s+tT6mwwMOsH
	yyrz4iIiUVRDppZ7KAwVUZvYETo2V05qignBw6RxOy0JFcFr7piCWvgWd3doyNmw1+6DLwD++4fyy
	hOavCigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdUy-0000000FIqH-32RH;
	Wed, 07 May 2025 12:03:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdRP-0000000FI9f-1fXD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 12:00:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B3C6339;
	Wed,  7 May 2025 04:59:46 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 476B23F5A1;
	Wed,  7 May 2025 04:59:54 -0700 (PDT)
Date: Wed, 7 May 2025 12:59:45 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Mike Tipton <quic_mdtipton@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <aBtLMYqcnwacGJuy@pluto>
References: <20250428144728.871404-1-quic_mdtipton@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428144728.871404-1-quic_mdtipton@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_045959_592941_30511FD5 
X-CRM114-Status: GOOD (  25.66  )
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

On Mon, Apr 28, 2025 at 07:47:28AM -0700, Mike Tipton wrote:
> Currently, all SCMI devices with performance domains attempt to register
> a cpufreq driver, even if their performance domains aren't used to
> control the CPUs. The cpufreq framework only supports registering a
> single driver, so only the first device will succeed. And if that device
> isn't used for the CPUs, then cpufreq will scale the wrong domains.
> 

Hi,

bit of lagging behind, my bad.


> To avoid this, return early from scmi_cpufreq_probe() if the probing
> SCMI device isn't referenced by the CPU device phandles.
> 
> This keeps the existing assumption that all CPUs are controlled by a
> single SCMI device.
> 
> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Use dev_of_node(dev) instead of dev->of_node.
> - Sanity check scmi_np.
> - Pick up Reviewed-by from Peng.
> - Link to v2: https://lore.kernel.org/all/20250421195206.3736128-1-quic_mdtipton@quicinc.com/
> 
> Changes in v2:
> - Return -ENODEV instead of 0 for irrelevant devices.
> - Link to v1: https://lore.kernel.org/all/20250411212941.1275572-1-quic_mdtipton@quicinc.com/
> 
>  drivers/cpufreq/scmi-cpufreq.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 944e899eb1be..b63992de9fc7 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -393,6 +393,35 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
>  	.set_boost	= cpufreq_boost_set_sw,
>  };
>  
> +static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
> +{
> +	struct device_node *scmi_np = dev_of_node(scmi_dev);
> +	struct device_node *np;
> +	struct device *cpu_dev;
> +	int cpu, idx;
> +
> +	if (!scmi_np)
> +		return false;
> +
> +	for_each_possible_cpu(cpu) {
> +		cpu_dev = get_cpu_device(cpu);
> +		if (!cpu_dev)
> +			continue;
> +
> +		np = dev_of_node(cpu_dev);
> +
> +		if (of_parse_phandle(np, "clocks", 0) == scmi_np)

Shouldn't this, on Success, be released by an of_node_put() (or, BETTER,
by some OF-related cleanup.h magic...)

> +			return true;
> +
> +		idx = of_property_match_string(np, "power-domain-names", "perf");
> +
> +		if (of_parse_phandle(np, "power-domains", idx) == scmi_np)

Same.

> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int scmi_cpufreq_probe(struct scmi_device *sdev)
>  {
>  	int ret;
> @@ -401,7 +430,7 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
>  
>  	handle = sdev->handle;
>  
> -	if (!handle)
> +	if (!handle || !scmi_dev_used_by_cpus(dev))
>  		return -ENODEV;
>  
>  	scmi_cpufreq_driver.driver_data = sdev;

Other than the above glitches, LGTM.
(I gave it a go on JUNO and some emulated setup..)

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

