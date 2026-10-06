Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09BECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr0ojwKxzexz1gExyMgKbrvTBCOsN+vgkQEaK1X+gfo=; b=i9g6GDX88e5g0TW64TUAKn3Iqs
	6pJchnMplCh3Jx/HJRGmtp9tCg6zB43g93OyiK1plROkOyNTAP+xia09AJUHGEDR4Q30yFJ3SWZ/t
	zdu2eg4Hx/D0yEXzQCN7xHQeyrcKQP/MNJtrG7kEwRVzbdWlBZZ92GXyiMr/F6VZiNNThs1bJxxcR
	BVbNbrGqShV6wQL1ABT0qinZkU8JMleqAkVOVV9vJlikYsjCf0yCCn8YVpY05sa6kJdHd2CFFF1y+
	CC6zsA6H/XMC5rLJ9zNgoCEytPtoSi7GTFA9xlveePK/hdBjlIwcDepnry+HuYAJKIN3tSHECZpgJ
	oDIAWI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0TM-00000000HEz-2k3a;
	Tue, 06 Oct 2026 08:24:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0TI-00000000HEd-4AbF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 08:24:26 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791275058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vr0ojwKxzexz1gExyMgKbrvTBCOsN+vgkQEaK1X+gfo=;
	b=Ef4jOMuhmhoSFMKFG0YA+V7FibBdFdmjvO8xmHqtHDyuPnhG4nQ073ISZIF6WprthnNgEr
	TaiKfTB18JScFG5iU9YW7N01zXVx0TLoLiOdJXZEp1ARTsCEmNOR6kHjMMAcgbxWb+1Q2t
	lrecWJjebICUu/2e0favuozPuny81n/ScFIxOEkasul+3tZUpiljj9VLGpYoEHZfq8ZnXK
	4AbsTWO0/uzf+LLKspG+zxRuKl106KR0woRnpuqr7a5527y8T9APXE1Dq3ZWZ64f+SfwTJ
	Q/ZKOjFCpJZUqGCaedEJd0aTDoxy4jAXYdDoPbded4U1OupSplByd3G7gIq4MQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791275058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vr0ojwKxzexz1gExyMgKbrvTBCOsN+vgkQEaK1X+gfo=;
	b=b3DPDroz9fgG0Wn+7bA4SyufMD4jrNVOnLCp0/8vX8KYsMRpd1f8g6oSJFQ8XZ+bJ9fY2l
	T5hw9Yl6bLxfHIDQ==
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Song Yoong Siang <yoong.siang.song@intel.com>,
 Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>, Mohd Faizal
 Abdul Rahim <faizal.abdul.rahim@intel.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] net: stmmac: Disable NAPI before stopping Tx
 queues in stmmac_xdp_release()
In-Reply-To: <6bb85939-ff35-46e1-88cc-1bed0034e787@bootlin.com>
References: <20261005-stmmac_xsk_crashes-v2-0-46c60cba6421@linutronix.de>
 <20261005-stmmac_xsk_crashes-v2-1-46c60cba6421@linutronix.de>
 <6bb85939-ff35-46e1-88cc-1bed0034e787@bootlin.com>
Date: Tue, 06 Oct 2026 10:24:17 +0200
Message-ID: <87tsmzjky6.fsf@jax.kurt.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_012425_204089_72A4E30A 
X-CRM114-Status: GOOD (  14.00  )
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

Hi Maxime,

On Mon Oct 05 2026, Maxime Chevallier wrote:
> On 10/5/26 09:09, Kurt Kanzenbach wrote:
>> Attaching an XDP program while Tx traffic is running results in kernel
>> crashes in stmmac_xmit() -> dwmac4_set_addr().
>>=20
>> Loading an XDP program tears down and reallocates all DMA resources via
>> stmmac_xdp_release() and stmmac_xdp_open(). stmmac_xdp_release() stops
>> the Tx queues before disabling NAPI:
>>=20
>>  stmmac_xdp_release:
>>    netif_tx_disable
>>    stmmac_disable_all_queues
>>    ...
>>    free_dma_desc_resources
>>=20
>> A Tx NAPI poll may still be in flight at that point. stmmac_tx_clean()
>> takes the Tx queue lock, reaps completed descriptors and wakes the queue
>> again when it observes it stopped with enough descriptors available.
>> Nothing stops the queue afterwards, so the Tx path resumes while
>> free_dma_desc_resources() releases the descriptor rings underneath it.
>>=20
>> On non-coherent platforms dma_free_coherent() tears down the vmalloc
>> mapping of the descriptors, so the subsequent stmmac_xmit() faults on an
>> unmapped address instead of corrupting memory silently.
>>=20
>> Disable NAPI first and stop the Tx queues afterwards, which is the order
>> already used by __stmmac_release().
>>=20
>> The issue can be easily reproduced by:
>>=20
>>  1. Run iperf
>>  2. Run application which opens an AF_XDP/ZC socket
>>=20
>> Assisted-by: Claude:claude-opus-5
>> Fixes: 77711683a504 ("net: stmmac: ensure tx function is not running in =
stmmac_xdp_release()")
>> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
>
> This now matches the non-xdp case, great :)

Thanks for the review! Yes, it does match now. We could also collapse
the common teardown code between __stmmac_release() and
stmmac_xdp_release() into a helper function now and reduce code
duplication.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmrEsDETHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgrM5EACSIYb78xr0ciukoJSgoO8fP1If2Enw
ngrIFKLHJPoEehs4zxQzcdBscw9KwtDbn1J4E2fgh2oBRA0H2Nv3Q4LFMhBcU/5M
mVgXmqnj1gLoag8cs685ZTB4J2w6pfLvth5iKx5dDXg3XL9B32sQBlDhuarXElBE
GCxxAowpQ+f31D1lFINRgIXkxvPujvjFDHDDbYvKCC2w9Zz8UAV5nYElkdQkT9Ii
NP9clvFTr1ydjR6qPF8PAd2zsvPp9yq97GtQ0eM04JZINSVD/vF1kslb1XziRMZ/
5TPWFQi44ttkdFnJiiTltYkO6+KXEwHKU1+sbRdikXHHnN662pSvwyKBGuuF2pOt
gCktw9KNbGmEpa5qzpa5LICsWBPfBOar5D2zXdt5PKszUKsYs10f8S5E6SZhsDQ7
cQj++6A+gYhf9QT8jWWvlhQmTmOqXEvfT0c1uzM390avpjuS2wdKjj5gDjcZE2ow
UWzxLEgBm+VGbnNgxtGoL8Jj4h489CTIIdjEhHJmQVjMvWw5q0wSNnnHRsEjCPGd
cY4XTkVZqSD0dO7LV2ZUj79pBpMGI7a70ASHhpIekxwdMhfinAkZCnBUIt+/sMDH
ILxZapVvLT5dES437m0FEFQBMgYrptMo+fDbpHa7uYpywYrS2BoLif2sF6sGmJSr
YPglKi12wAOWgA==
=O+RA
-----END PGP SIGNATURE-----
--=-=-=--

