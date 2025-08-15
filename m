Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE34CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 08:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FF/CKt7ShSlNNzjrXaUZ8qODJsBZ15G3950GV+KjVI=; b=Iddpkj8pVYXt151hmbO3fYRF+s
	lLA/cjDiFVTHFHCPPIgbOaIYFIJGeUpDmL3o/YDuolshiI+OPcqSACLTaTg+GAHhF8Xt7wDICBIQi
	DsBvSkSJi9NOOPo99+j8HPXe1bL/Y/0jjQg3h9yBicwXmMRQwLMnOTFHOfIOPIh3IIq3w5jOBZR95
	w1lNii3Eofads9Z46dFJDfmtrlhHQ00CsmmH9ZNDHXXwAb07DMFcnjBKnejgPPJt5bfN1NekiTemt
	32yZLz6zCvWrz+LawddF8cmYQtFHwoDLJfjvBR/43kVhdqtxwg9AOsYKW8Ho8vq/kKR+H1GmTBd0Y
	4ElZfGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpay-00000001pcE-02JD;
	Fri, 15 Aug 2025 08:15:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpUZ-00000001ogm-2tdO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 08:08:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3E1C1C25;
	Fri, 15 Aug 2025 01:08:40 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B89E3F738;
	Fri, 15 Aug 2025 01:08:46 -0700 (PDT)
Date: Fri, 15 Aug 2025 09:08:38 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, james.quinlan@broadcom.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Peng Fan <peng.fan@nxp.com>,
	Mike Tipton <quic_mdtipton@quicinc.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scmi: Add quirk to disable checks in
 scmi_dev_used_by_cpus()
Message-ID: <aJ7rBgce5eWSkkk3@pluto>
References: <20250814225155.3519000-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814225155.3519000-1-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_010851_821560_533ABAC6 
X-CRM114-Status: GOOD (  27.28  )
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

On Thu, Aug 14, 2025 at 03:51:55PM -0700, Florian Fainelli wrote:
> Broadcom STB platforms were early adopters of the SCMI framework and as
> a result, not all deployed systems have a Device Tree entry where SCMI
> protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
> CPU Device Tree node(s) referencing protocol 0x13 as their clock
> provider.
> 
> Leverage the quirks framework recently introduce to match on the
> Broadcom SCMI vendor and in that case, disable the Device Tree
> properties checks being done by scmi_dev_used_by_cpus().
> 

Hi,

> Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
> Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/cpufreq/scmi-cpufreq.c     | 13 +++++++++++++
>  drivers/firmware/arm_scmi/quirks.c |  2 ++
>  drivers/firmware/arm_scmi/quirks.h |  1 +
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index ef078426bfd5..80647511d3c3 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -22,6 +22,8 @@
>  #include <linux/types.h>
>  #include <linux/units.h>
>  
> +#include "../drivers/firmware/arm_scmi/quirks.h"
> +

I will post a patch to move this header up to avoid the uglyness of this
include....

>  struct scmi_data {
>  	int domain_id;
>  	int nr_opp;
> @@ -34,6 +36,7 @@ struct scmi_data {
>  static struct scmi_protocol_handle *ph;
>  static const struct scmi_perf_proto_ops *perf_ops;
>  static struct cpufreq_driver scmi_cpufreq_driver;
> +static bool __maybe_unused scmi_cpufreq_dt_props_check_disable;
>  

Not sure why you introduce an intermediate global bool to check...this
defeats a bit the whole idea of the quirks framework which is based on
static_keys and is supposed to be mostly transarent when quirks are not
enabled....

Couldn't you just move the quirk inside the get_rate ?
(maybe I am missing something around compiler behaviours..)
 
#define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS		\
({							\
	if (true)					\
		return true;				\
})

>  static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
>  {
> @@ -400,6 +403,9 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
>  	struct device *cpu_dev;
>  	int cpu, idx;
>  

+	SCMI_QUIRK(scmi_cpufreq_no_check_dt_props, QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS);

>  	if (!scmi_np)
>  		return false;
>  
> @@ -427,12 +433,19 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
>  	return false;
>  }
>  
> +#define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS			\
> +	({							\
> +		scmi_cpufreq_dt_props_check_disable = true;	\
> +	})
> +
>  static int scmi_cpufreq_probe(struct scmi_device *sdev)
>  {
>  	int ret;
>  	struct device *dev = &sdev->dev;
>  	const struct scmi_handle *handle;
>  

> +	SCMI_QUIRK(scmi_cpufreq_no_check_dt_props, QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS);
> +

...removing this of course

>  	handle = sdev->handle;
>  
>  	if (!handle || !scmi_dev_used_by_cpus(dev))
> diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
> index 03960aca3610..aafc7b4b3294 100644
> --- a/drivers/firmware/arm_scmi/quirks.c
> +++ b/drivers/firmware/arm_scmi/quirks.c
> @@ -171,6 +171,7 @@ struct scmi_quirk {
>  /* Global Quirks Definitions */
>  DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
>  DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
> +DEFINE_SCMI_QUIRK_EXPORTED(scmi_cpufreq_no_check_dt_props, "brcm-scmi", NULL, "0x2");

Also, are you sure about using version as "0x2" ? That is supposed to
indicate the (optional) SCMI FW Version to which this quirk will
apply...and with that it means whatever FW versioning you use in
Broadcom to identify build versions....it is NOT the SCMI Protocol
Version, so that also means that if/when you will change the advertised
version, this quirk wont apply anymore...or equally if there are older
version than 0x2 that are buggy they wont be quirked...

One more doubt I have (despite me having suggested this solution) is
that here you are quirking against a malformed deployed DT really,
not against some SCMI FW anomaly in the Broadcom FW, but using the
SCMI Quirks framework you are tying the quirk to the SCMI FW Vendor
and maybe some specific SCMI FW Version....

...so what will happen when you will update/fix your DT in the future ?
Will you also take care to bump the BRCM SCMI FW version to disable the
quirk in the DT deployed by your FW binary ?

Thanks,
Cristian

