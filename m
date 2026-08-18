Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1B4C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 06:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k153DUjIMFjUgFA73Y8BqSLm951n83/LiLiTD2rmFjk=; b=QsLEnTlsRy6QkJoe/EBc08Bmg5
	a/9hG2ti9nZQPesDSAEwGFkY2JRRmqMsEKjIzMaMFGFYl5ivhI40V13M8QuMYydzkogzAaZA2XlD9
	s1/1BfcOhVpssIrktHLHifXJp46mBJMZSCGcGVX1AhuaDkJDDVT+KKaqdYyKhRJIGLhsRZFNNgZhe
	H5fFGw4Xdw7atelO6poswkKJDZsa7W4h1D8dP63GxsSoYXxEcCo8kmwIUSardYXj+rbiuVwUxyVb2
	xHCdEhQhLMAhL5rDAx8ihuBk9ccPh301e6Ul37hlV0qKcebK9kdzEvXrpBaiFqmG4WUJqQs9x1Zbg
	uOMi32VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDl7-00000007QPC-1YkW;
	Tue, 18 Aug 2026 06:57:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDl4-00000007QOr-3Mv1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 06:57:16 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787036231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k153DUjIMFjUgFA73Y8BqSLm951n83/LiLiTD2rmFjk=;
	b=K55YAyXbEmR7QI/wBoI+Ksm8NsDNnzECUAO1fcc9Nsa7XIq25Z0P/Z+Ixi7i3ebU0/uDgR
	J8ujkPyJfgBk5DaB+S5Ovw2+spa144Vis/di84QJ6dZneS1mD/4BC9ZCNEvZxKoRyemK1e
	pyiz5vs1QfL9RlsRcuT9s/VCN5Par1YZvg8TOBh0K0Xfq/1TV+s12CfdbWpJ24MWhCXYGY
	67nQtMKndZ/JGqfsvm9mNNLUjyxHBNk/F946aqydKrvvGuF9QWhejkQxzX5SNpElkYLb44
	oEd7QkJpnjiHnhoI8sOjf2BQFBEYDxI+3OpugRg42PGd+351DscHPuSl5Zb6sg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787036231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k153DUjIMFjUgFA73Y8BqSLm951n83/LiLiTD2rmFjk=;
	b=uWWo2AQlddJzsHPIgvU34g8IZJRdjK+w/9EgsMmZCTPhhvPAKRQCGXb3Zhv25RV1bhu/CU
	Cmw8nvMEhXpBSECQ==
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
In-Reply-To: <20260817103337.74c30adc@kernel.org>
References: <20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de>
 <20260817103337.74c30adc@kernel.org>
Date: Tue, 18 Aug 2026 08:57:08 +0200
Message-ID: <87mrujzzjv.fsf@jax.kurt.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_235714_996587_CB793F9B 
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

--=-=-=
Content-Type: text/plain

On Mon Aug 17 2026, Jakub Kicinski wrote:
> On Wed, 12 Aug 2026 08:28:57 +0200 Kurt Kanzenbach wrote:
>> TSO and TBS cannot coexist. Use the first queue with TSO and the rest for
>> TBS. Tx queues with TBS can support etf qdisc hw offload. This is done
>> similar to dwmac-imx and dwmac-intel.
>
> Can you explain your use case?

I want to use ETF Qdisc with hardware offload, which is currently not
possible on the stm32mp2.

> And how many queues the device has in total?

The stm32mp2 has four Tx and two Rx queues.

>
> You say "TSO and TBS cannot coexist" but can any queue on your
> platform be configured to support either feature?

I think so. The data sheet says: "Do not enable time-based scheduling for
channels on which the TSO feature is enabled.". But, I didn't find any
limitations on what queue/channel can enable TBS.

> If yes why are we configuring this statically instead of making
> appropriate configuration based on qdisc or some other uAPI knob?

It seems like a static configuration in the driver today. I basically
followed the same convention as dwmac-imx, dwmac-intel, dwmac-mediatek
and dwmac-qcom-ethqos. Only dwmac-socfpga does it differently.

Tx Launch Time requires a different DMA descriptor layout. Currently
tc_setup_etf() just returns -EINVAL if the DMA configuration is not
setup appropriately. I guess a dynamic configuration requires to change
the DMA config and perform a full release/open cycle.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmqEAkQTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgl24D/oD5pIbsJKmttKF5pgORFPdAeBIldyk
SJDlmLRbsKEvzsNC9upW0HDi48XGkXrQCaJjHwY8WLLbgvaBZhM7mDpfnI0GRXyc
XAyGdrQeO/BKPZ13oKJGWzu3IgV09rHW/tb4hT9wQDsXCNV88756qGey1h5pmrdT
rVqiP3muzIbHgXxZsomFPhe7eMOjttuYGAPRq2zFhXMCto8lqtn5GzdfxKXEnTxF
RMGp6gKZ/1onXl55AB/+E1DeUKilOkUyuc9b7SFCu0Czvtre0DllIO3/MwfX+hd9
+MUB1PP8bZ3CaN93N2d3pLyEZdY/NeqWOTmqnZforsvA5AXq8cexXNTz/PK+h35K
1N4gfK2szhFNyUmQS4joUj9j44PP6BunJIKHpvRZ2leVDb9JnJP0bprCy6b848H0
ifNkmYMIWKGdV+peW0ckNIfdg492rz5KZjLpzVZBwhH2j3XkRKiPZv1hz6i9ztgg
oncYVsNyXoCfUscIpCUfPOAy9DgIVvVyg7jW4Zj8wuG+atrIv0qybOLOD3xjLf6b
85nbZ18cyhXNFWyYxD0jHE8NkKe6CJu5QbfPSiPLYJtf2GrZPmp7YsQFaBRLU3HG
aUOXjDcgp7V1/SLyTjMpTDSsDIacT4E97SMnFLGHrGCxKpUC+PHB4tmi3u0W4WYY
TY9LCZK5MwqJvg==
=TQFM
-----END PGP SIGNATURE-----
--=-=-=--

