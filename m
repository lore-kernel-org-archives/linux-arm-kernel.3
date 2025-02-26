Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B93FC19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tw42xid+WUwsyTXO3dfqODQosn1SYPoGt8Yoqu9g61Y=; b=j2tNKs204owZXlneu6xOWM5NGW
	WCfIfH04pbDIySTJ7dOq0RSSCa4jsCuZFmzNXvNXGarfoU4y7AzYQiwyEq8TN0eR0xiXxt4ErUa5O
	fOnMV6Ll63Qbwb2+iLCJyA0IpTuFsAjMqiU9LcnTU7G1LNb9YPoHRegtO4vU9mZsoOqIuLezISGFc
	YDuwwgxbn+1nR0RAY7kXmlnGhs+FI+2zwkVtAalonFyqikpvmW5A+UzbBPe+wBtJZ9zu3PLEqEKam
	xzskBPxY+E3n95Ukd7ag3//xc4FDiL4qxdVK/n1eKOf9rS57KeXMGr10GovN3+2podKBJgzNLX6dV
	QN9JOuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMrT-000000057Bu-0hZA;
	Wed, 26 Feb 2025 19:14:27 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMk7-000000055oB-21Y9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:06:53 +0000
Date: Wed, 26 Feb 2025 14:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740596808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tw42xid+WUwsyTXO3dfqODQosn1SYPoGt8Yoqu9g61Y=;
	b=qVx7MQzdPH944+qyXMOoDK5ZWsYeILr/Ab+IeBjUCMmdn7V8E82fLSi3f2zKvfsAMqW9a2
	vmJZ8yINouV+QYKzS/5a7UoTY8xh3E2Lce6JiN0RyKEZ5wPQGkNxcbAnK/pso4QmeKIXKP
	OOUdPOBznVg19MBbxRYhe7pPY7BFjSMZfpIguTK9LE3g/Q1gHYtul+9wN42VIF33nGzC/W
	XZ6tg2jLzRQZO8nz32FC49Yl8EWv4DBp9C/YH0euIaGEi+NWDheeQcAyCWARRaVhQkr0A+
	8PTQxj4z4mubk/OHsoj3zw9qCFq56k4rCvrs3UivpsffJU4zksmqGIKkvVBc/g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: apple: rtkit: Add and use PWR_STATE_INIT
 instead of _ON
Message-ID: <Z79mQqfYQH_rituh@blossom>
References: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
 <20250226-apple-soc-misc-v2-1-c3ec37f9021b@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226-apple-soc-misc-v2-1-c3ec37f9021b@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_110651_985942_049422D9 
X-CRM114-Status: GOOD (  17.04  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Wed , Feb 26, 2025 at 07:00:03PM +0000, Sven Peter via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> This state is needed to wake the dcp IOP after m1n1 shut it down
> and works for all other co-processors as well.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/soc/apple/rtkit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index 2f5f878bf899..be0d08861168 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -12,6 +12,7 @@ enum {
>  	APPLE_RTKIT_PWR_STATE_IDLE = 0x201, /* sleeping, retain state */
>  	APPLE_RTKIT_PWR_STATE_QUIESCED = 0x10, /* running but no communication */
>  	APPLE_RTKIT_PWR_STATE_ON = 0x20, /* normal operating state */
> +	APPLE_RTKIT_PWR_STATE_INIT = 0x220, /* init after starting the coproc */
>  };
>  
>  enum {
> @@ -898,7 +899,7 @@ int apple_rtkit_wake(struct apple_rtkit *rtk)
>  	 * Use open-coded apple_rtkit_set_iop_power_state since apple_rtkit_boot
>  	 * will wait for the completion anyway.
>  	 */
> -	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_ON);
> +	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_INIT);
>  	ret = apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STATE,
>  					  msg);
>  	if (ret)
> 
> -- 
> 2.34.1
> 
> 

