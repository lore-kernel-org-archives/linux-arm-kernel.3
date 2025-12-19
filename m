Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B917CD78763
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cov5JxZaKbMg2TNoSfvRy4Pz97ibHmqWqHmFt7gOYs=; b=B72pOjoVRJF1SeHl8TMH8U1fxo
	0mNMGkfJmjrWizufe6t113dtyeQi+CftmUGAfnRzpeHjLkYzglN8U4hROBfXrLd0ZdHA9Va7xx97K
	fN60o1uHQEPN4j4COvWbaotEgWyZgxPUwYZRSff5WvKPsd9oxT1K9Xs9Z1pFj0cJ24hpVTNUS4AdE
	F7/nJYCnWW4wgMhUJ5HnytUd9vqwoWWlLPMsQxY/T9U1U51iGGVQG32NXMWU0k1EmcmsxCCP1vaDT
	9kWKDnlDwlJs9T24LLBK9KoRZcapfFzUr/LWCtLNahxTmPODjAKq7PABg5twKSbmOwGpMsbdNwd/6
	8kwstC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZQm-0000000AH02-2PlF;
	Fri, 19 Dec 2025 12:18:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZQk-0000000AGzX-388Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:17:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BB76FEC;
	Fri, 19 Dec 2025 04:17:50 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04C433F5CA;
	Fri, 19 Dec 2025 04:17:56 -0800 (PST)
Date: Fri, 19 Dec 2025 12:17:54 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Ma Ke <make24@iscas.ac.cn>, jie.gan@oss.qualcomm.com,
	james.clark@linaro.org, akpm@linux-foundation.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mathieu.poirier@linaro.org, mike.leach@linaro.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] coresight: etm-perf: Fix reference count leak
 in etm_setup_aux
Message-ID: <20251219121754.GD9788@e132581.arm.com>
References: <f85c7d37-4980-46f0-9136-353a35a8f0ed@oss.qualcomm.com>
 <20251219023949.12699-1-make24@iscas.ac.cn>
 <20251219094141.GA9788@e132581.arm.com>
 <d4946831-fc8c-4727-abec-3edd92e357d1@arm.com>
 <20251219113803.GC9788@e132581.arm.com>
 <5a967265-b527-4ca0-bf63-f5f7cf9013a3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a967265-b527-4ca0-bf63-f5f7cf9013a3@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041758_826143_49A27EBF 
X-CRM114-Status: GOOD (  15.33  )
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

On Fri, Dec 19, 2025 at 11:48:35AM +0000, Suzuki K Poulose wrote:

[...]

> > My understanding is we don't grab a device from
> > coresight_find_device_by_fwnode().  The callers only check whether the
> > device is present on the bus; if it isn't, the driver defers probe.
> > 
> > This is similiar to coresight_find_csdev_by_fwnode(), which calls
> > put_device(dev) to release refcnt immediately.  This is why I
> > suggested the change, so the two functions behave consistently.
> > 
> 
> I see, sorry. I saw some other uses of the device, but clearly I was wrong.
> May be we should simply re-structure the function to :

No worries and thanks for confirmation.

> bool coresight_fwnode_device_present(fwnode)
> {
> 
> 	// find and drop the ref if required.
> 	return true/false;
> }
> 
> The name "find_device_by_fwnode" and returning a freed reference doesn't
> look good to me.

Renaming is good.  Maybe use a separate patch to rename:

  coresight_find_csdev_by_fwnode() -> coresight_fwnode_csdev_present()

Thanks,
Leo

