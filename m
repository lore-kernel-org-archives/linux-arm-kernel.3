Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B304A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H6m5vhsL;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=o/y3YkpY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w/Kq4rSNjCvs9VAI8UKnVJRhqPJ5zVmjn/9rAOMb60c=; b=H6m5vhsLp8vBRW
	/RsXS6dR5BtG9lNC2mwOpEyqPvF8KluarmOtSwbIg7ZsXbmPPxJZxefdCUmPmWCSC1TQqiiNS5F4u
	4o3SOpTYABaKF+mwGZUYqRx8LEemoEDsCKQA9aeqiadJ6TQ0LJlnINfiAT/ktWQzYGy7kodBTNy5A
	rzGaHyZCp3lkpwn8PgeZ8LKx3Fa5vIZrApZRbfeiEVDw2X5fFCogern1ORORAjbuROaQzFnR9vSL4
	Mah+in9ayazzPvffpKJxHGgmFqQci877belpn5bAtQfaN3JmG/d3Q0mTPfp2wtCKxqpiyhJXT3poF
	qwzUwoLicnp9x1XFR53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Gl-00000006hUK-4B18;
	Wed, 28 Oct 2026 09:48:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Gj-00000006hSp-0ADY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:48:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AB6E1756;
	Wed, 28 Oct 2026 02:48:23 -0700 (PDT)
Received: from [10.57.16.117] (unknown [10.57.16.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 955CA3F673;
	Wed, 28 Oct 2026 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793180906; bh=5qjmlzTnoR3IKWUCE79lFxEjxVpvS/kN7v+qA/a8N/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o/y3YkpY8LiEpwP/EqmTw7iys/V/Svusj3PGl3LWov6/QS4Nwqfkwv3YRQG1cI4OL
	 hHuGveEVOw8Yj6CoscXg0nLlzRMioHrXqZIB8pqHt2OQKexVtqQQ3VcX0gTVITWZfq
	 PDX/UiZ+C4FJITdEQNwlRpiu0NgH0d6TNf2gmcmg=
Message-ID: <4160015c-8372-4fb4-bc2b-714f18756d0d@arm.com>
Date: Wed, 28 Oct 2026 09:48:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: handle runtime PM resume failures
Content-Language: en-GB
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_024829_218652_5B643D2D 
X-CRM114-Status: GOOD (  12.93  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On 11/09/2026 11:28, Yuanfang Zhang wrote:
> When a CoreSight component's parent power domain, such as a CPU cluster
> genpd, fails to power on, runtime resume returns a negative error. Several
> call sites ignored that error and continued to access registers on an
> unpowered device, risking an external abort.
> 
> Replace the remaining pm_runtime_get_sync() calls with
> pm_runtime_resume_and_get(), which restores the runtime PM usage count
> when resume fails. Abort before accessing hardware and propagate the
> error to the caller.
> 
> In coresight_get_ref(), unwind the module and device references. In
> debug_enable_func(), roll back the CPUs that resumed successfully before
> the failure. Finally, release the mode acquired by stm_enable() if its
> runtime resume fails.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
> This patch converts the remaining CoreSight pm_runtime_get_sync() users
> to pm_runtime_resume_and_get(), propagates resume failures before
> hardware access, and completes the related module, device, CPU and mode
> unwind paths.
> ---

The patch looks good to me. Please could you rebase this on the
coresight/next branch ? (to address the conflicts)

Cheers
Suzuki


