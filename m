Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D1CC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYnLi3KwvYUOTG+qFfRt4ovqKtaUombElJPtjd+u6gY=; b=mMXMiz7h26xYLSDMwtgYupYsLM
	q+xTw9J/VGgJzzn68yud4B09Vv/mMxo+CFFrXdD5Mrx6+vosUfJbV+MPwE6pNUQZVVOAZtwoOrCgk
	u36xqggIvsHQw8fjz1AoYdRZWorNljACNKsnJqYR5C7zWO2F4bim4QJWD0VragMLZCLmaz56+TLDk
	nXVGnoAAmNaXLnDhyQ+FjroPjZL4tqWQOIZOTEfIAKVYn2PQ1klBzaZZEGrgYdHVYLb6LcmKiO2Ox
	wcWpVwKRiZJJJrtY/FCuy10lqI2MwMtEkbnkTmHIGB217Bf0Rmd31Ldu36fl1XMDfwK0YVbWn0dOW
	hSJHSGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78vz-0000000B3nC-43eV;
	Thu, 17 Sep 2026 10:01:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78vx-0000000B3mV-49E4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:01:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5102E1476;
	Thu, 17 Sep 2026 03:01:32 -0700 (PDT)
Received: from [10.57.74.102] (unknown [10.57.74.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CE963F7B4;
	Thu, 17 Sep 2026 03:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789639295; bh=1pwwAA8ZeOmKPOIlnHk+XRlZJTnA6zBlBTY2TxR85cU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SvAAG4W6pCrBYl8UpXFPHTB71j6RSyCdPuWmd6UkpE0cOM3aNKMGhTZAlgIGEB7fV
	 Cd4IX/FcwNi0bAPpT+dbXe03++P3TJBX21zD+nSnKRWo8w05d+mhGf6NjzzytfXlME
	 YQWqbo5gb1j49X8rnLzxfNNa3piSKywqbAZlc1EM=
Message-ID: <6f2907ec-848e-4e60-98b2-a3b7a905b880@arm.com>
Date: Thu, 17 Sep 2026 12:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Sudeep Holla <sudeep.holla@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <55538466-2203-42ec-a0bd-b743c04a3b38@arm.com>
 <178955779940.30466.10860982419496123467@gmail.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <178955779940.30466.10860982419496123467@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_030138_075559_55C2DA57 
X-CRM114-Status: GOOD (  10.03  )
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

Hi Oleg,

On 16.09.26 13:23, Oleg Keri wrote:
> Hi Dietmar,
> 
> On Wed, Sep 16, 2026, Dietmar Eggemann wrote:

[...]

> Fine by me, that reads better than open-coding the shift. Your diff
> builds here on arm64 (topology.o and kernel/sched/), so I will fold it
> into v4 and add the scheduler maintainers to Cc for the header move.
> 
> Since the diff is yours: is a Suggested-by enough, or would you rather
> have Co-developed-by and your Signed-off-by on the patch?

Don't worry, I will give my 'Reviewed-By' for the final version.

