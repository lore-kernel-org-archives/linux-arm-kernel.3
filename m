Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1348ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdE00SwGpqRjy/1BolsRPq7oxyYl9mYtKTNrRbZ8CzA=; b=jApuJtTLvm2THIvSFNdSp6k8on
	hC6S0ckKn8zXgDSxNDNEi1fg8oVPxVcxRk+Xzwb0gMq5z/SVhMrL15ps7DDWsJZ5Rq2e8e7NHSXDp
	M5B9eGTUAVGeYLCKAWbpiVslcrJtGhcJA7CWd6YdD+y6R1mceYN5yaBDVsWKUqhxTc8RPN6KYBfgo
	mm+n/mKrvhgQnniVACzIai2FGFye7f+DaTtmN3xKVXzQEn1NuAx/wOLy0Oj/CtZsQMqF8YGra/tst
	N9fvALw3f442ZKjHNXTh5up3WZIgU0ocRqGEojSBgmwyXtCRTh9wdC7ldjaBX6HJCWWwwOXgM0FGt
	ibaM3Qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyST-00000009FKY-1iFQ;
	Fri, 15 May 2026 19:44:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNySQ-00000009FJy-3agB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 19:44:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55DA735D8;
	Fri, 15 May 2026 12:44:18 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2759D3F85F;
	Fri, 15 May 2026 12:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778874263; bh=fGn67fcZjcz9edf4yEQ5Kkc8xloh2hLzf0ykwfBwxs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VekRduJFvioIv1hmQejwhQy6DtJgsppoXCMqgEp6zK6SVx9b+SsdzXL08JSUeOW6Z
	 yWPOvgMmH0I2ajsyK2mWB41zpSBvs6qgnerPWWCY6Q7uN90bGWxEfq1wvwaA9tNt3c
	 SpOVMQCtYQSgFTkem99q0hcNZB2WyiA9NX6MCjhU=
Date: Fri, 15 May 2026 20:44:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v13 23/28] coresight: Control path during CPU idle
Message-ID: <20260515194421.GP34802@e132581.arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
 <20260515-arm_coresight_path_power_management_improvement-v13-23-9dfc558ed65e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-23-9dfc558ed65e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_124427_045418_310FE921 
X-CRM114-Status: GOOD (  10.34  )
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

On Fri, May 15, 2026 at 07:51:46PM +0100, Leo Yan wrote:

[...]

> @@ -121,6 +122,9 @@ static void coresight_clear_percpu_source(struct coresight_device *csdev)
>  	if (!csdev || !coresight_is_percpu_source(csdev))
>  		return;
>  
> +	/* Clear percpu_pm_failed */
> +	this_cpu_write(percpu_pm_failed, false);

This is not right when I looked again, we cannot assume this happens
on local CPU. I will update and send a new one.

Really sorry for flooding.

