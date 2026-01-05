Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEC5CD0424
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiNoenJ/RZ3CMJPSRjSEdihij0G5/3gRJ7C0p4oFC3Q=; b=DJe1STsXjMTsL5IcwfywX+ZdZo
	vARp95mmbsmkoyc56luC5SsQG4xNWgF8VKjL6tvL0bcGkccO64fKXJtG2HXXBB36Uf/mOwFYmpnxu
	yEgrwKT6Kyop8mTuwF/iqtvMAtEj38Jc/t/lWWUCsu3rMl9JYUkG+zLDKkMJ1If5Vz+0W8aK/uRAP
	+YaQT5a8g6U3SoFmy9Z8KaZOBvcQi/PbAxMv6U/k3oXV3AsLZyhXytqxfRSMp44FMfEZoN2rRP/tc
	97v+FSavUkDvtMQEdx4eYl1TbVwD1vu/kDLwxza/KPfN7TMeD00DUsDwE0yYjw/4Yl4X622eqQwcG
	zqrKpHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXk-0000000CDED-0jpx;
	Mon, 05 Jan 2026 22:59:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXh-0000000CDAB-1pha
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:59:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 195F7403B1;
	Mon,  5 Jan 2026 22:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5315C116D0;
	Mon,  5 Jan 2026 22:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653957;
	bh=KoxFTUsZ/Of4FpR1fNnDeWRLDtfKACGPbvAGhu6FGEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C6r1S8gASfY2AXvWRNoY4CiHm7V+po1rHc5YibaxHnrCtTJsXaq65M0P8eian+XtR
	 ht1uXBS6YFiX5NsVI6KY7vLtAfOZKk47Qv2FPJHMLwFlilqQP1QQPxbvb6WtWua3Ac
	 cbir6th4dO2/4YdQ0mFpmVRRo5CHWh/lYWNh7qjxlHpleVk1XdIgN1QvOEpiMVtwEf
	 7iT1WyywOrC/Sm/0qsJpGXsW8bVsqcggX1aBfmrRBQklSaHkH8Ij5qLl32ih3NXMfI
	 DZZtv6tMun+4se3oAbB2cOPUNk4dlAEk7gKKfsNq6D45LKVBW8MUs28oqfG7I9LOek
	 4kpljl9B4zWxA==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	sudeep.holla@arm.com,
	gregkh@linuxfoundation.org,
	dakr@kernel.org,
	beata.michalska@arm.com,
	ionela.voinescu@arm.com,
	Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linuxarm@huawei.com,
	jonathan.cameron@huawei.com,
	vincent.guittot@linaro.org,
	zhanjie9@hisilicon.com,
	lihuisong@huawei.com,
	yubowen8@huawei.com,
	zhangpengjie2@huawei.com,
	wangzhi12@huawei.com,
	linhongye@h-partners.com
Subject: Re: [PATCH v6 0/3] arm64: topology: Handle AMU FIE setup on CPU hotplug
Date: Mon,  5 Jan 2026 22:58:31 +0000
Message-ID: <176764750971.1449488.16003345808762968197.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
References: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_145917_546332_FD5D0DB6 
X-CRM114-Status: UNSURE (   6.30  )
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

Applied to arm64 (for-next/cpufreq), thanks!

[1/3] arm64: topology: Skip already covered CPUs when setting freq source
      https://git.kernel.org/arm64/c/af15bc259e26
[2/3] cpufreq: Add new helper function returning cpufreq policy
      https://git.kernel.org/arm64/c/4221504c4328
[3/3] arm64: topology: Handle AMU FIE setup on CPU hotplug
      https://git.kernel.org/arm64/c/6fd9be0b7b2e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

