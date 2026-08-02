Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE06C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ko76THsfnXZ043OG9zh/F8AdTxAYTWWKZfq1z6rekAY=; b=blMoOIGtTHEyzJi9/c5hqVUZ6f
	ycHG7lqy/39ZkVQmmHYLc1PN9zMzTwD05X7f1eYvGBY0zwkZgU/oBKO3uQT13KgDtKyu1d3w7DWU4
	F9gQwPtIliOuk/ZEAgBfm1QlLeTX0fN73m/2UXEXh3Aix+iz4SSTzwiC6qohfzQBOG0ZhCMRED8Kd
	9RAvponEYcA0sdRIzCAZjMxDRHCE7LeB54IPVxnRHLwy1mP31LuahKBti0WASq1Vhy8nCgARqNPPW
	AP/E9fzELfR/RCn3QqQuQegWknqa1fOYrpsclxuteHySyHQLcA5nNiOaDajQW3hs67lfgAxhrHLin
	3NVHcmBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqSLe-0000000FVqj-3SJD;
	Sun, 02 Aug 2026 09:19:10 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqSLc-0000000FVqL-16Y4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 09:19:09 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6905B1400155;
	Sun,  2 Aug 2026 05:19:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 02 Aug 2026 05:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785662347; x=1785748747; bh=Ko76THsfnX
	Z043OG9zh/F8AdTxAYTWWKZfq1z6rekAY=; b=VvUxUaY724cssEc/xuev07u9L0
	Xs0MjyrQSrzaxdz2mhPLEe8doVKtUX8OKQ7IFYSRduiYBVyOhFcWoNYeiADM7099
	HdDKUpzZNWNzs3WghBPUl6EKSiRqU/Klv8QkNoWB6BpfQtTP/eNXfLv13bURM2e9
	y10Tclqb8YBJgSfDT3Q5s7eaZxS/jTAa6lic9upPFb3QYsKziDhriTiPYiFl8lfo
	EGoShX9KU+8LkH/E5Lan0/SbNFUPTxKaAclv/KwzgX4tyMSkWcdYDhJ5o7sCnlRj
	pWVjEPuToGj53BjYo0jBeqIevVikGYTiJodtrSfHRVWki/w1GM6Kj17ZYnbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785662347; x=1785748747; bh=Ko76THsfnXZ043OG9zh/F8AdTxAYTWWKZfq
	1z6rekAY=; b=ALErArKORJUpxgnYIQpxQJwFuHBp8WBubOJYhvwxJcivE096fIV
	2VneqUvYjJTao6gy8TBOJ45TW5sE4Clq/CLrzjCEsktDQDR/O7i2MYFDARqQ7/Mo
	VIG5pzqsUN86hMBACfRg+QyQ1EQ8ZymZgJPlfApblTlIR8G2aGEsdo5NsStn0oT1
	IePvjUFmgxYrpNPMgliYrsZqV5HqTx4CyyNYjcFQ7i5YWRtJqusxvCUFCm6I96UK
	oYs3qwK4Ha6XJuVwss7D1Zx7oo3+SqQGUCaLua1+KxDUT8L7fszgCo98ZEqb0Azn
	pF8ObsNHMPSIJer9ydeaaJYEafrNtaWMipQ==
X-ME-Sender: <xms:igtvak5biAlTSpUvtzLPZU0O1OJpucMbiCw3DfRB0Jy68g5woSZlhA>
    <xme:igtvasRyabOKD86Mz-1Vtm3BnLy2DvRPe9FvOUGNx2UkU7QSexKRpJZM8MB6TgUlb
    5jSJOXCs8QoWEWR0x2sgtPvW-tWTNEAw5UK8SC7A6bhFg3kJnHQNn4>
X-ME-Received: <xmr:igtvavsWomI7M2dJruCkBlYusOOlwrH8GYl9CB8plyMlHe-lkZX56-YwV_p5SLfq0ychjlre2sXaE70fQZedLgHkrHEETA-eM-Q>
X-ME-Proxy-Cause: dmFkZTEr8HrNx3Cr5ni6UAa7SmNpYhsyawGdrEF8NEKNgj/AOO9YDh3BTzAEdJ7Jch1tnW
    Qp4K4U3EN0sA/l40npR75Xu2RxqowGvJy08sH0BiJy1S3MBM8gsm/pJmrPtuyrFxSSEvtD
    wwashyBPQ/kP8+Z5TrmoQqsMLmFT2oOI1AYZ59KOxQv432TtjAh7QhK0BoKrNhUM/jyWOu
    TsyOfXGKPXaC9gfJLyauN0sR+3prLnDoPVx/rXeJ1Mq43MR7E4Grdzr6No7SuXb+jkwRAz
    JIxQJvVh+MRaUGm/ZLJpF8or/p/OxLYBDOAGd6YPag0MN+ZHTmP3vnXOSUAjzeg0sjqjon
    BDLeCF6JN0Jtd4GmdBS0kmeWNFqPzclsQaNVmLr4GU3lxD3+N+0+xtjiXmTUg6ErQ/cg4g
    ARAXdztQUihmTfGQ0pi0VqQSioFSEbDlixQNkpZ8O82p9+qpqy3wmAqo87vvr0c1Pwvu44
    fD+YsDxGrWjFgbBPXmJT1cBatyhbAt3OoIjjuyuuuxTl9UWDA3CSdiAdnIiMK5/MPyRSJT
    NTe6hDVvHXOfwqgMRy7+zMj6myo03mejOzAu0hBH+7XbRwmyVdAwGDKjWBU1y1ZrALoQNt
    xoRlD3nbkbRQJz8G8fDdjq0tOxH7HPBPKE0S5PH3lOk3REBR6RDH+kOMxpLA
X-ME-Proxy: <xmx:igtvam_qet7EeQoQzhjG3hM11t7o5lqh9nN8fNfD5-mGunsqkbtxpg>
    <xmx:igtvagyWMyJ7sDkP16FnbUMknMvS7yVcz747MrwIaNGVnBNdvsx5pg>
    <xmx:igtvag_3f7FWSpJuimNZvvvF96eDWBkXtFws8G874znD01R680ovdg>
    <xmx:igtvamOONclzGS6P_V-7opz2Fig2FK6Hbt4EXiP2LgNlplXy5E0pXg>
    <xmx:iwtvapdikZr1oYW0x6nULWS0Q77Y9-tBuuxXsQY7exJtL2eRLmAbEe-b>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 05:19:06 -0400 (EDT)
Date: Sun, 2 Aug 2026 11:19:05 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v2 2/7] spmi: apple: Validate FIFO state
Message-ID: <20260802091905.GD806854@robin.jannau.net>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-2-f43e5f10e583@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-t603x-spmi-v2-2-f43e5f10e583@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_021908_389713_1DA8C441 
X-CRM114-Status: GOOD (  17.19  )
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

On Tue, Jul 28, 2026 at 11:28:08AM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> Check for data before reading the body of a reply, and check for
> end of data afterwards.
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index 376cf682c43e..b4f442d0b4ad 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -78,6 +78,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  
>  	/* Read SPMI data reply */
>  	while (len_read < len) {
> +		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> +			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");

this looks like it maybe should use dev_err_ratelimited()

> +			return -EIO;
> +		}
>  		rsp = readl(spmi->regs + SPMI_RSP_REG);
>  		i = 0;
>  		while ((len_read < len) && (i < 4)) {
> @@ -86,6 +90,9 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  		}
>  	}
>  
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");

would it make sense to flush the fifo here to avoid issues on the next
command? I would assume if we don't flush this condition will trigger
for every following command.

> +
>  	return 0;
>  }
>  
> @@ -115,6 +122,9 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	/* Discard */
>  	readl(spmi->regs + SPMI_RSP_REG);
>  
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");

same here

> +
>  	return 0;
>  }

Janne

