Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F3FC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1I7aZMjRXvCaOpbeSXZzskXq8kx2GUMjlj6C7bc1U8=; b=TvpLAgJoLM5sa7rxomYDhSONAT
	CNTbZEW7d2csq7IfuhoPXwj0GXc5BfcXoISldYVsNXBJ9RINPv8W+8Df6LYPJo2MX9nSqx/SJkPCr
	JhfocmGfn5mXUtyFreGvpXsji9FS3Cy0ZcMfLJJh5fBDtoJu1TAInCQoYUwXDWJ7av/NUiroMhLM7
	W4eUAnuEqiI45kmpNFvtfoFzqL0uaIuxJMUMBmvzzT1WDMAW6OxmMDhbGzeiD4A/QeCh1gZbGUvnM
	rCCc7tstmZePx75iyp4yZQdTgUJWYkeljxSMYdck+hdFEifizXf8YSgy3fAZjCT9lGPbVWkyrd7iK
	CJsUn30Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJaM-0000000Ch05-3TtD;
	Fri, 21 Aug 2026 07:22:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJaK-0000000CgzU-3ABD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:22:41 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787296956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K1I7aZMjRXvCaOpbeSXZzskXq8kx2GUMjlj6C7bc1U8=;
	b=Eh0tOm0kHAXCPERXM0REoNprMkim0+iXF/rczlOD8MvdLjRPiap7J0KnSiXw3+hk3/0v/n
	DzlaxjbiP/TuzGyL+ZE2KWrEaoRKPjV+Tprw8FpJlV25yejJNloX7rWJjTUw5jKo8UQmYj
	WeNfjvddesIxmaGPL6s153RrihRU21HvsKYwRTLzMXXx+XSjqFz4D7VLMKgu2vDwNSnrsS
	fY4C8esFC5SvdLQlrXffpPe1+QaSXPc1ImFj/gceUTi0+2FYOe+KXOUzZfi+4kEr03YqxS
	W+nbl7UTPOoWl7a9gTaZz7JsGRPGJ0YjRsmhznL7s3/lTJH9CBxU7VYjPbzhCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787296956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K1I7aZMjRXvCaOpbeSXZzskXq8kx2GUMjlj6C7bc1U8=;
	b=GpTDiyKgCEKtCl0bNBKhy/6wMAHCCrh95o67Qh53WlJ9/s3qNgKhq//kP3QVaSIleAdmoK
	Uy7G9q9K2WugfzDw==
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi
 <lorenzo@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: stm32: Set TSO/TBS Tx queues
 default settings
In-Reply-To: <20260820144528.7107ba90@kernel.org>
References: <20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de>
 <20260817103337.74c30adc@kernel.org> <87mrujzzjv.fsf@jax.kurt.home>
 <20260818075335.48936b08@kernel.org> <87h5kq1s1f.fsf@jax.kurt.home>
 <20260820144528.7107ba90@kernel.org>
Date: Fri, 21 Aug 2026 09:22:35 +0200
Message-ID: <87y0e0x7ic.fsf@jax.kurt.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_002240_943741_1174FB98 
X-CRM114-Status: GOOD (  23.28  )
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
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu Aug 20 2026, Jakub Kicinski wrote:
> On Wed, 19 Aug 2026 09:35:40 +0200 Kurt Kanzenbach wrote:
>> >> I want to use ETF Qdisc with hardware offload, which is currently not
>> >> possible on the stm32mp2.=20=20
>> >
>> > Do you need multiple queues for ETF/normal traffic?
>> > Or one ETF and one "normal"?
>> >
>> > How do you sort the traffic between the queues?=20=20
>>=20
>> So the stm32mp2 has two CPU cores. I've isolated CPU1 for Profinet. That
>> one uses Tx/Rx queue 1 with ETF to reduce the Tx jitter. Everything else
>> is routed to Tx/Rx queue 0.
>>=20
>> Config looks like this:
>>=20
>> #
>> # Tx Assignment with SP.
>> #
>> # Tx Q 0 - Everything else
>> # Tx Q 1 - RTC
>> #
>> tc qdisc replace dev ${INTERFACE} handle 100 parent root mqprio num_tc 2=
 \
>>   map 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 \
>>   queues 1@0 1@1 \
>>   hw 1
>>=20
>> #
>> # Enable Tx launch time support for TC 1.
>> #
>> tc qdisc replace dev ${INTERFACE} parent 100:2 etf \
>>   clockid CLOCK_TAI \
>>   delta 500000 \
>>   offload
>>=20
>> On Rx incoming frames are steered via PCP field (vlan tagged).
>
> Thanks for explaining!

No problem.

>
>> >> It seems like a static configuration in the driver today. I basically
>> >> followed the same convention as dwmac-imx, dwmac-intel, dwmac-mediatek
>> >> and dwmac-qcom-ethqos. Only dwmac-socfpga does it differently.
>> >>=20
>> >> Tx Launch Time requires a different DMA descriptor layout. Currently
>> >> tc_setup_etf() just returns -EINVAL if the DMA configuration is not
>> >> setup appropriately. I guess a dynamic configuration requires to chan=
ge
>> >> the DMA config and perform a full release/open cycle.=20=20
>> >
>> > release/open is not ideal but still better than hardcoding?=20=20
>>=20
>> For sure it's better than hardcoding :). But, again the driver does it
>> statically. Maybe there's a good reason for it. Maybe not. I'm not that
>> familiar with the stmmac driver. I'll prototype something to see whether
>> we can enable TBS at run time using the ETF Qdisc callback. It may take
>> some time though.
>
> I think the m in stmmac stand for 'mistake'.=20

:D

> We need to start cleaning it up.

No objections here. I've briefly looked at the TBS thingy. I think we
just need to reconfigure one Tx queue instead of doing a full
release/open cycle. The XDP/ZC code does something similar. So the
infrastructure seems to be in place.

However, we need to keep track of what SoC implementation can enable TBS
on which queue. For gmac4 we can probably reuse tbs_en and for xgmac
there's is capability field tbs_ch_num. Let's see.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmqH/LsTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgiBtEACuo+fjtobS7lE+ee/yAu66iJrTfedY
ZgknzqKhL5HxIBGp8o4QXc7/LwcBTUUpj19rYRHPSWcqF0QJMjzvWBDdivdcGuWj
g0WEF25OgNtVE+xZCQ2U+JodvI6IhmAMxlywIly0QzgzBNO7MFMmUk/3+7meK0b7
tfZaRikU+nGWfMOG23xytyL39eEcaBRIBH9kXP+t+GYtI3Dw22gd7K9C4DpWxTxN
loKtoMXFtUqxlVy+2XBCSl5Fm3yt0r+mpZDeXEKIpndEMCf7uEhfg/4QuFi4b5vW
fqm49d+4pC30b/QAbNkYq/tc4XVSaoaIO1wRpyOspCjcbUyz84ed7uzVPYY741p/
5mB80PGTKqvxR1lDksaoeX0nt3YPUOk573/inK7ak1DB+6lDAnqU+1mC+YXcqohz
k7KDTixfC4xjFnof8hRULtRVAd0OQcDUlz4LGx0G7vJB1I6NQEzuHvl4XawvpHUp
Na8+NLnHGsAAbx/IkcIyxvHH9xjZ+lVBlhmaCBFhA7TmCi5RiHj9/Rf+GuJZW2lB
hpRcC48QF4Tyq43NSduyZ7W2Z7y0sWSx85OYEdMR9bIyzYDkBwCGNQLI5EnRqPyz
3KplXYGtxa8zP0C9AoRiCfMIt/gsj+AGbDAs5VTHkhy9pRVk9o95kXOoww3CB2ri
n8ueyZTfPq1PKQ==
=pNYD
-----END PGP SIGNATURE-----
--=-=-=--

