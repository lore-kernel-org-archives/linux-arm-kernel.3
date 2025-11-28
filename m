Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C38D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJ30o+944ryzUEhgAU02Jlk/NKpl3DEUymTwi102Ofk=; b=ruJUp8vDs0fRLagHbxzA9U2Ljc
	hoG+uvmmaFCTeKc9K/6UyRPQ21C+AqX/HNiWR6IowgBWOXadpomcPVWMp13i7EWdy4F3jqJvU7A1q
	JkrchcDPE5hN7EpmbFw/VD4LTKh6wqJ9IdgxMiM4h4X3zDpSqVaLCTAuPtKOLcxvZ5EdprhQpHLH5
	LC1OqiXNqPBOAU6O2sAtN59bt1pcIDGpcoanpLm9tkHU1smIij1O3EZUGOHOul8IEFbxYd9ufCQ8l
	4k0jv/SjdtpOPt+/0CBSHIdM00LxrbsI0kpLgqQ2BQxBW/k4+UrpE9J3DV4hv81fl+Us6A8YBU7KK
	gwiKW1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP0it-00000000b8c-1A5V;
	Fri, 28 Nov 2025 15:49:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP0iq-00000000b8G-2PXg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 15:49:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 775F7176A;
	Fri, 28 Nov 2025 07:49:15 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DED913F66E;
	Fri, 28 Nov 2025 07:49:19 -0800 (PST)
Date: Fri, 28 Nov 2025 15:49:17 +0000
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
Message-ID: <aSnEfTJ3WRx6iJU5@arm.com>
References: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
 <176409538230.296584.10511015168201991664.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176409538230.296584.10511015168201991664.b4-ty@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_074924_656624_E338106A 
X-CRM114-Status: UNSURE (   9.56  )
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

On Tue, Nov 25, 2025 at 06:29:53PM +0000, Catalin Marinas wrote:
> On Wed, 19 Nov 2025 16:13:53 +0800, Lifeng Zheng wrote:
> > Solve a problem that causes CPUs Setup AMU FIE failed in a corner case,
> > even though they're eligible.
> > 
> > Changelog:
> > 
> > v6:
> > 
> > [...]
> 
> Applied to arm64 (for-next/topology), thanks!
> 
> [1/3] arm64: topology: Skip already covered CPUs when setting freq source
>       https://git.kernel.org/arm64/c/a04fd8bcd6aa
> [2/3] cpufreq: Add new helper function returning cpufreq policy
>       https://git.kernel.org/arm64/c/709a16bebc54
> [3/3] arm64: topology: Handle AMU FIE setup on CPU hotplug
>       https://git.kernel.org/arm64/c/1ea7e37e26b3

I think Beata still has to review the last patch in the series, so I'll
drop it for now from -next. Sorry about this.

-- 
Catalin

