Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25622D609B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWhAy9+9PNeOPwF/R4/xqInvj31Q4dE74xVNHSXPp8A=; b=ylWTbM51eCWOODno6sZerJyQTB
	fD4RJ5qaCwzW4wRijjr6elcHzlPiReMBcU2gji2QZwMUl2WnqZw8q2BwqRUH4Kq+7wQiA16jWQ7nE
	R1soaEZCua8I8+93PKSS0xmmeYZM6H7CVCea262LhVfXLeBPviYZ2OMZuUq4XBBaKOl6qKfyVBUfc
	Jr+0Jl5s6CXz+Uh10jgpBnLxwKuWpibvbOH7AvZ0Co5umw4X37fWyDNCemaJgfOFALAVerqlhoCGu
	HxyZHoplPg0EJ+mMaRYaFH02vmu610+8VbH30jiOF+Vc4pkBSqbsEcdB36XIP+n7MrPCA20mWwbaE
	gzxvL1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXEI-00000005TK1-0Ws4;
	Tue, 16 Dec 2025 15:44:50 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXEE-00000005TJI-1pkp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:44:49 +0000
Message-ID: <7f42e053-b7d6-4216-9ed1-c496db3a54d0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765899882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWhAy9+9PNeOPwF/R4/xqInvj31Q4dE74xVNHSXPp8A=;
	b=A06oI68CcEav+v+vYa/lHCpPzjs52pwkzI5ahVnbFirnpvlIYTrsAMRD2nenKuaVv3BWgT
	UhwzqRJ9tPqUGFMdfK6T8QlTOGgzIcMQEzce2TFTeEQhYNl6a5a1qtg27Rt/foouw5b9RW
	Lu4l2a79fIqlZJddYQPMEozwDcYqL+k=
Date: Tue, 16 Dec 2025 10:44:34 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] serial: xilinx_uartps: fix rs485 initialization at boot
To: "j.turek" <jakub.turek@elsta.tech>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org
Cc: michal.simek@amd.com, namcao@linutronix.de, tglx@linutronix.de,
 zack.rusin@broadcom.com, hshah@axiado.com, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251216152641.196221-1-jakub.turek@elsta.tech>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20251216152641.196221-1-jakub.turek@elsta.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_074447_185032_F73C23F6 
X-CRM114-Status: GOOD (  19.65  )
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

On 12/16/25 10:26, j.turek wrote:
> When 'linux,rs485-enabled-at-boot-time;' property is enabled in device-tree
> and there is no rts-gpio defined there is NULL pointer dereference in
> function 'cdns_rts_gpio_enable' because 'cdns_uart->port->membase' pointer
> is not set at this point
> 
> Signed-off-by: Jakub Turek <jakub.turek@elsta.tech>
> 
> Fixes: fccc9d9233f9 ("tty: serial: uartps: Add rs485 support to uartps driver")
> ---
>  drivers/tty/serial/xilinx_uartps.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
> index c793fc74c26b..1e4d54fd5762 100644
> --- a/drivers/tty/serial/xilinx_uartps.c
> +++ b/drivers/tty/serial/xilinx_uartps.c
> @@ -1816,8 +1816,6 @@ static int cdns_uart_probe(struct platform_device *pdev)
>  		console_port = port;
>  	}
>  #endif
> -	if (cdns_uart_data->port->rs485.flags & SER_RS485_ENABLED)
> -		cdns_rs485_rx_setup(cdns_uart_data);
>  
>  	rc = uart_add_one_port(&cdns_uart_uart_driver, port);
>  	if (rc) {
> @@ -1826,6 +1824,9 @@ static int cdns_uart_probe(struct platform_device *pdev)
>  		goto err_out_pm_disable;
>  	}
>  
> +	if (cdns_uart_data->port->rs485.flags & SER_RS485_ENABLED)
> +		cdns_rs485_rx_setup(cdns_uart_data);
> +
>  #ifdef CONFIG_SERIAL_XILINX_PS_UART_CONSOLE
>  	/* This is not port which is used for console that's why clean it up */
>  	if (console_port == port &&

Is probe the right place to do this configuration? Maybe
cdns_rs485_rx_setup should get moved to cdns_rs485_config.

--Sean

