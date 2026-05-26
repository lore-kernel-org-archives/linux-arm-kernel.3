Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82573CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DdhusNN+vFuzB0PmOPfndHbDWMKZxSYmfD1KK2/m2E=; b=lc+Swfhefz8/3NJOmWr8nP6wlX
	gAsppSRlxeowM0OAZbAszn/RWGZcWTlzuLqxQjpRpgG47kpmKLzlQlQPreehUwSO/VGkpFS/zUgde
	HMaKhsYyqfXA8iwCi3ZX/QTUc4D3s4FK/EfnkkFdZiQjSXEMDQE9cdgkyAjfnD2GDaX8dmVdZza9S
	JCIZClA3F5aFk2zlU+LcsrVwm4tkrAnOXpVpjt8yw4houCr7bySOVAuhwNmhByzI1IcjBxT1TbG2K
	WTpbLXSgCe4WyZxCXJm/45JB5YhwUb0Kru9irTXi3JkaHjp5I4X/P2UffjCgxTGOiAtX6SIohnu0L
	gj0nL2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRr4E-00000001wHP-2vvO;
	Tue, 26 May 2026 12:39:30 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151] helo=fout-c8-smtp.messagingengine.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRr4A-00000001wFL-3vKF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:39:28 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 5C6CC1D000FB;
	Tue, 26 May 2026 08:39:22 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 26 May 2026 08:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779799162;
	 x=1779885562; bh=2DdhusNN+vFuzB0PmOPfndHbDWMKZxSYmfD1KK2/m2E=; b=
	Zl5C97iHWwzX+s65iHmz4A7cBN0fMHPEaOtqEkDv/450rxtnCqAzaF40910/sCx4
	XsRkbYxxcRcJTVoVS+Rj3CPRkoTR9FAbkbgVlrTgwnH+fLNR3yKvTxYz6ozFJzD9
	5yuPXhM+YyiHfrD1U1I94zpXS0nRa7zJJbPfxDZB83OlxXFH7Sx7iMdObzT4nZ/9
	QyTXQ3GmYNukhtaTlyjn9nLG+6lJtoSVkxHPKo73M27e6ePO6zH7IWFSBDvwofzZ
	JEKmEpOKHioFh4cFGmWvg9g1WoRdoeyJvLE+MfZMXBSlr8H3FjsSj/lZTUDr3DAI
	5ctlqw67K0myRrIqnqoL/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779799162; x=
	1779885562; bh=2DdhusNN+vFuzB0PmOPfndHbDWMKZxSYmfD1KK2/m2E=; b=W
	fRF8GIYRCMPR3lZ7dpGkTUoJuGKwURAj+8OZAfKcst2nL0NeRhZT3yRPm2KmRbOP
	Pg2f9wF6MPHE03aMTf0a4d/Ez2Et0VujQWssWiz1GQy00aCIhYmFBFo/oj4IWcRZ
	6fZuNjhGAfqa9tybpKAplceAM02TwxPiB2CUU2zcHQ4X/GkAemgOG9eEalZRme3e
	KNlZieVVgZrtaN0Tw1PBc2OeZKKNGjtL5+BnrwDBK0IoDhIqItOe3DQ/MU7GUM8c
	iBcnhtkmLvQ6JqQcXaqxQcTUzi1RBhT1HCSq2Oxf2OZJbw9rhxJE7ok8jECbXBaz
	iME8iqB/zw59FnQTo+h7g==
X-ME-Sender: <xms:eZQVanw1i65sp2LVimLDuabU3-yASNQPQj7As5LwwpnV27NmqNloJQ>
    <xme:eZQVaqEBMhWCcmZ-9c-O9nLEdjSvBHkK3jdYjOZX7s3T0_F0CZ8OQyrNy5dRMKv94
    iSaWwPDo1IurVvRVrTjAMWSxL1NCj1cwauc77ehoF1T9q1m6kpjqEg>
X-ME-Proxy-Cause: dmFkZTEywkXow3xdYkQ2bDUtuiNbW7HPTteV8VzeERFNC0X3krSq4Ztmxvfvo6lBC3mfHk
    nIOsh5OPxI5m9OkJYF5SpKXCL0JPa1nAwM4dHAgWRKmM5SD1y0YU3ZEds98AJZO2aNgC8j
    zzzgjv6EQVgcIXDfju67LcVJpmmJa1u5qE2m+i8WyxOoLatK9rZaqTmq+Chxph1tcZy6Rl
    gTzCoeLg4agwUggTSBIMIuJWS9zV2ihi7fFBfzxQBNcZLHVyYWYmrgQVAarNy80TcBgYrM
    I5F11ACojSxd2njeimht6MiOouBM0c7tWRJlPYuirsqeO1C1G2wz8aGh7V0B9KYOs+fuf0
    QWibBSswoX2aPbe5RpZ/T5/5VyXZ6ici5TcgaxQRbckIofh1dZ3vi2LHFvxvVf/zw1grSy
    TiFbYmEapVu+EvbVggQzeocyApFx0GmICq1JbLoPZtt68MV/RHZYiHjz082yl3d4xSRIe3
    7q3Tn3RFm9uDbM+GhABvyKx2DcAodSaFPYbYOTYSg1zpgNzA8elKSiy+uaifiZX3GNtC/x
    AsDSiCan2W+1fKFlBxfg2RjxvJVGiNVr5S/0feP5fMpdG4S09OQObqy87wJ/x/QEUA7guh
    WSBRWIsFhVA0TbqVIC33cj+SAHLUdeRWMUKNoj7e2Uj6A1+McumjsS9Oz1fw
X-ME-Proxy: <xmx:eZQVah4bs_xWeiDDQibLl1aBwgYGX1cCRJ38kh4WBqDH10_9gDDYfw>
    <xmx:eZQVav39f8LPj7xgJP3MvokKe5igghtVltfyKfZezSrQvzrup_8Fiw>
    <xmx:eZQVaox4mTj8r5t8eDA1jZs5joqKPISo1WMYqZGbZsYhT5UMPMhqTQ>
    <xmx:eZQVaonlNzLHp4EPnefWPUG_OJkRaPdx-UyE3T94ThcfHiWSuoKH_w>
    <xmx:epQVakkNsMABvUsRVbAnepaf_1q-zRd7bKVxZUmYdvNcFqijiIjGZK2h>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 89ED7182007A; Tue, 26 May 2026 08:39:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AuWQEIBBqPC7
Date: Tue, 26 May 2026 14:39:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Wei Fang" <wei.fang@nxp.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Claudiu Manoil" <claudiu.manoil@nxp.com>,
 "Clark Wang" <xiaoning.wang@nxp.com>, "Christophe Leroy" <chleroy@kernel.org>
Cc: "Andrew Lunn" <andrew@lunn.ch>, "Vladimir Oltean" <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, Netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-Id: <ef1435b1-0cce-4f15-9e4c-0e9d50a9e1ea@app.fastmail.com>
In-Reply-To: <DBBPR04MB7500D92831D793CDD1D562E2880B2@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260526102708.2837129-1-arnd@kernel.org>
 <DBBPR04MB7500D92831D793CDD1D562E2880B2@DBBPR04MB7500.eurprd04.prod.outlook.com>
Subject: Re: [PATCH] [net-next] net: dsa: netc: fix enetc dependencies
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_053927_447436_97750B71 
X-CRM114-Status: GOOD (  10.31  )
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

On Tue, May 26, 2026, at 13:03, Wei Fang wrote:
>
> Thanks for fix this issue, I have sent a patch last Sunday.
> Link: https://lore.kernel.org/netdev/20260524070310.2429819-1-wei.fang@nxp.com/
>
> I think the solution should simply be to add
> "depends on NET_VENDOR_FREESCALE", right? The changes in
> enetc_mdio.h seem more like improvements to me.

Yes, the added dependency is sufficient. I removed the other
change only because that was intended as a workaround
for the same problem but was incorrect.

      Arnd

