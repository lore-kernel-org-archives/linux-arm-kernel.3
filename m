Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2FFC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbAxxbT8tAzu++l7YEpQ8qx7NuP024/XerKy2rX7QqY=; b=f1c5bFAmoDq5Bx+p61QuE21b4H
	dk5wfdW1RP0pIHrWNhJkCpdpC3NNL7vYAnKGKTl7Wu98coG1dep0UTOUT0ReIw0ht8zjFo28zoXJD
	9LUx6KlMUOjBhESp+MsCfidpHhahJ64wGlX7k9e6MFqjT15bX1wM/1dd19ctQDZurW3SezukFRZQl
	Gz675WIMrXCeXIZz14H6BQzPbDSkWmcElhdCJ1eXqNRBkiBpA4CeBcr9EsITBsHS1UvLRSXKROUFZ
	CmJP10/aCfFy9/KDWbiCPkJelbYoC/D2cByDvan+qIYRctiHb8vdrzsmaOz49Njt5SqW1b9q+frHo
	AD8AYd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9pC-0000000CBXg-2rAU;
	Thu, 20 Aug 2026 20:57:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9pB-0000000CBXX-3fnS;
	Thu, 20 Aug 2026 20:57:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 980D660A61;
	Thu, 20 Aug 2026 20:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25A51F000E9;
	Thu, 20 Aug 2026 20:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787259440;
	bh=IbAxxbT8tAzu++l7YEpQ8qx7NuP024/XerKy2rX7QqY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EHREILNBpfwT0Euc/maJiAHHHhU4HloAu2+XfUEEhc92ijmK53qv+bxE8ZFyYAkWF
	 rbW3erbcN1PJ7Qz+pZAjoaMeaS+2SBWd3JgF8P59oo5O3DzslfwNixt8X1BnTI0v6Q
	 KN/l+osxGH/TMEBzG4hN84isdZTDf+CJjarHUOvYia6Zf70j5s4O4ZeAt83wXyfzTA
	 NjtZpEKDbcPApCISazwFRY5ivYRwiaHWHy41swP9lX5/JoXufZMiYPm6MF/NU5/FL8
	 O/3YtproF8PiHv3X73/LHHw3v0G4X7rGpmov852oasyrMV17MkLmNQcAY/UnpJEyY2
	 2qIoZBPGYibgw==
Date: Thu, 20 Aug 2026 13:57:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "Leto Liu (
 =?UTF-8?B?5YiY5rab?=)" <Leto.Liu@airoha.com>
Subject: Re: [PATCH net v4] net: airoha: Add retry mechanism to
 airoha_qdma_set_trtcm_param()
Message-ID: <20260820135719.0b4e5f35@kernel.org>
In-Reply-To: <20260817075044.17691-1-ansuelsmth@gmail.com>
References: <20260817075044.17691-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 17 Aug 2026 09:50:39 +0200 Christian Marangi wrote:
> CPU accesses QDMA via the bus.=20

Maybe it's just me but I have no idea what "the bus" is here.
I'm guessing that the bug is that the CSR write path to=20
some SRAM may get starved.

> When multiple modules are using the bus
> simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
> resulting in QDMA configuration failures and potentially causing packet
> transmission issues. In order to mitigate the issue, introduce a retry
> mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
> configuration is correctly applied to the hardware.
>=20
> Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Leto Liu (=E5=88=98=E6=B6=9B) <Leto.Liu@airoha.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v4:
> - Rebase on top of net
> Changes v3:
> - Init data
> - Use continue instead of negative error for poll
> - Add memory block after CFG_PARAM
>=20
>  drivers/net/ethernet/airoha/airoha_eth.c | 29 +++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 79418e682f71..302f8c432055 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2712,14 +2712,31 @@ static int airoha_qdma_set_trtcm_param(struct air=
oha_qdma *qdma, int channel,
>  		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
>  		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
>  		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
> +	int i;
> =20
> -	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
> -	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);

a short two-line comment would help remind why we're doing this loop
here, specifically (and not all register accesses)

> +	for (i =3D 0; i < 100; i++) {
> +		u32 data =3D 0;
> =20
> -	return read_poll_timeout(airoha_qdma_rr, val,
> -				 val & TRTCM_PARAM_RW_DONE_MASK,
> -				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
> -				 qdma, REG_TRTCM_CFG_PARAM(addr));
> +		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
> +		wmb();
> +		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
> +		wmb();

The wmb()s look like cargo cult, please drop them or explain what they
do.

> +		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
> +						mode, &data, NULL))
> +			continue;

AI also points out that we're worried about this get timing out here
but other spots in the driver read it without a retry. Is this possibly
also an unnecessary check, like the wmb()?
--=20
pw-bot: cr

