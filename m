Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7157C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv4btFH5VWr4FMrQz1HzsFVqhg1Ur/1K4K16qbLAWRg=; b=2uld0fz88G9M/x0f88WuaS6L49
	o29I0q8aY6lZkBvQoa3qXcvb1mi5A+L/XGtoDzo2ULcb4Hp3M16jJ3wEROyuwv3O3G3gyu6X23L1c
	o4mQFteiSQgnJG2bu5EkhsKN3SbmumGVKp7wwcpzMYXjyhAEztDGnq9nGu4IV6DP6hTfd73i+FJaI
	rt9rCV3kjRi5OcO3tWNjsR1bwoLFQtyEZrV6XOth+wvsCVVQcUZoNRAJI9ItAF2FPJ7dvRlbouYHB
	Cv8ymhPRFSjCwg9xUFDOr0at4Zzh6BvST7lKtVow00rojLk4HoJFuFdZoliSX1ODO1TsjyWNVP710
	/aBgBroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8kY-000000061qJ-4AIo;
	Mon, 17 Feb 2025 21:33:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8ir-000000061Ig-3eXg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 21:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F31FE5C5934;
	Mon, 17 Feb 2025 21:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BC0C4CED1;
	Mon, 17 Feb 2025 21:32:08 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	ionela.voinescu@arm.com,
	sudeep.holla@arm.com,
	will@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	Beata Michalska <beata.michalska@arm.com>
Cc: sumitg@nvidia.com,
	yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com,
	zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Phil Auld <pauld@redhat.com>,
	x86@kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 0/4] Add support for AArch64 AMUv1-based average freq
Date: Mon, 17 Feb 2025 21:32:06 +0000
Message-Id: <173982791748.4020779.2848639862581042284.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250131162439.3843071-1-beata.michalska@arm.com>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_133213_961910_E12DF37B 
X-CRM114-Status: GOOD (  10.61  )
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

On Fri, 31 Jan 2025 16:24:35 +0000, Beata Michalska wrote:
> This series adds support for obtaining an average CPU frequency based on
> a hardware provided feedback. The average frequency is being exposed via
> dedicated yet optional cpufreq sysfs attribute - cpuinfo_avg_freq.
> The architecture specific bits are being provided for AArch64, caching on
> existing implementation for FIE and AMUv1 support: the frequency scale
> factor, updated on each sched tick, serving as a base for retrieving
> the frequency for a given CPU, representing an average frequency
> reported between the ticks.
> 
> [...]

Applied to arm64 (for-next/amuv1-avg-freq), thanks!

[1/4] cpufreq: Allow arch_freq_get_on_cpu to return an error
      https://git.kernel.org/arm64/c/38e480d4fcac
[2/4] cpufreq: Introduce an optional cpuinfo_avg_freq sysfs entry
      https://git.kernel.org/arm64/c/fbb4a4759b54
[3/4] arm64: Provide an AMU-based version of arch_freq_get_on_cpu
      https://git.kernel.org/arm64/c/dd871ac1237f
[4/4] arm64: Update AMU-based freq scale factor on entering idle
      https://git.kernel.org/arm64/c/96b335620c59

-- 
Catalin


