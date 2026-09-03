Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A07C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RJJ5Ck5tDcfXmRju452BkVK6jdwg9PPI73U3ho8lRE=; b=wV3MTNACyoRyelN4sAozqpLCE+
	i2TeIR0NbeWFiyuLCNQ4IOoHGemraWzc8haq0RqbeIVdahgGd8dTc7FLJASN2EHghoGSM7iEi0c9W
	iEY3QykTWZf4mTigFQlJ+MsqF1Z3cIy6X5IlJLrcwm97HENVG3NG/BoOu5tra/c5McBNIZnWyJmQs
	ZCCe9jhu+4l/4VzKsbKbF8XBiGmJiLw5CJ/rYBsB2nyexDR/pGthaxCnZYeiyS71ik4C5Bz1f6ONq
	kO9c2OdqUXR4onoJnuV+m9Way7CNl1cQqsXfs+2+rhrkgzR2WhKfORS6lQO5dAPyfjKxmexXK5wMe
	J8wGOWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21le-0000000GZ4j-1a5g;
	Thu, 03 Sep 2026 07:21:50 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21lb-0000000GZ4P-3fHN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788420108; x=1819956108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E/rv5OYfCgD1Ay6H7pbOaKWU2Rq/RliVZWyF2kjsLCc=;
  b=MxEwYlXwyOKqNxAv5sfXmRsYcQHVK1fK+JBQAwBx66MPGnOhMwUF737k
   cA6A39Vc4W+r/hUCSpdac2vJIJqqBJpFWkj/6JACKFWvocqU5eL6AhozY
   HepPHnCi15XqdZI/8/+vLOt4q7Dzgpx22vro9USBpZwmZHGLOtkr8kqBO
   IFnp3Kb4w7WCI3umCsc3/wl/bJ6JYIURXxf3cpW1EJYq1AZYBlszrAcMg
   4H9AbHJPieFI9kDx7L0PsnEMWtn1HCAqBV+ih35reCBq9U1JC4pcBG57H
   LSqdondU0EUQ3nSRwDyK+hYivphpolr2cqDAaBxpdvRmy/7F+8j4xDPwF
   w==;
X-CSE-ConnectionGUID: gl25wEUrQNuYsEqpJTyJjQ==
X-CSE-MsgGUID: rUru1PfbRICm9cKw58chgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88815772"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88815772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:21:46 -0700
X-CSE-ConnectionGUID: S57IN92qQCKbOLMzaU+g8A==
X-CSE-MsgGUID: JmrspBJRQ7aRBQVp04jgaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="263461669"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:21:42 -0700
Date: Thu, 3 Sep 2026 10:21:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Subject: Re: [PATCH v2 01/12] i2c: core: add I2C_XFER_V2 - support for
 detailed transfer reporting
Message-ID: <apkgBIgF09HAcbot@ashevche-desk.local>
References: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com>
 <20260903-i2c-fault-reporting-v2-1-fedeb91792e6@mobileye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-i2c-fault-reporting-v2-1-fedeb91792e6@mobileye.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_002147_954907_042A3570 
X-CRM114-Status: GOOD (  33.52  )
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

On Thu, Sep 03, 2026 at 08:38:08AM +0300, Dmitry Guzman wrote:
> In I2C subsystem there is API that allows sending/receiving a number of
> messages in a single call. I2C_RDWR ioctl, as well as i2c_transfer kernel
> API function, returns only a single error code. In case of a fault,
> there is no way to know which message in the series caused a fault, and
> how many bytes have been sent or received before the fault.
> 
> This commit introduces i2c_transfer_v2 kernel API function and
> I2C_RDWR_V2 ioctl. They provide the same functionality as the old ones,
> but also accept additional pointer to `i2c_transfer_report` structure
> and fill it with detailed fault report: number of messages transferred
> successfully, index of message that caused fault, number of bytes
> transferred (if a fault occurred in the middle of the last message).
> 
> I2C bus controller driver may implement either both callbacks or any one
> of them. The implementation of both callbacks may make sense if the
> precise detection of the fault position requires different handling with
> the hardware that causes to extra CPU load or other consequences that
> may be unwanted if the precise fault report is not required. If the
> precise fault detection is free, the driver may implement only `xfer_v2`
> callback - the infrastructure will provide pointer to a dummy fault
> report that will be dropped if the client uses old API.

What tool do you use?
The problem with the submission is that:
- it has no cover letter
- it has been send with In-Reply-To set to the previous version of the set.

I have noticed the same issue in another patch series which is heavily relies
on AI. You should read the coding-assistants.rst and act accordingly.

...

> -int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +int __i2c_transfer_v2(struct i2c_adapter *adap, struct i2c_msg *msgs, int num,
> +		   struct i2c_transfer_report *report)
>  {
> +	struct i2c_transfer_report dummy_report;
>  	unsigned long orig_jiffies;
>  	int ret, try;
>  
> -	if (!adap->algo->master_xfer) {
> +	if (report) {
> +		report->msgs_cplt = -EOPNOTSUPP;
> +		report->bytes_cplt = -EOPNOTSUPP;
> +		report->fault_msg_idx = -EOPNOTSUPP;

Why all three?! Why even a single one as long as we return an error code?

> +		if (!adap->algo->xfer_v2)
> +			return -EOPNOTSUPP;
> +	}
> +
> +	if (!adap->algo->master_xfer && !adap->algo->xfer_v2) {
>  		dev_dbg(&adap->dev, "I2C level transfers not supported\n");
>  		return -EOPNOTSUPP;
>  	}
>  
> +	/*
> +	 * If the controller only supports "v2" callback and the report is not requested,
> +	 * provide pointer to a dummy report.
> +	 */
> +	if (!(adap->algo->master_xfer) && (!report))

It's not a line in the macro.

> +		report = &dummy_report;


> +	if (adap->quirks) {
> +		struct i2c_msg *bad_msg = i2c_check_for_quirks(adap, msgs, num);
> +
> +		if (bad_msg) {

This style is bad for maintenance. Whenever you need to validate something,
never assign it in the definition.

> +			if (report) {
> +				report->msgs_cplt = 0;
> +				report->bytes_cplt = 0;
> +				report->fault_msg_idx = bad_msg - msgs;
> +			}
> +			return -EOPNOTSUPP;
> +		}
> +	}

...

On a brief look this patch made with AI and it's a complete unreviewable mess.
Make sure you do a series of a small logically finished pieces. For example,
introducing a v2 of a hook with a new prototype. This can be done in a separate
patch. Adding report is another, and so on...

-- 
With Best Regards,
Andy Shevchenko



