Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6E4E68940
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 01:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYvPVVAeZAaiSZqf70qXrUEe+1NujkjiO7NSl1ghSxs=; b=K1nia1eFDFtpoYWenvDxtVVche
	+ZpXXiF38pjiO5KKjkmOiL/q4lC5Dh2Gi9+61uovktPTAMgm9mxTrZb8q6FYq7Wv5xx+KKvswVL6x
	27fLhj06TV+wxkdIRDUj2/XbQGbF3wS6hEB7cL40czWNzkU59QRYtSdYaFlJA/d4veY/9smLtcgeT
	sPLE2Bjzl4EFBkkaWJ6PiijBhDajtreNiPMXPTrxo4w0ziPh3VGSXkzeE36bYLFNBGFtaSbK/o1HW
	HEWsY42frwxg6lqOZIScJNqDbp/ATJq2OdCEVOmvLPUC3EbfVJYwD4HedjA2pyZFeG6TghEUKLfaO
	A5ZWRlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Jgm-00000002DT9-2Usy;
	Thu, 31 Oct 2024 01:09:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Jf8-00000002DJr-2Tdi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 01:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0C0DA4389B;
	Thu, 31 Oct 2024 01:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E503BC4CECE;
	Thu, 31 Oct 2024 01:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730336865;
	bh=KTGoTD83eV6moZ2wNyAKGgj9FRSZTPh8B8ArNRpcHHY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CbS/yJfJLv6FKaTlKAfRilbi+dKk+EBOGSLc5vkTcBQGe1ojlVlOAooUNsmCeab6e
	 qjHQiXF71ZohogPV80p0GOsRPaKCaDLp3srqTRUjKKvvZhjUTOv3H6Qi9doTUC5Xb4
	 +vta2UONIQpXSwFi2biAzjWU4Xh2F533Owvn+S48utWco0p2C8HhVes8uZkAqDJlPx
	 u5MMq0wiSeIFidmVVpFh1BsHkhdhTzRiSxSY7LgcAk8yuS7zzeRHmIlpBaMHy05WyF
	 19wSRqtWncfDmid03xOBLV1u3qguoAukZy+wCL6ukfT/mtCVES/MGPYKBHvo3WyNlr
	 PMBZOmG+T4s6w==
Date: Wed, 30 Oct 2024 18:07:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Lars Povlsen <lars.povlsen@microchip.com>, Steen
 Hegelund <Steen.Hegelund@microchip.com>, <horatiu.vultur@microchip.com>,
 <jensemil.schulzostergaard@microchip.com>,
 <Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
 <UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
 <ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v2 10/15] net: lan969x: add PTP handler
 function
Message-ID: <20241030180742.2143cb59@kernel.org>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-10-a0b5fae88a0f@microchip.com>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
	<20241024-sparx5-lan969x-switch-driver-2-v2-10-a0b5fae88a0f@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_180746_728792_B7585E29 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
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

On Thu, 24 Oct 2024 00:01:29 +0200 Daniel Machon wrote:
> +		spin_lock_irqsave(&port->tx_skbs.lock, flags);
> +		skb_queue_walk_safe(&port->tx_skbs, skb, skb_tmp) {
> +			if (SPARX5_SKB_CB(skb)->ts_id != id)
> +				continue;
> +
> +			__skb_unlink(skb, &port->tx_skbs);
> +			skb_match = skb;
> +			break;
> +		}
> +		spin_unlock_irqrestore(&port->tx_skbs.lock, flags);

For a followup for both drivers -- you're mixing irqsave and bare
spin_lock() here. The _irqsave/_irqrestore is not necessary, let's
drop it.

> +		spin_lock(&sparx5->ptp_ts_id_lock);

