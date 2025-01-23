Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004A8C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 12:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaoOFn6JXXsIq16ZOXpO7kHfAaEgKspiCBXQ/wULbpE=; b=jMRjwCTVbyP9UetIhulz6Pbuc2
	4bo0hjz3qM55j3/51cLUBMjkHcnUthU2McN3A6HbD/6EMnnfHvD8eo4xBGRczikuhNqbp2B2q9twQ
	WvVOv9nYPqA7COhEa9JqtE1uzP4DA08VYuiv+3U+kFv+PYq5wgZbrrE1ebqrsHpKjiXJy8/qc0nbU
	/oKlPs5p8eJi7tvasH/GtV68l18SDRxH5Qs8idR/79+Bfx7g2nq9FWvx9WqBiS81j1W3pYlm0Ot5q
	rTr6Nyt0TOS7cAqTG04xM3/pTaI4Q0omF5/k/E6Y+80tThU8EaZTbBGXHNBBdsCFUwbqgFAM0jhuh
	tga4N4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavvF-0000000CPBI-1CR9;
	Thu, 23 Jan 2025 12:02:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavtx-0000000CP6S-1rvC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 12:01:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B02DF1063;
	Thu, 23 Jan 2025 04:02:04 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06A7B3F5A1;
	Thu, 23 Jan 2025 04:01:34 -0800 (PST)
Date: Thu, 23 Jan 2025 12:01:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/33] cpufreq: scmi: Stop setting cpufreq_driver->attr
 field
Message-ID: <Z5IvnF_dw3ez33Bv@bogus>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
 <d4893396c4bacdd995d03a296b9d3ff44e71d072.1737631669.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4893396c4bacdd995d03a296b9d3ff44e71d072.1737631669.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_040137_526201_87271D56 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 23, 2025 at 05:06:00PM +0530, Viresh Kumar wrote:
> The cpufreq core handles this for basic attributes now, the driver can skip
> setting them.
>

I know this is boiler plate commit message but it made me go check if boosts
are handled too even though I checked it in 01/33. So if possible, you can
add "basic attributes including boost frequencies", that would be good,
aligns with the change below and makes it easy to refer in the future if
required. Not a must, I will leave that to you. Anyways,

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

