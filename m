Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98765E6ADC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGhzl0PQsumkyxo4agqUCnIuON+fsu0KhbiRlOO4UDI=; b=A81HSUG3DECtfWAorvF6i+z9cw
	S0sY0kC5dOFZPHEBukzRzcpSK/hgYQmyHGMF1n+njN8lIQMz6d03ZOKnUXsB7zhlz8fheECKJyLIq
	Uk1rjiq8r30sAlUXC65G66GhIS5GdXNpDmg5Mz1RIaQHtO1fGpSz1XqGWSNMQ1mfzJD/nZ188c+5c
	iDmnoZBHtGFk6DqW3qWnVqW69MAILSIsyBQxPfAkvZKOh4ogYAT+cJhwzIfvN/9powkzgHNOm1ZzM
	ZPjhiDo21/CvcdjGFMGf6/ffmkedSms8NcD0tesNoFWbVZHERaczdFhQL2HtyPcgqCQFHSAZBZEDU
	D/T8kfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbEl-00000003LVH-2LmO;
	Fri, 22 Nov 2024 21:30:47 +0000
Received: from bout3.ijzerbout.nl ([136.144.140.114])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbDn-00000003LPz-1OKL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 21:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1732310971; bh=6Dq/7a3W6K2nC9cc/WeXeaR3aIX83oR+/Zyz5Nsg+h0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RRDbqHL5Tu0vgOBzHI44XtGJkGz23xeJB82btI7ryKROpsyor4DFZYBINq+G6GP5a
	 6kJdv/59eO0bH/a8+V4On/Scvh/0hTihoWTwXJ6m8gc4/IU/QtB2/2TYN3FRSliNa3
	 4qp+4JBj6Zqrokf6ou2ZJaLcH8ZzrE5/7ta3Cxr9lSYnj9NIrtoljDGdD9rocgpi0p
	 agLLlyQfR69uP5Jc9AMnA5Cy/fZ0wu9d2tAVrPSXMyz/zKFeBys/tSIT4IN+ipiRrE
	 7D7mNBpn9m+DP9P6J2EoOWL1WgrBcU/34qroIa2VmAIlzOwFag9aIxSNWHG0ppNLEG
	 j9EVW6/qrKgroxUbmQqqGgqOwY5KTTsjPtYEPdLnps/10dIAf7jo7VNgNSslFSmEMY
	 2g6zfCLaahK6ZSSTeZy8Tvl29s+uTkmIQyVjvYogndHGLEYzAAuhG/gPoBzgA4Qe80
	 VagJNHkP1Rpv1hkUFopa2jqIaF+BIdPk/2jqVokyaZ3X2gCRHcw7lIvxHRKUzv0CeH
	 Jfc51Xpb1aSK+6ZMCWmgh3wYNjIivurxyzPNlyswk3xoo8ZXYRduj8+RG9Z+pIOloT
	 ZHoiSwisic5dAT5BnJTvHdVo20UhtNlmXQug5B59+4b9iRM6gri1KwbS1Am8cqkeTj
	 bR/XOFZ0xkOkzL7PLan6010c=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id BE4CE18E0CC;
	Fri, 22 Nov 2024 22:29:30 +0100 (CET)
Message-ID: <d50b2caa-4d3a-4c1d-986c-6fb3c0a2f850@ijzerbout.nl>
Date: Fri, 22 Nov 2024 22:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: xiic: Add atomic transfer support
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
 michal.simek@amd.com, andi.shyti@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
 shubhrajyoti.datta@amd.com, manion05gk@gmail.com
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
 <20241011104131.733736-3-manikanta.guntupalli@amd.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241011104131.733736-3-manikanta.guntupalli@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_132947_784010_90B072EE 
X-CRM114-Status: GOOD (  15.99  )
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

Op 11-10-2024 om 12:41 schreef Manikanta Guntupalli:
> Rework the read and write code paths in the driver to support operation
> in atomic contexts.
>
> Similar changes have been implemented in other drivers, including:
> commit 3a5ee18d2a32 ("i2c: imx: implement master_xfer_atomic callback")
> commit 445094c8a9fb ("i2c: exynos5: add support for atomic transfers")
> commit ede2299f7101 ("i2c: tegra: Support atomic transfers")
> commit fe402bd09049 ("i2c: meson: implement the master_xfer_atomic
> callback")
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 245 +++++++++++++++++++++++++++++-----
>   1 file changed, 212 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 052bae4fc664..e5e9a4993bd4 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> [...]
> +static void xiic_recv_atomic(struct xiic_i2c *i2c)
> +{
> +	while (xiic_rx_space(i2c)) {
Let's remind what xiic_rx_space is
#define xiic_rx_space(i2c) ((i2c)->rx_msg->len - (i2c)->rx_pos)

> +		if (xiic_getreg32(i2c, XIIC_IISR_OFFSET) & XIIC_INTR_RX_FULL_MASK) {
> +			if (!i2c->rx_msg) {
This check is suspicious. If i2c->rx_msg is NULL then the while
above already dereferenced a NULL pointer.
What is going on?
> [...]
> +}
> [...]
> +static void xiic_send_rem_atomic(struct xiic_i2c *i2c)
> +{
> +	if (!i2c->tx_msg)
> +		goto send_atomic_out;
> +	while (xiic_tx_space(i2c)) {
> [...]
> +	}
> +send_atomic_out:
> +	if (i2c->nmsgs > 1) {
> +		i2c->nmsgs--;
> +		i2c->tx_msg++;
We can get here with i2c->tx_msg being NULL. See the first if
in the function.
> +		__xiic_start_xfer(i2c);
> +	} else {
> +		xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK);
> +	}
>   }
> [...]

