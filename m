Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD7FE937E1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyrBejDYNW+FyCRkORkAaICvUo5I+HducgLjouVMK8Q=; b=fHc6OJbnFW8zQA8sopicKQ+vs8
	kJM0nN6+ZKLusjOj52WcwqcaHeRQmyWRoyYHpxtovQFaSnVMFxq10DkYeiAHry25vAqVf91GA6gia
	NliUVfgV52WkQmSb939O0XMT2a4rhw2RX3kzodkgv+lKZNFvDOOF4LOSfUmSmutyfys6WQqGqfMET
	jDF0A1ftq4n03TWoY7cOxu66T9XOzC5t94VYAiPUF/doQNKFnn5anCou+K+pnmAD/IQ4RcQgecup5
	RASmTZpR228HU3qz6bnQNkuWXn8+wDh342d9WUP21w0SfYs1ZPMc4us6ax/k76Pf1DYUzli5zABGr
	0cWo0vGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvOC-0000000EM8C-42M0;
	Sun, 12 Apr 2026 14:02:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvO9-0000000EM7h-1Xlq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 14:02:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 99823C5B184;
	Sun, 12 Apr 2026 14:02:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72DEA5FFB9;
	Sun, 12 Apr 2026 14:02:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E243710450084;
	Sun, 12 Apr 2026 16:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776002527; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JyrBejDYNW+FyCRkORkAaICvUo5I+HducgLjouVMK8Q=;
	b=H1SHUp2R7XPwq9Y3NwXMRHFL9rv7/aMub8BCAbRoGsvkYB4u71U8GqMr0QXdounn2viENY
	zw3G2x+z9Klw5QjfVdizmvk0jI7B04AX8ZpmqkoYXAbeFu1wJzDgkp71lYhIS4ii9K1DLO
	2vBkQPe+HymDPy73T1Zt7U+JzMzxPhWnTmACykWg7uU2kaUg26+Hy7YmTEntANuVJwSI5Z
	fp/Nj7T8u6mUUN5VVT1D2vLWHunbpjWtrvRheLGMv9Hgjr9ibBUmcBN5hRHNkJy8NSyNam
	n/pWT7WmiWvqGU8UnIetUuUX+/iR4SESagBhFHwYVzPsr6Qoq71fhkwp2d1B+A==
Message-ID: <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com>
Date: Sun, 12 Apr 2026 16:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sam Edwards <cfsworks@gmail.com>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_070214_026906_161A7BAA 
X-CRM114-Status: GOOD (  16.89  )
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

On 10/04/2026 15:07, Russell King (Oracle) wrote:
> Enable receive process stopped and receive buffer unavailable
> interrupts, so that the statistic counters can be updated.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Since we are seeing receive buffer exhaustion on several platforms,
> let's enable the interrupts so the statistics we publish via ethtool -S
> actually work to aid diagnosis. I've been in two minds about whether
> to send this patch, but given the problems with stmmac at the moment,
> I think it should be merged.

Looks like my reply to your original RFC was lost in limbo as the review/test tags are missing.

Here's my original answer :


It works, I can indeed see the stats get properly updated on imx8mp 🙂

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

I personnaly find the stat useful, and that having the stat visible to user
but stuck at 0 is misleading so,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>


Maxime

> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> index af6580332d49..43b036d4e95b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> @@ -99,6 +99,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  #define DMA_CHAN_INTR_ENA_NIE_4_10	BIT(15)
>  #define DMA_CHAN_INTR_ENA_AIE_4_10	BIT(14)
>  #define DMA_CHAN_INTR_ENA_FBE		BIT(12)
> +#define DMA_CHAN_INTR_ENA_RPS		BIT(8)
> +#define DMA_CHAN_INTR_ENA_RBU		BIT(7)
>  #define DMA_CHAN_INTR_ENA_RIE		BIT(6)
>  #define DMA_CHAN_INTR_ENA_TIE		BIT(0)
>  
> @@ -107,6 +109,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  					 DMA_CHAN_INTR_ENA_TIE)
>  
>  #define DMA_CHAN_INTR_ABNORMAL		(DMA_CHAN_INTR_ENA_AIE | \
> +					 DMA_CHAN_INTR_ENA_RPS | \
> +					 DMA_CHAN_INTR_ENA_RBU | \
>  					 DMA_CHAN_INTR_ENA_FBE)
>  /* DMA default interrupt mask for 4.00 */
>  #define DMA_CHAN_INTR_DEFAULT_MASK	(DMA_CHAN_INTR_NORMAL | \
> @@ -117,6 +121,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  					 DMA_CHAN_INTR_ENA_TIE)
>  
>  #define DMA_CHAN_INTR_ABNORMAL_4_10	(DMA_CHAN_INTR_ENA_AIE_4_10 | \
> +					 DMA_CHAN_INTR_ENA_RPS | \
> +					 DMA_CHAN_INTR_ENA_RBU | \
>  					 DMA_CHAN_INTR_ENA_FBE)
>  /* DMA default interrupt mask for 4.10a */
>  #define DMA_CHAN_INTR_DEFAULT_MASK_4_10	(DMA_CHAN_INTR_NORMAL_4_10 | \


