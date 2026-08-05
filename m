Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37609C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPhr6H8ZdU/MHCnKebIax2RGkJS686HYO8sySsT9xiQ=; b=dFzNJJgP7ZHHqpyrjfYENhdDTN
	elctJwBzisl6ZcVU0v9SOmzFakkFeOmxeyL6aDD80IJrS4r0rm6Lfb2YSWr2JPFImn+6NT6eOmPET
	fheM8UhO0zmVpjIz7ITFRDOjOGFqWsYrq3TSFzQBszUAwjR/XutCIBzesYDrElr2DpNKbZc5Axw2T
	EYAjGOG8YA744xFQvBi72T6lbe2nuHEL4WPRGDRLSYwu+f9yA699AXnIpgpa5Vg8P4Av4CNhZ2AjL
	yGzoHeO7xtBcIurYTujluJThT030CQGAXUQ4cA69n/n54cy72B7aWWXRe+VvVrC9ko+aDo0NZlOmY
	Ksw/D8WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraKz-00000003rP5-2CQN;
	Wed, 05 Aug 2026 12:03:09 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraKw-00000003rOi-2KGl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:03:07 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 98A637A0095;
	Wed,  5 Aug 2026 08:03:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 05 Aug 2026 08:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785931385; x=1786017785; bh=PPhr6H8ZdU
	/MHCnKebIax2RGkJS686HYO8sySsT9xiQ=; b=MqZrTq0scsFN8DnQLEpYRQG+6F
	YC0pszK0Gwm2qoGbQ8+NQ3kqvudznPePPtlKJm7JxqOwGq/76rMJ0yPW8XvdwE8p
	aoRuNA9z2HcKG0ceY2R8ysIg2RUZ2DaBWL84MjuZxIMe0ujfti3KOH52MJ+5JWAv
	KMuIaj3FWYBk9T/AtOmiZ6bDMPpRlVNlSKN4BV6JGvb2FayXW0B1h+dOj5LPw+aE
	4+vuIW1KP5bJj2Nrj8DbN0CTf9tKKErn/ZHOrg9AXjS03j/dicSSApFvZ7/6H9mT
	XZVnUbgSry8n00oY+iYqRARe9PYBfq6sdk0nDtO066I0famg1qmUe9DKhVqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785931385; x=1786017785; bh=PPhr6H8ZdU/MHCnKebIax2RGkJS686HYO8s
	ySsT9xiQ=; b=aZEVagpjVhc+tHNl1yfUZF6OuQD8iSgZl+7e7iipFLXf76Ycb4Q
	mIUyw9Lg8/G/JijUC7FGogHRiYTt0kWrrlMM1g+UarMHMVQrbOunvpR8nDJqU4eZ
	YfqZcPUK0+ZSxwltMtaz+O1jP55z5tGYsYJHbaSCYltkhFBIHk/R1saAzP1qURyK
	G/zDxe0IMLL6kXa7HKGG4vwnMmUJh5VxZJ/0cS9hk4GiBAgCiy+cu3GMg+7lcMI+
	oWZbpBWCjPIs0+sJNtCtADxoHbhjLUHkENBTQAcD+2036/CzVjWqcyYHSa05uJ/r
	Myh6abT0pQi3MJ4CaHVtcJTtWFymOKbNzow==
X-ME-Sender: <xms:eSZzam5lQZvSGt8SxXkTmdCN60uEv2I2IHKrE0iU8PGE6nVOp4ZnFA>
    <xme:eSZzamSCyxOIcLN1XyaaPwCnkQRcvSx5RuV0nzcqEBhTUYOtOu9YCLKWLEHBYYr95
    NBeGt9e0FCBPV7jDyWrzueCvP2WFkXJs9T7MKKOuONS47IHQAxxsdKo>
X-ME-Received: <xmr:eSZzaht-7K3TnGIOZOG1whN4GgsuzpsDfvj-OsTPwjAq36kJX5NDHY2kjIqgLE-zvQsDQTgu5yZo8e0Lty9wBdZx5RK7CijOJqE>
X-ME-Proxy-Cause: dmFkZTFzQAZjvT8uGrnf9aXjsofQwQIv8kp/LpTrCaaU0lhPsDKs8dpieNzT4ps0wh7nXM
    wocmT9MaEq6MexFe/RB/X13u6I4JVUkMIkyHr3csyFicrqXOpAAb+EGB3d/Qman5ZYDe/T
    HNld/CQdkSUD6deXbptt7PpVbLMMXJ9hGWM0dTBlZStJoRgNW7Umye10tBfQmCsuvjHVWB
    Vf9nkXksiGk/Xr58qPEvZrErei1Jr8DXYO9dHgt1MA0/p6vphv35DYiv0+bLjq8TwjiWbN
    gFBeJoVXf3NAHdWnNjnQu+hmcLCUi3YOJgy+AIwzWngLPT8c7BxQ3ZPNINF/H9fsbsouY7
    60xYdPQKytEVw5iu8HpVcIP7v3gGEeFyqk7dTGHkpo6Rd7uHyvUI33aYFvakVEqoyVXkkJ
    9ZUTBOmHMlS5rutovCtYzKf01n4suW+Gk8+eaIc5AwxGctkmK7J64lMP0U71nalePrhrvJ
    rW7/7NdsoH1wFD1Dvb0j6mxV4y93ezZpbjZuNJADev5MzzbkKzX1ApGLJV2qkyH1jw3hfm
    TRgu+/cmXvOlYurVY4L5921fdzt5tVZCfrLTT/87LMP8cLuT4Hq0ruxbMxFkXWiqGIalVg
    3xqqJ5m6R7Eip3+gpyxNw0JP8CyLArKknlbCwvKw6qFiUEo89e9nJhNXCAxg
X-ME-Proxy: <xmx:eSZzag-TT5dDi3lguvz4aVVayAQKnFCuVNVAkwsc_r00TJ-2MxCm1Q>
    <xmx:eSZzaiwivxdiKt2zmZl3LGeFmCIX6F-Ap41AtMJdNsosHA6q5og_9w>
    <xmx:eSZzaq9gT4s1M4VLtzs_yNF3CUTy2sFUKgA4LmotvvyS4W3gdl8sVQ>
    <xmx:eSZzaoNH6_6VQTvwo9qV37VbnbA9mEVu19yfluHAv48m0t1LrjxHxg>
    <xmx:eSZzare96bhtBVSer_3qQPMTyIpm0zOOJzRKgNT5AvGnpFf3v1rcyPAJ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 08:03:04 -0400 (EDT)
Date: Wed, 5 Aug 2026 14:03:02 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v4 2/6] spmi: apple: Validate FIFO state
Message-ID: <20260805120302.GB832571@robin.jannau.net>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-2-c15a12d9a7d1@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-t603x-spmi-v4-2-c15a12d9a7d1@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_050306_663248_6CA5D845 
X-CRM114-Status: GOOD (  18.08  )
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

On Wed, Aug 05, 2026 at 12:11:12PM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> Check for data before reading the body of a reply, and check for
> end of data afterwards.
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index 376cf682c43e..4d5356bf9bbf 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -21,7 +21,9 @@
>  #define SPMI_STATUS_REG 0
>  #define SPMI_CMD_REG 0x4
>  #define SPMI_RSP_REG 0x8
> +#define SPMI_ACT_REG 0xa4
>  
> +#define SPMI_ACT_FIFO_FLUSH BIT(0)
>  #define SPMI_RX_FIFO_EMPTY BIT(24)
>  
>  #define REG_POLL_INTERVAL_US 10000
> @@ -29,6 +31,7 @@
>  
>  struct apple_spmi {
>  	void __iomem *regs;
> +	bool prev_fail;
>  };
>  
>  #define poll_reg(spmi, reg, val, cond) \
> @@ -49,6 +52,7 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
>  
>  	ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
>  	if (ret) {
> +		spmi->prev_fail = true;
>  		dev_err(&ctrl->dev,
>  			"failed to wait for RX FIFO not empty\n");
>  		return ret;
> @@ -67,6 +71,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	u8 i;
>  	int ret;
>  
> +	if (spmi->prev_fail) {
> +		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);
> +		spmi->prev_fail = false;
> +	}
> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
>  
>  	ret = apple_spmi_wait_rx_not_empty(ctrl);
> @@ -78,6 +87,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  
>  	/* Read SPMI data reply */
>  	while (len_read < len) {
> +		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> +			dev_err_ratelimited(&ctrl->dev,
> +					    "FIFO lacks reply data, controller stuck?\n");
> +			return -EIO;
> +		}
>  		rsp = readl(spmi->regs + SPMI_RSP_REG);
>  		i = 0;
>  		while ((len_read < len) && (i < 4)) {
> @@ -86,6 +100,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  		}
>  	}
>  
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");
> +		spmi->prev_fail = true;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -97,6 +116,11 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	size_t i = 0, j;
>  	int ret;
>  
> +	if (spmi->prev_fail) {
> +		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);
> +		spmi->prev_fail = false;
> +	}
> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
>  
>  	while (i < len) {
> @@ -115,6 +139,11 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	/* Discard */
>  	readl(spmi->regs + SPMI_RSP_REG);
>  
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");
> +		spmi->prev_fail = true;
> +	}
> +
>  	return 0;
>  }

Reviewed-by: Janne Grunau <j@jannau.net>

Janne

