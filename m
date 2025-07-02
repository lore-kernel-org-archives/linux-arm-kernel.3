Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843A6C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 11:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYuyRu35GJI5BLjQqgaQKsBeUmVk0PVXAFpB2efbG2M=; b=BOWjUmDplSQUccHJ9eU3yR5shK
	KXPdG7PC0Kw5SD8bd9iibNe/KGqEK366+PQnqDforfl2n5EQ3xyUuMIlhwkFq70amCZiRROLkAiM+
	WeN/Mf8uSVUmj0zX5ASvuS84uRYdiQVf4w0r+XZe16av6iZOTa3gn1HIsiltG6lBugAjjYqjZ+waD
	Kv9n7uHaWBnyJBPwpOW6KZpFPK+cM+KZkzIV8o598DMaFKF0MJ57qiqhKR5jwWIXq070cvqGQJKd6
	DfVmWHfgDVxHCQpVvPqcdNPvLNG8zEUuPlfaOar0gCRfHvKRRxiQkATobiCHTjGZJ+6Tr3ai9zyup
	Zd5nNs+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvbU-000000088Cr-2iTG;
	Wed, 02 Jul 2025 11:26:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWurZ-00000007yoK-0Swe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 10:38:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3E2C22D9;
	Wed,  2 Jul 2025 03:38:32 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A03E3F58B;
	Wed,  2 Jul 2025 03:38:47 -0700 (PDT)
Date: Wed, 2 Jul 2025 11:38:45 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/28] coresight: Change device mode to atomic type
Message-ID: <20250702103845.GV794930@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-1-23ebb864fcc1@arm.com>
 <aGUAjcZ1elCoJ+KU@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUAjcZ1elCoJ+KU@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_033849_194439_286F8A18 
X-CRM114-Status: GOOD (  14.19  )
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

Hi Levi,

On Wed, Jul 02, 2025 at 10:49:01AM +0100, Yeoreum Yun wrote:
> Hi Leo,
> 
> >  {
> > -	return local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, new_mode) ==
> > -	       CS_MODE_DISABLED;
> > +	int curr = CS_MODE_DISABLED;
> > +
> > +	return atomic_try_cmpxchg_acquire(&csdev->mode, &curr, new_mode);
> >  }
> 
> Just question. why is acquire symentic enough in here?

My understanding is that acquire semantics ensure ordering between
cmpxchg_acquire() and all memory accesses that follow it. However, it
does not guarantee that memory accesses appearing before the acquire
are ordered as well.

This is exactly what we want in the driver. We must ensure to first grab
an active device mode, then it is safe to proceed later operations (e.g.
set configurations in driver data and access registers).

> before this change, local_cmpxchg seems to use full_fenced.

Not really. Arm64 has atomic instruction for cmpxchg, it does not use
full_fenced. It should run into the path of arch_cmpxchg().

Thanks,
Leo

