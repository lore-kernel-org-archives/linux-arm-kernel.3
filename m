Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4DEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SJ8J70xfNe/JpIRlawsgSJuzP4lRQlWMl+O+tWc9sU=; b=l0OyyQ4v9dIYQC+qshNwJl1ps/
	JwX3d47qeq1wHM17dJz1HZWVfiBJOgLaxkJzxq3i1TvOxLiDffoeLwU558UwjNEWAUhA4H7lnkn9n
	7TfJB2F+cfCaCiyEPC/2tDgRQvlEOeeZwpzG6pkFwBE6CjrfDE/x2sOrVlm9HYQtdVP/xZYnbJ6XK
	/xm5sSiUn3/hJqAgzOyVbuOqgSGPNZP3P5wHzdPScRrFBGvRSGS4S2RkJbcQrAHD5YZ+kCSpDPv8X
	Q/yH5uIuVU9e+t+MeLu9jPxpWCfrh8dss5FPCeNgHMx9qDvuOFsWuYsz6eXUv6TG6nnDgA7Z5DHBK
	HJQv4xPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnyx-00000002QjL-2K8u;
	Thu, 09 Jul 2026 12:35:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnyv-00000002Qig-04vl;
	Thu, 09 Jul 2026 12:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783600553;
	bh=Wppfbnj881WSgNJYSf89PmL0u3y+RW4UCa78fZI6H30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ma11lkQLksFyB/jDWmVFChDw5KJqE7xRFNLDg3q1xg0mDwIG/uugMecMUb4puQOB6
	 SisVmPveMDSxB7kl1cZQygHkzwSCi7q0wALvQDH+T+oZ0KSApYzRp4ELe1EEvRr9Xj
	 biJ7oYeNkCyeFVTPkJRU02TGIIcYPJ/4zC9XXgZ/s9nMQ9oHpZnbyMl05xmplTMLyr
	 PWAfMTCiNU60g+jmAf4f/mB7Y4weKzH8jI2I5QCaWVk6281nKFVX6u6H9TtDaVcTc8
	 XaBtI9nI2xkpZlrlG3sORkTvZnHkK1i9BL6C/hplorzxK91MQNO97A0Ha/rqu6J78z
	 f296JdGm6V2gw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71A6817E079B;
	Thu, 09 Jul 2026 14:35:53 +0200 (CEST)
Message-ID: <1b27eabe-1709-4345-b2ba-50b528761683@collabora.com>
Date: Thu, 9 Jul 2026 14:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: mediatek: fix WRRD for SoCs without auto_restart
 option
To: Roman Vivchar <rva333@protonmail.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260624-6572-6595-i2c-v1-1-9155cebaae20@protonmail.com>
 <0eb85793-5995-4177-9b04-338246d6979e@collabora.com>
 <GOZtJ6Ys4Syt4VaGQyJvmYEIe6dx97flmTygat-nc_gMwsKVrDaDOQjP2ZbX1Qqwx5PYjWo6rJwo-8H32NQQAQi4Z7x6y9wpBNyYea9liZA=@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <GOZtJ6Ys4Syt4VaGQyJvmYEIe6dx97flmTygat-nc_gMwsKVrDaDOQjP2ZbX1Qqwx5PYjWo6rJwo-8H32NQQAQi4Z7x6y9wpBNyYea9liZA=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_053557_232986_7995AF0B 
X-CRM114-Status: GOOD (  21.68  )
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

On 7/9/26 14:12, Roman Vivchar wrote:
> Hi AngeloGioacchino,
> 
> On Thursday, July 9th, 2026 at 2:46 PM, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> On 6/23/26 23:40, Roman Vivchar via B4 Relay wrote:
>>> From: Roman Vivchar <rva333@protonmail.com>
>>>
>>> MediaTek mt65xx family SoCs have no auto restart, however, they still
>>> support the WRRD mode in the hardware. Because auto_restart is set to 0,
>>> the WRRD mode will be never enabled, leading to read errors.
>>>
>>> Fix this by removing auto_restart check from the WRRD enable path.
>>>
>>
>> Are you sure that MT6577 and MT6589 do support WRRD?
> 
> Yes, I have checked their downstream kernels[1][2] and they both mention
> WRRD.
> 
> We also tested mt6589 (privately) and the i2c was working. To be fair,
> it had some other fixes, but at worst this patch is no-op.
> 
> mt6577 is a tough one... I don't think there's any recent kernel with
> it. I plan to make it work with upstream, but that's a TODO. Either way,
> vendor code has WRRD support.
> 
>> If you're not 100% sure, or you want to be careful (which I would, in this case),
>> please add a `unsigned char wrrd_supported:1` to struct mtk_i2c_compatible, set
>> it to `1` on *all* of the SoCs that support auto_restart (as that's effectively
>> a different feature - it just happens that all the ones supporting this also do
>> support that, up until today), and add a new one for your MT6572, declaring no
>> auto_restart but wrrd_supported.
>>
>> That would make me sure that you're not breaking anything, and would guarantee
>> you a R-b.
>>
> 
> As far as I know, there's no SoC without both auto restart and WRRD.
> Adding wrrd_supported that always equals to true sounds redundant to
> me.

I have just verified on datasheets.
You're right, both MT6577 and MT6589 do support WRRD, hence your change is good.

With this commit, you're fixing a fix... Leilk from MediaTek was indeed wrong, as
in the commit description he says "the old IC does not support I2C_MASTER_WRRD",
and that's *very* wrong.

I can see though what he did, as he inadvertently also fixed the WRRD algo because
the fix was to increment msgs by 2 instead of 1 when op==WRRD.


Please, resend your commit as a v2, and add:

Fixes: b49218365280 ("i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD")

and also
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

> 
> [1]: https://github.com/GoldRenard/lenovo_A390_mt6577_uboot_kernel/blob/38ea59263984e26c0dd8e5891b22a35f61e60ed5/mediatek/platform/mt6577/kernel/drivers/i2c/i2c.c#L963-L975
> [2]: https://github.com/bq/aquaris-5/blob/bc1d0d0e35c969670e2d869001be944ad0c9c5e5/mediatek/platform/mt6589/kernel/drivers/i2c/i2c.c#L728
> 
> Best regards,
> Roman

