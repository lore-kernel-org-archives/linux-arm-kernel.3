Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE712CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LN5yKJc0qCu3K+7AQh2+YtZujBU33pHX+rCZ2CHzTV4=; b=INunjefv05k0F3Hut98q0I4wjD
	l+woptBgfDHnYOw6a/xmMkYQwtBHvrOiYJxx80mWW+0qw4c1eMcWeW5ULX1Qyr5Zvp2kHr1dqRsPE
	uUr9y2Uouw8c8cn77h5EMd1ElMoN0olqxRMX5AFYNkIqbqnNX4kVScqssAAoMKBTO2hj3mgwFJdoF
	9cxp+q3WDJFC0/hajIx8ItZSNCRUnmwB7u+T/lsqgpDC3Y+kBeMKIJ9C6g4ZCxpwCjlCEoCp1+jC8
	QBSlf6rv5xjwhHO6WRWG+wk0O7NFnF+AcNvgWcMO+S9dq/2gUyHxzVkvpjwZcyfEYBHWVMgwksPFe
	pdytcpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBCF-00000009uk8-0OhG;
	Mon, 12 Oct 2026 08:15:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBCB-00000009ujL-24SZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:15:44 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791792938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LN5yKJc0qCu3K+7AQh2+YtZujBU33pHX+rCZ2CHzTV4=;
	b=J38FtVI3Fty3OlI72sQRYMg4rxohx4syiz3NFBZHwXtfp/jcuAd31ErG8MSsYN0kNjKC/u
	jEOZDHuagTYIiU6a6PUiaxEHTFu4nMfwCfDBrv4PhHGEwAyWNRsSU8m7Q/Wi1oxLoqw8OK
	Gecgs0otAWLM0sshl4A59UW50NShGM/TibwbsJxW6ncU11NxMIJ70tni+l0RJziHfcWXtV
	h3wLqx7TEyt9iogk2LjB5bFvmRWmP1LqBZKZakBn6hN1KF+xGotNhehVpKoOixFCP3IuEl
	Kijj2y4WBnAvPFZAc0P4A861Wz3IKapqHcgi6bWP6BxRhEWnnWPehZzoFiF7gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791792938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LN5yKJc0qCu3K+7AQh2+YtZujBU33pHX+rCZ2CHzTV4=;
	b=kXFALlzytsaU1zGROHC66/1jiuQOj+Gm1rH0TBAGnmmC4O9rlywEVJy/m7ZTRVlAOwuizW
	1xlBUKUWRWNxHPDA==
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
 yoong.siang.song@intel.com, noor.azura.ahmad.tarmizi@intel.com,
 faizal.abdul.rahim@intel.com, boon.leong.ong@intel.com,
 bigeasy@linutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: stmmac: Stop Tx queue when
 (en|dis)abling XSK pools
In-Reply-To: <179148659458.434549.12782551117834577099@kernel.org>
References: <20261005-stmmac_xsk_crashes-v2-2-46c60cba6421@linutronix.de>
 <179148659458.434549.12782551117834577099@kernel.org>
Date: Mon, 12 Oct 2026 10:15:36 +0200
Message-ID: <87bj8zgwrb.fsf@jax.kurt.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_011543_698935_ADD68147 
X-CRM114-Status: GOOD (  24.97  )
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

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Oct 08 2026, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 (1) =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [High] The patch only stops the netdev Tx queue, and the driver's own
>   XDP transmit paths ignore that.
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the new wake-
>   up makes it visible: if stmmac_enable_tx_queue() fails, the Tx queue=E2=
=80=A6
>
> --
>
> net: stmmac: Stop Tx queue when (en|dis)abling XSK pools
>
> This patch stops the netdev Tx queue in stmmac_xdp_enable_pool() and
> stmmac_xdp_disable_pool() while the Tx DMA descriptor resources are freed
> and reallocated. The queue is woken once the ring has been rebuilt. The g=
oal
> is to fix crashes in stmmac_xmit() when XSK pools are toggled while Tx
> traffic is running.
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_xdp.c
>> index d7e4db7224b0c..883bd3fe8089d 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
>> @@ -6,6 +6,16 @@
>>  #include "stmmac.h"
>>  #include "stmmac_xdp.h"
>>=20=20
>> +static void stmmac_xdp_stop_tx_queue(struct stmmac_priv *priv, u16 queu=
e)
>> +{
>> +	struct netdev_queue *nq =3D netdev_get_tx_queue(priv->dev, queue);
>> +
>> +	__netif_tx_lock_bh(nq);
>> +	txq_trans_cond_update(nq);
>> +	netif_tx_stop_queue(nq);
>> +	__netif_tx_unlock_bh(nq);
>> +}
>
> [Severity: High]
>
> Does setting __QUEUE_STATE_DRV_XOFF here keep the driver's own XDP
> transmit paths away from the ring while it is freed and reallocated?
>
> The Tx lock is released before stmmac_disable_tx_queue() calls
> __free_dma_tx_desc_resources(). DRV_XOFF only stops callers that reach
> ndo_start_xmit through the stack.
>
> Both XDP Tx paths in stmmac_main.c choose the queue by CPU. Neither checks
> whether that queue is stopped before calling stmmac_xdp_xmit_xdpf():

Yes, that was pointed out by Nicolai as well. He proposed a fix and I'll
include in the next version.=20

>
>> @@ -46,6 +57,7 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *=
priv,
>>  		stmmac_enable_rx_queue(priv, queue);
>>  		stmmac_enable_tx_queue(priv, queue);
>>  		napi_enable(&ch->rxtx_napi);
>> +		netif_tx_wake_queue(netdev_get_tx_queue(priv->dev, queue));
>
> [Severity: High]
>
> This is a pre-existing issue that this patch did not introduce, but the
> new wake-up makes it more visible. What happens here if
> stmmac_enable_tx_queue() failed?
>
> stmmac_enable_tx_queue() returns void and only logs the failure:
>

Yes, I know. I do have a patch to address this in the series to enable
TBS at run time. It's a separate issue.

Thanks,
Kurt

=2D-
pw-bot: cr

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmrMlygTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgvJOD/oC+32wZQWkvRXBng1UVlrTs93znASJ
RltxMF+cgY1G4W9vcXykAolnMw16VTPDwrNfzvUbf0fF+eWoHhSbcl/rndlfCXt6
JxLLiju44wd6WAA/5tHrSpydOoFUvJiGuhxz4f9Qb2jSWUPzlxIxvUnQNtntmW2r
SoX59J9EqE6tnyHmyN8PuZbsv4zpobH84LpovjdLkZNWmD49E7ukbI/sJvSsRcdE
oS2g+VsOzRBLfUI2AgXMfkUINmj/UY/1gVp27kdq+jUlUssugwIGTllwr6TlLUhN
eLbQ+xg9yyXQydsO9oJZy/tDkny+QZ5HCuEbQdywAqUAeO7u7B89VuJyZ9y3tzjM
MWcssT20CN8bu1uv1EtGaG0tu0Jm1KfH82tY9gjEMXaN8bravfVLyNOJ4xqKfm7+
1t68ILxPTBHXgIDHU0LFhfoJ38AxMuyWp8ZO82AwqHq/WHByZfmThPm+tduUTIZ/
DDo4LX94md2rX/dkTTbIQoGZnLV+d2Waj6X5iHIjyAZ47DI/1INpepCnPs6f12ld
3T/CVT5Zg4kZ2vrzWfqRd+vsMF4V7VPxbJmGyCC6ViEsiv3dkooB+agBH8o5POJN
0/o3u034OY+GGUBgwXPf3DK9gdsbVvoSlz/qFvpyTMnXO94GqLv1hgkvDCPInsNw
aVuQWUI6PrWEjw==
=U4Sl
-----END PGP SIGNATURE-----
--=-=-=--

