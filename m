Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB22C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NJpuP8QAvrvl+PVL24frdpuVZt5EE9YT2b5o/wg7Sc=; b=uI0GOkOt3xy4wJAu6ytRQQK4VF
	qIZPPWaYJfgS3QCVrFPzY4cOHC2bq7BjGKJF1DmZ9Nle2qHF1kALoAELX1PGHofHpTNtRKbE7xPYj
	DqmsCpGE3OdDBLHp9o3lNZQYb6LMpAZK/RwfgMzYXVYeSPI3R47BDr1KitSAcAmEtffrgl/KYhzOC
	whEeKVUV7uzu4knrN3nuYk5VYHs66YnsCUyFVpFzCWdXJc1ZxWw/BT3muQ69Ngig0rYPVeruBNqxL
	AFGCFh2PmCINGz2wA6O03E2FHULB/lqtlJUu8Z69TxD1LWzPBaogUS+YPIVxaAIB5wYZWZ5lx+u1B
	HuIgulSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8YQ-00000007Ud5-0Y7Y;
	Thu, 06 Feb 2025 20:32:54 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8X2-00000007URg-20XX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 20:31:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YppfR5j1Hz6CmQyc;
	Thu,  6 Feb 2025 20:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738873880; x=1741465881; bh=2NJpuP8QAvrvl+PVL24frdpu
	VZt5EE9YT2b5o/wg7Sc=; b=YQauap5vt91p/64wa2xD++T/ZIQ2JWQO8wxX1/RH
	Xar37Pyvo92+OPWWeZ+xi1WOLRBHtV/o65PEcuTNSTtJhoelhJGqiaPtWgTRUMS4
	pzdDUvF+W7dBvu8Iczfu+BO9oGWPB+QYNrAW49iKHVKbA+09SWwrTFUeNbWCK7Sb
	4W/ktd5YuQuXCHFkGP1TvI5ywA0tdtuIbXEcRb0h4u/wbo/rCUB251x649M3BKc/
	alyVBChUDX8ea7FdZ6ocro8HJeCSx0ThYkXkNa+eUNbpHcy6ra1WUWuOITFRXX6G
	6fGY/AQhisdqp6w6+oLB0o1DknrAat3T/0tZOaVi0FKTLw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SA9dIvRNaZcF; Thu,  6 Feb 2025 20:31:20 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YppfF2X6tz6CmQyZ;
	Thu,  6 Feb 2025 20:31:16 +0000 (UTC)
Message-ID: <373d62da-810f-492c-af2f-53b32cc90b33@acm.org>
Date: Thu, 6 Feb 2025 12:31:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: zynqmp_dp: Use scope-based mutex helpers
To: Sean Anderson <sean.anderson@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250206194117.1496245-1-sean.anderson@linux.dev>
 <20250206194117.1496245-3-sean.anderson@linux.dev>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250206194117.1496245-3-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_123128_534658_B6AD51D8 
X-CRM114-Status: GOOD (  13.91  )
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

On 2/6/25 11:41 AM, Sean Anderson wrote:
>   static int zynqmp_dp_enhanced_set(void *data, u64 val)
>   {
>   	struct zynqmp_dp *dp = data;
> -	int ret = 0;
>   
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>   	dp->test.enhanced = val;
>   	if (dp->test.active)
> -		ret = zynqmp_dp_test_setup(dp);
> -	mutex_unlock(&dp->lock);
> +		return zynqmp_dp_test_setup(dp);
>   
> -	return ret;
> +	return 0;
>   }

Has it been considered to combine the two return statements into one
with the ternary operator (?:)?

>   static int zynqmp_dp_downspread_set(void *data, u64 val)
>   {
>   	struct zynqmp_dp *dp = data;
> -	int ret = 0;
>   
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>   	dp->test.downspread = val;
>   	if (dp->test.active)
> -		ret = zynqmp_dp_test_setup(dp);
> -	mutex_unlock(&dp->lock);
> +		return zynqmp_dp_test_setup(dp);
>   
> -	return ret;
> +	return 0;
>   }

Same question here.

> @@ -2053,7 +2039,8 @@ static ssize_t zynqmp_dp_custom_read(struct file *file, char __user *user_buf,
>   		return ret;
>   
>   	mutex_lock(&dp->lock);
> -	ret = simple_read_from_buffer(user_buf, count, ppos, &dp->test.custom,
> +	ret = simple_read_from_buffer(user_buf, count, ppos,
> +				      &dp->test.custom,
>   				      sizeof(dp->test.custom));

This change has not been mentioned in the patch description and is not
related to the other changes in this patch?

> -	return ret;
> +	dp->test.link_cnt = val;
> +	if (dp->test.active)
> +		return zynqmp_dp_test_setup(dp);
> +
> +	return 0;
>   }

Has it been considered to use the ternary operator here?

Thanks,

Bart.

