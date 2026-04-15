Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81ECFA0C4C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0YVr5VDQ9l5LiJwz5trQwgxUHf3mbmuBoNgSGW4exs=; b=D6Rrc4KG/LGqX9w0X8F56VbN1P
	vwJsOTaW62k30HBN9w+dqP720yGCuJMWwr42mLFNJxI1m8/53DEeRLsnmnMam+Ta958OSdWmW8YNQ
	OtRz+CutpYuabLG+eKPNpJ0oh9unqr7wjOExoTFCSmgzoeuImrnsYtLIfs9vtZN9yw1oFI0yZo9cJ
	vzQANB1/jMzVzbbqhLiRYL429YUUdw7yWKiKv0ItjCbpxLwZ3Nzt/0bLg8vh/5laONUEuTsM6Nf5X
	GlKaRlcWgWvwha3LG7sEL6lgWxEOXV1pj+4qz+K2UoTE+l/Ftoeoo8dQXLFgW1n9ax39GGwZ/apSB
	JkxyGPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvfk-00000000ov8-2UQX;
	Wed, 15 Apr 2026 08:32:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvfh-00000000ouk-13Li
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 08:32:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C76EF4FBA;
	Wed, 15 Apr 2026 01:32:21 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C95F63F86F;
	Wed, 15 Apr 2026 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776241947; bh=3Oz86IP4KYvd6deOUSDzB67MR2t73cfuj670d+WNmzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Od7qU9ycVAJ7NZPjTu8N/n5px8XP7FCmjka+VPZpo+2Y50cv9e6ZYbZ8R2gjou/qD
	 7vNQitqNq92Qb6pljihwzKJ8iKI1SYHE5q586Sw3Xjou2uRRkaAKw8YIrj+UnWSQqe
	 zt+sQUcDPxGasRQy50YzgyrNp+tN/bR2EtOGWZVw=
Date: Wed, 15 Apr 2026 09:32:24 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Subject: Re: [PATCH v4 3/9] coresight: etm4x: fix leaked trace id
Message-ID: <20260415083224.GJ356832@e132581.arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-4-yeoreum.yun@arm.com>
 <20260414163221.GG356832@e132581.arm.com>
 <ad5wVVnUw1jnkCdn@e129823.arm.com>
 <81fdef8a-a60e-4d29-948d-c4a07e23dad9@oss.qualcomm.com>
 <20260415072933.GH356832@e132581.arm.com>
 <ad9FxS86FTqxu00d@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9FxS86FTqxu00d@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_013229_523297_F903E82E 
X-CRM114-Status: GOOD (  17.89  )
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

On Wed, Apr 15, 2026 at 09:01:09AM +0100, Yeoreum Yun wrote:

[...]

> > > What I am thinking is as SoCs continue to grow more complex with an
> > > increasing number of subsystems, trace IDs may be exhausted in the near
> > > future. (that's why we have dynamic trace ID allocation/release).
> >
> > Thanks for the input.
> >
> > I am wandering if we can use "dev->devt" as the trace ID.  A device's
> > major/minor number is unique in kernel and dev_t is defined as u32:
> >
> >   typedef u32 __kernel_dev_t;
> >
> > And we can consolidate this for both SYSFS and PERF modes.
> >
> 
> When I see the CORESIGHT_TRACE_ID_MAX:
> 
>  /* architecturally we have 128 IDs some of which are reserved */
>   #define CORESIGHT_TRACE_IDS_MAX 128
> 
> I think this came from the hardware restriction for number of TRACE_IDs.
> In this case, clamping the device_id to trace_id seems more complex and
> reduce some performance perspective.

Sigh, my stupid.  Please ignore my previous comment, let us first fix
ID leak issue.

Given Jie's comment on the use-out issue, it is valid for me especially
if a system have many dummy tracers.  We can defer to refactor it
later (e.g., use separate ranges for hardware and dummy tracers).

thanks for correction!

