Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A367C5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 17:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40tGj4LtArMYY/iMAZx4qLQgfsxafDk9Vi56FBAOAgk=; b=rBMW/HLX7kENWyugv0V+LoM1y5
	b+488onBSWKaLI4FZXn78/9mwFoCfgLKxrMTn6VkJC0Dj9Saq7mb8j+GLR6487BlMSoa1220gtZPW
	FJBNOEX/93GSo0vIOu0W0PODteFmqE5AJP2XyvaOeYUC0Y3wW7FPlvXeCyEBNvJOvFFYIMaYCQwnZ
	t/kT6F6WPh2U7OHKGAprdHCoPpoOSUC/MUvSzv/Egf9QMw+5+u617iYAOJ1XWp0wD07cQru2Wk+GY
	6NOW7Uju7Gie1+j62SEw5tFQjf7IykCWP2UErUbuunSR7ZSmw4mLm5PzJAaG9iq6tgwlLjcLrUlHC
	NLKrT3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUQ3-0000000FNdS-0Wl7;
	Fri, 20 Feb 2026 17:35:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUPz-0000000FNcx-2B8y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 17:35:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EF92339;
	Fri, 20 Feb 2026 09:35:45 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58BA03F7D8;
	Fri, 20 Feb 2026 09:35:51 -0800 (PST)
Date: Fri, 20 Feb 2026 17:35:49 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <Mike.Leach@arm.com>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 8/8] coresight: cti: Refactor cti_reg32_{show|store}()
Message-ID: <20260220173549.GI136967@e132581.arm.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
 <20260209-arm_coresight_cti_refactor_v1-v1-8-db71ab4d200b@arm.com>
 <PAVPR08MB96744050482081B274E6E4BB8C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAVPR08MB96744050482081B274E6E4BB8C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_093555_708852_C731927A 
X-CRM114-Status: GOOD (  21.67  )
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

Hi Mike,

On Fri, Feb 20, 2026 at 02:44:03PM +0000, Mike Leach wrote:

[...]

> > @@ -252,14 +252,14 @@ static ssize_t cti_reg32_show(struct device *dev,
> > char *buf,
> >  	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> >  	struct cti_config *config = &drvdata->config;
> > 
> > +	if (reg_offset < 0)
> > +		return -EINVAL;
> > +
> >  	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
> > -		if ((reg_offset >= 0) && cti_is_active(config)) {
> > +		if (cti_is_active(config))
> >  			val = cti_read_single_reg(drvdata, reg_offset);
> > -			if (pcached_val)
> > -				*pcached_val = val;
> 
> I think we still need this. If a register with an none-zero default
> value / status that can change over time is read when active, then
> read when inactive, but never written, then the inactive value will
> not reflect the last read value.

Let us consider below operations using your suggested approach:

  echo 0xab > /sys/bus/coresight/devices/cti_cpu0/regs/gate
  cat /sys/bus/coresight/devices/cti_cpu0/regs/gate

  echo 1 > /sys/bus/coresight/devices/cti_cpu0/enable
  cat /sys/bus/coresight/devices/cti_cpu0/regs/gate

  echo 0 > /sys/bus/coresight/devices/cti_cpu0/enable
  cat /sys/bus/coresight/devices/cti_cpu0/regs/gate

If a user reads the "gate" knob three times in the above flow, it ends
up having three different semantics.

 - The first "cat ../gate" outputs the user specified value (0xab).
 - The second "cat" outputs the real-time register value after the
   module has been enabled.
 - The third "cat" outputs the last read value before disabling.

This could be confusing for users (even for ourseleves), as it needs to
understand the meaning of the value under specific conditions and based
on prior operations.

To simplify the semantics in this patch, the "cat" returns the realtime
register value when the module is enabled; otherwise, it returns the
user configured value.  Since "*pcached_val" always stores the user
configuration, it remains consistent configurations across multiple
enable/disable cycles.

> Relatively minor issue but does represent a potential change in
> functionality for the driver - even if I cannot see specific issues
> for current ARM CTIs. This is a R/W cache so should be updated on
> both R and W.

"R/W cache" mixes the cached user configured value with the hardware
register dump and may become inconsistent across multiple
enable/disable cycles.

It seems to me that this is a bit overdesigned and complex. thoughts?

Thanks a lot for review!

Leo

