Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5974AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 11:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUv3Ois8ZCHDMoM2egWiuohStpgz7BU/niPld0UTTWY=; b=iVpbAy4JXiWgw7Jw/R/p7Hw+Bm
	ns76Klq6JYkyXhj6ChlTanvC8G24kc8upV0hrUEXnKHKV8Z7Ip9xvL40A4MFPq54eQHAzpyHtWZOF
	ywICXinXJ0XxtlSBQLx+mceFMWERE7cYGITkzLvwedLBxy8UZ9NEgyC0q4gwa8EDb5pi6SL5Co0kz
	m5kECWQYhztk0wj2kkDN+XtaYXiSVJb1LXGH3QqoZOnwwVZrTFChs7u8WQmRn6okiuGw381jyK4lC
	ZNIVUdm5ZdipGvBy3XYu1QppDD0sBZkO7lDrHSV1Zei//2Wahyn4Kynfmg9gDtg8Y359JHCikLl5O
	iJhNhPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kkO-000000001Ai-0OSz;
	Mon, 07 Apr 2025 11:34:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kgx-0000000Hawq-3CKU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 11:31:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71A42106F;
	Mon,  7 Apr 2025 04:31:03 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E7FC3F59E;
	Mon,  7 Apr 2025 04:31:00 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:30:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: cristian.marussi@arm.com, rafael@kernel.org, viresh.kumar@linaro.org,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] cpufreq: scmi: Fix null-ptr-deref in
 scmi_cpufreq_get_rate()
Message-ID: <20250407-wondrous-turtle-of-foundation-e92250@sudeepholla>
References: <20250405055447.73925-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405055447.73925-1-bsdhenrymartin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_043103_844678_63651C9A 
X-CRM114-Status: GOOD (  17.97  )
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

On Sat, Apr 05, 2025 at 01:54:47PM +0800, Henry Martin wrote:
> cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> in the policy->cpus mask. scmi_cpufreq_get_rate() does not check for
> this case, which results in a NULL pointer dereference.
> 
> Add NULL check after cpufreq_cpu_get_raw() to prevent this issue.
> 
> Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index c310aeebc8f3..c735f39245bf 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -37,11 +37,17 @@ static struct cpufreq_driver scmi_cpufreq_driver;
>  
>  static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
>  {
> -	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
> -	struct scmi_data *priv = policy->driver_data;
> +	struct cpufreq_policy *policy;
> +	struct scmi_data *priv;
>  	unsigned long rate;
>  	int ret;
>  
> +	policy = cpufreq_cpu_get_raw(cpu);
> +	if (!policy)

How about `if (unlikely(!policy))` instead ?

With that you can add :

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Both comment and review applies for scpi-cpufreq.c

-- 
Regards,
Sudeep

