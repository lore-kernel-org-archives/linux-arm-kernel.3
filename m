Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1231088E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuIuj6jPyTIoBTwoJKtWdl2yMOYfZCNpjrte30EDTm8=; b=Hc6IQrFOvMdU1XcGSySsqZ2T8F
	Tzx/veQVfgUcwskzc3MyQ9MRCNJC+fvbsV0ZIv8JX0sEgNM7s9+59Gh8JYwBkwowUDgKm5jUhR3ys
	SmC0tp30KkEudDnykFNL9czOo7AJLwDoZ+SVCQAu+59Nt4LcjBoJzTaTPWT7Tl3iGJvq5mtTO6BWL
	+7r1xz/IumRr6MzTtMIBtq7TT5YL2J1m0Q87nk54lNmN+BvsXNMENZ/X640QrTApPAfguqaU2YJf8
	gyvuEGVxHJeMqDovNjlAJvjhGGx6UTbAYq6rSeIHWQl2gAEOfiF5bmmOjZlIFzu8BD7mDIJJqCUjI
	SIoOJRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W52-0000000CT9p-459d;
	Fri, 20 Mar 2026 09:23:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W50-0000000CT9S-0stC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:23:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 364D91682;
	Fri, 20 Mar 2026 02:23:34 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D44413F778;
	Fri, 20 Mar 2026 02:23:39 -0700 (PDT)
Date: Fri, 20 Mar 2026 09:23:37 +0000
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: platform: check the availability of the
 endpoint before parse
Message-ID: <20260320092337.GP8048@e132581.arm.com>
References: <20260320-add-availability-check-v1-1-b2e39cdeb6e0@oss.qualcomm.com>
 <20260320082549.GO8048@e132581.arm.com>
 <519ca61b-049e-4e2f-a9fc-9b4621574470@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <519ca61b-049e-4e2f-a9fc-9b4621574470@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_022342_310171_4329AC99 
X-CRM114-Status: GOOD (  13.73  )
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

Hi Jie,

On Fri, Mar 20, 2026 at 04:44:54PM +0800, Jie Gan wrote:

[...]

> It's about the coresight_find_device_by_fwnode() returns NULL, resulting in
> -EPROBE_DEFER. So the probe process will re-start after several seconds, but
> always failed because we have a "disabled" device node in DT(we can see this
> device in DT, but it never becomes available). It's ok if the device only
> has one remote device, but has issue with more than one remote devices.
> 
> Consider below situation:
> 
>       device0
>    |          |
>   device1  device2(status = "disabled")
> 
> The probe of device0 succeeds only when device1 and device2 are available at
> probe time. But I think it's ok to probe the device0 only with device1
> available.

Thanks a lot for details.  We might need to report warning or error if
all remote endpoints fail (e.g., device1/device2 both are disabled),
this is a rare case so would be low priority.

For this patch:

Reviewed-by: Leo Yan <leo.yan@arm.com>

