Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7315D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GjlUH9L/;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=WHEv8Bmz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FBjIBgDWbZCo9SaA6U+cSq8TU+erFs29CF/2hr/QbOQ=; b=GjlUH9L/EsojHc5d1meYvoLg5r
	4bAPruyOtASmYnI/o/TjyfB3eycNbIoE1FmGr6cTrj/3yFqcnEMBX5h+aH99Dvp9nZY1P5XGLbAvD
	qlaciV6xLMouofC7I8mlW0NaRrQR/lgYIo1l17zLvweW2S9S8c2x1kXG/gf6EA287zvblq5LHGafc
	glVdMRlTtdgLVqnsl1mgGKr22VPwBxtxgWVGnsbJWK14mMClMyN1nDwXjoRTeqd5M3qDMeRLAF3AK
	oei01qO45esxMFqPHo/e3mZnD0KiNLbxzG/nmkZT7h3/EgeQkS0jkSyhHxOPQ+4J/uEtjDQnrseBP
	3bgdPSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJP1-0000000CLv3-20CU;
	Fri, 06 Nov 2026 12:50:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJOx-0000000CLuH-3kBj;
	Fri, 06 Nov 2026 12:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FBjIBgDWbZCo9SaA6U+cSq8TU+erFs29CF/2hr/QbOQ=; b=WHEv8BmzZlBskbtiRsC4Yz/6tF
	lVJsH/z7pFdPbcrteUfO96lrIzu6yFa42ask2ACLtB8O6uGMAjJ5FkSqxMKs8yMyT7o7Hs0ZuH/2N
	4GkPXRnZ7UYI7WmuDLcVG55y5hJJHUVGaRsnVFAvyX9zV/fjb9Uw1RfdJCS97gPuNrho07j/aW+1F
	pOJern4i9oeuE7j8otJl9949EwHRfUv+7LRx9Kd4TbmcROCdlLLufc3Qteg0RmyjsU3rG6JeoPs2K
	k++dAKZdxZIbbcOTn+0G93w14T0clcHEu2gUYgi3SOM1wcSDowGQdPNb/nXXKvmf4sWXrtqwqUcHH
	TaIrvW+A==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Oliver Hartkopp <socketcan@hartkopp.net>, kernel@pengutronix.de,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, 1579567540@qq.com
Cc: Cunhao Lu <1579567540@qq.com>, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v7 0/7] can: fix bus-off restart and device close races
Date: Fri, 06 Nov 2026 13:50:20 +0100
Message-ID: <16255046.uLZWGnKmhe@diego>
In-Reply-To: <20261106-rockchip-canfd-restart-close-v7-0-accdb11bc845@qq.com>
References: <20261106-rockchip-canfd-restart-close-v7-0-accdb11bc845@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_045040_173631_18B4C159 
X-CRM114-Status: GOOD (  13.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Am Freitag, 6. November 2026, 10:37:19 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Cunhao Lu via B4 Relay:
> This work started from a real failure on a production robot using a
> LubanCat-5IO with an RK3588. RX continued, but the TX queue remained
> stopped and subsequent sends returned ENOBUFS. The interface still
> reported ERROR-ACTIVE, and the hardware indicated neither a bus-off
> condition nor a pending TX request.

[...]

> This series depends on the three patches in "can: skb: make CAN skb
> freeing safe in any IRQ context" [1] and the three patches in "can:
> rockchip_canfd: fix TX stalls and races" [2].
>=20
> [1] https://lore.kernel.org/linux-can/tencent_CD05F020BAFB2537F5D1F4CBB42=
5588EA80A@qq.com/
> [2] https://lore.kernel.org/linux-can/tencent_E25C9BE6689264E4138A464803B=
810FDFD09@qq.com/

Both these series are from july and seemingly from before you started
using the b4-relay. So they may or may not have survived the kernel
releases and their threading is broken both on lore and in any maibox
they arrived in.

And if there haven't been any responses to them since then, I'd think
they have been lost or so.

So I'd suggest rolling both your dependencies forward on top of the can
tree and sending them as a new version, so that reviewers can find them?


Heiko



