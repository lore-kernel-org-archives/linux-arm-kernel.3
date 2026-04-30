Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C1EFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 17:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9plVCBA8NG1qHxPo97Ma+U/4oPmv6inQgJfe1YfOhas=; b=uI2dh+Vj8fgRxXznz3a3t2saQ1
	c5MUGrO1jbeAy80P1sz7mOa//hB8QAoko8ksQZO6aCp664GiPOqQ25kp520U920z/tl08hDLy8H0t
	R0SuXT5ObuVqazTq04g3UVGG+mYP1+81jLj4s9xgUgLt3QWAuS7JF4XYA14h1i7kAqC9rYIO0JLVC
	65Zxd2FvgtsDG3Gj0+1XrVpBvBc7/egw0Gpy66OfuMkkW/3aX+APIDCKYc+rDOBmwX59xmwRBq8wS
	4tXLytVRhYz8mxaCKq/JuQVSbe7eAvE3P9RSEv7S4nJLtcMDCSrivtdt1sfeKu10ar/eeE0ZIpXyY
	45vhku3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIV7Z-00000005n3n-02sX;
	Thu, 30 Apr 2026 17:24:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIV7W-00000005n3L-3CTg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 17:24:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CB14175D;
	Thu, 30 Apr 2026 10:24:07 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71E4C3FAF5;
	Thu, 30 Apr 2026 10:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777569852; bh=W7KvrmKSH/47VlzRFv8Cr8zhERDW09ttFcIbgy5m6ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDZ9kgd1F2APSzB4Aua15VI9jJrw/jMur9hBOzS7MCaouFEP545stFEuv4itmTQzi
	 ErhOzQ4FERb+ZpAAW9xHtzY6Nl1ESRLGkZWdWReEYb9DQY53byWglKs0PDklgwwiXi
	 n7oJ1ALc2Jz55ruKtzrsPvOUInBdFnsgRsxxEX28=
Date: Thu, 30 Apr 2026 18:24:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] coresight: etm4x: Refactor pm_save_enable handling
Message-ID: <20260430172410.GG16537@e132581.arm.com>
References: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
 <20260428-james-cs-ete-pm_save_enable-v1-2-c7a90ca6f43b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-james-cs-ete-pm_save_enable-v1-2-c7a90ca6f43b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_102414_908397_5D74E701 
X-CRM114-Status: GOOD (  14.86  )
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

On Tue, Apr 28, 2026 at 01:18:12PM +0100, James Clark wrote:

[...]

>  static int etm4_init_pm_save(struct device *dev, struct etmv4_drvdata *drvdata)
>  {
>  	if (etm4x_is_ete(drvdata)) {
> +		if (pm_save_enable)
> +			dev_warn_once(dev, "pm_save_enable module option is only for ETM4\n");
> +
>  		/*
>  		 * Always do PM save for ETE. It always uses system registers
>  		 * which will be lost on CPU power down.
>  		 */
> -		pm_save_enable = PARAM_PM_SAVE_SELF_HOSTED;
> +		drvdata->pm_save = true;
>  	} else if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE) {
> -		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
> -			PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
> +		drvdata->pm_save = coresight_loses_context_with_cpu(dev);
> +	} else if (pm_save_enable == PARAM_PM_SAVE_SELF_HOSTED) {
> +		drvdata->pm_save = true;
> +	} else {
> +		drvdata->pm_save = false;
>  	}

Could we separate ETE and ETM a bit?

        int cpu_pm;

        cpu_pm = coresight_loses_context_with_cpu(dev) ?
                PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;

        if (etm4x_is_ete(drvdata))
                goto alloc_out;

        /* Now this is only for ETM case */

        /* Do consistency check */
        if ((cpu_fw_pm == PARAM_PM_SAVE_SELF_HOSTED &&
             pm_save_enable == PARAM_PM_SAVE_NEVER) ||
            (cpu_fw_pm == PARAM_PM_SAVE_NEVER &&
             pm_save_enable == PARAM_PM_SAVE_SELF_HOSTED))
                dev_warn(dev, "inconsistent setting ...\n");

        /* Force to use the global setting */
        if (pm_save_enable != PARAM_PM_SAVE_FIRMWARE)
            cpu_pm = pm_save_enable;
>  
> -	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
> +	if (drvdata->pm_save) {

would be:

        if (cpu_pm == PARAM_PM_SAVE_SELF_HOSTED)

>  		drvdata->save_state = devm_kmalloc(dev,
>  						   sizeof(struct etmv4_save_state),
>  						   GFP_KERNEL);
> @@ -2037,7 +2047,7 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  {
>  	int ret = 0;
>  
> -	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> +	if (!drvdata->pm_save)

Drop "pm_save" and directly use drvdata->save_state ?

We don't need "pm_save" anyway after we apply the patch [1].

[1] http://listhost.cambridge.arm.com/pipermail/linux-eng/2026-April/030289.html

