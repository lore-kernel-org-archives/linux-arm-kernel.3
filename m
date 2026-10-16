Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B80ECC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 00:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ctt3HFSEzRTcfY1DycVxiEiuhDGVs7yfYDgMipksSOQ=; b=Y6pJjuxvFNAMl6J7WQpi2OsWRA
	izUvJC5vSpLqD0GTZEkZ+ZzcTUeMkv6A0otFpZv+Ybm88T6yiNpvO9u8p93K1/UXiySOSj10XuM09
	AAF7FNXcY2flcx/lvux6kJt0Q+4ryL6l9chu3A4Earvdobby6vbsyXpLBAhqZJ0AFX5bs9JZ1mlR+
	34+6aG/TSuCHn810yGfU4A5NlTF3gxRVraBco5T2LFxaXVrt0ugsHoOi8qYMhgSPuAYHwvBAU9k+R
	TD7avhEKnzU5/X8Di8CpNvSDoxstCV0saX8XpfguxTr/fY26WPZI//0U2A3wdk1q7ncc/mMl6wX0j
	z8d2Y4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVy7-00000001dBj-3dfj;
	Fri, 16 Oct 2026 00:38:43 +0000
Received: from mail-m127175.xmail.ntesmail.com ([115.236.127.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVy4-00000001dAQ-1cgG;
	Fri, 16 Oct 2026 00:38:42 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51398676d;
	Fri, 16 Oct 2026 08:33:33 +0800 (GMT+08:00)
Message-ID: <bfe8baa4-e740-4908-9d2a-4defc5240a82@rock-chips.com>
Date: Fri, 16 Oct 2026 08:33:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, "david.wu" <david.wu@rock-chips.com>
Subject: Re: [PATCH] i2c: rk3x: Disable the controller between transfers
To: Alexey Charkov <alchark@flipper.net>
References: <20261015-i2c-rk3x-disable-v1-1-81625845c175@flipper.net>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261015-i2c-rk3x-disable-v1-1-81625845c175@flipper.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa14220df3303a4kunm31bb4bf9443a31
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhlLVhhMHh4aHUgYS0NNTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=HCvp4J3BqeW8tRqo6dqlhjxVhHgXindjIk9oimTtEj3E5SxwUCPWKXY2qPa/QlX7fedQWmi+NehpzYlQhIjTeohfO7GNITLnqNzecvfolBOsHQ/R/qUndYVWSMaKtnkYXdsgf01DZyKSl80XMKqkbbyRCpamHG37O4QclElLkSM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Ctt3HFSEzRTcfY1DycVxiEiuhDGVs7yfYDgMipksSOQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_173840_634829_E0122915 
X-CRM114-Status: GOOD (  20.79  )
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

Cc: + David

在 2026/10/15 星期四 22:00, Alexey Charkov 写道:
> The driver leaves the controller enabled once a transfer completes, and
> an enabled controller keeps tracking the bus. If the lines collapse under
> it while idle, as happens when a target's supply is switched off while
> its bus pull-ups stay powered, its state machine wedges driving SDA low.
> Every later transfer then times out, since the timeout path only requests
> a STOP and never disables the controller, and the stuck state even
> survives a kexec.
> 
> Clear the enable bit once each transfer is done, successful or not, so
> that the controller does not watch an idle bus and starts every transfer
> from a clean state.
> 

I checked the vendor kernel tree and saw another case that you perhaps
need to fold something similar below into your patch, along with your
disabling controller?

     In some case，log like this:

     [   12.393926] rk3x-i2c ff150000.i2c: irq in STATE_IDLE, ipd = 0x51
     [   12.416592] rk3x-i2c ff150000.i2c: irq in STATE_IDLE, ipd = 0x51

     The i2c clock is disabled, so the pending irq clean is not
     worked. Disable the interrupt after the i2c jobs were done,
     the error log would not happen.


/* Disable i2c all irqs */
#define IEN_ALL_DISABLE   0

i2c_writel(i2c, IEN_ALL_DISABLE, REG_IEN);i2c_writel(i2c, 
IEN_ALL_DISABLE, REG_IEN);



> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>   drivers/i2c/busses/i2c-rk3x.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index fcede9f6ed54..dbf1ed30fda6 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1125,6 +1125,16 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
>   		}
>   	}
>   
> +	/*
> +	 * Do not leave the controller enabled between transfers. It keeps
> +	 * tracking the bus while enabled, and if the lines collapse under it,
> +	 * e.g. as an unpowered target clamps them, its state machine wedges
> +	 * driving SDA low until it is disabled. This also gets it out of
> +	 * whatever state it was stuck in when a transfer timed out.
> +	 */
> +	val = i2c_readl(i2c, REG_CON) & REG_CON_TUNING_MASK;
> +	i2c_writel(i2c, val, REG_CON);
> +
>   	clk_disable(i2c->pclk);
>   	clk_disable(i2c->clk);
>   
> 
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20261015-i2c-rk3x-disable-24672d4f38bb
> 
> Best regards,
> --
> Alexey Charkov <alchark@flipper.net>
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


