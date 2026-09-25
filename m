Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27391C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grlICF9nkh4C/dnNNhJ1T/58sZ+clHLnfYaCye7OIvg=; b=zjMgOHYMwGdlKACQSZAUEGaWPu
	PmN03sU3K4oelMzBYG1irFBRxUgYgpmjUJXyh5cPMpZt3pnGRZfK0KLwlOdZ+b/qTPjzESz7ISGiT
	dPDqkp9epUmfy8KeqdYYzLeRTbjfDKjWET4EcSgHOj+7V+hh7urEsdJlOBB8nd7PvRoNENaFzsLip
	0/Lo5r1XhTG41DYNf4SRGKaFV3ydwvol8lUhqCNJDCChiOYTmb71CZKHuVLOZQWgkUR34/GJSxzSg
	vFtBFeTZ2SJJNDakrpwa6aUklPNez9gmU3PzwqtAb9lUp51DMM5aOJk/zAQhGZghWfwStppGOhWYz
	xo6ngqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4s1-0000000DIYs-43Yq;
	Fri, 25 Sep 2026 12:17:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4rz-0000000DIXy-0bPc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 12:17:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D206E169C;
	Fri, 25 Sep 2026 05:17:34 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03D733F86C;
	Fri, 25 Sep 2026 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790338658; bh=gVBLm+VP8ROLJ0gR1xOSUhXwVrsMbmupCmmXzTJRqks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQA5EJREBfekr73a3Y7Tyo36mm8gHlHbPrgP6zTS1tdofwAOLh6QSATc2nWz04hBw
	 Fl6KFtOge5c3tL+1563ecWu9eTlRTpev11oUFN/x47kKgQHfxdfCbzuX3edtQtvKql
	 WepaXKC5dHpWOTCvmdbp5E8fbPV/jfpDLzuqTq0A=
Date: Fri, 25 Sep 2026 13:17:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
Message-ID: <arZmXFw5Jw2IbAmA@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-6-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924135201.850038-6-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_051740_056481_FD724403 
X-CRM114-Status: GOOD (  21.16  )
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

On Thu, Sep 24, 2026 at 02:51:59PM +0100, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Activate the RMM after the basic configuration. This is a memory
> transferring stateful operation.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v17:
>  * Inline RMM_ACTIVATE command and remove the definitions from arm-rmi-cmds.h
>  * Use scope-based cleanup to free sro object
> Changes since v16:
>  * Split into a new patch
> ---
>  drivers/firmware/arm_rmm/rmi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 035f21d3f26b6..0859f256e192b 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -834,7 +834,18 @@ static int __init arm64_init_rmi(void)
>  	if (ret)
>  		return ret;
>  
> -	return 0;
> +	/* Activate the RMM */
> +	struct rmi_sro_state *sro __free(kfree) = kmalloc_obj(*sro);
> +	if (!sro)
> +		return -ENOMEM;
> +
> +	ret = rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_ACTIVATE);
> +	if (ret) {
> +		pr_err("RMM activate failed (%d)\n", ret);
> +		ret = ret < 0 ? ret : -ENXIO;
> +	}
> +
> +	return ret;

It was raised earlier this year [1] but I'm not sure it concluded. How
do we handle kexec and kdump? I think RMI_RMM_DEACTIVATE only succeeds
if nothing is delegated, so it would need all realms torn down first. If
that's not feasible, we could at least block (non-crash) kexec like pKVM
does.

Kdump gets even more interesting if it starts accessing delegated pages
and getting GPF.

[1] https://lore.kernel.org/r/CABpDEukEO4Y_fg8fv5Nr1_Pw_qOK=2UmioXk=WyPEzoEprPcGA@mail.gmail.com

-- 
Catalin

