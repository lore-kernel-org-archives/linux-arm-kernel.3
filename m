Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848AACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFiFhndwi6XDsy7wZnYGty33Xfo/6aSC9tubmlHV0O8=; b=3roiwfH/EfLmPnAVM7xTKMl6XY
	N6+aSh82ieMqPd41WVbTxNPZx9DujGjSMj+Ox5kwD/wAobQUKKJRiOSlnDeg0J6hxRIpDOiuBVBpU
	SBWshdmHai6SwtOkaIkfUjzSND2CdTOs//BdFQEZTUilOhzWQCnIN98slAHt3sYYXS2jOYowZJKzz
	rVjGt96Jwjw6tUZUuSnPhnBX1KiwklZ1GpGg9eaDKFpCamt1r+djMZGqGgUdFYumY7i6bWcAKVVsz
	3v7A4ZVLh4RvBorAG0Va2JdGi0u4CnLzUO1cmqYwfE5XD6dIJBxDny4QgM2kOREbuNXg2N5ZXUUZ2
	M3NZBXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFxw-00000000hao-2XIV;
	Tue, 19 May 2026 08:38:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFxt-00000000ha7-33TP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:38:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA73334FC;
	Tue, 19 May 2026 01:38:06 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBE763F85F;
	Tue, 19 May 2026 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779179891; bh=m/IZzX8K/zDKGw1QKwD/kJgkxjUXp+cyXlYYXszD6zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NCpXbeDiE5zv83JOlhsVwe3fjcNwBoQZ2s7MxJ2d906/vAA9adgN5JbKYtvtwS7xx
	 LCHX08O5Sgn8ReRpjp1SphC3MmmDq79RxsjNYyXhL5SEbylGomhfhF//P4cXpXwjmn
	 5OJQs+9i8gH1fTSxe8Au1sSjg3CGH7kLTyVXq+Dg=
Date: Tue, 19 May 2026 09:38:03 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] firmware: arm_scmi: Read sensor config as 32-bit
 value
Message-ID: <agwha4a1nzG8btl3@pluto>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
 <20260517-scmi_fixes-v1-1-d86daec4defd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-scmi_fixes-v1-1-d86daec4defd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_013813_828093_D89BF06D 
X-CRM114-Status: GOOD (  16.75  )
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

On Sun, May 17, 2026 at 08:02:40PM +0100, Sudeep Holla wrote:
> The SENSOR_CONFIG_GET response contains a 32-bit sensor_config field,
> and the xfer is initialized with a 4-byte RX buffer. Reading it with
> get_unaligned_le64() can consume bytes past the returned payload.
> 
> Use get_unaligned_le32() to match the protocol layout and the allocated
> response size.
> 
> Fixes: 7b83c5f41088 ("firmware: arm_scmi: Add SCMI v3.0 sensor configuration support")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/sensors.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
> index 882d55f987d2..836c294a9f42 100644
> --- a/drivers/firmware/arm_scmi/sensors.c
> +++ b/drivers/firmware/arm_scmi/sensors.c
> @@ -793,7 +793,7 @@ static int scmi_sensor_config_get(const struct scmi_protocol_handle *ph,
>  	if (!ret) {
>  		struct scmi_sensor_info *s = si->sensors + sensor_id;
>  
> -		*sensor_config = get_unaligned_le64(t->rx.buf);
> +		*sensor_config = get_unaligned_le32(t->rx.buf);
>  		s->sensor_config = *sensor_config;
>  	}

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

