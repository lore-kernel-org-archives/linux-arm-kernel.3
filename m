Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1B1C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5hBOAWgXWbs5YM2cQ5EdWooZcYMmnFjFR/k5PI2mnc=; b=4UzSV3jx2XXfHqzyxfEf52NEBS
	7iWOza/udB47cSXThfPGSI32HoD2+8qLCNkVNK8/eaSUE4EybpFe8hlpcaYLOWxntlK2wkW0QER7q
	xlebYDjjgm1DVthlDvuvIRHNVx8q8lM10KjzCJDtIIPezkDbzAXLd+0R04Xrrd5wXSqRgJLJvJvAM
	s/basGcwHxFNm0NvjGQf+uYh9eScMEzoqcyBbcd0Fa6sUyXIdvIXwKtS/UgqlDwN3saZ40PBTN6FR
	FJPoyWm/n4uz11M6SlbM8xaDcVHm3mlHx3btoHimvxHfjcg/BpSxbQUsIvXIeXtxH3dq4siARSBim
	jufpq29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAWE-0000000EydR-3qPM;
	Fri, 27 Jun 2025 14:57:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9tl-0000000Esbc-0zt5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 14:17:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5571C1A00;
	Fri, 27 Jun 2025 07:17:31 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 252213F58B;
	Fri, 27 Jun 2025 07:17:48 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:17:45 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, kernel@oss.qualcomm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
Message-ID: <20250627141745.GS794930@e132581.arm.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
 <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_071749_319967_FE6F9D41 
X-CRM114-Status: GOOD (  16.81  )
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

On Fri, Jun 27, 2025 at 12:23:29PM +0100, James Clark wrote:
> 
> 
> On 27/06/2025 12:10 pm, Yuanfang Zhang wrote:
> > The current implementation uses a fixed timeout via
> > coresight_timeout(), which may be insufficient when multiple
> > sources are enabled or under heavy load, leading to TMC
> > readiness or flush completion timeout.
> > 
> > This patch introduces a configurable timeout mechanism for
> > flush and tmcready.
> > 
> 
> What kind of values are you using? Is there a reason to not increase the
> global one?

IIUC, this patch is related to patch [1].

It seems to me that both patches aim to address the long latency when
flushing the TMC, but take different approaches. In the earlier patch,
both Mike and I questioned how the timeout occurred in hardware, but
no information provided about the cause.

I would suggest that we first make clear if this is a hardware quirk or
a common issue in Arm CoreSight.

Thanks,
Leo

[1] https://lore.kernel.org/linux-arm-kernel/CAJ9a7Vgre_3mkXB_xeVx5N9BqPTa2Ai4_8E+daDZ-yAUv44A9g@mail.gmail.com/

