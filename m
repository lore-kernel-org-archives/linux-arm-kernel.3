Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91872606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1GffJJiY;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Y34JQihT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o4gG/i3absZUKyk5WqO7dZSC3KzKqyXdlnRQkR3arf0=; b=1GffJJiYpVsxrA
	IhLsBqhOh4lL+SmlcPWv9YJhPjBhDw6qYYcOESZdrp5rqhwipHpe3BakNknrRAVnPGTwp0TLx7lNE
	8c7UAXtgHKrfKpzQ1XM8RW7oUFFOaPme0JP330RtwvKP82hJ7n+yI18FcJQHh/N23svVlYeFNO1bl
	a3++ndcTMv37rtO+iWOprovgOJA+RTFrh2bZKQX9/a5At9wvO033oSP3ZbM3dhNiypCalugW49xtp
	aVk+Tqik5oIyLcDS65VIr22sqELZL6E8WQ7a96d/hREQfO1HhgEr60b5HRlesIvgQAx+v8wEBZ+dK
	jUoT+471T9B2135jzekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTS3-0000000E82g-40uD;
	Sun, 01 Nov 2026 11:10:15 +0000
Received: from mail-m12858.netease.com ([103.209.128.58])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTRz-0000000E81x-21cq;
	Sun, 01 Nov 2026 11:10:14 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5310d4819;
	Sun, 1 Nov 2026 19:09:59 +0800 (GMT+08:00)
Message-ID: <d419faee-354a-4712-b047-d88fa4cab37d@rock-chips.com>
Date: Sun, 1 Nov 2026 19:09:57 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, sebastian.reichel@collabora.com,
 finley.xiao@rock-chips.com, zhangqing@rock-chips.com,
 linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: rockchip: do not restore QoS that was never
 saved
To: Jiaxing Hu <gahing@gahingwoo.com>, ulfh@kernel.org, heiko@sntech.de
References: <20261101055633.101309-1-gahing@gahingwoo.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261101055633.101309-1-gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa196cd4d2e03a4kunm5d7bf15e34a8a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGB1OVkNIShpMTEtOHh0eTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Y34JQihTJ4/ryrn8Fe/mVgqrbxNaBqNU/IPUejG0cY4zW/MkLr6rkK5xwbtsL1z7KLzuFS/S1szB5Dx0HhjbJlQdBh2Th8g0WgJdAGk0fjHumW/0U6M1WWzIq8+6J/ZSWvPo0/9+m0Vsf0jT8a+yVG1G4nmhLIUZvhQiIoUjX6c=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=o4gG/i3absZUKyk5WqO7dZSC3KzKqyXdlnRQkR3arf0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_031012_063558_E60A71AD 
X-CRM114-Status: GOOD (  21.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 2026/11/01 星期日 13:56, Jiaxing Hu 写道:
> rockchip_pmu_restore_qos() writes back what rockchip_pmu_save_qos() read
> on the last power-off. A domain that was off when it was registered has
> not been powered off by the driver yet, so on its first power-on the
> restore writes the zeroed save array over the QoS reset values.
> 
> On RK3576 this is the GPU on every boot. Read back after the restore, its
> QoS is all zeros; with this patch it keeps the values it powers up with,
> priority 0x101, mode 3, bandwidth 0x80 and saturation 8.
> 

Thanks for the patch. LGTM,

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Only restore after a save. Rockchip's own driver does the same with an
> is_qos_saved flag.
> 
> Fixes: 074c6a422d86 ("soc: rockchip: power-domain: support qos save and restore")
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>   drivers/pmdomain/rockchip/pm-domains.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> index db3879846db6..d1c025bdaa08 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -97,6 +97,7 @@ struct rockchip_pm_domain {
>   	int num_qos;
>   	struct regmap **qos_regmap;
>   	u32 *qos_save_regs[MAX_QOS_REGS_NUM];
> +	bool qos_saved;
>   	int num_clks;
>   	struct clk_bulk_data *clks;
>   	struct device_node *node;
> @@ -474,6 +475,7 @@ static int rockchip_pmu_save_qos(struct rockchip_pm_domain *pd)
>   			    QOS_EXTCONTROL,
>   			    &pd->qos_save_regs[4][i]);
>   	}
> +	pd->qos_saved = true;
>   	return 0;
>   }
>   
> @@ -481,6 +483,14 @@ static int rockchip_pmu_restore_qos(struct rockchip_pm_domain *pd)
>   {
>   	int i;
>   
> +	/*
> +	 * A domain that was off when it was registered has nothing saved yet,
> +	 * and writing the zeroed array would replace the reset values the QoS
> +	 * registers came up with.
> +	 */
> +	if (!pd->qos_saved)
> +		return 0;
> +
>   	for (i = 0; i < pd->num_qos; i++) {
>   		regmap_write(pd->qos_regmap[i],
>   			     QOS_PRIORITY,
> 
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c


