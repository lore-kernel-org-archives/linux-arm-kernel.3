Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D937AFF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pmbats54+MxucVCieGBchgsz1wK8hwjJIWyGJ7YoUA=; b=QWYL4YjVJ3P8pIWggx+k6bwo25
	RvAvHYMSsUCy9MzH1h44DHTlYO0FUCDgfijpdKAQqtARHtqYf3NXrGAH1t2WWvCsb/jOIjYUXqHBa
	BXQzZWz/zV0yn4am1NzKmwdPUt93LoSVldO6H3HGyLjJxfKF0lYG2MSoKxkkWQo2HQRcGlR/NXC60
	MHv4diEwKJLTf6qBNyE2KBuUDzT7gtArtrc1ZnCx2usoFqCnDisCljEDY3KvT0HY6smwL/ijZQet8
	bkJsLlsbvcMkcGaqzpjsFOlFP7M6X9qDRJnCf9Nxj/PBD1PazJN4CKwyLMQp/zWytui7/zYjmPtMl
	qUpGJHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W4z-0000000CkVb-2Qi3;
	Tue, 31 Mar 2026 10:12:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W4y-0000000CkVH-0kXw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:12:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6140E60103;
	Tue, 31 Mar 2026 10:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C368C2BCB2;
	Tue, 31 Mar 2026 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774951931;
	bh=HuZ9XGoQtldmCzvMR9gactMeYCZzEsjf+eC61YzxUVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSIKhHvnNVzyDB7Dbvcg/JqcpGEsuEKR1WQoJEpntULphGGp5lkEGIzKX7pp4Zfw6
	 6wo7s8y0LBbabPjtdS+e+qDBSAC/JlZ4L9wxviznwYPHOwTetC3QqgB6QuC8bNwcbD
	 6ujNKPxHwNC/8NY/Mr/wa2w9LUd/pByQT8Pjrye/7KtvT2gkjGELofJ4W6Qv5z3K7G
	 /YM4vuPuLm9PdXo0fhQIEtkPH4V1wPjiJIdzdCtPxbqi2xlHTg+4e8v0CDTX28MfFc
	 VwjCuhJJsxwt/9aD3QzApBcLwb03siv3rNEXVmPljUloc63KdNzOEV1Rv/8RqfCUk4
	 3Ai2u6sR9BQQg==
Date: Tue, 31 Mar 2026 11:12:03 +0100
From: Lee Jones <lee@kernel.org>
To: Akashdeep Kaur <a-kaur@ti.com>
Cc: praneeth@ti.com, nm@ti.com, afd@ti.com, vigneshr@ti.com,
	kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	s-ramamoorthy@ti.com, vishalm@ti.com, sebin.francis@ti.com,
	d-gole@ti.com, k-willis@ti.com
Subject: Re: [PATCH v2 2/2] mfd: tps65219: Make poweroff handler conditional
 on system-power-controller
Message-ID: <20260331101203.GA3795166@google.com>
References: <20260324101419.95616-1-a-kaur@ti.com>
 <20260324101419.95616-3-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324101419.95616-3-a-kaur@ti.com>
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

---

On Tue, 24 Mar 2026, Akashdeep Kaur wrote:

> Currently, the TPS65219 driver unconditionally registers a poweroff
> handler. This causes issues on systems where a different component
> (such as TF-A firmware) should handle system poweroff instead.
> 
> Make the poweroff handler registration conditional based on the
> "system-power-controller" device tree property. This follows the
> standard kernel pattern where only the designated power controller
> registers for system poweroff operations.
> 
> On systems where the property is absent, the PMIC will not register
> a poweroff handler, allowing other poweroff mechanisms to function.
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>  drivers/mfd/tps65219.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
> index 7275dcdb7c44..6fa202339a0c 100644
> --- a/drivers/mfd/tps65219.c
> +++ b/drivers/mfd/tps65219.c
> @@ -541,13 +541,15 @@ static int tps65219_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> -	ret = devm_register_power_off_handler(tps->dev,
> -					      tps65219_power_off_handler,
> -					      tps);
> -	if (ret) {
> -		dev_err(tps->dev, "failed to register power-off handler: %d\n", ret);
> -		return ret;
> +	if (of_device_is_system_power_controller(tps->dev->of_node)) {
> +		ret = devm_register_power_off_handler(tps->dev,
> +						      tps65219_power_off_handler,
> +						      tps);
> +		if (ret)
> +			return dev_err_probe(tps->dev, ret,
> +					"failed to register power-off handler\n");

Couple of nits to fix.

The `"` should be aligned with the `(` and the `failed` should be capitalised.

>  	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

