Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146B6EE36B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 18:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8kTUrc2o8wPYaMgFv2zk2qMqXHnJHp/twrSvkqJ9AQ=; b=Ma8YI+qeYoXxHiYpUx8AgcLJmH
	oV0RD7NSGqI83M8rFQ0m4QDnYDmSlVwFhSBP81IMrQWnMYtPfRUu2tVcpQh8aAcdQzPA/751qRw/t
	bErNtB0FwsdS30/spJL9D+4cT7DW1NTWBrR1neDXANRaTX01l0pvUtOE/cxUQuYYJPelt5mHgXbUZ
	UmSHn9gHCvXLjKtGYLfub+ffS/Ok0pPjGBl5vcYlIDb6hZsEzUOfMBPKFcOPyBhtfchKpJCUhzJdO
	muByM3cBIgaWiS8tymlDNuWS2wgY+6yGw8cDMvc9WoU5Pj6sYG4I2r4KdqHSW6RpGK9pWh6su7wkd
	4zgX1QuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqb3i-00000002Uku-00xF;
	Thu, 12 Feb 2026 18:04:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqb3e-00000002UkV-3RNx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 18:04:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AEC40C23DAB;
	Thu, 12 Feb 2026 18:05:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35E75606B8;
	Thu, 12 Feb 2026 18:04:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EA37103688A1;
	Thu, 12 Feb 2026 19:04:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770919490; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+8kTUrc2o8wPYaMgFv2zk2qMqXHnJHp/twrSvkqJ9AQ=;
	b=OItYGEKeYLv6ENHxiFbDlStUJY+eiUIKrhRIS5s+oy9EWcwC4xSa+/ZCPbMxjYFOh11Qzu
	9b09NIO+0jumzK1YKqiygXfTR4T6SXEXIaJHLDf2tB2+XEVux6c5aqT9KGG+l3ZVcjZAU5
	2dlXo/7YhSPhuHum5WinVv79hCcg9Itzlilzp4rHFffcH9SP2UzU71do+LD1lveZ6c80ci
	waB/vcvME4XbrUrM6MmJStRzBRVxLwypl9nFIcZpRDHNSlxRKacGSbkLlzRFDaHXqEcRmV
	d0G5clrJ26QwXtQ+Ux8eqZwQP8X+Ak/6r4U1hstaxxncFeQXJJFo45TbY9mTDw==
Message-ID: <42049f4d-8258-4d9a-840c-a2d2eafc6bf6@bootlin.com>
Date: Thu, 12 Feb 2026 19:04:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: sparx5/lan969x: fix PTP clock max_adj value
To: Daniel Machon <daniel.machon@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 Richard Cochran <richardcochran@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260212-sparx5-ptp-max-adj-v2-v1-1-06b200e50ce3@microchip.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260212-sparx5-ptp-max-adj-v2-v1-1-06b200e50ce3@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_100455_003893_298437A8 
X-CRM114-Status: GOOD (  11.71  )
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

Hi Daniel,

On 12/02/2026 12:02, Daniel Machon wrote:
> The max_adj field in ptp_clock_info tells userspace how much the PHC
> clock frequency can be adjusted. ptp4l reads this and will never request
> a correction larger than max_adj.
> 
> On both sparx5 and lan969x the clock offset may never converge because
> the servo needs a frequency correction larger than the current max_adj
> of 200000 (200 ppm) allows. The servo rails at the max and the offset
> stays in the tens of microseconds.
> 
> The hardware has no inherent max adjustment limit; frequency correction
> is done by writing a 64-bit clock period increment to CLK_PER_CFG, and
> the register has plenty of range. The 200000 value was just an overly
> conservative software limit. The max_adj is shared between sparx5 and
> lan969x, and the increased value is safe for both.
> 
> Fix this by increasing max_adj to 10000000 (10000 ppm), giving the
> servo sufficient headroom.

That's arbitrary, but looks like there's plenty of other drivers that do
similar things :)

> Fixes: 0933bd04047c ("net: sparx5: Add support for ptp clocks")
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


