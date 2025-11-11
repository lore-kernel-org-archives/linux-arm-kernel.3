Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849BDCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le//jhK4+QXBmD4gkrvuMY/Lm8SBKXunru4kfAfr/7k=; b=dSUY/Xs/6eI4CpVvcAP+e7Q2xw
	FR7yNMXvpXWwVOC4E/wnDdo4jdSHOKD2a7Gzr8YX/C9JRliEO5zLatdX1ZtMTVjtOn7axhrghpSnF
	6qd7IOn885qshfFx3vuOdIW2UIMeOlr7hhDIBLZk4NAoDCeySnQm045BoOsGg3MKw89nJlUVCqINA
	4TyoPeiYKm7T5/uqJOJEa3gzdznujlxZ3Id5GO27JsZtilSD7NNfKOcrh6EMWqk+xS09sWfgGI8cV
	Y2WzQdqLlSWUojg8cfbpwVBXJ5V5Atb+G7O9qtzore6zPOoyNkwI8E6BwjSWrqjic+1fZSxA57sAp
	dI8KbbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkbi-00000006pvD-1AJD;
	Tue, 11 Nov 2025 09:24:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkbf-00000006pup-3bZV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 09:24:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C36C2F;
	Tue, 11 Nov 2025 01:23:58 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5FD03F66E;
	Tue, 11 Nov 2025 01:24:05 -0800 (PST)
Date: Tue, 11 Nov 2025 09:24:03 +0000
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
Subject: Re: [PATCH v5 09/11] coresight: etm4x: Add flag to control
 single-shot restart
Message-ID: <20251111092403.GB281971@e132581.arm.com>
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
 <20251103-arm_coresight_power_management_fix-v5-9-f803c19aa153@arm.com>
 <ac108275-0b12-4cc1-b8db-d864175f9059@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac108275-0b12-4cc1-b8db-d864175f9059@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_012407_945829_342DA0F9 
X-CRM114-Status: GOOD (  12.06  )
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

On Mon, Nov 10, 2025 at 11:37:52AM +0000, Suzuki Kuruppassery Poulose wrote:

[...]

> > -static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> > +static int etm4_enable_hw(struct etmv4_drvdata *drvdata, bool restart_ss)
> 
> While this looks to work, I wonder if we could manage this all in the config
> ? i.e.,
> 
> Use an extra field, say config->retain_single_shot_status, which defaults to
> 0 and is always cleared once we pass through enable_hw.

This is fine for me in general.  I agree that adding an argument in
etm4_enable_hw() is not scalable, though we can take a bit advantage
of stack push and pop so no need cleanup.

Before proceed, I would check another idea.  Can we do this with
is_idle_task()?

  if (!is_idle_task(current)) {
      if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
          config->ss_status[i] &= ~TRCSSCSRn_STATUS;
  }

As a result, we can avoid new flag and extra operatoins (set/clear) for
the added flag.

Note, this does not only impact CPU idle flow, this also applies on CPU
hotplug flow (as CPU hotplug callback also runs in idle thread).  I
think this would be fine, no matter CPU idle or hotplug, we keep the
single-shot state after the CPU resume back.

Thoughts?

Thanks,
Leo

