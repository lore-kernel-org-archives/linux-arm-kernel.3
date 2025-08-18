Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3031CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oHV6eDv/jSipaBzI1+qlMqK2ITIVXOlUp3nua4gFpk=; b=MAh5SLD/iOkjZlJPVI7rijgvDz
	7IO3/bA2fkaixkAcuwHDrHc+I3zJCPlP+JxdNPENMzX7zYuFNCvI+BOMMaZnt4EFtEWh3dAmQxtCo
	NJjwvAWOTlRh/KY7pX5QOIYhT+aO3BURXxZFwwlnnzQ4vc4xHwit1pmYyrtoT+yGqwNCJFKWx+Jx4
	wU2BAoCfqI8libp7NU3qlvvPYYk8YzMN5wNkhLISo5obfmD9fRUbCjWbnVJK9XqMw7FxLK1RjH3qA
	k09lHJC5FvWnxE38jZTxdhM1aYGV+QJQZtUHaGnE4M+gaUnFyGc93gLuL7lrd/wbniwnEAzFCVHMD
	N3epq7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unue9-00000006pA8-3guU;
	Mon, 18 Aug 2025 07:51:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untF3-00000006coy-16Ob
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 06:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4oHV6eDv/jSipaBzI1+qlMqK2ITIVXOlUp3nua4gFpk=; b=ByfnIDCKvdI3fS2wb3YObnhkoy
	yljhkf8Tg/TA8qYUD2+qNJxBgzI6tg5YWEExftZodiN1DreWRMHvhDd9BOBwtCwC9gPfrJHrzucQ/
	ERDfwXKy2+n8vtQi3QSfS4CMVzTkn7x93cN73dyOpvQKjALYHq/DVF/xRQ5yT5rTtOtAjXTwb4wnM
	MKbiHUGI3BlPWDpAYhK0c8NIcOqibYvlsG/uv6HC8JByIcGOC3I+cIiTpVbR2fpyXumF4sZ9CkoPQ
	JBtt+La9KArYWaiBi0T0j/2l2cp6BvrD5A5Z+tDLUNYyWRqrIpc7jDJVFTodmStaBL6ObtfhWPrb4
	VBGYz4zQ==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untEy-0000000HHDL-1i6D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 06:21:12 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57I6KkKV2653885;
	Mon, 18 Aug 2025 01:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755498046;
	bh=4oHV6eDv/jSipaBzI1+qlMqK2ITIVXOlUp3nua4gFpk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DzPRt50w+q2spgh7NxBisUjPt9yBaIOK1KzpkfMH7nGX2ebDA3XFXELuFwIfGBwEN
	 dguytTXvWx6sW4cZfckp/JVJmpwyvV945/yyVayTjzUxbQdOQBjAi0+QGn3YMU9PHB
	 83AlAMkY6fE96+U7n7LE1FKVTXTwKsGCtu2Vr1J8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57I6KkMj3594812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 01:20:46 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 01:20:46 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.1748.24; Mon, 18 Aug
 2025 01:20:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 01:20:45 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57I6Ki38544316;
	Mon, 18 Aug 2025 01:20:45 -0500
Date: Mon, 18 Aug 2025 11:50:44 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <arm-scmi@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <sudeep.holla@arm.com>, <james.quinlan@broadcom.com>,
        <f.fainelli@gmail.com>, <vincent.guittot@linaro.org>,
        <quic_sibis@quicinc.com>, <dan.carpenter@linaro.org>,
        <johan+linaro@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <quic_mdtipton@quicinc.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>
Subject: Re: [PATCH 2/2] [NOT_FOR_UPSTREAM] cpufreq: scmi: Add quirk to
 disable checks in scmi_dev_used_by_cpus()
Message-ID: <20250818062044.zawqkalphvxjwt2w@lcpd911>
References: <20250815102736.81450-1-cristian.marussi@arm.com>
 <20250815102736.81450-2-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250815102736.81450-2-cristian.marussi@arm.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_072109_822290_ACF37BCC 
X-CRM114-Status: GOOD (  21.15  )
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

On Aug 15, 2025 at 11:27:36 +0100, Cristian Marussi wrote:
> From: Florian Fainelli <florian.fainelli@broadcom.com>
> 
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
> Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
> Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> [Cristian: Moved quirk directly into scmi_dev_used_by_cpus]
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> ----
> @Florian: I reworked this minimally to avoid the global as I was mentioning.
> No change around the version match either...so the NOT_FOR_UPSTREAM tag.
> (also the if (true) i smaybe a bit idiotic...)
> Please check if it is fine and modify as you see fit.
> ---
>  drivers/cpufreq/scmi-cpufreq.c     | 9 +++++++++
>  drivers/firmware/arm_scmi/quirks.c | 2 ++
>  include/linux/scmi_quirks.h        | 1 +
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index ef078426bfd5..9b7cbc4e87d9 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -19,6 +19,7 @@
>  #include <linux/pm_qos.h>
>  #include <linux/slab.h>
>  #include <linux/scmi_protocol.h>
> +#include <linux/scmi_quirks.h>
>  #include <linux/types.h>
>  #include <linux/units.h>
>  
> @@ -393,6 +394,12 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
>  	.set_boost	= cpufreq_boost_set_sw,
>  };
>  
> +#define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS			\
> +	({							\
> +		if (true)					\
> +			return true;				\
> +	})
> +

Probably another checkpatch warning to fix:
8<--------------------------------------------------------------------
WARNING: Macros with flow control statements should be avoided                                                                                                                                                     
#50: FILE: drivers/cpufreq/scmi-cpufreq.c:397:                                                                                                                                                                     
+#define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS                      \                                        
+       ({                                                      \                                                                                                                                                  
+               if (true)                                       \                                        
+                       return true;                            \        
+       })                                                                                               
                                                                                                         
total: 0 errors, 1 warnings, 0 checks, 47 lines checked                                                  
-------------------------------------------------------------------->8


-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

