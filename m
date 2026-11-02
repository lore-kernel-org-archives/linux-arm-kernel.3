Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AB7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 06:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k39rO5I9;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=bC7DjVmf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PTkCharFQmf18BmR+HlsgqRfDjWer5Tuunqxyv1lgvw=; b=k39rO5I9diLO1h
	5X1V1XLYcI53jxnyacjR/d1i8mKrkowD/4whMXmE7AzgD3sr6kUUwPps+VudhT+TA7tixHSzyypfu
	9DdPgx/UoQ3agMK22ov7+EwhwK/vbq2iwexkiLmddrltdylFSG8RzQHrSJm4j7tOeTFrOoiWI4jyq
	xXAgJFiXjHzKhoWYJD19ouKL4Z3gTAn1DwK58fK4jIcU4pvxzUVV0/bRtCLca+vNOyViGhUvz98kx
	xkolFNryfBKN1el/6cMqx9YjoB4rAZcFWJVg++crx9n4VNAOK4AmIYU6bZDY2rV1qthAJCTJfaXlG
	jBA0fwdpwojfJqRyv8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNltp-0000000FhQZ-0Pe1;
	Mon, 02 Nov 2026 06:52:09 +0000
Received: from mail-m82205.xmail.ntesmail.com ([156.224.82.205])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNltl-0000000FhPX-2ElL;
	Mon, 02 Nov 2026 06:52:07 +0000
Received: from [172.16.12.11] (gyproxy-mailtls2-entmail-virt217.gy.ntes [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5325ade18;
	Mon, 2 Nov 2026 14:51:49 +0800 (GMT+08:00)
Message-ID: <b012a73f-1834-471f-982f-84244b863dce@rock-chips.com>
Date: Mon, 2 Nov 2026 14:51:49 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: rockchip: do not restore QoS that was never
 saved
To: Jiaxing Hu <gahing@gahingwoo.com>, ulfh@kernel.org, heiko@sntech.de
Cc: sebastian.reichel@collabora.com, shawn.lin@rock-chips.com,
 zhangqing@rock-chips.com, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261101055633.101309-1-gahing@gahingwoo.com>
From: Finley Xiao <finley.xiao@rock-chips.com>
In-Reply-To: <20261101055633.101309-1-gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19b074e4203a8kunm1cd43e6020218b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGU4fVkpOTxpJGEMeH0xLS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bC7DjVmfge6voq7J+27TJQ++JcPO8y+rqy/5dy/AkhYlmSBOLipVPasTo2cW/f5wkVlem1BYf3uSkAFJqo97BisVIUOmbU2hq7ArQLIR0neW+8FAUptzDiVC4yicE2S53tgbbYPuBUK169JCV9CLVu/+mXP+F183i3iknXpAbVU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PTkCharFQmf18BmR+HlsgqRfDjWer5Tuunqxyv1lgvw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_225206_152275_D47E6110 
X-CRM114-Status: GOOD (  21.47  )
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


在 2026/11/1 13:56, Jiaxing Hu 写道:
> rockchip_pmu_restore_qos() writes back what rockchip_pmu_save_qos() read
> on the last power-off. A domain that was off when it was registered has
> not been powered off by the driver yet, so on its first power-on the
> restore writes the zeroed save array over the QoS reset values.
>
> On RK3576 this is the GPU on every boot. Read back after the restore, its
> QoS is all zeros; with this patch it keeps the values it powers up with,
> priority 0x101, mode 3, bandwidth 0x80 and saturation 8.
>
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

The fix itself looks correct. One minor nit: the downstream Rockchip
kernel implements the same guard with a flag named `is_qos_saved`
(you already reference it in the commit log). Reusing that exact
name would make it easier to correlate with the vendor tree when
debugging or backporting QoS issues like the RK3576 GPU case.

Reviewed-by: Finley Xiao <finley.xiao@rock-chips.com>


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

-- 
Best regards,

底层平台中心 肖锋（Finley Xiao）
************************************************************************************
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.
福建省福州市铜盘路软件大道89号软件园A区21号楼 350003
No.21 Building, A District, Fuzhou Software Park, Fuzhou, Fujian 350003, P.R. China
Tel: 0591-83991906-8602 Mobile: 18506057603
************************************************************************************


