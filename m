Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474FECA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 23:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMcXMeK/Gx0dq/qUEJCJIEDpG51iPGdTXb1XjwpWfVs=; b=HvAIex4IzzsAs+ZuT8xGUGzmGy
	1Ied5fq4zZ9RRFO3yFjXgor2UG/m0yfJeqmpuraOYPR4y+i6zZy5/KyL04k0HipIjnAxzPYLq/kq0
	fPZx6N6CY9DGs4LWaCVzz2SYNkw/0jPAm5vL+yVQxpNbcJz6kLH+OAyqXxdt/jbURjZW6bh9qRYT3
	nNIVl8fLj4iiDeQL1I53iDhxFOp4E4FFPS+w1EnHMcMErorw7JAsp2Q+3C9RfeRXK7PSzU8XOUrV9
	rcmMbdFfn71VdIY4Xc3sR8BVf13v3+o2en+KP/aek0jw0rliMKSjE1vSeh/howfO7PACa+UjCIWMf
	sfUF5KKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqh2g-0000000A9kG-2hZH;
	Mon, 25 Aug 2025 23:56:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqgzx-0000000A9as-02tp;
	Mon, 25 Aug 2025 23:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48B4B44489;
	Mon, 25 Aug 2025 23:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E533C4CEED;
	Mon, 25 Aug 2025 23:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756165992;
	bh=OSFizG0G8sYZyxXrUnI/kUtdTxY7DmYTz4FmYAkcABA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LDLJvmbUwIA7DVd7La2/nDraaRDNjuq6eOXjb7WjGUBke0MHAE6gSENBkjOuv3xSk
	 G/lvWZrBAIAgAbwXr9DyoSrKDbTpdvbG6ywD10b7dsCR872nd02rpjWFSeB/U8ZGRT
	 nDMzcugkTDMc6Dec/Fk7j6M3PpyHKI2EYylPvrHnee+xu9wkNH+/HdM0ICeJtdRdv3
	 51pw9kyAAzkF+h0dw4+kxlCPScc3CdolgjN15HZawluYOQ70LuqyWjdur0xJfMJNiH
	 B9RnkiIoGzzF7fcAlLSexGp4+odDp6RuxLNcePNnw/nfwXINVdFrmiiXjiFeym1O6D
	 98dSxXnqdb42g==
Date: Mon, 25 Aug 2025 16:53:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, stable@vger.kernel.org, Andrew Lunn
 <andrew@lunn.ch>, =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v2 1/5] net: cadence: macb: Set upper 32bits of DMA ring
 buffer
Message-ID: <20250825165310.64027275@kernel.org>
In-Reply-To: <20250822093440.53941-2-svarbanov@suse.de>
References: <20250822093440.53941-1-svarbanov@suse.de>
	<20250822093440.53941-2-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_165313_070389_64D8A82A 
X-CRM114-Status: GOOD (  11.54  )
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

On Fri, 22 Aug 2025 12:34:36 +0300 Stanimir Varbanov wrote:
> In case of rx queue reset and 64bit capable hardware, set the upper
> 32bits of DMA ring buffer address.
>=20
> Cc: stable@vger.kernel.org # v4.6+
> Fixes: 9ba723b081a2 ("net: macb: remove BUG_ON() and reset the queue to h=
andle RX errors")
> Credits-to: Phil Elwell <phil@raspberrypi.com>
> Credits-to: Jonathan Bell <jonathan@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ether=
net/cadence/macb_main.c
> index ce95fad8cedd..36717e7e5811 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -1634,7 +1634,11 @@ static int macb_rx(struct macb_queue *queue, struc=
t napi_struct *napi,
>  		macb_writel(bp, NCR, ctrl & ~MACB_BIT(RE));
> =20
>  		macb_init_rx_ring(queue);
> -		queue_writel(queue, RBQP, queue->rx_ring_dma);
> +		queue_writel(queue, RBQP, lower_32_bits(queue->rx_ring_dma));
> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> +		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +			macb_writel(bp, RBQPH, upper_32_bits(queue->rx_ring_dma));
> +#endif
> =20
>  		macb_writel(bp, NCR, ctrl | MACB_BIT(RE));
> =20

Looks like a subset of Th=C3=A9o Lebrun's work:
https://lore.kernel.org/all/20250820-macb-fixes-v4-0-23c399429164@bootlin.c=
om/
let's wait for his patches to get merged instead?

