Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FB7C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 23:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTwlmly93vnRbvgyIBnYILT6N2ep8nD9Waa6NB4Btl8=; b=e+Byt13wJcAGMBfMs/iAoATWzl
	f19ZczabZOlyKnp08ADxJvnsEGTbG5eiQQ5mwyfy4igVlrVH0fdIGL83ftVKz95oZ/s0LVjtIHaiX
	Go1iK0aAXD3yjJJX8EBMWiui8idAEtNFr4F8oajzVzNHnB3PhgU5LYm97nztbmlKP605mObR4mg8r
	w5u9SHMr5Ceb5kQXxb2oNLXA+nfXxSOf4MpH+Z5Fz6zrVZtsGLCiglfK6Q26Phpe9s56BrRcGXMru
	kVPs7xfi0IdlsUxAtJenTP8XKkq87EmB79ZGLBviGvxnr/iewEKv2rTjpSvQq3F5opHFJOK1JY5/I
	NrX0RB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEcFw-0000000AttY-3aJh;
	Mon, 12 May 2025 23:08:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEcDu-0000000Atkm-47L5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 23:06:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA51D5C1072;
	Mon, 12 May 2025 23:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A8BC4CEE7;
	Mon, 12 May 2025 23:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747091173;
	bh=1ZcjgvgrEMG2RkKvo4QaKByZQ7uYkbBvxm9KMRRwrRw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a66Cd6b6btmARTbPFL7WbRB+VLlk6/mdcaqOc0xzVwbJ1pyX/dd0sJrfElvM0aaVr
	 f6F2Q43V30TREjyHga/uXUVR/N4BNEPTiCqoNFgiOeULWmkXyjsjJZ8sMfoW43E08a
	 JSb6x8uydyZVzwdy8cCKFY64Hmf5ar+EqVvVdT+o=
Date: Mon, 12 May 2025 16:06:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <dianders@chromium.org>,
 <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
 <lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
 <zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>,
 <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH v2 0/2] Update the watchdog period according to real CPU
 frequency
Message-Id: <20250512160612.c10464075df3c7842b13da11@linux-foundation.org>
In-Reply-To: <20250512130919.23915-1-yangyicong@huawei.com>
References: <20250512130919.23915-1-yangyicong@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_160615_131874_6F1BA4C9 
X-CRM114-Status: GOOD (  15.93  )
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

On Mon, 12 May 2025 21:09:17 +0800 Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> watchdog perf needs architecture to provide method for converting the watchdog
> thresh to counter period. For arm64 we're using the max CPU frequency for
> doing the conversion which is from cpufreq driver. But some cpufreq driver
> are registered lately, for example cppc_cpufreq will be registered at late
> initcall which is after the initialization of watchdog perf (initialized in
> armv8_pmuv3 of device initcall). In such case the period of watchdog will not
> be accurate enough. Fix this by registering a cpufreq notifier and update the
> watchdog period once the cpufreq driver is initialized.
> 

Thanks.  Thoughts.

1: What is the impact of this change?  Is the current code causing
   problems?  If so, what are they?  How is the end-user experience
   improved by this change?  Important info!

2: As far as I can tell, this patchset impacts arm64 only.  Do you
   think that other architectures should implement this?

3: As far as I can tell, this patchset affects all cpufreq drivers
   which use late_initcall() (on arm64, of course).  Is this correct?

4: It is asserted that we should use the *maximum* possible CPU
   frequency for this calculation.  Why?  I assume this is because we
   care about the minimum watchdog period?

Can I assume that the ARM maintainers will be handling this?

