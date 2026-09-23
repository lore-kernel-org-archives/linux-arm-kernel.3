Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB668C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKK7cLX2tCod48o8HN+nrBMshyoyneBxydRfhPU+VUU=; b=BLajqz0iboUq1fhF99HB3DtYXt
	iWIP91T8Te7Z5Ry0hSv4GN+RGaXmu/RLDYYkSGYpIZSq92wleedfquFAOBc6ZCqjOEHDNvPhfC3FS
	siKXHAAwpK2IoROTytk8kBNsw3hTwmOJtYZXmjOvlCxtNKYKlwL9IQCioLiaCpqiEn/e7bOlItFm7
	qI/1afRvPPzLWgDnItn7sysqIk9+p7f5XlvPihdMEg+5k7GFZsW6DFQABPQvMzEhjw9cAY6EZPokl
	zecFvf3of2BRS2PQiiMLjLDtkO6lumpHcB2x2d1WuNv/4avQYAvZu8WE0QTwFz3Wteplg5xy1LNNN
	DUtvmeIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CfF-00000006vrT-1K6Y;
	Wed, 23 Sep 2026 02:24:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CfD-00000006vqK-1zvF;
	Wed, 23 Sep 2026 02:24:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 891C56022F;
	Wed, 23 Sep 2026 02:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06401F000FF;
	Wed, 23 Sep 2026 02:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790130290;
	bh=eKK7cLX2tCod48o8HN+nrBMshyoyneBxydRfhPU+VUU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=S1VH6KZgzj+BfWsFvrsKHP/NHEfJPw7zaa2Lu3jbqKgkT+Hb5Yo8NWf/mBen9uump
	 AwWxlozzIuyDkOd1IPMAtQ/7uZ1Yq3EVz7eJ+CDXyCGVEL+cHmM4JBEFdvooCwrvOH
	 Cc7cDKHvySBEZ3z7qctXXxYURvMSuZAzci2UREjZo/7OKZpaIyYyYTXLTvkCcG9lUE
	 rYGCYIqnegmSTep/tKDXH93ZrzpwcomL39lEjoTMOZaCfEtuYPzxeRy7b1f4btKf2P
	 XEIIGFLwH/7KWjbr29FMeVeU9RpRmTImCY1Qy+wAriWHzXtU1U7DJfknoFo137WdKH
	 qiJ1O/clPCVEg==
Date: Tue, 22 Sep 2026 19:24:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Tao <gongtao0607@gmail.com>
Cc: netdev@vger.kernel.org, "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?QXLEsW7DpyA=?=
 =?UTF-8?B?w5xOQUw=?= <arinc.unal@arinc9.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 2/2] net: dsa: mt7530: trap frames to conduit in MFC
 on EN7581 and AN7583
Message-ID: <20260922192449.568e2b71@kernel.org>
In-Reply-To: <20260919065214.31604-3-gongtao0607@gmail.com>
References: <20260919065214.31604-1-gongtao0607@gmail.com>
	<20260919065214.31604-3-gongtao0607@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 19 Sep 2026 06:52:12 +0000 Tao wrote:
> On MT7531 and MT7988 switches, trapped frames forwarding is directed to
> CPU ports specified in the MT7531_CFC (0x04) CPU_PMAP bitmap. When support
> for EN7581 was introduced, it was assumed to follow the MT7531 model.

This patch does not apply, please make sure you rebase on net/main
and repost
-- 
pw-bot: cr

