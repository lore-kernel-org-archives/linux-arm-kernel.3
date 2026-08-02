Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C69C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYjFgrqQtDyTaV/XiPsfNDKjVnYviPk0fwgxGzdp6UY=; b=egxhnTVu1R7E1E7pJTwjWp3khF
	yOrFUUTVAqNPb1W4NQ1dSnThJ9zgwD2jctrBiqEgfLMvYV+i1xtfikT54814GKaL0PNXJNi0xa4uJ
	/lmlNhk8MJoa7I1HDJ3Po+OrTcVP3OH8K/M7QhDfNjRU8E5mEddrVDd3KlbHLISB0iGRSSMXHf4jT
	y9V6Y/BTK2Diib/vXUAhC4XD3veMvAoTtYezjz/VKzJBVtrRfCfMvrVJgycLI+NmgIGurs3PlMebC
	id0YEYkGkfSc1lSuZCMZCmFogp7d497FkWHYwkum2JmcPT31/dKMtjp/M38qki96+F+k2w23WZzQw
	b8gkymvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqTHX-0000000FXiw-03lm;
	Sun, 02 Aug 2026 10:18:59 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqTHT-0000000FXiI-3hD7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 10:18:57 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6E00B140014E;
	Sun,  2 Aug 2026 06:18:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 02 Aug 2026 06:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785665934; x=1785752334; bh=sYjFgrqQtD
	yTaV/XiPsfNDKjVnYviPk0fwgxGzdp6UY=; b=Bmy2tmd4pr5/+lwTCZdk2URI4L
	cPlEjDHLOmuzfqmT7CG8+Sp0c6eKRwEQdFuA8FJADnfyS9DQLm3LmFSHFi/TaNxN
	yPJPQSzsQGB2NjCPchzmKW8qqsn7CwWIT/EI2XghzohRAATSoIMUwcb/2/W0Yvj2
	U5TrUXRWrjIRDfdkOjbLNeVMN9xWyPr77akmbYLcMGsNwF0JjplFaQwBdpHlwbnW
	OkD/G5IzszSjQCb91V2SKinVN+/+z4UYdURZYHFaoKva8iElb9vAWiSbMvorj9XA
	YZxmsj7SgaBCB2yVvHXSLVQog9dXhgsn16xUsb8a83XjV1AEcAAg+Y+cKqfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785665934; x=1785752334; bh=sYjFgrqQtDyTaV/XiPsfNDKjVnYviPk0fwg
	xGzdp6UY=; b=AlXsz0OYf3EhPWW6UNuWHm2Bo0oUarsaRkEQmsJ3brW8Blvv8HX
	kAgxcstDvFp98hmi6HZ5UoHUyF6WsoiVNUUdgiS7n+8mTtUt5pSsrreTbtGxn0PQ
	0P6B2pBZwEvQWBQBd5KT6SZnSJfv9bQ2NFxrzy1XZtKc5Xi/9kvK406rWE+0Wim8
	lpvAoQQ1rKedEOgoI/yOGnLS0pNXDJbh0PoRAtwJsez8JtA78TMp86jVZt/YXv7H
	3ivEYRbIO+nLmvUNKLjSnclId+HF0+PG719QJfAY+iNjOJrUQhEwoFuAwDsRRu7+
	3uTft+CTImnd0V+I9swuAB/T7a4smtzSNZw==
X-ME-Sender: <xms:jRlvavINX3-T1DGV9piYOLRPnGwC4ayV87hu8V4Ej0F89UcxwwgcwA>
    <xme:jRlvapjagqs5PeSH5SknUTMyV9LkkmNx98J1bVK1ardWtVeXt51SIJdvT63iZwUZ8
    nsZMx2Ldmxrsgap-5NarcpAD8A-jCBNyE2dxQKwIb_yGWxzEElEcA>
X-ME-Received: <xmr:jRlvaj_EK2j2Y9rC6WKn8gwtYclaXklfLBY9uYgzwRD_AdJ8zUaL80_BrViH1CsRiGXKne2mdfaRcG5wf_cxrScZpVpHymElPVg>
X-ME-Proxy-Cause: dmFkZTFjHCw4CSqjnCBFOt9sM9Qq66+yAIV8Fxa6AOKC9eLT2RSFltDg+ZhMdJVRhD2hls
    RjhJpTxja3NpZ1aqkeKV78I159Ambir1/X/Pg8gYP+sSkXkzQBMybxhmpk50Xae6+SgTh3
    ALPLMSCzkrpXKsKgqrhODaTV2v27PZJ0f1CR7dzQjfR7kh2UrIlhQaNaaCqLNihNJ/cEdK
    8mBanYcKSMOONdPC8gykSX3Upuw6SsSXr0LASWWSZOXOldvtz3Joi0pEqtJO/T8uJ2gD/A
    eCZlpbABkY50ANWv/uOEykOrEdgRmyfipJL5Rd/53rJtcRvxfVlxuGV1At9mgwvhLkG3Cj
    K0BVXsZsdYcxmPp79bEpmVX7wGqwAP2uZPNIqB1GbD3b84hBWY49MG/O7H5qQCPRPEqthT
    fD7nHEGSgmHFVECwdfgx6mK8cpmddvP/TDK8gksDcF7k00nH2UKpJ8XcAGQQAuErmZE4UO
    AUUgGKoezkwxr1y8pqeipR5TfN67DiViLEgfO0yA97CUlqqqOldGQw4DTF9SuNCKslIPRn
    +RmfwX2mdLq1w/mSp6yM/j63g2pRYJoTAPVh0Nlvvz5zg3e1JQfTanSkoeAHAy+UtVJJla
    jcgWSmU7jXQAI4f68XMgqLOUIrZdknZUT7a7B/DWUmWShKZuf6bgi/GASkVA
X-ME-Proxy: <xmx:jRlvamPIdJ7fHBBQico0IgKsIT5F0SekmcCKz2oFr2QNMBKnT8DygA>
    <xmx:jRlvavBO8JHi8F1nNJ5XACrh77m2NugxTG_lvp8MfbWgqnEeNyaCTg>
    <xmx:jRlvaiOIJ_0RfmyVf34giDkfWOLclCTnNdOKOlur5KFL6UfqfPEYOw>
    <xmx:jRlvaudLVqI8UBi0DKoTc_3KFF2xUZNSe482GbuOW4S6yG1iGUGelg>
    <xmx:jhlvaluKpUMu4grviNO9zDAC8QyuIw5JZbeMsMo35n_gPi7b4ShIy_Z6>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 06:18:53 -0400 (EDT)
Date: Sun, 2 Aug 2026 12:18:52 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v2 3/7] spmi: apple: check transaction status
Message-ID: <20260802101852.GE806854@robin.jannau.net>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-3-f43e5f10e583@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-t603x-spmi-v2-3-f43e5f10e583@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_031856_303071_0CB82337 
X-CRM114-Status: GOOD (  17.88  )
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

On Tue, Jul 28, 2026 at 11:28:09AM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> Check for parity errors and missing command ACKs
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index b4f442d0b4ad..4678a9e5270a 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -22,6 +22,12 @@
>  #define SPMI_CMD_REG 0x4
>  #define SPMI_RSP_REG 0x8
>  
> +/* SPMI_RSP_REG reply word */
> +#define SPMI_REPLY_FRAME_PARITY_OFFSET 16

SPMI_REPLY_FRAME_PARITY_STATUS GENMASK(31, 16)

> +#define SPMI_REPLY_ACK BIT(15)
> +#define SPMI_REPLY_SLAVE_ID GENMASK(14, 8)
> +#define SPMI_REPLY_CMD GENMASK(7, 0)
> +
>  #define SPMI_RX_FIFO_EMPTY BIT(24)
>  
>  #define REG_POLL_INTERVAL_US 10000
> @@ -62,7 +68,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
> -	u32 rsp;
> +	u32 reply, rsp;
>  	size_t len_read = 0;
>  	u8 i;
>  	int ret;
> @@ -73,8 +79,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	if (ret)
>  		return ret;
>  
> -	/* Discard SPMI reply status */
> -	readl(spmi->regs + SPMI_RSP_REG);
> +	reply = readl(spmi->regs + SPMI_RSP_REG);
>  
>  	/* Read SPMI data reply */
>  	while (len_read < len) {
> @@ -93,6 +98,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
>  		dev_warn(&ctrl->dev, "FIFO has extra data\n");
>  
> +	if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << len) - 1)) {

if (~GET_FIELD(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len) - 1)) {

not sure this is clear improvement

> +		dev_err(&ctrl->dev, "some frames failed parity check\n");
> +		return -EIO;
> +	}
>  	return 0;
>  }
>  
> @@ -101,6 +110,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
> +	u32 reply;
>  	size_t i = 0, j;
>  	int ret;
>  
> @@ -119,12 +129,15 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	if (ret)
>  		return ret;
>  
> -	/* Discard */
> -	readl(spmi->regs + SPMI_RSP_REG);
> +	reply = readl(spmi->regs + SPMI_RSP_REG);
>  
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
>  		dev_warn(&ctrl->dev, "FIFO has extra data\n");
>  
> +	if (!(reply & SPMI_REPLY_ACK)) {

if (!GET_FIELD(SPMI_REPLY_ACK, reply)) {

> +		dev_err(&ctrl->dev, "command not acknowledged\n");
> +		return -EIO;
> +	}
>  	return 0;
>  }

Janne

