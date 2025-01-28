Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F01C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tq/jWLugD3JTo03rRq/eaOiezGlp3YokZ+pL54A6ddc=; b=r84cn4pZZgH5LL8iayTYndgF7i
	KSPCpJqbDbv3x4OmuudQFfwTGSZQxDBocOPgTRzjB6+K5hLKJ+8BXc6HhKOym3qRPW+L8su/rQdqF
	qjeAoZT30XXdigJCzkImrddQXc6WvOvnJ6U5nOtzMxXh4HvCY+NWfQpW9dC1NiFmYIgDS4gYGcjsq
	8+RKlHWt4/hbOEqkaG/ksb8TPmJQMTO2E9h3xRyAhgXl7jWM/Jkszj2JGZZ73bSxdpX3EZ5uPwDZG
	5d7tdzzrnSCP7TeRKAcnqeSgQeYCvK64RLhGWGibmfDOUBOeRwaPKRNzxXvukjlP52dywzJLiKzWy
	tFko6Vpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgip-00000004Lrj-0PK1;
	Tue, 28 Jan 2025 08:13:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcggJ-00000004L5p-3D2o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 08:10:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C098497;
	Tue, 28 Jan 2025 00:11:11 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F8AC3F694;
	Tue, 28 Jan 2025 00:10:40 -0800 (PST)
Date: Tue, 28 Jan 2025 09:09:55 +0100
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
Message-ID: <Z5iQ02AIDalsUXe-@arm.com>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-2-beata.michalska@arm.com>
 <20250121104706.2gcegucb6hcuksrd@vireshk-i7>
 <Z4-52JUmR7A-7NJP@arm.com>
 <20250122061250.kxdpkkvce4g5nar2@vireshk-i7>
 <Z5K4aDaZIbhRCbOP@arm.com>
 <20250124033333.jrqbhuyd6qtogn2c@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124033333.jrqbhuyd6qtogn2c@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_001047_849457_ABEF647D 
X-CRM114-Status: GOOD (  16.54  )
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

On Fri, Jan 24, 2025 at 09:03:33AM +0530, Viresh Kumar wrote:
> On 23-01-25, 22:45, Beata Michalska wrote:
> > That would mean we are opting for presenting '0' value (whatever that means)
> > instead of trying alternative ways of getting 'current' frequency ?
> > This is still the scaling_cur_freq.
> 
> A return value of 0 should typically mean something went wrong
> somewhere and didn't return the right value to us.
If smth goes wrong, an error should be returned, shoulnd't it?
> 
> - For the print message, I think we should just print the value
>   instead of UNKNOWN. Let the user / developer decide what to do with
>   it.
Are you refering to the x86 show_cpuinfo behaviour altered by this patch ?
> 
> - As for trying other mechanism to find the frequency now, maybe you
>   are right and looking for an alternate way is the right way to go.
>   And that would be consistent with existing behavior too.
> 
That would mean that changes to show_scaling_cur_freq are fine ?

Just trying to clarify things.
Thank you.

---
BR
Beata
> -- 
> viresh

