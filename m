Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76670C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AmT91GNyEyQqWqWxg0TBH3JEfJSP0b5YmcyprlUh0w=; b=BiWW2+3Y7d+AdC7H8kxHaLtf6T
	9pN96IN7B7Uaez1Xr3dUou8nuqGW1frlJ5qJ9MqiocuXJhs5muqicfI1ml5QQwNw5RDamD0mA02kG
	+1DE5ZDcNJEIE8CUCsBsUAOcrrfsFJJMYKsti7S/vcxYY4HNw2immms4s0H844A1l3BDCrTE0qk8h
	SGsYMbQVQz8xhZWSp0uPUaOhz5ql8TrydZPMqNnMoSJhX4uKSs82ljvkk1twWv8oP7cDR1u0sam50
	HWh1JhfwFJCjD0SFpFL9NdPSNOIgsl+cp8jCzEisLRGDm4kOUks80mlvr6L5PFoaJHa5DHyxCBkqU
	UcQrJkbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPkk-000000052Fv-04O0;
	Fri, 21 Feb 2025 09:55:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPWI-00000004yWy-1LOL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:40:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A9145C57BB;
	Fri, 21 Feb 2025 09:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD03C4CED6;
	Fri, 21 Feb 2025 09:40:26 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com,
	will@kernel.org,
	sfr@canb.auug.org.au,
	Beata Michalska <beata.michalska@arm.com>
Cc: ionela.voinescu@arm.com,
	yury.norov@gmail.com,
	linux-next@vger.kernel.org,
	sumitg@nvidia.com,
	yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com,
	zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com
Subject: Re: [PATCH v2] arm64: Utilize for_each_cpu_wrap for reference lookup
Date: Fri, 21 Feb 2025 09:40:24 +0000
Message-Id: <174013080894.2262863.4824734189364820879.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220091015.2319901-1-beata.michalska@arm.com>
References: <20250220091015.2319901-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_014030_413800_3C242477 
X-CRM114-Status: UNSURE (   8.33  )
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

On Thu, 20 Feb 2025 09:10:15 +0000, Beata Michalska wrote:
> While searching for a reference CPU within a given policy,
> arch_freq_get_on_cpu relies on cpumask_next_wrap to iterate over
> all available CPUs and to ensure each is verified only once.
> Recent changes to cpumask_next_wrap will handle the latter no more,
> so switching to for_each_cpu_wrap, which  preserves expected behavior
> while ensuring compatibility with the updates.
> Not to mention that when iterating over each CPU, using a dedicated
> iterator is preferable to an open-coded loop.
> 
> [...]

Applied to arm64 (for-next/amuv1-avg-freq), thanks!

[1/1] arm64: Utilize for_each_cpu_wrap for reference lookup
      https://git.kernel.org/arm64/c/20711efa91e8

-- 
Catalin


