Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DB9F8DFE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8QspruT5jjGLL3FrDL/uQ2QNGs2WwlmHKjn/j9gl1s=; b=BbvuWNg82/S73OYgbHrHAtHMU0
	At4raFuwf6SctZZw3bspQyyTvXedO2IjzEtaSsnjwowvNCRx70k20nH3OwLyvJZhjEIkzpMkRzazs
	jLXKYA05CXS2NmdzJlTr/abAT0yF6S8x5N+0XmcEI7sTeFzZnVTvZ2xPozwuSFndttFyCiazyUR0e
	nEzBTskkj0VO6xRLTip9ow2mowrW6wjDL7lkAW2nEMUdbHoEv2lmMGjLgEGz3H0dv2hzdOm893nI3
	/zJNGAazaa1jSx87XuZFYeRz2a6ym6nIVYjaF3ewFA40z2FBy0DIYl6EczxXW0xDFnAww4dD0Vc6S
	xL6am4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDelR-00000003gta-03q9;
	Fri, 17 Apr 2026 08:41:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDelN-00000003gsM-3Idy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 08:41:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3882A1E7D;
	Fri, 17 Apr 2026 01:41:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 667673F641;
	Fri, 17 Apr 2026 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776415280; bh=AE9tGvDnku39vfxAUF/4mX5MIkxJb3p3tylUEbtf31E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqqZ49dCyA2UnmFgbaQIh5ScjTi1wPbBSHQHRFYpY2xu7Ane3PVMjz+x3aMVxdJHw
	 zaWLmbeH+Y1r9Vc7WMYlFbPLgJme/0Yrzgt6hmgXiyArjMc3E4zM/SxfhENJJJ7O+b
	 oVxFtPI/+V6W1kKyKMqGEPU8lQAG/6grpzzuwuRQ=
Date: Fri, 17 Apr 2026 09:41:18 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Subject: Re: [PATCH v5 06/12] coresight: etm4x: fix leaked trace id
Message-ID: <20260417084118.GP356832@e132581.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-7-yeoreum.yun@arm.com>
 <20260416165541.GN356832@e132581.arm.com>
 <e994bf83-a66c-453e-aee6-c15b6888499c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e994bf83-a66c-453e-aee6-c15b6888499c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_014122_374523_09960218 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

On Fri, Apr 17, 2026 at 09:01:17AM +0800, Jie Gan wrote:

[...]

> ... we still need support static trace ID allocation in parallel for
> the dummy sources and we should not break this logic in future refactor.

Just confirm what is the reason you need to use static trace ID for the
dummy sources?

I am wandering if we could use dev->devt as trace ID for dummy
devices.  Since the device's MAJOR number is non-zero and occupies the
upper bits (see MINORBITS), it is naturally separated from the hardware
trace ID range.  If so, we even don't need to bother ID alloc/release.

Thanks,
Leo

