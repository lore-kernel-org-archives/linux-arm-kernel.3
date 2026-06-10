Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE13CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 07:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtHvcgqAu8v2YPctakrIYsBNQrHANt0cF9AvYDlwPQ4=; b=MWjpGdVBQYuigrmf9OWthWFT/q
	Tr/eTBjUwBuzwx3XU2UhbyNIPrPDyadDQKmMI7QShFG/PQzz6SE0oyTEsdcVjjNq1eCm4yMJDwojH
	i2mdM2cjHwVi/wnat+DCrEBb1kbFQ6f8JHy1OvbV6eS0tzj0FsTR/SyFRZZ7/vk4d5V3Jjqcm7FbJ
	F3kQz+jmBNUIeJn7emdrAfepTiz9xPYwSFD6avKTGgLyE/sn8KwTclHRPJgceUE/dI+HKU5avVF7V
	asYce2dX1Q5SRUAFENfmvuxATSeNCjScdd02UBH7mNQ/7BYClg4SPKTC9E3/vUHVGeMt5v6Uirw9C
	e8B2/B7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXD4W-00000006wBN-1bgz;
	Wed, 10 Jun 2026 07:09:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXD4U-00000006wB1-3uWP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:09:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4688C416B7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 07:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADA61F00898
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 07:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781075394;
	bh=jtHvcgqAu8v2YPctakrIYsBNQrHANt0cF9AvYDlwPQ4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lyszrwGf+ZPaiiV0PeqShNWNbgTtzndJExdRpbn72JvsnAjHx6nq8WGf7riT1PfI9
	 4IumPqXb/9cB2FslZ0Pbnu31jtCtChOESA0yUFhBJl3yCRf7P0VUvP8CE8Tduq+Xmo
	 t0aC2kX0ECCJRvX6OESXwBzKheyX0u07j4KNhfmt025wQRbpn67mbWrHB3ZhNZvCB+
	 WrgT9advMxtmjlvwN5jyuGj3ak30cbM2b2FEoPzts+keFOTqx4aa7/GP7MEbZzFNLf
	 GmV/0/OpCDSYDHCzgVc1RHwwPwuNX3PzzMtzh+Laju6ytm0cQ1eJduyGcmEAwMTFmy
	 Os55XLLp+kkcA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa68d9d56fso6615412e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 00:09:54 -0700 (PDT)
X-Gm-Message-State: AOJu0YyhTGOctLgeZUCXyT6877ZIeFfyPATuEu7HgiRUIXsjP5j8mo5Q
	428AG1PTinkF/Q50MsXFRaI3U3MBGWbcYDLmPI3Efr0FZpRNDQXPjo0uEa3bsCfksxebZJ2BMqt
	Y672b0Ac2m6RjF15yzAXAaS0xEVM0lGdapiUZ7j/qYA==
X-Received: by 2002:a05:6512:60b:b0:5aa:6dfd:459e with SMTP id
 2adb3069b0e04-5aa87b8e1bemr4673923e87.7.1781075392952; Wed, 10 Jun 2026
 00:09:52 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 03:09:51 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 03:09:51 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610030513.2651018-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
References: <20260610030513.2651018-1-haoxiang_li2024@163.com>
Date: Wed, 10 Jun 2026 03:09:51 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfjpibfmnHKi1GeMRCgDOc3=+1_C3aJfYQwR_YMcHtC_A@mail.gmail.com>
X-Gm-Features: AVVi8CfY527vYJqPCTKFLvrHgAhLfpoYrAWJS-RKMwI2pvUAHuO9GyiDhNNz-o4
Message-ID: <CAMRc=MfjpibfmnHKi1GeMRCgDOc3=+1_C3aJfYQwR_YMcHtC_A@mail.gmail.com>
Subject: Re: [PATCH] i2c: davinci: Unregister cpufreq notifier on probe failure
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, brgl@kernel.org, 
	andi.shyti@kernel.org, khilman@deeprootsystems.com, chaithrika@ti.com
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 10 Jun 2026 05:05:13 +0200, Haoxiang Li <haoxiang_li2024@163.com> said:
> davinci_i2c_probe() registers a cpufreq transition notifier before adding
> the I2C adapter.  If i2c_add_numbered_adapter() fails, the probe error path
> releases the device resources without unregistering the notifier.
>
> Add a dedicated error path to unregister the cpufreq notifier after
> i2c_add_numbered_adapter() fails.
>
> Fixes: 82c0de11b734 ("i2c: davinci: Add cpufreq support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index a773ba082321..a24c3e8b87ff 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -818,12 +818,14 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>  	adap->nr = pdev->id;
>  	r = i2c_add_numbered_adapter(adap);
>  	if (r)
> -		goto err_unuse_clocks;
> +		goto err_cpufreq;
>
>  	pm_runtime_put_autosuspend(dev->dev);
>
>  	return 0;
>
> +err_cpufreq:
> +	i2c_davinci_cpufreq_deregister(dev);
>  err_unuse_clocks:
>  	pm_runtime_dont_use_autosuspend(dev->dev);
>  	pm_runtime_put_sync(dev->dev);
> --
> 2.25.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

