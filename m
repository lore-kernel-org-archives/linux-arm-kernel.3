Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D47FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgW0RTlAFLm4qQ4c8FTnCZopSZANOiBjbm0YL8SIACA=; b=zWvlLc9IdjPw+6CnB9CyxEFi0N
	8tbePPla2gn38RgfClsGqxTIhD4rPeZQ+ZNd3sqy3/scjx+yzVUSD4adH5M+fO04+unbzNnkjHWDN
	4gklrozcmGQTZgHWOApc5TF7aiKI3yzVA8IfNUsG1MUaVvIVOgZihjEdJpODUpWEgzN7hJTM5gsNo
	rY3zFDXXssqPPdaAfnb2v+g0v2JK77cderv91YQPvYYvFPWfGadJctdlyTal2P+6ypKZrB9ieczkj
	p3/rZ1ADK25sbpFkz6WDiQmFcntgfwft+cvMzj7KZG1ybAjFoT4TKGCRRP8zmf+dl9+VBlqp44KXc
	MXLHumSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4h72-0000000CayE-0U0o;
	Fri, 03 Oct 2025 14:50:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4h6z-0000000Caxr-1s07
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 14:50:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E39D1655;
	Fri,  3 Oct 2025 07:50:12 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6BDF3F5A1;
	Fri,  3 Oct 2025 07:50:19 -0700 (PDT)
Date: Fri, 3 Oct 2025 15:50:17 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 20/31] coresight: cti: Register PM notifier after data
 initialization
Message-ID: <20251003145017.GA7985@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-20-ea49e91124ec@arm.com>
 <CAJ9a7VjoW=U42SztbdHfxM=v=UaAmJn1=cdJd1EZU3rB6x+WAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjoW=U42SztbdHfxM=v=UaAmJn1=cdJd1EZU3rB6x+WAA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_075021_522800_FC1ABAB9 
X-CRM114-Status: GOOD (  14.45  )
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

On Fri, Oct 03, 2025 at 10:38:24AM +0100, Mike Leach wrote:
> Hi Leo,
> 
> The CTI PM code was initially set up before the CTI was a helper device.
> 
> If the core bound CTIs, which are helpers to the core bound ETMs, are
> disabled as part of the path disable helpers, then I think the CTI
> specific PM code might be redundant.

> If it is not, then should this not  hook into the generic PM code in
> coresight-core.c?

Correct, CTI devices will be managed as a part of path in
coresight-core.c (See patches 26 and 31).

However, we still need cti_pm_setup() - when a CPU bound CTI is enabled
via CTI's sysfs interface, in this case, no path is enabled but purely
CTI device is enabled.

A side topic not related to this series, I am curious if we can remove
the enable/disable knobs in coresight-cti-sysfs.c, then CTI will only
work as helper. This can significantly simplify the CTI driver.

Thanks,
Leo

