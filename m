Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD8CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8E4a1Ll1M0eyyKtZ5UTFELV7nQ7QMGlUStpV44ukhLc=; b=ttrEZ7KD7lt5CbydOLZ669oGwZ
	7V4S1OrtNoTrWSzshWNmErAER3OnxMVlcb7k/0OXAedTS5y9UducjWy4+md3GL7e+hMT/bkZMduXy
	VuuaHeIotO4EwSYxmdXBvFllRtf8cQoZbc7Tp22FweYjTqTzuRIJe7PdBq2cMk1Z0C2P1AXGr6J3B
	R/iOD1e6Cey7nY5IZPpjSQUhQj3rnPCCAyiIrF8Gx6ettph2GkM60LErjGgjaslkm1X3v+S4QF2Wh
	j4uMr6xnyk6oHshOsl47dRNgWS54QoxTCLgJgbIlZkiuKaYWdqzP+5uQHfQteNSGRK3JA5FQpPXml
	IIs7sO6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmUK-00000007mnK-0DiS;
	Wed, 05 Mar 2025 11:00:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tplwi-00000007fpR-3bQz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:25:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 361C7FEC;
	Wed,  5 Mar 2025 02:26:01 -0800 (PST)
Received: from bogus (unknown [10.57.37.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B9EA3F673;
	Wed,  5 Mar 2025 02:25:45 -0800 (PST)
Date: Wed, 5 Mar 2025 10:25:42 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>, Jacky Bai <ping.bai@nxp.com>
Cc: lpieralisi@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	james.morse@arm.com, d-gole@ti.com, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, khilman@baylibre.com,
	quic_tingweiz@quicinc.com
Subject: Re: [PATCH v2] cpuidle: psci: Init cpuidle only for present CPUs
Message-ID: <20250305102542.36q7lmctx5jm4mg7@bogus>
References: <20241120103749.1450017-1-ping.bai@nxp.com>
 <Z8fv3X0Pivh8zbMg@cse-cd02-lnx.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8fv3X0Pivh8zbMg@cse-cd02-lnx.ap.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_022548_946006_3298FA0D 
X-CRM114-Status: GOOD (  19.01  )
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

Hi Jacky,

I wasn't Cc-ed on the original patch.

I was searching to provide feedback but couldn't find one.

On Wed, Mar 05, 2025 at 02:31:57PM +0800, Yuanjie Yang wrote:
> On Wed, Nov 20, 2024 at 06:37:49PM +0800, Jacky Bai wrote:
> > With 'nosmp' or 'maxcpus=0' boot command line parameters,
> > the 'cpu_present_mask' may not be the same as 'cpu_possible_mask'.
> > 
> > In current psci cpuidle driver init, for_each_possible_cpu()
> > is used to init the cpuidle for each possible CPU. but in
> > drivers/base/cpu.c ->cpu_dev_register_generic(),
> > for_each_present_cpu() is used to register cpu device for
> > present CPUs.
> > 
> > When boot system with 'nosmp' or 'maxcpus=0', the cpuidle driver
> > init failed due to no valid CPU device sysfs node for non-boot CPUs.
> > 
> > [ 0.182993] Failed to register cpuidle device for cpu1
> > 
> > Use for_each_present_cpu() to register cpuidle only for present
> > CPUs.
> > 

Can you reword it something like
"

for_each_possible_cpu() is currently used to initialize cpuidle in the
PSCI cpuidle driver.

However, in cpu_dev_register_generic(), for_each_present_cpu() is used
to register CPU devices which means the CPU devices are only registered
for present CPUs and not all possible CPUs.

With nosmp or maxcpus=0, only the boot CPU is present, leading to the
failure:

  |  Failed to register cpuidle device for cpu1

Change for_each_possible_cpu() to for_each_present_cpu() in the PSCI
cpuidle driver to ensure it only registers cpuidle devices for CPUs
that are actually present.

"

With that, you can add:

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Please cc Ulf Hansson <ulf.hansson@linaro.org> as well. Either him or
Rafael can then pick up the patch.

-- 
Regards,
Sudeep

