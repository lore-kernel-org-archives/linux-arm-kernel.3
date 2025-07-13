Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DA4C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akmPUGJ+ZPVpH2vLXmA9mtmigA3DY32/PLo63cH7VLg=; b=q8CpyjugdrKZ291Nt96ZCYQrdO
	2oNpkibvfgAb0iMBKQxbk+GHQ/aYmZ8iKLGNqKMtWv3gG+e58qp3E866lmY4lyV0Pn6KhBjWNrZFu
	i2rDRaYLpZtuhR8m5n7b9pWU4DdNMqmCWfvg6H1rqnrjFzKM+Ko9hi//46zbYLmx3Qur6rK1D8Ht+
	hVBmpUEuVKGmvh//hmEE0PaR0ECSKzp7cfb35IUpIS+MAmm3AGaJeAYQxk5VNiet239pBYSMxY60e
	E79t6WmspfWMaOrEMNaD3w9ffVCL9XRE8yGkoatfR3XuUtD5ZB8IXCYMnaC9Ni/F1ADIdQbIEgbZ3
	I7oYDxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1l2-00000000W9g-15UX;
	Sun, 13 Jul 2025 18:49:04 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1ie-00000000W5k-06YU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 18:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=akmPUGJ+ZPVpH2vLXmA9mtmigA3DY32/PLo63cH7VLg=; b=UYTqm66mHtW2Zr2BqdfhnWkU/l
	xnaVzZTiVyT5AqXimPG5qYWDiEkiexTj0ZumHQSl3q8Bpek4n7+VuWgrg2wxP5JGu9AC8h0TKawa6
	lj+wVoIkGgDrfIWRHklL4Rrw+0BCWZE3WhF9SJijdGJMYyKzvw3sQIRIe3jok3euXP9EilMJsRB40
	T99rgODOVIRAtsufQYUvPECa6koyvtCnhgBcP8/hZkBjs0d8bzv2246PiJVjSR5IrHUKr32TRm+89
	pSXcf4/oqu3J122OZV14cxdosMXgAp6fJsXRhaIZR6IMVxx1DYJT8+AiObdRW1adfm+eL5KRX4CK6
	zDAGZmAg==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ub1iZ-00G9At-TP; Sun, 13 Jul 2025 20:46:32 +0200
Message-ID: <b60b89b9-40e2-476c-ad67-1a5df548a167@igalia.com>
Date: Sun, 13 Jul 2025 15:46:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] staging: vchiq_arm: Make vchiq_shutdown never fail
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev
References: <20250711154031.24178-1-wahrenst@gmx.net>
 <20250711154031.24178-4-wahrenst@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250711154031.24178-4-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_114636_121556_585BA484 
X-CRM114-Status: GOOD (  13.65  )
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

Hi Stefan,

On 11/07/25 12:40, Stefan Wahren wrote:
> Most of the users of vchiq_shutdown ignore the return value,
> which is bad because this could lead to resource leaks.
> So instead of changing all calls to vchiq_shutdown, it's easier
> to make vchiq_shutdown never fail.
> 
> Fixes: 71bad7f08641 ("staging: add bcm2708 vchiq driver")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 6434cbdc1a6e..721b15b7e13b 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -393,8 +393,7 @@ int vchiq_shutdown(struct vchiq_instance *instance)

If vchiq_shutdown() will always return 0 and most users ignore the
return value, how about turning it into a void function?

Best Regards,
- Maíra

>   	struct vchiq_state *state = instance->state;
>   	int ret = 0;
>   
> -	if (mutex_lock_killable(&state->mutex))
> -		return -EAGAIN;
> +	mutex_lock(&state->mutex);
>   
>   	/* Remove all services */
>   	vchiq_shutdown_internal(state, instance);


