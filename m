Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7A4D29C33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSmKic32n6ti5xOcPpQbUlIndt/JhQ9yoiHmChcJtRE=; b=SKXvCkzjs+Z7XqVDPaqDd9TAhz
	e0zj95KXtGZtfOhLMAGFZvgmZqBuUvA1zcO+78aTvWnIXBVwUG02aVsTXL4ZsdGgId6+M8hKqc0CL
	3GSXloNNAzrUNg290mkiOFyTtFnVmttzAZVBQpORl33PPREa925WgdxyfzHivKo//17Lg2duhNVfJ
	g4z3Li+rlJFcMjxgsQg8Q/O25BYTuMAlwEUnsH9u/dKutm+3/QoGfwIHa/FdyP828WlpnAg33TGPp
	+4SMF+v9sGMS/rnljbRl5CiN5WJmNoiOyWax9HJ1wlDbHKEReh3n+D9jQlCQdAf6lyYmm7+2rfB6l
	dFMcjkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqnl-00000002JLv-0yyQ;
	Mon, 19 Jan 2026 15:04:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqnZ-00000002JIr-3Bi6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:04:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CB3571A285D;
	Mon, 19 Jan 2026 15:04:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9205360731;
	Mon, 19 Jan 2026 15:04:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F62010B6B0FF;
	Mon, 19 Jan 2026 16:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768835045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cSmKic32n6ti5xOcPpQbUlIndt/JhQ9yoiHmChcJtRE=;
	b=hEzL6BaFT066Dkq6fkn2iM8Cz98b9mOWoul5nqw+sxKA/HI+bwQEt+qHbTNi6G6Ej27iPg
	RFubusD5i4DA6w0h3GAF8jpMFiAAAf/uGdfucxGXWfSKQHuHYPKvSkMoCFYJd6GXDJWYMS
	lpnmGML26CfYqmYQEWDSZmuJM/iht/h3uxWbSpJh4CpQrQqKyEFu2F+eXXjAXH7MsSMpKM
	J58IWOFFRwFzQMJ7QjMiUpJxZHM/8flWTmoq6N2Y95gngvgSooRxl1CnZZohnW96H3z9FX
	jQsooIGcyvRKE3u+Yg8J6czEHiItf9ezstKd5s1PDkmwgKFyexWaZXUZBrtvbQ==
Message-ID: <33b06fd6-3eb3-4eb7-8091-7ebe8a8373ba@bootlin.com>
Date: Mon, 19 Jan 2026 16:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: stmmac: enable RPS and RBU interrupts
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_070415_811366_2E635D02 
X-CRM114-Status: GOOD (  14.14  )
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

Hi Russell,

On 17/01/2026 00:25, Russell King (Oracle) wrote:
> Enable receive process stopped and receive buffer unavailable
> interrupts, so that the statistic counters can be updated.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> 
> Maxime,
> 
> You may find this patch useful, as it makes the "rx_buf_unav_irq"
> and "rx_process_stopped_irq" ethtool statistic counters functional.
> This means that the lack of receive descriptors can still be detected
> even if the receive side doesn't actually stall.
> 
> I'm not sure why we publish these statistic counters if we don't
> enable the interrupts to allow them to ever be non-zero.

It works, I can indeed see the stats get properly updated on imx8mp :)

There's one downside to it though, which is that as soon as we hit a situation
where we don't have RX bufs available, this patchs has a tendancy to make things
worse as we'll trigger interrupts for each packet we receive and that we can't
process, making it even longer for queues to be refilled.

It shows on iperf3 with small packets :

---- Before patch, 17% packet loss on UDP 56 bytes packets -----------------

# iperf3 -u -b 0 -l 56 -c 192.168.2.1 -R
Connecting to host 192.168.2.1, port 5201
Reverse mode, remote host 192.168.2.1 is sending
[  5] local 192.168.2.18 port 47851 connected to 192.168.2.1 port 5201
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-1.00   sec  10.7 MBytes  90.0 Mbits/sec  0.003 ms  48550/249650 (19%)  
[  5]   1.00-2.00   sec  11.3 MBytes  95.0 Mbits/sec  0.003 ms  41881/253832 (16%)  
[  5]   2.00-3.00   sec  11.3 MBytes  94.9 Mbits/sec  0.002 ms  42060/253913 (17%)  
[  5]   3.00-4.00   sec  11.3 MBytes  95.1 Mbits/sec  0.003 ms  41499/253785 (16%)  
[  5]   4.00-5.00   sec  11.3 MBytes  94.6 Mbits/sec  0.003 ms  42663/253787 (17%)  
[  5]   5.00-6.00   sec  11.3 MBytes  94.9 Mbits/sec  0.006 ms  41976/253719 (17%)  
[  5]   6.00-7.00   sec  11.3 MBytes  94.5 Mbits/sec  0.003 ms  43133/253999 (17%)  
[  5]   7.00-8.00   sec  11.3 MBytes  95.0 Mbits/sec  0.004 ms  41442/253579 (16%)  
[  5]   8.00-9.00   sec  11.4 MBytes  95.2 Mbits/sec  0.004 ms  41518/254131 (16%)  
[  5]   9.00-10.00  sec  11.2 MBytes  94.3 Mbits/sec  0.006 ms  43580/254143 (17%)  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-10.00  sec   135 MBytes   114 Mbits/sec  0.000 ms  0/0 (0%)  sender
[  5]   0.00-10.00  sec   112 MBytes  94.3 Mbits/sec  0.006 ms  428302/2534538 (17%)  receiver

iperf Done.
# ethtool -S eth1 | grep rx_buf_unav_irq
     rx_buf_unav_irq: 0

---- After patch, 22% packet loss on UDP 56 bytes packets ----------------------

# iperf3 -u -b 0 -l 56 -c 192.168.2.1 -R
Connecting to host 192.168.2.1, port 5201
Reverse mode, remote host 192.168.2.1 is sending
[  5] local 192.168.2.18 port 42121 connected to 192.168.2.1 port 5201
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-1.00   sec  10.3 MBytes  85.8 Mbits/sec  0.004 ms  55146/247172 (22%)  
[  5]   1.00-2.00   sec  10.6 MBytes  89.1 Mbits/sec  0.003 ms  54699/253355 (22%)  
[  5]   2.00-3.00   sec  10.6 MBytes  89.0 Mbits/sec  0.003 ms  55231/253887 (22%)  
[  5]   3.00-4.00   sec  10.6 MBytes  88.9 Mbits/sec  0.003 ms  55138/253602 (22%)  
[  5]   4.00-5.00   sec  10.6 MBytes  89.0 Mbits/sec  0.003 ms  54938/253722 (22%)  
[  5]   5.00-6.00   sec  10.6 MBytes  88.9 Mbits/sec  0.003 ms  55273/253580 (22%)  
[  5]   6.00-7.00   sec  10.6 MBytes  89.0 Mbits/sec  0.003 ms  55202/253986 (22%)  
[  5]   7.00-8.00   sec  10.6 MBytes  89.1 Mbits/sec  0.003 ms  55047/253958 (22%)  
[  5]   8.00-9.00   sec  10.6 MBytes  88.9 Mbits/sec  0.003 ms  55612/254140 (22%)  
[  5]   9.00-10.00  sec  10.6 MBytes  89.0 Mbits/sec  0.003 ms  55683/254403 (22%)  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-10.00  sec   135 MBytes   113 Mbits/sec  0.000 ms  0/0 (0%)  sender
[  5]   0.00-10.00  sec   106 MBytes  88.7 Mbits/sec  0.003 ms  551969/2531805 (22%)  receiver

iperf Done.
# ethtool -S eth1 | grep rx_buf_unav_irq
     rx_buf_unav_irq: 30624


So clearly there are pros and cons with this, but I don't want to fall into the
"let's not break microbenchmarks" pitfall.

I personnaly find the stat useful, so :

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>


Maxime

