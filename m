Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E69C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgX7UYYnL+/ISH1rT2YC/gRfHWzR+cvyMXMr/EdhRQc=; b=on/+VS7SrmWrGyQkCFuq/bTzbJ
	wHP9om/svcJ0PpQP9AO3VE9fCrSCgWpIUfawOOjVHkDD4NTX914mDTIyjdGxziF2EHex/zr0125Uw
	dtHKVzt7/KwB18f8Qc5C5jWj095Tj9LvzUD1sobdvaSRizgAJHSPXNNrIIhbiaCKZRWKiCAgthQk6
	naRuBBXP9p8W3HuUwkfmghHPdyRdrSZjCST5uuutZaIgjw0TObx7qiGVklW3YS2rq3UrlEoGRsrXg
	AzHawZsEeb6oeKj3YXadIGMi9GO/WUIuDQYqBKT617ke4/WuiDT3+cNR4SlJQSnvh6vzETvi4Hoh3
	+7JwRJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUbY-0000000Dntd-3Uva;
	Fri, 07 Mar 2025 10:06:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUYr-0000000DnRX-0xwn;
	Fri, 07 Mar 2025 10:04:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C04F2150C;
	Fri,  7 Mar 2025 02:04:20 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 123553F66E;
	Fri,  7 Mar 2025 02:04:04 -0800 (PST)
Date: Fri, 7 Mar 2025 10:04:02 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: "rafael@kernel.org" <rafael@kernel.org>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"quic_tingweiz@quicinc.com" <quic_tingweiz@quicinc.com>,
	"quic_yuanjiey@quicinc.com" <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v4] cpuidle: Init cpuidle only for present CPUs
Message-ID: <Z8rEkgYoThJAJdPV@bogus>
References: <20250307080303.2660506-1-ping.bai@nxp.com>
 <Z8rBYuDiIyo8y6HT@bogus>
 <AS8PR04MB86425B7CEE7443F822A2DBCA87D52@AS8PR04MB8642.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB86425B7CEE7443F822A2DBCA87D52@AS8PR04MB8642.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_020409_357406_F877A6ED 
X-CRM114-Status: GOOD (  23.77  )
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

On Fri, Mar 07, 2025 at 10:02:14AM +0000, Jacky Bai wrote:
> Hi Sudeep,
> 
> > Subject: Re: [PATCH v4] cpuidle: Init cpuidle only for present CPUs
> > 
> > On Fri, Mar 07, 2025 at 04:03:03PM +0800, Jacky Bai wrote:
> > > for_each_possible_cpu() is currently used to initialize cpuidle in
> > > below cpuidle drivers:
> > >   drivers/cpuidle/cpuidle-arm.c
> > >   drivers/cpuidle/cpuidle-big_little.c
> > >   drivers/cpuidle/cpuidle-psci.c
> > >   drivers/cpuidle/cpuidle-riscv-sbi.c
> > >
> > > However, in cpu_dev_register_generic(), for_each_present_cpu() is used
> > > to register CPU devices which means the CPU devices are only
> > > registered for present CPUs and not all possible CPUs.
> > >
> > > With nosmp or maxcpus=0, only the boot CPU is present, lead to the
> > > failure:
> > >
> > >   |  Failed to register cpuidle device for cpu1
> > >
> > > Then rollback to cancel all CPUs' cpuidle registration.
> > >
> > > Change for_each_possible_cpu() to for_each_present_cpu() in the above
> > > cpuidle drivers to ensure it only registers cpuidle devices for CPUs
> > > that are actually present.
> > >
> > > Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in
> > > GENERIC_CPU_DEVICES")
> > > Reviewed-by: Dhruva Gole <d-gole@ti.com>
> > > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > > Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > ---
> > >  - v4 changes:
> > >   - add changes for other cpuidle driver that has the similar issue
> > >     as cpuidle-pcsi driver.
> > >
> > >  - v3 changes:
> > >   - improve the changelog as suggested by Sudeep
> > > ---
> > >  drivers/cpuidle/cpuidle-arm.c        | 8 ++++----
> > >  drivers/cpuidle/cpuidle-big_little.c | 2 +-
> > >  drivers/cpuidle/cpuidle-psci.c       | 4 ++--
> > >  drivers/cpuidle/cpuidle-riscv-sbi.c  | 4 ++--
> > 
> > 
> > Why have you spared drivers/cpuidle/cpuidle-qcom-spm.c ? IIUC the issue
> > exists there as well.
> > 
> 
> For qcom-spm driver, it has below code logic to handle no cpu device case, and
> no rollback to cancel the whole cpuidle registration. So I just leave it as it is.
> Do we need to update it?
> 
> for_each_possible_cpu(cpu) {
>         ret = spm_cpuidle_register(&pdev->dev, cpu);

Did you look into this function ?

-- 
Regards,
Sudeep

