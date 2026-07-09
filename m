Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D86C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6cpwRhucWkiLQ3Poj1JeNznATKHvkQ86n1vPWHyAws=; b=dnyE4YBnyUOreb5hziKp+qwerG
	C2XCyUkdP/j5IKFRxPHba8LHEAHaxy4oAyNYGa/42GpJjl6UHXaS4HLXhMousfP133HG4g+yxA40c
	He4x0l8gWRL7Sjx9EqGq7OXogvnoq1orCvnHJLkjz9BNAhF46F/x6zlhglEDkVrhRgTAFTkKZ4LW6
	zr43t7lAuR+xFyPCUVS1gvF/Uy6Rjt/10BrKlUuRVT8FjpBoPdGKQ3UmdmhRmxkNLgcvepRv9ATqJ
	XTKn8NZ906aKTLQNH03HpB2d0GY8vTkR3a9amF314Iq/oW0jveRcZn1uyRhARemGyTX9lu0u2sBWm
	Mer7lCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnDF-00000002FjT-1PqN;
	Thu, 09 Jul 2026 11:46:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnDC-00000002Fig-1JZZ;
	Thu, 09 Jul 2026 11:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783597596;
	bh=osmPEMuhZlTqXYrEtvH7s5D+9/+EfoSMDdcRQu+4FAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jsB+EJ6c7dx6XCbidR9MCD+dTzI5o18P7QfSzlwncVmkzrIJWTGHJEpykvHgdVIud
	 XfpalvD8f70jO20On+0Wv5fMSrWBap+IA9/BEj4P0f2SbZ6aO6+xUIC/pAdqD2gfht
	 TcY9LoWrB43jl3XcNCcfrC/TV/x2YNXNX3aTgh8x2TB6SFBk3gqnPc6OW1lxx84Ak4
	 wRZ9NPqwt7uJD/Qeb1Vhy4mRsb99MxOtV3k8nPx32zKhADiKCikK8am868qIEJZt5g
	 5HFhIhABzTculKi8ZitphJSoewiDfJzEcS7aMLTFcvz5sFXsA6tXdLbGss+kbh3NLV
	 Sqt8AaQRIYiBg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 140F117E0C88;
	Thu, 09 Jul 2026 13:46:36 +0200 (CEST)
Message-ID: <0eb85793-5995-4177-9b04-338246d6979e@collabora.com>
Date: Thu, 9 Jul 2026 13:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: mediatek: fix WRRD for SoCs without auto_restart
 option
To: rva333@protonmail.com, Qii Wang <qii.wang@mediatek.com>,
 Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260624-6572-6595-i2c-v1-1-9155cebaae20@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260624-6572-6595-i2c-v1-1-9155cebaae20@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_044638_507326_3D93837B 
X-CRM114-Status: GOOD (  23.27  )
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

On 6/23/26 23:40, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> MediaTek mt65xx family SoCs have no auto restart, however, they still
> support the WRRD mode in the hardware. Because auto_restart is set to 0,
> the WRRD mode will be never enabled, leading to read errors.
> 
> Fix this by removing auto_restart check from the WRRD enable path.
> 

Are you sure that MT6577 and MT6589 do support WRRD?

If you're not 100% sure, or you want to be careful (which I would, in this case),
please add a `unsigned char wrrd_supported:1` to struct mtk_i2c_compatible, set
it to `1` on *all* of the SoCs that support auto_restart (as that's effectively
a different feature - it just happens that all the ones supporting this also do
support that, up until today), and add a new one for your MT6572, declaring no
auto_restart but wrrd_supported.

That would make me sure that you're not breaking anything, and would guarantee
you a R-b.

Cheers,
Angelo

> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
> This is a preparation for the mt6572/6595 upstreaming.
> 
> mt65xx family SoCs don't have auto restart, but vendor kernels keep using
> WRRD mode. Lack of the WRRD mode makes i2c reads impossible from both
> userspace and kernel drivers.
> 
> Without patch (mt6595, da9210 buck at 0x68):
> ~ # i2cget -y 1 0x68 0x00
> Error: Read failed
> ~ # i2cget -y 1 0x68 0x01
> Error: Read failed
> 
> With patch:
> ~ # i2cget -y 1 0x68 0x00
> 0x80
> ~ # i2cget -y 1 0x68 0x01
> 0x00
> 
> Same behavior observed on mt6572 devices.
> 
> This change doesn't affect SoCs with auto restart option.
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 126040ca05f1..307925fb78e3 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1258,7 +1258,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>   	i2c->auto_restart = i2c->dev_comp->auto_restart;
>   
>   	/* checking if we can skip restart and optimize using WRRD mode */
> -	if (i2c->auto_restart && num == 2) {
> +	if (num == 2) {
>   		if (!(msgs[0].flags & I2C_M_RD) && (msgs[1].flags & I2C_M_RD) &&
>   		    msgs[0].addr == msgs[1].addr) {
>   			i2c->auto_restart = 0;
> 
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260623-6572-6595-i2c-6ec9c4e6a6a6
> 
> Best regards,
> --
> Roman Vivchar <rva333@protonmail.com>
> 
> 

