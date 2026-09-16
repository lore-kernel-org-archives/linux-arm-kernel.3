Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939F4C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKci5+csun7MDLLcGkBrE9e7KB8BbabndTKcg+DB8r8=; b=kaj5jBL1/YCTLSmbskJPmzUEwb
	D2fsPaTG5qahobWk5K0AIjlOaZb8zrmOdfAqE7sa9Wgvd/aYqAvwvNXASl7njXrVRic6skKPnuTWD
	o+WweW8wYmNGhIgnF7n7dldjFlS989MtplUj3Edfrr4JXADZaMGaPF1e4UpWDUeQxnis39OYw8Tnf
	8bBcJmowlfkXAYiIBo3yTWqo+331/gQ/TScUYTGh3wh1pAusR0bQ3z0dgBofs0aMu73cfRRFYK1h1
	3fbMsqv/fj0CdPoxa8BGaU1y8qFIO+2GSg7aVeVThGIS7u/V/QwHEH2rhmMQTKCHb4ixmBSGwBL9v
	o+S4DkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6n1N-00000008zLc-2wS6;
	Wed, 16 Sep 2026 10:37:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6n1K-00000008zL7-3NbY;
	Wed, 16 Sep 2026 10:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789555059;
	bh=D9FLIJZO8QSfHmJQ7HJ1vUHDWHscdlD8COtFiTPpb5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CKukPzsqZFLhoiLDPwPA9YYkGO1+KUamch3lJpo6XwsbdDjPNBdj5kzrkzxa4vlZa
	 JbySdpvggr3o1DJLKa5wAcBZnDXAbWLhPYiEk9EsLQoZvJaXF6rA18VpXWn8+xWTKf
	 s/dkw24GqK/8lTLscTVSVlvIuZMl0qzqBiiyWZKsAQ8FHuAYbF0VjATEJKkOO38WN2
	 ETRK5CP1WFZ2RuGHVv4tEsiqzP42n32iIXfYeMJL7p4SvRPIytUR0Iy5ICgXPH2wMP
	 YIuHjUuRSvJdqYWvx1y5REgIdDfb1eYFirByg67LR+mQZzwaNHCwQYPlmAHQjPaVeD
	 VoDLj5YPWp0UA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC3D317E0420;
	Wed, 16 Sep 2026 12:37:38 +0200 (CEST)
Message-ID: <e7d5b410-8a0c-4add-b4c5-9e9573fa9c68@collabora.com>
Date: Wed, 16 Sep 2026 12:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spmi: mtk-pmif: Add workaround for FSM lockup/error in
 read operation
To: sboyd@kernel.org
Cc: matthias.bgg@gmail.com, justin.yeh@mediatek.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20260701121908.19327-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701121908.19327-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_033742_997784_BB37F33E 
X-CRM114-Status: GOOD (  32.88  )
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

On 7/1/26 14:19, AngeloGioacchino Del Regno wrote:
> The SPMI PMIF in some SoCs like MT8196 is affected by a hardware
> issue that makes the first read operation on each SID to fail as
> the FSM locks up after sending the read command, and this happens
> at least in the following conditions:
>   - At boot, after bootloader handoff; and
>   - At every suspend->resume cycle.
> 
> This critical bug may produce unwanted issues in regulator drivers
> which may fail to set voltages, making the platform to end up in a
> undervoltage or, a bit more critically, an overvoltage condition,
> producing instability or ... worse.
> 
> In order to work around this issue, add a retry mechanism into the
> pmif_spmi_read_cmd() callback which will resend the read command
> up to 3 times in the following conditions:
>   - Software Interface returns an error; or
>   - Software Interface never gets in WFVLDCLR state.
> 
> As to avoid uselessly blocking for too much time, only during the
> read-retry loop, the maximum SWINF polling time for each trial is
> reduced to PMIF_TIMEOUT_US / 2: this was tested on multiple SoCs
> and seems to always be enough, as when any read succeeds it will
> always take less than 40ms.
> In any case, this is still allowing 1.5 times the previous maximum
> polling time, reaching a total maximum (for 3 retries) of 150ms.
> 
> Worst case testing that I performed saw a third retry only 3 times
> out of ~100 reboots.
> 
> Fixes: 1f5be2d7f743 ("spmi: mtk-pmif: Add support for MT8196 SPMI Controller")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This is a *fix*, and has been waiting for 2.5 months.

Can anyone please apply it?

Thanks,
Angelo

> ---
>   drivers/spmi/spmi-mtk-pmif.c | 38 +++++++++++++++++++++++++++---------
>   1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> index 1048420b5afb..61c916edaec4 100644
> --- a/drivers/spmi/spmi-mtk-pmif.c
> +++ b/drivers/spmi/spmi-mtk-pmif.c
> @@ -21,6 +21,7 @@
>   #define SWINF_WFVLDCLR	0x06
>   
>   #define GET_SWINF(x)	(((x) >> 1) & 0x7)
> +#define GET_SWINFERR(x) (((x) >> 18) & 0x1)
>   
>   #define PMIF_CMD_REG_0		0
>   #define PMIF_CMD_REG		1
> @@ -349,6 +350,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	struct pmif *arb = to_mtk_pmif(ctrl);
>   	struct ch_reg *inf_reg;
>   	int ret;
> +	u8 retry = 0;
>   	u32 data, cmd;
>   	unsigned long flags;
>   
> @@ -385,17 +387,35 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   		return ret;
>   	}
>   
> -	/* Send the command. */
>   	cmd = (opc << 30) | (sid << 24) | ((len - 1) << 16) | addr;
> -	pmif_writel(arb, pbus, cmd, inf_reg->ch_send);
> +	do {
> +		/* Send the command. */
> +		pmif_writel(arb, pbus, cmd, inf_reg->ch_send);
> +
> +		/*
> +		 * Wait for Software Interface FSM state to be WFVLDCLR or to
> +		 * return an error.
> +		 *
> +		 * If this is WFVLDCLR, read the data and clear the valid flag;
> +		 * If error or timeout, retry for a maximum of 3 times as a
> +		 * workaround for an hardware issue.
> +		 */
> +		ret = readl_poll_timeout_atomic(pbus->base + arb->data->regs[inf_reg->ch_sta],
> +						data,
> +						GET_SWINF(data) == SWINF_WFVLDCLR ||
> +						GET_SWINFERR(data),
> +						PMIF_DELAY_US, PMIF_TIMEOUT_US / 2);
> +		if (ret < 0)
> +			continue;
> +
> +		if (GET_SWINFERR(data)) {
> +			ret = -EIO;
> +			continue;
> +		}
> +
> +		break;
> +	} while (++retry < 3);
>   
> -	/*
> -	 * Wait for Software Interface FSM state to be WFVLDCLR,
> -	 * read the data and clear the valid flag.
> -	 */
> -	ret = readl_poll_timeout_atomic(pbus->base + arb->data->regs[inf_reg->ch_sta],
> -					data, GET_SWINF(data) == SWINF_WFVLDCLR,
> -					PMIF_DELAY_US, PMIF_TIMEOUT_US);
>   	if (ret < 0) {
>   		raw_spin_unlock_irqrestore(&pbus->lock, flags);
>   		dev_err(&ctrl->dev, "failed to wait for SWINF_WFVLDCLR\n");

