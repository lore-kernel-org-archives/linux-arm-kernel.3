Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40119CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXtlwR+cKWGeAXn3H+Lf5Yv1kL7XUbUsrMYC6J2rcVc=; b=kGcCAiz/4kZC3m
	VCY9xzrPKZdbNfSECArOqp8oGhYs82EY5okRp9jqgExhArGym/uGgL8AhWwBLq4g6pOjINPUw/wjl
	+3o8/8X3e6XFiNUNbb14xEaNa8061rZOyqpAknM9nxgIxt9MCQwdG51Y/VF9G0JNxwLh17kYj5AAv
	wHaQai+W7aLjJL1CV1LQrdjXQgZ+RDKiziJ1zMJpbzAtCQ1H2g5RFZS5XCGkUE2zmKieIZF7I/PDq
	6MwEOLqPpj7RQmdjknJAliz0QPOt63pQDfDY7rFp29SIQzW2YsfizJWqCoM5MXzcPB0T7k5PfXhOO
	G+LYtsd+IUGdOAOZAEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwRg-0000000ATwW-2sIX;
	Fri, 12 Jun 2026 07:36:52 +0000
Received: from zebra.cherry.relay.mailchannels.net ([23.83.223.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwRe-0000000ATw0-1iR5;
	Fri, 12 Jun 2026 07:36:51 +0000
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 19D7C7219BE;
	Fri, 12 Jun 2026 07:36:42 +0000 (UTC)
Received: from fr-int-smtpout19.hostinger.io (100-116-180-119.trex-nlb.outbound.svc.cluster.local [100.116.180.119])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3CAC8721857;
	Fri, 12 Jun 2026 07:36:39 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Arithmetic-Fearful: 63c5ece7276c157b_1781249802002_3456694983
X-MC-Loop-Signature: 1781249802002:29651468
X-MC-Ingress-Time: 1781249802001
Received: from fr-int-smtpout19.hostinger.io (fr-int-smtpout19.hostinger.io
 [148.222.54.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.116.180.119 (trex/7.1.5);
	Fri, 12 Jun 2026 07:36:42 +0000
Received: from [10.10.10.3] (unknown [46.1.111.82])
	(Authenticated sender: chester.a.unal@arinc9.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gcBCl1z9Fz1y7P;
	Fri, 12 Jun 2026 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1781249797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXtlwR+cKWGeAXn3H+Lf5Yv1kL7XUbUsrMYC6J2rcVc=;
	b=ZeBrpYI6Dd/19gzwezL9s6dEWcEwXVPhMzaTBGzKwS8TIWcBSU3yoD7QKoZ3yBGWR+nrqg
	eInFGcClna9n7prMx+FJ6b33Zm5w33wIlPL5Od2HPMHlfENdEtHhdA9Iub80OstE3yDSBX
	UutJgFHpeovEWcFS5UQ4mqnuK9jPNPSPpEdvjU5Y+GVvL6WBRS/MGcW4H9eZ9dP/3zlI7J
	Yt5+qrOfHH9GMLKCfCTXqVR5Zxn2FthdUHqQhQhB3CsF26zCWxvHk4CCa7ir13RtDoYNFY
	lYAx1OuXCkt0u9l6a8Njq5H1YKm9zyPNNEijODSUqkXgsjGtusNAsoRm8S+awA==
Message-ID: <02ad5de0-ea6a-4267-8686-72e3f98fce4e@arinc9.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 8/8] net: dsa: mt7530: implement
 port_change_conduit op
To: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1781119435.git.daniel@makrotopia.org>
 <91ae0f87a6ca2cce3d072dba548545e02347bf13.1781119435.git.daniel@makrotopia.org>
Content-Language: en-GB
From: "Chester A. Unal" <chester.a.unal@arinc9.com>
In-Reply-To: <91ae0f87a6ca2cce3d072dba548545e02347bf13.1781119435.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 12 Jun 2026 07:36:35 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=6a2bb705 a=EYFf6tZZuEx+mizzmxfcTQ==:117 a=EYFf6tZZuEx+mizzmxfcTQ==:17 a=IkcTkHD0fZMA:10 a=VT4XjZGOAAAA:8 a=GvHEsTVZAAAA:8 a=FvUSNmnTzPuJ0QD-RBkA:9 a=QEXdDO2ut3YA:10 a=6CpsfURP9XNmmWg3j1mJ:22 a=aajZ2D0djhd3YR65f-bR:22
X-CM-Envelope: MS4xfPf9YvhCURV0HNIRHewhsgeJ9lEsWOVHOYoe2NIE2lxkmBW207FzjH+NqiB3byQJ0bAloPoh1NCmG2PgAFdt/QN7hkNG2SGyAMV4XomqSKlxpCttMUy5 s+QzPUrh17I0tW90nKrdo+RS3RYeD862Ks9jmvbyoaOY/jWi8O8vrClb6WmkCVwf1j9fnM2H1XmeyqkDfAG/6iAAON8+3kZAADIG92oUX9eOrEMe5AhBOp6f fOE1xNV66pSaBNW6YjWW9aFU9Bry5FQqphNAL2qC0aQz6DpUHP2AhI66bTwRSyQFTK1m+QJBCDCKZeNdzddGf8rQiFGiyomFmTKmTeSTMdqI9eKMvR9T2G+i 2Mu/cLS28ncEvQDD3vD5K3BS33LCxkOIPqw/XLG4d6mwXRZYtg9ibcZxDgXRuDkGSFtkwJ7h6FiPPRh78EXqnQFg74I+FJ53x30cX9m818PhBvRthI9W/Fyj urnwTraN9Cex6mcdm/Z4LjaJZgE4slbLiKBKFeqpJdcgQOrYK8taV2bqkOyBLNJh50N/iUSbucRzQmNv4XjdeFkRPh4uEVB/g46MCHu6c//OIis5e5indrdj dO1vybENR3J0C4iyL7jcmsyDD7d8kF8ajC9cUWQAXcAwUmFCPrdEa2+hOr+4GDKMGcRzXSb/X8bvu1BVjZpCXXio
X-AuthUser: chester.a.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_003650_560795_656F6EBF 
X-CRM114-Status: GOOD (  13.21  )
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

On 10/06/2026 20:56, Daniel Golle wrote:
> Allow changing the CPU port affinity of user ports at runtime via
> the IFLA_DSA_CONDUIT netlink attribute. This updates the port matrix
> to forward to the new CPU port instead of the old one.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Fabulous!

Acked-by: Chester A. Unal <chester.a.unal@arinc9.com>

> ---
>   drivers/net/dsa/mt7530.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index c96420c291d5..2f3e734b9f53 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3206,6 +3206,34 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
>   	return 0;
>   }
>   
> +static int
> +mt753x_port_change_conduit(struct dsa_switch *ds, int port,
> +			   struct net_device *conduit,
> +			   struct netlink_ext_ack *extack)
> +{
> +	struct dsa_port *new_cpu_dp = conduit->dsa_ptr;
> +	struct dsa_port *dp = dsa_to_port(ds, port);
> +	struct mt7530_priv *priv = ds->priv;
> +
> +	if (priv->id != ID_MT7531)
> +		return -EOPNOTSUPP;

Why do we limit this to MT7531 only?

Chester A.

