Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00412CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUVlP6+PJZcvY0gs/BWUDj4eOBc/o77YxaXLrdcxszQ=; b=ec8iji8aNI2P/PPDGf201gFK8X
	hJYRa2fi3szDMzYk3UMbG0iVxF61HG++FdkklBKDaSMbx4BDGpx3DKmQ0slxjU+vqTembH0Qvp6jq
	RUNszgh8AXw9ynCH5vyVYKABqR15841iUFvf0h6d/EitUAeEKyikE3VzLIWBaeZIu0tcn2+GsM/+V
	by5X7Prksxa+mYMJsgf7sEdocoOFqnrtZ/eJAUDKIRQxMCi2ngMvortF49JVKYGPMGn6G19Gl7+0A
	cTnOtL2l13CZhiOovrinbLT+zBcVUJ1IJwIITDwELDhWd2AYmRLaFUALHFn0gnhqsl2XX/93EDJub
	grWRpsjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fJq-0000000CJRr-3KFQ;
	Fri, 03 Oct 2025 12:55:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fJo-0000000CJRO-0lS1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 12:55:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C001655;
	Fri,  3 Oct 2025 05:55:16 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 527653F66E;
	Fri,  3 Oct 2025 05:55:24 -0700 (PDT)
Date: Fri, 3 Oct 2025 13:55:22 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/31] coresight: Change device mode to atomic type
Message-ID: <20251003125522.GV7985@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-1-ea49e91124ec@arm.com>
 <422560ee-50e8-4298-80c8-de46c521117a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <422560ee-50e8-4298-80c8-de46c521117a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_055528_265189_636343DE 
X-CRM114-Status: GOOD (  15.91  )
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

On Thu, Oct 02, 2025 at 01:51:22PM +0100, Suzuki Kuruppassery Poulose wrote:
> On 15/09/2025 11:33, Leo Yan wrote:
> > The device mode is defined as local type. This type cannot promise
> > SMP-safe access.
> > 
> > Change to atomic type and impose relax ordering, which ensures the
> > SMP-safe synchronisation and the ordering between the mode setting and
> > relevant operations.
> > 
> > Fixes: 22fd532eaa0c ("coresight: etm3x: adding operation mode for etm_enable()")
> 
> 
> Do we really have an issue here ? I thought we modify the mode under
> spinlock. Also the fixes commit looks odd. The mode was added to the
> coresight device only recently. Prior to that, it was part of drvdata and
> was serialized by the respective spinlocks. So I don't see how this
> was an issue.

Below is the sequence in which CPU0 enables the path with CPU1 ETM
via sysfs knob, while CPU1 is executing the CPUidle notifier:

  CPU0                                     |  CPU1
                                           |
  coresight_enable_sysfs()                 |
   `> mutex_lock(&coresight_mutex)         |  etm4_cpu_pm_notify()
   `> etm4_enable()                        |   `> etm4_cpu_save()
       `> coresight_take_mode(csdev, mode) |       `> coresight_get_mode(csdev)
       `> Call SMP call                    |
   `> mutex_unlock(&coresight_mutex)       |


(1) The mode is not protected by spinlock. Although the sysfs flow
    acquires a mutex, it does not provide exclusive access to the
    mode.

(2) On SMP systems, the mode is accessed by multiple CPUs. We
    currently use the local_* accessors, which are suitable only for
    per-CPU (local) access, not for SMP access.

If a vairable is not protected by spinlock, and accessed by SMP cores,
then atomic type would be a right choice.

Thanks,
Leo

