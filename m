Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F48ACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLooIQeM14qVt2R3iNMksVO2OoAxPBm8EDTL1+MXpRQ=; b=LaVrBUFsjq7E5z21vywdAVy1YX
	MNZoZ9PxyvUyyqwpU+Rt3aapNt7u6Sm0yWwP+c1Q4Mqa1/WFbzYj5cTC6vIiExYsLhF65rO4EQC3I
	zkM/TS/+uE203z1IyAi4XtnpRMFRDR+Qt02WMJyxspg6VrkbmiT0rqOlUFbqgGMbFnLIJbpOC9h3f
	PwU785szNMqDU7wkpuXkJr+UqJ7k5Kz1IribS3e0ldPvswqyUYUdgJXtKOOkRIPIWsypCBuQuBmdj
	uq7NNoH20/L6nFdtxrZPAw6QIOvvv1f4wUCMfKqb16dfD827qS6x5NgIyIYN6VbvhlfzD/c2PO+Xc
	k34xoHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPp-0000000ErMf-2jZE;
	Wed, 13 Aug 2025 19:45:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGM9-0000000EiuG-3kmx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 18:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qLooIQeM14qVt2R3iNMksVO2OoAxPBm8EDTL1+MXpRQ=; b=E3jUN5+Q0cKiyBN00benAZC1kx
	govClkJIQMczJVL2tXiRLp1Z9QEmey67VBZSOVhV60D1Kllc+pSGdeNKRPgOlDJJq+YUnMRTRKvck
	EIFAnMS/yUHn4m5S36GR/Lxh9x1ySjBWx+JnoAOQSoKZBcRzQLMmsZH8ElfiuEqecx5VGPAA09Lzq
	Otr3E4V3eiN5nDmIWQBIo/w1jFKqbjYfi05AwOmGFk+2jVJ0HkjGBjhGyEiK6g3EadgAZ8Rqc9NaS
	6t9PCPfv++RJgEOuhfzNZQmYF9WKCRFR0wBa8GeXS16B3itKKGOB42YBV5mRfYmDMjuxW/m7dtNsC
	AjQiHLfQ==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGM3-0000000G9Uz-3ogl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 18:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qLoo
	IQeM14qVt2R3iNMksVO2OoAxPBm8EDTL1+MXpRQ=; b=H9azEvDIg7LttMudtBUl
	AA4bNamdTvpOJPCzbrVX86FzCeS0jSfzp6xFjf2Esz5CSxtTxCgw9hbF8qWDjd5X
	GgNQeZz/tQytXid9g7PqvMHPFqfVQNd53hHIS6E3fq+ewo2Kbi9BOrTOwKVLXd7p
	ny4dXs9GUbu4p+1ruQfUk3hMcHpX4eVSwL80lXqxD4g5ljUb5652hLJKAweYhzWY
	Y5PedHtFyv9G9nlRPiw/TORSC3UTfn408axsciOH88WHWQ6xA9zM/tYWVTItdH8l
	+vKG56KIcJkfcXkedq2fdtFVFJ0jva61javWTIJck1GyfoojpE5wqJL/zQ9kcOuQ
	cg==
Received: (qmail 726888 invoked from network); 13 Aug 2025 20:37:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 20:37:39 +0200
X-UD-Smtp-Session: l3s3148p1@jMyLc0M8Rr9tKLNT
Date: Wed, 13 Aug 2025 20:37:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, lee@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 7/9] i2c: at91: make it selectable for ARCH_MICROCHIP
Message-ID: <aJzbclxOoHqQ7QAs@shikoro>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-8-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813174720.540015-8-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_193744_191134_0DB8FEFC 
X-CRM114-Status: UNSURE (   8.56  )
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

On Wed, Aug 13, 2025 at 07:44:43PM +0200, Robert Marko wrote:
> LAN969x uses the Atmel TWI I2C, so make it selectable for ARCH_MICROCHIP to
> avoid needing to update depends in future if other Microchip SoC-s use it
> as well.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


