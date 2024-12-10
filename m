Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DCAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBUKULQdeAj3srAOUfNxAcrVMqtQrzmaJVxl5Kec0tI=; b=J/xYpZrGMuVhdf+T/LIG3r4iUq
	Nx/r++FX+6DkhPGCROjBGgF6+xaSspRWIJxpil7VebvlI01vCN4QJj9YqyYaCJFvQw6M9KDutK5gM
	HcLDb9a916HtAl/PRzD4xnGS7keNaHB7zWRO4R85/lIzHufDoQ7hkrN6JgMEUelI0HbHqrYwwVWlu
	oXdn16eJJIQAptzN/rnxtoycAruc4hLF8PsaUuhMbYA/VRHMxxv8XlrrlewUdCn0yFRVGiQUoT4aN
	0Y+oLQHQ+gsEkmF0TrxyOP+NzNrZ1wajNMAMxLlnxUsOLzSdilidiflZfTcVj6/qpX6Fr3yRu2J6h
	YL8H4zKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvSx-0000000AgOw-1wLI;
	Tue, 10 Dec 2024 08:19:35 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvRt-0000000AgF5-0LZ9;
	Tue, 10 Dec 2024 08:18:30 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1733818707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OBUKULQdeAj3srAOUfNxAcrVMqtQrzmaJVxl5Kec0tI=;
	b=lCnsrTK/1akQyLYVUjsKpfdC8FWRqa7ttTUhWa+bmTGtlWuysFdJ4hPh2dTiFKuIOQCOwJ
	4djFAfDBuB1rMbjD3u5D0wiscNu/ACTFmIwg20YCsZKVlRnZJCmOdtsmRv8pdBsW7bFSgZ
	ElVF7gfrMcl3d+S61cKqC1AYIZmocKBQ8iw3DHsl8eunXfoQdQ6Y1CPyEgTceanMUJYcvL
	Q33kPgQLTgTDP6XbIxdX4b+Cq1mhN5ICozlogDEDU05rvrBFN0DjSn1xu4Sv4m7a8BMRje
	BkQHwZ6YP6iMg6V5++lL6Mqpfx/SVcKe4bQbuHMrHISVa3KA98iI0y7K91Dpkg==
Date: Tue, 10 Dec 2024 09:18:25 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Geis <pgwipeout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, Finley Xiao
 <finley.xiao@rock-chips.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Kevin Hilman <khilman@linaro.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/6] pmdomain: rockchip: fix rockchip_pd_power error
 handling
In-Reply-To: <20241210013010.81257-2-pgwipeout@gmail.com>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
 <20241210013010.81257-2-pgwipeout@gmail.com>
Message-ID: <1b323d6e9ef873bfc770e9d54b7a3a64@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_001829_438424_194096E4 
X-CRM114-Status: GOOD (  17.13  )
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

Hello Peter,

On 2024-12-10 02:30, Peter Geis wrote:
> The calls rockchip_pd_power makes to rockchip_pmu_set_idle_request lack
> any return error handling, causing device drivers to incorrectly 
> believe
> the hardware idle requests succeed when they may have failed. This 
> leads
> to software possibly accessing hardware that is powered off and the
> subsequent SError panic that follows.
> 
> Add error checking and return errors to the calling function to prevent
> such crashes.
> 
> gst-launch-1.0 videotestsrc num-buffers=2000 ! v4l2jpegenc ! fakesink
> Setting pipeline to PAUSED ...er-x64
> Pipeline is PREROLLING ...
> Redistribute latency...
> rockchip-pm-domain ff100000.syscon:power-controller: failed to get ack 
> on
> domain 'hevc', val=0x98260, idle = 0
> SError Interrupt on CPU2, code 0x00000000bf000002 -- SError
> CPU: 2 UID: 0 PID: 804 Comm: videotestsrc0:s Not tainted 6.12.0-rc5+ 
> #54
> Hardware name: Firefly roc-rk3328-cc (DT)
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : rockchip_vpu2_jpeg_enc_run+0x168/0xbc8
> lr : device_run+0xb0/0x128
> sp : ffff800082143a20
> x29: ffff800082143a20 x28: 0000000000000140 x27: 0000000000000000
> x26: ffff582c47a313e8 x25: ffff582c53e95000 x24: ffff582c53e92800
> x23: ffff582c5bbe0000 x22: 0000000000000000 x21: ffff582c47a31080
> x20: ffffa0d78cfa4168 x19: ffffa0d78cfa4168 x18: ffffb755b0519000
> x17: 000000040044ffff x16: 00500072b5503510 x15: a7a6a5a4a3a29a99
> x14: 989796959493928a x13: 0000000051eb851f x12: 00000000000000ff
> x11: ffffa0d78d812880 x10: ffffa0d78d7fbca0 x9 : 000000000000003f
> x8 : 0000000000000063 x7 : 000000000000003f x6 : 0000000000000040
> x5 : ffff80008010d000 x4 : ffffa0d78cfa4168 x3 : ffffa0d78cfbfdd8
> x2 : ffff80008010d0f4 x1 : 0000000000000020 x0 : 0000000000000140
> Kernel panic - not syncing: Asynchronous SError Interrupt
> CPU: 2 UID: 0 PID: 804 Comm: videotestsrc0:s Not tainted 6.12.0-rc5+ 
> #54
> Hardware name: Firefly roc-rk3328-cc (DT)
> Call trace:
> dump_backtrace+0xa0/0x128
> show_stack+0x20/0x38
> dump_stack_lvl+0xc8/0xf8
> dump_stack+0x18/0x28
> panic+0x3ec/0x428
> nmi_panic+0x48/0xa0
> arm64_serror_panic+0x6c/0x88
> do_serror+0x30/0x70
> el1h_64_error_handler+0x38/0x60
> el1h_64_error+0x7c/0x80
> rockchip_vpu2_jpeg_enc_run+0x168/0xbc8
> device_run+0xb0/0x128
> v4l2_m2m_try_run+0xac/0x230
> v4l2_m2m_ioctl_streamon+0x70/0x90
> v4l_streamon+0x2c/0x40
> __video_do_ioctl+0x194/0x400
> video_usercopy+0x10c/0x808
> video_ioctl2+0x20/0x80
> v4l2_ioctl+0x48/0x70
> __arm64_sys_ioctl+0xb0/0x100
> invoke_syscall+0x50/0x120
> el0_svc_common.constprop.0+0x48/0xf0
> do_el0_svc+0x24/0x38
> el0_svc+0x38/0x100
> el0t_64_sync_handler+0xc0/0xc8
> el0t_64_sync+0x1a8/0x1b0
> SMP: stopping secondary CPUs
> Kernel Offset: 0x20d70c000000 from 0xffff800080000000
> PHYS_OFFSET: 0xffffa7d3c0000000
> CPU features: 0x00,00000090,00200000,0200421b
> Memory Limit: none
> ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
> 
> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain 
> driver")
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>

This patch is obviously correct, because not checking what
rockchip_pmu_set_idle_request() returns was simply wrong.
Thanks for the patch!

Though, shouldn't we improve further the way proper error
handling is performed in rockchip_do_pmu_set_power_domain(),
by "rolling back" what rockchip_do_pmu_set_power_domain()
did after powering up fails?

> ---
> 
>  drivers/pmdomain/rockchip/pm-domains.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c
> b/drivers/pmdomain/rockchip/pm-domains.c
> index cb0f93800138..57e8fa25d2bd 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -590,14 +590,18 @@ static int rockchip_pd_power(struct
> rockchip_pm_domain *pd, bool power_on)
>  			rockchip_pmu_save_qos(pd);
> 
>  			/* if powering down, idle request to NIU first */
> -			rockchip_pmu_set_idle_request(pd, true);
> +			ret = rockchip_pmu_set_idle_request(pd, true);
> +			if (ret < 0)
> +				return ret;
>  		}
> 
>  		rockchip_do_pmu_set_power_domain(pd, power_on);
> 
>  		if (power_on) {
>  			/* if powering up, leave idle mode */
> -			rockchip_pmu_set_idle_request(pd, false);
> +			ret = rockchip_pmu_set_idle_request(pd, false);
> +			if (ret < 0)
> +				return ret;
> 
>  			rockchip_pmu_restore_qos(pd);
>  		}

