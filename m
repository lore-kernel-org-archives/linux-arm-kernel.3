Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D9CCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp/Ktl/BfJgahFQrSgF+CUYl79FC3zWQugrYYRrUwU4=; b=DQ7x4synIL1YD/6n3cJecIWa3F
	f7EH4wouN40L5UF4kRKIyNBYHpLFN5ntfnrvE/wXgpTDyaaFwF8zppuOxofIEarjreIZ8/CKmlaU8
	HyII6KXgd8Up3Lz7t53Wh4fx61rnUU1PaIu7pWZRk9wODitj4EPbL1keyddWv87XiLbFCQPtMTa1Z
	kv2e4z/+87Ii8O18taywKwkoUMEgwoEtUUY4CPzxXljANhlwA/oIe8v3TP+EOys3t3vfFECF/7LIk
	nwX6ykNPQOeLddRFo7gGp/4k1OHoruxmoBorKHyXBOqdhYypDRAZDK1beAhsmAmw049RLk8viinqe
	g5ZVNW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoGh-00000007BwU-1mS6;
	Fri, 01 May 2026 13:50:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoGf-00000007Bw9-1er4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 13:50:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4B07176A;
	Fri,  1 May 2026 06:50:50 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D80143F62B;
	Fri,  1 May 2026 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777643456; bh=gIKEf1WZwbXI4L8Pus8PqCVCaNqrvltBdZxWR+B7YGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hb3cCLXL1a2wQ8K/kvh0sjLrnJUYt96HR7Q7U25CSeLV8+0zrcpnC0fllpPtBieRV
	 PTfKTmkz8PvAyonLZo/RSPWqA+pPAR2X09RYERxKdGqiDuHO3g+JRySj0xSczx4W8I
	 fVjSZqIZX8UuqwtqdhhBHD1xQJ21VTLUvTRHkWcw=
Date: Fri, 1 May 2026 14:50:53 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 1/2] coresight: ete: Always save state on power down
Message-ID: <20260501135053.GA2674113@e132581.arm.com>
References: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
 <20260428-james-cs-ete-pm_save_enable-v1-1-c7a90ca6f43b@linaro.org>
 <bc9f873e-4919-4617-bb6f-1f495a6a508b@arm.com>
 <be6bbfe1-cd51-43d8-84c7-34de929118f4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be6bbfe1-cd51-43d8-84c7-34de929118f4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_065057_496181_72482BF2 
X-CRM114-Status: GOOD (  21.91  )
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

On Fri, May 01, 2026 at 10:43:09AM +0100, James Clark wrote:

[...]

> > > +static int etm4_init_pm_save(struct device *dev, struct
> > > etmv4_drvdata *drvdata)
> > > +{
> > > +    if (etm4x_is_ete(drvdata)) {
> > > +        /*
> > > +         * Always do PM save for ETE. It always uses system registers
> > > +         * which will be lost on CPU power down.
> > > +         */
> > > +        pm_save_enable = PARAM_PM_SAVE_SELF_HOSTED;
> > 
> > Should we do this instead based on if the ETM/ETE is accessed via sys
> > instructions ? That would cover all implementations?
> > 
> > 
> > Suzuki
> > 
> 
> I did discuss that with Leo but we thought it might be a riskier change as
> ETM is older and nobody has reported any issues, and there is already the DT
> option to fix it that way. Turning it on by default could cause some
> performance regressions. Although it's only if the ETM is in use, so the
> impact is minimal.
> 
> In reality it probably does make sense as it's highly unlikely that sysreg
> ETM wouldn't need saving, so it might make some platforms with misconfigured
> DTs more stable.
> 
> I can send another version if you think it makes sense, what do you think
> Leo?

If extend a bit for ACPI context, it is fine for save / restore based on
sys reg implemenation. This is most nature way for support ACPI?

We can limit "arm,coresight-loses-context-with-cpu" for only ETM +
MMIO mode.

BTW, when respin, could you consider the approach for not changing
pm_save_enable. We simply take it as a global parameter, and calculate PM
mode for each CPU. But it is not necessary to write the PM mode back to
pm_save_enable.

Thanks,
Leo

