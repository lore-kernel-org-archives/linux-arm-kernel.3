Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845D1C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVYMCR+zZiJk548IYjNev7NpqzC9USJxLtoQD3GMb6E=; b=sl1TxUv2i0jQmHpjltlfaPnKSb
	3Wb7cpxY+/tLKsGvQbJyj6iU7cDLYt0nbwM7X3PjwJ3Qpx9MTpYVuqHOuiBne8scw/sDpmW/iUhUN
	fCpJKho/21DCy93FmjDvzMKTMmzTXQwYuIEWhK0uQWWv0z/9HSF5vJp+cM65zk7W+khNWRePPUQZi
	BfJGfLeEq313MDzKf7DUHoSApKjID/MDJSc394aEbA39RTZOlV+51gVpdhA7Y3fAw91HNXMt26/2m
	vocA2O2dHuQrIr+PjwIas0TdeVRbWhim4xkyIlv3okAyzsTAZEWKut01gTZiUdm/350dc9BMhUd8D
	IaBOvpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8lz-0000000622l-2hAj;
	Mon, 17 Feb 2025 21:35:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8j2-000000061Lp-0bB7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 21:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B8C15C57CF;
	Mon, 17 Feb 2025 21:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AFAC4CED1;
	Mon, 17 Feb 2025 21:32:21 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com,
	vincent.guittot@linaro.org,
	beata.michalska@arm.com,
	Ionela Voinescu <ionela.voinescu@arm.com>
Cc: Will Deacon <will@kernel.org>,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	dietmar.eggemann@arm.com,
	pierre.gondois@arm.com
Subject: Re: [PATCH] arch_topology: init capacity_freq_ref to 0
Date: Mon, 17 Feb 2025 21:32:18 +0000
Message-Id: <173982791747.4020779.3793606958598624272.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240827154818.1195849-1-ionela.voinescu@arm.com>
References: <20240827154818.1195849-1-ionela.voinescu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_133224_221003_01DF7269 
X-CRM114-Status: UNSURE (   9.49  )
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

On Tue, 27 Aug 2024 16:48:18 +0100, Ionela Voinescu wrote:
> It's useful to have capacity_freq_ref initialized to 0 for users of
> arch_scale_freq_ref() to detect when capacity_freq_ref was not
> yet set.
> 
> The only scenario affected by this change in the init value is when a
> cpufreq driver is never loaded. As a result, the only setter of a
> cpu scale factor remains the call of topology_normalize_cpu_scale()
> from parse_dt_topology(). There we cannot use the value 0 of
> capacity_freq_ref so we have to compensate for its uninitialized state.
> 
> [...]

Applied to arm64 (for-next/amuv1-avg-freq), thanks!

[1/1] arch_topology: init capacity_freq_ref to 0
      https://git.kernel.org/arm64/c/004b500a9031

-- 
Catalin


