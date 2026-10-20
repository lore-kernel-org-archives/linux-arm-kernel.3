Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A55B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uHsJ/gOt;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dwa2/2mp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqANyPBVKb1V6pHlRKt3NQ6Ocz+jeVWfCBZGSbiTll8=; b=uHsJ/gOtWGUeH94/VXO7NCvWrc
	gVcf3LLeavBOG721iGQjJoAxwmEb5Nb/Pa0FKAE7b1uMzw9Jll/ceYKp9WkBG1oZ7N5XAWt7fpIzD
	kd5VILY0s6ZrCXv1g1GeuYKS/Gta49onq26PbcnT6gpw5LeeiziLiPTkdcADc8r4Tpu/tzARcjrJq
	CJXorLm9jrgqklRqYHhXfUlQYkRvsbSlA6uBmOAtulUj6+qMSUAbZbag5XqVyxNGB9cXByhBG5ltC
	/7FWLZ7QE7P/rC8sydFA9RoiNZAbLRO6xRucoSgnT5WYjL/ejSyaRxEzhNJxfzCwnFVaEokVESKKs
	ve3Q6pSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBN9-0000000A1Zb-2io2;
	Tue, 20 Oct 2026 15:03:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBN7-0000000A1YV-0th7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:03:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD12A16F8;
	Tue, 20 Oct 2026 08:03:18 -0700 (PDT)
Received: from [10.0.128.106] (e127648.arm.com [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3E7B3F7B4;
	Tue, 20 Oct 2026 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792508602; bh=exlXZ5LNhGnN6GWf37HBftprwysKrWdhPAxWVsVZnGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dwa2/2mpL1Ht/iQN5zB71Zivd5y3oivwHNR7BaVDIjpFi1bTiqQV2LEY60nxyV6a+
	 2THIUWRIDDYXSkn93LRt1nOfPCTAWVNx1fE+8NZ6xbeMyw4Fn3Evrq5qFQzCaf6Cwu
	 btZ5Wxg37QmxwMhfOPy3El60uQDPX3N1uqM38r9U=
Message-ID: <19c334e2-267f-4b85-8eaf-40e23259c961@arm.com>
Date: Tue, 20 Oct 2026 16:03:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuidle: psci: Do not log probe deferral as an error
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261020-cpuidle-defer-v1-1-c86e0d450b4f@oss.qualcomm.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261020-cpuidle-defer-v1-1-c86e0d450b4f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_080325_301985_9A8F2B92 
X-CRM114-Status: GOOD (  16.59  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 15:26, Loic Poulain wrote:
> psci_cpuidle_domain_probe() reports every failure with pr_err(),
> including -EPROBE_DEFER. dt_idle_pd_init_topology() returns that
> whenever a parent domain is not registered yet, which is a normal and
> recoverable condition, so an otherwise successful boot still logs an
> error:
> 
>   CPUidle PSCI: failed to create CPU PM domains ret=-517
> 
> Report the failure with dev_err_probe() instead, which downgrade
> -EPROBE_DEFER to a debug message while still logging genuine errors.

s/logging/returning/?

> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

in any case:
Reviewed-by: Christian Loehle <christian.loehle@arm.com>

> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..aa73a2fa14b3af4d1e3edd607e058ba96132bad7 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -173,8 +173,7 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>  	dt_idle_pd_remove_topology(np);
>  	psci_pd_remove();
>  exit:
> -	pr_err("failed to create CPU PM domains ret=%d\n", ret);
> -	return ret;
> +	return dev_err_probe(&pdev->dev, ret, "failed to create CPU PM domains\n");
>  }
>  
>  static struct platform_driver psci_cpuidle_domain_driver = {
> 
> ---
> base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
> change-id: 20261020-cpuidle-defer-4e6184bef223
> 
> Best regards,


