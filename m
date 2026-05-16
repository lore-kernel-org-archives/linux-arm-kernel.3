Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237C3CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFUZZx2QJqJTOZT7S3kg7qiH36Ox6wWOQI5Wixbdoks=; b=HYXrgbtpFhqgh2CK+aSxayiVZ4
	P0MDh7RDwa/qmAdCXp1/J7/xqJyJdC0FjTdc7RRVTpxSAp6GLH9MpGXwkb9nqll3YjViFTcnAeRnb
	nyHl3IdZjfNdooK1EalC0YAlU4F/RTsv6VNXRNrD4nS7Pwr7CBbIa+nep0vfz6dmOWbugH1vuOwMI
	HTtsGuZMSyC40JTRl1GJze26Xxxv6DZxlN3BIj3AJUIqDraK77oWSlpsYK3PKE4qeUvqLQJb24/ku
	N6WY7J5xBcfYPd8lfOx66Te6XEPpVnDSpa0D8YGGTcT6HwggHEfA07afoED6dvBf7RmahFeYOgtaQ
	i6sRahpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOAph-0000000ASGd-2gda;
	Sat, 16 May 2026 08:57:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOApe-0000000ASFz-1vZ8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 08:57:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CE701516;
	Sat, 16 May 2026 01:57:07 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2282F3F7B4;
	Sat, 16 May 2026 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778921832; bh=ek0f0kWCmmBayUmjVfA98ro5juV/5E9LFf/nK5QvmdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRSeFrcH8F1MQ6Fss76gM01dOQ47JcqWH5L8XtusDZ8XcwRn0LvwxqcaY5b2TvJOv
	 03HZu0jbMGrFTXpIXgx2t5U1ne7KOZ5916KrrmX+s4Oy8p5U+rRoP85/jhBXBZyO1d
	 bCKfFSzlmx7ULlDWSCYcfHYEgTChLVc5ukWXU+FA=
Date: Sat, 16 May 2026 09:57:07 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v14 01/28] coresight: Fix source not disabled on
 idr_alloc_u32 failure
Message-ID: <aggxY66eLG//jVH7@e129823.arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
 <20260515-arm_coresight_path_power_management_improvement-v14-1-f88c4a3ecfe9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-1-f88c4a3ecfe9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_015714_663361_CF5CBC52 
X-CRM114-Status: GOOD (  21.76  )
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

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Fri, May 15, 2026 at 09:08:08PM +0100, Leo Yan wrote:
> From: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> In coresight_enable_sysfs(), for non-CPU sources (SOFTWARE, TPDM,
> OTHERS), the source device is enabled via coresight_enable_source_sysfs()
> before idr_alloc_u32() maps the path. If idr_alloc_u32() fails, the
> original code jumped directly to err_source, which only calls
> coresight_disable_path() and coresight_release_path(). The source device
> was left enabled with an incremented refcnt but no path tracked for it,
> leaving the device in an inconsistent state.
> 
> Disable the source before jumping to err_source so the enable and path
> operations are fully unwound.
> 
> Fixes: 5c0016d7b343 ("coresight: core: Use IDR for non-cpu bound sources' paths.")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-sysfs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index b6a870399e83419dce0552099562fa3ae7b2bd69..da6f22b512c92ab0cff5bb239495a1ab6d2a0dbe 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -244,8 +244,10 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>  		 */
>  		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
>  		ret = idr_alloc_u32(&path_idr, path, &hash, hash, GFP_KERNEL);
> -		if (ret)
> +		if (ret) {
> +			coresight_disable_source_sysfs(csdev, NULL);
>  			goto err_source;
> +		}
>  		break;
>  	default:
>  		/* We can't be here */
> 
> -- 
> 2.34.1
> 

-- 
Sincerely,
Yeoreum Yun

