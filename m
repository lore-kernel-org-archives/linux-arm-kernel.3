Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8322BD0EE13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 18:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDaFpPJLHxOVd2xPLevCFq2D34frZokjsxb3owKPRtQ=; b=TqylxMgTVvx5J1XoLmj6hPi5k4
	aXE4koU0t7jk7LuS+haoWf/zbGnJCWHPnRj6XthJrIeWRmNB8y5h9662tsxhFmtqH+JHEJEme3P3K
	ekDrt1IhBaWo2HN930HzBO3X6wWRVuKTe/AEVOaLbpQvTQAaYWxHy5Bz3KcFi6rTfJcEMY7cAL2lJ
	/kQGGD/cSRbfvzGP/59zod/91BR+9TcorsUb0Oe09ogN7lrSfqxOnWD+1QECfB0a33cBnk1s9L4EQ
	mj3f8KumyOz+crW5g1rzopsho777z0o2VlanNjbCQlGlirLIwxGs6yDIlbcPfgv+q9DJiv6yN2KjF
	Q+UaCiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxnh-0000000DljN-2VTb;
	Tue, 25 Nov 2025 18:30:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxnf-0000000DliN-05LY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 18:30:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8DB01570;
	Tue, 25 Nov 2025 10:29:51 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43FAE3F6A8;
	Tue, 25 Nov 2025 10:29:56 -0800 (PST)
Date: Tue, 25 Nov 2025 18:29:53 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, dakr@kernel.org,
	beata.michalska@arm.com, ionela.voinescu@arm.com,
	Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	vincent.guittot@linaro.org, zhanjie9@hisilicon.com,
	lihuisong@huawei.com, yubowen8@huawei.com, zhangpengjie2@huawei.com,
	wangzhi12@huawei.com, linhongye@h-partners.com
Subject: Re: [PATCH v6 0/3] arm64: topology: Handle AMU FIE setup on CPU
 hotplug
Message-ID: <176409538230.296584.10511015168201991664.b4-ty@arm.com>
References: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_103003_158194_16940B07 
X-CRM114-Status: UNSURE (   6.96  )
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

On Wed, 19 Nov 2025 16:13:53 +0800, Lifeng Zheng wrote:
> Solve a problem that causes CPUs Setup AMU FIE failed in a corner case,
> even though they're eligible.
> 
> Changelog:
> 
> v6:
> 
> [...]

Applied to arm64 (for-next/topology), thanks!

[1/3] arm64: topology: Skip already covered CPUs when setting freq source
      https://git.kernel.org/arm64/c/a04fd8bcd6aa
[2/3] cpufreq: Add new helper function returning cpufreq policy
      https://git.kernel.org/arm64/c/709a16bebc54
[3/3] arm64: topology: Handle AMU FIE setup on CPU hotplug
      https://git.kernel.org/arm64/c/1ea7e37e26b3

-- 
Catalin


-- 
Catalin

