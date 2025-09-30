Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D55BCCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aXr7PIDJqhppMsCfIRxXVKxK+DvbbfF1pf2Cjk0GWQ=; b=cxhnKWWZ21wFT4zY/UK5cpM6XR
	rwL6CnnAILaqdh5CzgT1pe3xYIyxORHfbqT+8mXISz+c049icTyG3FB1zsynPu+FGBUZhz74oA6E6
	mou5TJIkYNo0bJK6Mmw3IbAk1V3d7QBGRnjMkFlLOCCeScnqF9Hfiddxw2ImSEiygwkA0gHAg1BSp
	cWGJ/woW6SoDEU86T6VkDNeALTSYrwLF4c+RrL8+yuM6kg1+NF07ua9F2ZjgBM3/n8DEqgh+5uLtY
	oLReDrGICPpK/qDG5VNmiP/jR9CzUQhmjSM7MBQtCM9oQ89aI/ghrVl+siL9By41WPFjm+yVueutc
	iwg5VxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3c9S-00000005dka-1COY;
	Tue, 30 Sep 2025 15:20:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3c9P-00000005dkB-2hqA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 15:20:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A97D81424;
	Tue, 30 Sep 2025 08:20:14 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59BD13F59E;
	Tue, 30 Sep 2025 08:20:22 -0700 (PDT)
Date: Tue, 30 Sep 2025 16:20:20 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/6] coresight: Add format attribute for setting the
 timestamp interval
Message-ID: <20250930152020.GL7985@e132581.arm.com>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_082023_722427_60225B54 
X-CRM114-Status: GOOD (  10.44  )
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

On Thu, Aug 14, 2025 at 11:49:51AM +0100, James Clark wrote:

[...]

> This is added as an event format attribute, rather than a Coresight
> config because it's something that the driver is already configuring
> automatically in Perf mode with any unused counter, so it's not possible
> to modify this with a config.

Tested on Juno-r2 for this series:

  # /mnt/build/perf record -e cs_etm/timestamp=1,ts_level=15/ -- ls
  # /mnt/build/perf script -D | grep I_TIMESTAMP | wc

   1305   11745   83337

  # /mnt/build/perf record -e cs_etm/timestamp=1,ts_level=0/ -- ls
  # /mnt/build/perf script -D | grep I_TIMESTAMP | wc

   120668 1086012 7705024

We can see a small counter (2 ^ 0 = 1) that records significant
timestamp packets.

Tested-by: Leo Yan <leo.yan@arm.com>

