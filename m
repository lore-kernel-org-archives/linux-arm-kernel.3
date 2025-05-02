Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD428C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMPNWz4FOU2/jszEzOaMkApxqrpvg0kK9/bo79XP3Rs=; b=Feyz41+0pjivlcY0/tj9qxJIwo
	P4zsnWfPccCO2+bEowFCAyZ/7UfCdJyZz5HoXXzp4FkXGQS7c9nKT5PU9q6IHuvbj8lHMwW5NEK3D
	LVSTi1pwmF90LBfke5RBAogKIlDHAv9NLk7vZGdbc+PmCsIoY7ve8Mks6ygu7TarTDihpULDzVd2Z
	iUBpAd4t445N78fQ9cMibS56tz+QvR4wEHPOmdEELdZ4g6ZQWCygOG7djCBJjR6sw5ahnmPsjxuIn
	PhYhuY6PSgW7oQEhMUkNdFK7N1ZYNpzeZDIHmlmXBpPNHqwNkgpARFFFgvF0WGTOupXPV+ikTgu1m
	SNa5ZSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuat-00000002if6-2ab4;
	Fri, 02 May 2025 17:54:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuXz-00000002iJD-34W1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B0A06844D;
	Fri,  2 May 2025 17:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0904AC4CEE4;
	Fri,  2 May 2025 17:51:33 +0000 (UTC)
Date: Fri, 2 May 2025 18:51:31 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 4/4] tools/kselftest: add MTE_STORE_ONLY feature hwcap
 test
Message-ID: <aBUGI1OaaSUJPGAa@arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410080723.953525-5-yeoreum.yun@arm.com>
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

On Thu, Apr 10, 2025 at 09:07:23AM +0100, Yeoreum Yun wrote:
> add MTE_STORE_ONLY feature hwcap test.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/abi/hwcap.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
> index a539eeb0bfc0..32385f67498e 100644
> --- a/tools/testing/selftests/arm64/abi/hwcap.c
> +++ b/tools/testing/selftests/arm64/abi/hwcap.c
> @@ -1104,6 +1104,12 @@ static const struct hwcap_data {
>  		.hwcap_bit = HWCAP3_MTE_FAR,
>  		.cpuinfo = "mte_far",
>  	},
> +	{
> +		.name = "MTE_STOREONLY",
> +		.at_hwcap = AT_HWCAP3,
> +		.hwcap_bit = HWCAP3_MTE_STORE_ONLY,
> +		.cpuinfo = "mte_store_only",
> +	},
>  };

Please also add checks to tools/testing/selftests/arm64/mte/ to verify
that read tag check faults are ignored when this is enabled.

-- 
Catalin

