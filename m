Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250C7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 20:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WshiQleagEJl8YvCdzl40mnAtO3MVmpgjwhG5SV0dds=; b=aoWdaaqrb98oa+NEaUJWgzd0/D
	CjOrD2q/qsr4ZufxqZnlOvfVce+MhKYy6jAAKd+9uX1ZFpimThcSJA2W8qfuDKyLogzszsx9TssT9
	4lZi07ChOsrfD2IWn/2y/Wpg02ElFo7nJavkfSwoCXHl1KdsrlBqKRnvtybgCbouQeBEfZkDF/cbw
	ipmx4YagNTdkCcFxOxuqukVevbOo3d6LxZTB/QaIXNNbN+3csR6LYSJgpkyomtL2HnryJFA6jQkO4
	z/pGcOjH6Lr5T/MqF58HXkl1Kp2MJ82zu9B2ZVeYr7UDVC3KsQmnlYp+rQa7R8G/P8Lt/6/eQ5gi/
	qwenoGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdw1-0000000EiCS-3ZLx;
	Tue, 17 Dec 2024 20:12:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNduw-0000000Ei3k-0GRs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 20:11:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 089D4497;
	Tue, 17 Dec 2024 12:12:09 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 825133F528;
	Tue, 17 Dec 2024 12:11:35 -0800 (PST)
Date: Tue, 17 Dec 2024 21:10:43 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <Z2Haw_o8gF-Ce1gx@arm.com>
References: <20241206135600.4083965-1-beata.michalska@arm.com>
 <20241206135600.4083965-2-beata.michalska@arm.com>
 <20241212065100.sjb7lrlmksbm2hdk@vireshk-i7>
 <Z2CmcelSy89NULtz@arm.com>
 <20241217042726.isllh5bulpnwql7i@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217042726.isllh5bulpnwql7i@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_121142_150367_EE5D59FE 
X-CRM114-Status: GOOD (  19.06  )
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

On Tue, Dec 17, 2024 at 09:57:26AM +0530, Viresh Kumar wrote:
> On 16-12-24, 23:15, Beata Michalska wrote:
> > My bad as I must have misinterpreted that message. Although I am not entirely
> > sure why this might be unacceptable as it is not such uncommon approach to use
> > signed int space to cover both: expected positive value as well as potential
> > error code case failure.
> 
> This part is fine. The problem is with handling frequency here. Signed int can
> capture up to 2 GHz of freq, where as unsigned int can capture up to 4 GHz and
> so we would really like to keep it at 4 GHz..
Right, though the arch_freq_get_on_cpu operates on kHz values.

---
BR
Beata
> 
> Maybe we need to move to 64 bits for frequency at some point of time, but at
> least we should try to not break it for now.
> 
> > Enabling the new attribute for all is an option, tough not entirely compelling
> > one as exposing a feature that is known not to be supported seems bit
> > counterintuitive. On the other hand using cpufreq driver flags won't help much
> > as the support for the new attrib is platform-specific, not driver-specific.
> 
> -- 
> viresh

