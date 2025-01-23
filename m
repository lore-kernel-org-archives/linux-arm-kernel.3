Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9E3C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJlRHyh533Vht7m2VQcQJzLl5EgcYqqnj1UNKQQqu5U=; b=HASiOLcl4+u4TAlXNlvQtw9NrF
	52Lornz7o/XceS9hhIInV5VkfZTua/ykYt1WS1vW1Bg1f51+MqEBFW7rCvCT32JW6MkwnYeF0X0ul
	7np8wP6nVmx6C9BRVHXvAPg/niWj9xlrEfSV4ioWA6hRVxJJJnKPJTNwUaDAiwFO9Bd4bO6nM0nbD
	iukGBLR6L6c99OX8SH0pUn8G49Ssdmktk39wmPAdfl/y+EjGHzXVNv4nDDvnQ5LMDorr55GMmOnQ4
	/4eX+ONJGqJgGVpchNg7enH25UeHi8kpJVRqL0skbuVJZdpEMj33bTkW8Xgf1l6UfQwbFXERpLVyz
	tm+Xcuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavnJ-0000000COi8-33nR;
	Thu, 23 Jan 2025 11:54:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavlE-0000000COUF-03yJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:52:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05C3B1063;
	Thu, 23 Jan 2025 03:53:02 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E18F3F5A1;
	Thu, 23 Jan 2025 03:52:32 -0800 (PST)
Date: Thu, 23 Jan 2025 11:52:29 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 25/33] cpufreq: scpi: Stop setting cpufreq_driver->attr
 field
Message-ID: <Z5ItfU78ALHgrYI2@bogus>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
 <2b89078adc1472d5ab9377ad7675cf4c07a8f7cc.1737631669.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b89078adc1472d5ab9377ad7675cf4c07a8f7cc.1737631669.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_035236_096145_9F38BA9E 
X-CRM114-Status: UNSURE (   5.64  )
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

On Thu, Jan 23, 2025 at 05:06:01PM +0530, Viresh Kumar wrote:
> The cpufreq core handles this for basic attributes now, the driver can skip
> setting them.
> 

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

