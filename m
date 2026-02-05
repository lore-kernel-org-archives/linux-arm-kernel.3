Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290CCEC1EA6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 11:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUNYtzLL0GMF68RWR6XVwRo9ouH4LPFhahq/dBMM37A=; b=eRZgoC5PdJ24EQs+TW6E6p8SED
	oWrvCy6cA7ocawcoBhiTObBgGnY13Nnk8Zry8Y6x6DGjjCerdp0WNm5QCT/XyBLhD0mdDcjRmKZQB
	92lARHW+En9RHYDA1LUkt07lNqUSDr4DqSSv7xIZ+TrQPNMwt279pNrTtXUpEUT0bQjgpmIzRHj0U
	fonGUouCsQrjSCVx/zlxC8KPav63UdLoS6lOmG4SyG8mqHVhMiCRwzEYkci5bxynscYdRJpt6PEkE
	8ThjU4R3hyxaPR7CtTw+yxtfYtdPYAHQxc6QAUvP7J9GcIdXZUFV8Gqg5GDr8Ck5x8fvKJeq+w0+d
	j3UW38+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxpk-00000009qVE-0NdP;
	Thu, 05 Feb 2026 11:47:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxph-00000009qUq-3VVu;
	Thu, 05 Feb 2026 11:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770292052;
	bh=Ws6OzDQVrOxdD0jUIjuPKZPO9P+V9t/Y8YCXpYTlx3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mql04GFJR869FmjE8II2bQN1vOz0TJZ3gFVy8SLkasH1216LF4hvRO/wokQ6kfT+y
	 tAMKmnMeP48ZNbfagP5T5B5FB8nBE16jaoyj/pxe9I0/+qvajfbmVy7FNZpdn1SsD/
	 Eklo8uEXsMxyBYhnCOUqKIoEMFNUHLd62PK/iMHqYPXAIkEqt9GfTELjssvZB19nsK
	 UOfEyjZzSn/IC6PSUAIswwAHGpFvfdOzCpmA47cm7UNx+H6ncth13hzZDNEkRtBKck
	 Iqq8RuW2Ao34OywVNZAIC1T+zUPGOjfqtewgxqoLpMTYSUqOh7dMMW/UCWOn2F9Nm1
	 ferjkv0gmPq3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5546217E06C3;
	Thu,  5 Feb 2026 12:47:32 +0100 (CET)
Message-ID: <33719d8d-af95-49ae-bc5e-247784529d12@collabora.com>
Date: Thu, 5 Feb 2026 12:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: mtk-sd: disable new_tx/rx and modify related
 settings for mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mengqi Zhang <Mengqi.Zhang@mediatek.com>,
 Wenbin Mei <Wenbin.Mei@mediatek.com>, Andy-ld Lu <Andy-ld.Lu@mediatek.com>,
 Yong Mao <yong.mao@mediatek.com>
References: <20260204020709.24604-1-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260204020709.24604-1-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_034738_055546_53DAD687 
X-CRM114-Status: GOOD (  13.29  )
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

Il 04/02/26 03:06, Cathy Xu ha scritto:
> Disable new_tx/rx and modify related settings helps avoid data
> transmission instability, and better compatibility for mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Needs a fixes tag. Please add the relevant one and resend.

Thanks,
Angelo

> ---
>   drivers/mmc/host/mtk-sd.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 302ac8529c4f..b2680cc054bd 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -682,15 +682,15 @@ static const struct mtk_mmc_compatible mt8189_compat = {
>   	.needs_top_base = true,
>   	.pad_tune_reg = MSDC_PAD_TUNE0,
>   	.async_fifo = true,
> -	.data_tune = true,
> +	.data_tune = false,
>   	.busy_check = true,
>   	.stop_clk_fix = true,
> -	.stop_dly_sel = 1,
> -	.pop_en_cnt = 2,
> +	.stop_dly_sel = 3,
> +	.pop_en_cnt = 8,
>   	.enhance_rx = true,
>   	.support_64g = true,
> -	.support_new_tx = true,
> -	.support_new_rx = true,
> +	.support_new_tx = false,
> +	.support_new_rx = false,
>   	.support_spm_res_release = true,
>   };
>   


