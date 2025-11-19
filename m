Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA616CF31BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmtgHWYd9oqTv8LhisgzYToiO828evjSOBZB/jjyP9o=; b=nnPgKPy4wmzL8Ys1S+4ErDwkYr
	YpW37G00QWI0s64xu/91W+b39/4HKVJTEM+/K3Ch7bwuj/JRr8rHuSIfhN1z7Ge1SLH5i8cXUg4N+
	vo1TPdAv+mPBu0p6Aigx6uIXLLNGr42+J701ayk6D04T7eG10d8VSfQUOwMUvo1F20mm8b7zaRTGk
	KC59y1etCCeNiTGfoZKK1xC6XVnu9CNDiofTVs91seuc/JC7hbnzZ/Nw/v+Z5jk5U38BSKIGHwzfr
	pZxMpRm1xThm3rG0dWZvxfQ6kZfGHoZk6UaRsJhT12Jp5QqMDYYrvhy3CAsluujm0oKFB/dO+heBs
	gN8loQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhQb-00000003BBZ-3wz4;
	Wed, 19 Nov 2025 12:36:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhQZ-00000003BAu-1WNb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:36:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B13FFEC;
	Wed, 19 Nov 2025 04:36:42 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C98D83F740;
	Wed, 19 Nov 2025 04:36:49 -0800 (PST)
Date: Wed, 19 Nov 2025 12:36:47 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Message-ID: <20251119123647.GC8204@e132581.arm.com>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
 <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
 <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_043651_441473_63806E7A 
X-CRM114-Status: GOOD (  11.67  )
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

On Wed, Nov 19, 2025 at 12:00:30PM +0000, James Clark wrote:

[...]

> ...  But then to make
> the code match the warning it might also make sense to change CONFIG_ARM64
> back to CONFIG_CORESIGHT_SOURCE_ETM4X, which Leo suggested to change. Maybe
> I can just delete the warning text, practically this warning can never be
> hit.

Armv8 CPUs can runs in aarch32 mode, strictly speaking, we should also
can run ETMv4 driver in aarch32 mode as well.  Then CONFIG_ARM64 is the
right choice, this can remind us that `is_kernel_in_hyp_mode()` is
always stick to aarch64 mode.

  static ssize_t format_attr_contextid_show(struct device *dev,
                                            struct device_attribute *attr,
                                            char *page)
  {
  #if IS_ENABLED(CONFIG_ARM64)
       if (is_kernel_in_hyp_mode())
               return contextid2_show(dev, attr, page);
  #endif

       return contextid1_show(dev, attr, page);
  }

Thanks,
Leo

