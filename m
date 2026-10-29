Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DBD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 06:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vlAaFbxt;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=RoZWO1Qj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4beEnSSDjYlacVLVyK+pNpsq6dloyN3BCH/sftoRCws=; b=vlAaFbxtRlFzR3
	H4wVWwKksN/ahD2tihk7UfEWw6RUDu/k/p5GajPMCyvYrW48yeOTtDQrXesZkf7YnDdVXEn3/d6el
	m4n9JHGfdPEkZoy5r2B02Gp08Xooo7TLYNi/9KuCPg53HaAMwfoayec3iBZxHKVGDLYwe8Uc09Jtr
	3tG203DF4xOGqzw/L4NiKpJoDbh4Xhsjfx41WdlfLzFOsRffHf+i0bSPlrMXCIcuKECZ9crieydQd
	Rg3bnqty+XOMF9FGWOzBb61MPHPzq4QDkdtJWG0aSF5GwopASrYGUTvFF+uLhcQ7efO3/lOI16fF5
	Xv9pJXVHUiN/yQRkKlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJsv-00000008UoZ-0HuG;
	Thu, 29 Oct 2026 06:45:13 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJsr-00000008Uny-18lR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 06:45:10 +0000
Received: from [10.94.176.171] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id C271520B7168;
	Wed, 28 Oct 2026 23:44:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C271520B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793256294;
	bh=4beEnSSDjYlacVLVyK+pNpsq6dloyN3BCH/sftoRCws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RoZWO1QjfFHOcHrc3AEzAOTSzZgUNuwwMMjoN0CmiyWKqkm3zphhYbOgzImuBKiQ4
	 VUKcCjRqDEmg67BWlyyCYVgA1Q3nSslMxUP9gCNS6Hbu4jPuJNtbKIhP7tNwyrcjz6
	 lujz1vLlO9iKDs9Q0idLsEL9F1SxU6DtwXH/6l9M=
Message-ID: <11334849-52a2-4a4f-b656-e3cfa7f04565@linux.microsoft.com>
Date: Thu, 29 Oct 2026 12:15:00 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuidle: psci: Do not log probe deferral as an error
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261020-cpuidle-defer-v1-1-c86e0d450b4f@oss.qualcomm.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20261020-cpuidle-defer-v1-1-c86e0d450b4f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_234509_561248_44725EFD 
X-CRM114-Status: GOOD (  15.87  )
X-Spam-Score: -2.1 (--)
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

Hi Loic,

On 20-10-2026 19:56, Loic Poulain wrote:
> psci_cpuidle_domain_probe() reports every failure with pr_err(),
> including -EPROBE_DEFER. dt_idle_pd_init_topology() returns that
> whenever a parent domain is not registered yet, which is a normal and
> recoverable condition, so an otherwise successful boot still logs an
> error:
> 
>    CPUidle PSCI: failed to create CPU PM domains ret=-517
> 
> Report the failure with dev_err_probe() instead, which downgrade
> -EPROBE_DEFER to a debug message while still logging genuine errors.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/cpuidle/cpuidle-psci-domain.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..aa73a2fa14b3af4d1e3edd607e058ba96132bad7 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -173,8 +173,7 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>   	dt_idle_pd_remove_topology(np);
>   	psci_pd_remove();
>   exit:
> -	pr_err("failed to create CPU PM domains ret=%d\n", ret);
> -	return ret;
> +	return dev_err_probe(&pdev->dev, ret, "failed to create CPU PM domains\n");
>   }
>   
>   static struct platform_driver psci_cpuidle_domain_driver = {
> 

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

> ---
> base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
> change-id: 20261020-cpuidle-defer-4e6184bef223
> 
> Best regards,


Thanks,
Prasanna Kumar

