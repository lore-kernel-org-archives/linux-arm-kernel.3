Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAEBC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 21:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdOmtVDZ9AtDv5aeNcPxutp1z6aV4QRfQjUxDYYkamI=; b=LVtzyWdezvdSxPnFGaF/74wPrb
	GgN7Y+rL4qsJ6SMOiQoMMgWKXDFxjLwLGo4W/Ekx41W/w5cB652iYXm8BAErhifSj7J9dfvx7rMvl
	I+chEzvvChWrfde+VL05jTxg4ZbZkn60qAZjz/M9C+HfG1Be60AZcbNLvkekJtdEkR3IMOUPle8Ja
	aebRq0dm3iOwIWBcY8TUiqnBJmjL+zhY3XoWQ2hvxPUD7z+X8njPnn9ITB08vUol4rrAIdf7VxJiJ
	V0NjI9boM0OBZBTKGNA2OEBcPCHvN9ffYaxYCX39TvE/+ob3pbIg2yzgH3V6BbtW7Vg9d43HK85Ke
	Wr0rKVsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb52i-0000000DL8g-1fW9;
	Thu, 23 Jan 2025 21:47:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb51Q-0000000DL2h-0Hl4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 21:45:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49BD41063;
	Thu, 23 Jan 2025 13:46:23 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD5163F66E;
	Thu, 23 Jan 2025 13:45:51 -0800 (PST)
Date: Thu, 23 Jan 2025 22:45:12 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH v9 1/5] cpufreq: Allow arch_freq_get_on_cpu to return an
 error
Message-ID: <Z5K4aDaZIbhRCbOP@arm.com>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-2-beata.michalska@arm.com>
 <20250121104706.2gcegucb6hcuksrd@vireshk-i7>
 <Z4-52JUmR7A-7NJP@arm.com>
 <20250122061250.kxdpkkvce4g5nar2@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122061250.kxdpkkvce4g5nar2@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_134556_146498_56A1D817 
X-CRM114-Status: GOOD (  10.75  )
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

On Wed, Jan 22, 2025 at 11:42:50AM +0530, Viresh Kumar wrote:
> On 21-01-25, 16:14, Beata Michalska wrote:
> > Theoretically speaking - it should, though what would 0 actually
> > represent then ?
> 
> 0 won't be a failure, that's clear, since errors are represented
> differently now. I am not sure what 0 frequency would mean and it can
> be left as an architecture specific value, which is a corner case I am
> not sure will ever occur.
That would mean we are opting for presenting '0' value (whatever that means)
instead of trying alternative ways of getting 'current' frequency ?
This is still the scaling_cur_freq.

---
BR
Beata
> 
> -- 
> viresh

