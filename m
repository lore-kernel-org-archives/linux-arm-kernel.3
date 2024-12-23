Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D15DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WLuHWjZM3VRX7nJ+Pc75I1m4HqNbbSxdu5AhUiwKyg=; b=YwOfKzNUgNgglbD0wgI8Knj6Na
	IoDoAXT9Fi1q97VSEiVL4jI/Cd8uLX+2hEdX2bsE6N5M0+FYgd4E4IPfFB+vCD5DEO4CM6DnVwWX2
	EzYAcMaaqXUkQfkEyBqWiiyy8bspSa85koOPURyBx6on4xystIIlcBJ4mPv4+QE16yT5kJy5AAY+M
	oXjgjsJvTuF3oxU7zMTt4Avexn6lvk7u8eCqkVuwy8VQUWrYf4yOC9Lx/KbACJHbYuGJNvdJYywH+
	9Ms3zsfWp+L/R9BuFpHg/sh+RxVaYOhgUKGuyaKJxR49BCAhqFEzhMVfGm7CgF+9OkBAxqvGN9jdG
	cS/xKUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPoEI-0000000AdEg-40d3;
	Mon, 23 Dec 2024 19:36:38 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPoD6-0000000Ad4L-3nvi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 19:35:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDF95108A88F0;
	Mon, 23 Dec 2024 20:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734982520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+WLuHWjZM3VRX7nJ+Pc75I1m4HqNbbSxdu5AhUiwKyg=;
	b=CueH/fD3YFomuQ1LDPTIrV6Y7okJdiQF7ouvXjU8mWrTaaDb1lShPFWDI3w4gTLIoDG15Z
	buFWYSgi5vaRBeWFErPnX9r0BxPiN9/6p8CcnRlH+CQ1l1VTJqM98idg8+PYFh8b6d4rN+
	TRz+EbhHKRqm10eL64RtQIKMrfJ2ejlUugJ6ikp7krKjXyvcAge5Y5ZByn7UDqUYJuYBTR
	k/IUvEBsrKs9vch5/Fx6Q0MOigV4/ZjFg9dRgV9KyeHUtya6HJ67RQVRH4+//L6VpuTP3C
	zOwOVu32xwsi/hQt5B3lLbOYasInFMiGufNsQb4I3X4t/X9ZhpyfVcHvOHKkLg==
Message-ID: <412e65b5-dd91-4982-8b1a-423997da9a28@denx.de>
Date: Mon, 23 Dec 2024 20:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: antonio.borneo@foss.st.com, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn,
 peng.fan@nxp.com, fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241223020629.3471182-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241223020629.3471182-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_113525_109272_0E9893D6 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

On 12/23/24 3:06 AM, Mingwei Zheng wrote:

[...]

Shouldn't the clock be enabled before calling 
stm32_gpiolib_register_bank() ? I think the 
clk_bulk_prepare_enable(pctl->nbanks, pctl->clks); should be around here.

> @@ -1646,15 +1628,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		if (ret) {
>   			fwnode_handle_put(child);
>   
> -			for (i = 0; i < pctl->nbanks; i++)
> -				clk_disable_unprepare(pctl->banks[i].clk);
> -
>   			return ret;
>   		}
>   
>   		pctl->nbanks++;
>   	}
>   
> +	ret = clk_bulk_prepare_enable(pctl->nbanks, pctl->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
> +		return ret;
> +	}
> +
>   	dev_info(dev, "Pinctrl STM32 initialized\n");
>   
>   	return 0;
Aside from that one question, this looks good, thanks !

