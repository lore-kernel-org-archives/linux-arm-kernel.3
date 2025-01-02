Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859CFE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooaglpRi/5xpaIgjOz5YJ+EAevl0mZjfqxAnhqmnBe0=; b=XOZww5P5G0P3fypV2jhjBS+fK1
	M5H2RSYQH065s/asi30WJ+sDWd1tCvgEymYMMbRzhqcHM95GL5VuDWl26pC97dqOFRRTWEWTiSYwr
	wfUWF1kADH8HhpL9t4n4uT13jJcKrc+cEvAFm9YS/3r/7DXDboFyNsYA30TF24LAe3toCcAqMT5Tj
	eFF9zNiNW5N/Rr/QV0cqyBGg9bEgimpuDMzJN2rtB5akZXD1Cx/Pu0NbDiXpvY0ludFN2EvkcBLue
	j/3EhVcCcy6trPP1jDxycCGrkUcwPlGkdbHIp5km4x6P2/ltHKNcZgziA2vH5L7nj4Sjj9+v+GaUF
	Yl2VOTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHqr-0000000A5t6-1Y2x;
	Thu, 02 Jan 2025 09:50:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHoi-0000000A5Y5-2cKR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:48:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AB5811FB;
	Thu,  2 Jan 2025 01:49:01 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B008E3F59E;
	Thu,  2 Jan 2025 01:48:31 -0800 (PST)
Date: Thu, 2 Jan 2025 09:48:28 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: <cristian.marussi@arm.com>, <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <viresh.kumar@linaro.org>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: scpi: Prevent null pointer dereference in
 scpi_cpufreq_get_rate()
Message-ID: <Z3Zg7PHdGAzXsyMg@bogus>
References: <20241230093159.258813-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230093159.258813-1-hanchunchao@inspur.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_014836_733820_E5763553 
X-CRM114-Status: GOOD (  17.99  )
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

On Mon, Dec 30, 2024 at 05:31:59PM +0800, Charles Han wrote:
> cpufreq_cpu_get_raw() may return NULL if the cpu is not in
> policy->cpus cpu mask and it will cause null pointer dereference.
> Prevent null pointer dereference in scpi_cpufreq_get_rate().
>

Can you please fix such occurrences in other places too ?
I see it in apple-soc-cpufreq.c and scmi-cpufreq.c as well.

> Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/cpufreq/scpi-cpufreq.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
> index cd89c1b9832c..c888ed3a0de9 100644
> --- a/drivers/cpufreq/scpi-cpufreq.c
> +++ b/drivers/cpufreq/scpi-cpufreq.c
> @@ -30,6 +30,9 @@ static struct scpi_ops *scpi_ops;
>  static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
>  {
>  	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
> +	if (unlikely(!policy))
> +		return 0;
> +
>  	struct scpi_data *priv = policy->driver_data;
>  	unsigned long rate = clk_get_rate(priv->clk);
>  

-- 
Regards,
Sudeep

