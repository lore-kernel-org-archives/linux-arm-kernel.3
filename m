Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B397C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0jr+LHQNre/wrdy9VEABPw/0lORCsFYauipHjWSmlQ=; b=ebhvTkgiaYc727XMmi0miRyRsq
	SakvMyUWWKznU6jq1WsaDgfqXMljqFJf/CAzCBHiSjcKPCvzBkrJCk5nyCawAwiCN6eXv9cyB5tPO
	7cZbhaSV/m+4HfrdLzcdvs3TjgVSwnREm9j6f8iM0pKmLG6iAxYF3/bvLLvXIrFPEfNDaitabctZV
	EunnIp+vakmthdIxmyG1vlpYgLMmOEl+zGrEsY9iHnO7ZojI356yT1Jk9CuTLZ/rtW6Y+Ea3n3y0b
	HgWCFqn1S6VxcVQMv6lUqs9Z90qKuRPCqea079dj4lvjunBBeIgD/YygrOBFXRWwwMk63LjTUVeuU
	2VSwivZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsnX-00000002Q2h-3cwN;
	Fri, 02 May 2025 15:59:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAses-00000002OWd-1bmF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:50:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC9491688;
	Fri,  2 May 2025 08:50:26 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A770D3F66E;
	Fri,  2 May 2025 08:50:33 -0700 (PDT)
Date: Fri, 2 May 2025 16:50:30 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] cpuidle: psci: Avoid initializing faux device if no DT
 idle states are present
Message-ID: <20250502-cherubic-persimmon-koala-f200cc@sudeepholla>
References: <20250502140119.2578909-1-sudeep.holla@arm.com>
 <CAPDyKFobCehWO2jo2H2wMx40NLggoFOnhWKCuqcMURTLgiK1ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFobCehWO2jo2H2wMx40NLggoFOnhWKCuqcMURTLgiK1ug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_085038_561431_F1F50698 
X-CRM114-Status: GOOD (  22.49  )
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

On Fri, May 02, 2025 at 05:16:48PM +0200, Ulf Hansson wrote:
> On Fri, 2 May 2025 at 16:01, Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > Commit af5376a77e87 ("cpuidle: psci: Transition to the faux device interface")
> > transitioned the PSCI cpuidle driver from using a platform device to the
> > faux device framework. However, unlike platform devices, the faux device
> > infrastructure logs an error when the probe function fails, even if the
> > failure is intentional or expected.
> >
> > To prevent unnecessary error logs, we can skip creating the faux device
> > entirely if there are no PSCI idle states defined in the device tree.
> > Introduce a check for DT idle states during initialization and avoid
> > setting up the device if none are found.
> >
> > This ensures cleaner logs and avoids misleading probe failure messages
> > when PSCI idle support is intentionally not described in DT.
> >
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Fixes: af5376a77e87 ("cpuidle: psci: Transition to the faux device interface")
> > Reported-by: Jon Hunter <jonathanh@nvidia.com>
> > Closes: https://lore.kernel.org/r/cf4e70e4-9fe5-4697-8744-8c12c41b5ff9@nvidia.com
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> 
> Rafael, please pick this one.
> 
> BTW, I was not cced the original offending commit and it was funneld
> via Rafael's tree. No worries this time, but probably easier to stick
> with my pmdomain tree future wise, to avoid any churns. This is also
> reflected in MAINTAINERS.
> 

Understood. The original patch was part of the series and I seem to have
missed you on it. Sorry for that.

-- 
Regards,
Sudeep

