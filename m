Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB31F99368
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YiKjVz9swVRUqA6WflZnEhbl0ptUcLNunuar2gR68Q=; b=UupCk73g2OObOQfg82NZ7TPpDF
	SP7wyAV1Y0DkC3YN1ohxBtsxGKTykPiB7kz4Kejmn/SvH0mM2MU8fqMY9fie0TwGeWBZAXmAvTNkF
	cb4XLlioAuNdgtJr2WaqnsSZqnZD8QdRU7ryC+ty6WA5GBjm4mjoyYO9UWpjSrFgJzbSGUIS2Mgr+
	e2Om6ukFITdHiQ3G87PgoeqoLtIbBAyWPzhaOK4TfG75V1k7VgPB5uFAaTvkdz2/tvN89qtn5qbNH
	YfOyZLwk0cU2c/+x5ZKf4RkbjkHrh3UFFb9zttihtNZov/00PlKJf4v36n3geEQIXy5d3fA3F66IY
	D5hrIMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFr7n-0000000BSsz-0eax;
	Thu, 23 Apr 2026 10:17:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFr7l-0000000BSsX-0HRb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 10:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEAC64455D;
	Thu, 23 Apr 2026 10:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E3CC2BCB2;
	Thu, 23 Apr 2026 10:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776939451;
	bh=Eh+rxbW5ADS/ygmkGFPlk846VYv4ZMXX9UlZzCUlUQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRs5EZs+C+W4Tt5ez+7FVfPvZ7loMsxFfvo24ZTmqRjA4OLTmGY4nXtGDrMIcehvS
	 I8qr35S9XtfHKYAHJW5uh7dgpauP5OXakHWyrbP19QIfwyyz/mTGmIfjE/eta5Vj1h
	 crmNgGSP44AQLW5Rbiov36q6vscGVHKaKWNxIOcsZMGhXwYuoVCPYUTk7ssPo0fea+
	 nD5bZ25tIRHnnstVyN2M/EXRETYWElnQ7nqatdTwUO9IwPzq155XJA8rgRSDg1OQT4
	 qfasuvo84W+aG584F2AnBd0Yp25dOT7UgyVgnVlj+8jHda/G5hBRgkGs1Kr1tV64XD
	 iM5PJq4cV+thw==
Date: Thu, 23 Apr 2026 13:17:27 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com
Subject: Re: [RFC PATCH v2 2/4] tpm: tpm_crb_ffa: revert defered_probed when
 tpm_crb_ffa is built-in
Message-ID: <aenxtxb5eIsCWOZd@kernel.org>
References: <20260422162449.1814615-1-yeoreum.yun@arm.com>
 <20260422162449.1814615-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422162449.1814615-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_031733_146791_3EBEBB45 
X-CRM114-Status: GOOD (  17.00  )
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

On Wed, Apr 22, 2026 at 05:24:47PM +0100, Yeoreum Yun wrote:
> commit 746d9e9f62a6 ("tpm: tpm_crb_ffa: try to probe tpm_crb_ffa when it's build_in")
> probe tpm_crb_ffa forcefully when it's built-in to integrate with IMA.
> 
> However, as IMA init function is changed to late_initcall_sync level.
> So, this change isn't required anymore.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/char/tpm/tpm_crb_ffa.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
> index 99f1c1e5644b..025c4d4b17ca 100644
> --- a/drivers/char/tpm/tpm_crb_ffa.c
> +++ b/drivers/char/tpm/tpm_crb_ffa.c
> @@ -177,23 +177,13 @@ static int tpm_crb_ffa_to_linux_errno(int errno)
>   */
>  int tpm_crb_ffa_init(void)
>  {
> -	int ret = 0;
> -
> -	if (!IS_MODULE(CONFIG_TCG_ARM_CRB_FFA)) {
> -		ret = ffa_register(&tpm_crb_ffa_driver);
> -		if (ret) {
> -			tpm_crb_ffa = ERR_PTR(-ENODEV);
> -			return ret;
> -		}
> -	}
> -
>  	if (!tpm_crb_ffa)
> -		ret = -ENOENT;
> +		return -ENOENT;
> 
>  	if (IS_ERR_VALUE(tpm_crb_ffa))
> -		ret = -ENODEV;
> +		return -ENODEV;
> 
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(tpm_crb_ffa_init);
> 
> @@ -405,9 +395,7 @@ static struct ffa_driver tpm_crb_ffa_driver = {
>  	.id_table = tpm_crb_ffa_device_id,
>  };
> 
> -#ifdef MODULE
>  module_ffa_driver(tpm_crb_ffa_driver);
> -#endif
> 
>  MODULE_AUTHOR("Arm");
>  MODULE_DESCRIPTION("TPM CRB FFA driver");
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

I'll hold review to next version i.e. after Mimi's concerns
have been addressed.

BR, Jarkko

