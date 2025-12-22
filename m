Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66626D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 05:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TguoDJvZuF+4QM7ziGMjx5oAowrPY+MIJ3NnqlsXYi8=; b=L6kvz6n8Agv5+0MeyCnshlMjkA
	ULmWd26Pc8mxPDt2rcI4DYtN609TCx+c6EN4d3bQhFSeZEnFeNLhKkHbhMdVMzXXyj4BpAH3ek4eX
	GE6AHPUjrfiQoF5Tm0jggi7/lb0dZjOT0Tn8BQPmYabTf1Y1BCTN0xd40Y7WHny8W6vP1dMWiBRxg
	g4d6D583iodcpy3mIHOlJzdWsFKy8QpOEiTeXersZJa1CmySN+udQDcaKeDmlDT46rDGRiKMJ/gLP
	OIWC9hEJ9ksLtCQLcK62vZ9UnkNvklbDnbIJp9xL2pFyWwo+efDFtLbaop7msOkgkkJdppnJg/q5c
	aMiMlx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXYgB-0000000D8X7-1Hik;
	Mon, 22 Dec 2025 05:41:59 +0000
Received: from mail.tkos.co.il ([84.110.109.230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXYg6-0000000D8UZ-3K4y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 05:41:57 +0000
Received: from localhost (unknown [10.0.8.3])
	by mail.tkos.co.il (Postfix) with ESMTP id 9A1BC44064C;
	Mon, 22 Dec 2025 07:39:12 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1766381952;
	bh=I2mkLsR9R8yTlZ2vB9UNyIEZQCNZVBLCZLhYW9lMQ5Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VD0kIW9bMDzR1OMZfs9Goe09MTNKkIU7dnzcp4vobqu8OiZNHQ/iMj+K3yxL+GMiu
	 Bpnx6BUduJxcLvZZSRNR9JNQgvENQNCY+WSdEaLPpkEUCbD9CDbKNcD+fd2pFdGFhG
	 6lmx7iUql3OOZaa07CD9E90yyq+4KIvgKdvbcvspf4ovshofwwmB0UL79YyuXZoSjv
	 bPmPMyOnq64bUao+pCUqw/r4LDmaHu/GbaW46PM04M8TssPQeCtpNzWDe0weAsHdoJ
	 KGIGk2aNpp43cOdnnMBDbeKp/eKKkuXXEO5JUc0J08HRzbm8NC8D+M7nYCwLPQAp1h
	 Q3EW7yhhTOYFg==
From: Baruch Siach <baruch@tkos.co.il>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Jiri Slaby
 <jirislaby@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-serial@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH] serial: digicolor: fix use-after-free on driver unbind
In-Reply-To: <SYBPR01MB7881327BF7F679E76A7315DEAFB4A@SYBPR01MB7881.ausprd01.prod.outlook.com>
	(Junrui Luo's message of "Mon, 22 Dec 2025 12:55:02 +0800")
References: <SYBPR01MB7881327BF7F679E76A7315DEAFB4A@SYBPR01MB7881.ausprd01.prod.outlook.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Mon, 22 Dec 2025 07:41:46 +0200
Message-ID: <871pkndqed.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_214156_109236_7B5811BE 
X-CRM114-Status: GOOD (  19.79  )
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

Hi Junrui,

On Mon, Dec 22 2025, Junrui Luo wrote:
> The digicolor_uart_console_write() function accesses the global
> digicolor_ports[] array to retrieve the uart port pointer, which
> can lead to a use-after-free if the console write occurs after
> the port has been removed via unbind.
>
> digicolor_uart_remove() leaves a dangling pointer in the array.
>
> Fix by clearing the array entry in digicolor_uart_remove() and
> adding a NULL check in digicolor_uart_console_write().

Thanks for the patch.

Is this .write/.remove callbacks race actually possible? Can you refer
me to similar fixes in other drivers?

> Reported-by: Yuhao Jiang <danisjiang@gmail.com>

Where can I find this report?

Thanks,
baruch

> Reported-by: Junrui Luo <moonafterrain@outlook.com>
> Fixes: 5930cb3511df ("serial: driver for Conexant Digicolor USART")
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
>  drivers/tty/serial/digicolor-usart.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/tty/serial/digicolor-usart.c b/drivers/tty/serial/digicolor-usart.c
> index d2482df5cb9b..5861be2072c4 100644
> --- a/drivers/tty/serial/digicolor-usart.c
> +++ b/drivers/tty/serial/digicolor-usart.c
> @@ -397,6 +397,9 @@ static void digicolor_uart_console_write(struct console *co, const char *c,
>  	unsigned long flags;
>  	int locked = 1;
>  
> +	if (!port)
> +		return;
> +
>  	if (oops_in_progress)
>  		locked = uart_port_trylock_irqsave(port, &flags);
>  	else
> @@ -508,6 +511,7 @@ static void digicolor_uart_remove(struct platform_device *pdev)
>  	struct uart_port *port = platform_get_drvdata(pdev);
>  
>  	uart_remove_one_port(&digicolor_uart, port);
> +	digicolor_ports[port->line] = NULL;
>  }
>  
>  static const struct of_device_id digicolor_uart_dt_ids[] = {
>
> ---
> base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
> change-id: 20251222-fixes-74e6b26513d1
>
> Best regards,

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

