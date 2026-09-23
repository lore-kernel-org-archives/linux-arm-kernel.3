Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED7DC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 00:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzB1bIu4DCAXkv+EdyAIgxF9xElFNSnl6zM2ZgAtCWQ=; b=J4HBjYh7n/HS9VUhMQ5hclS9iy
	YY6WzmOr3uAXvdy9kJP55h69AW/t7rHcN8EcuLjymDI5b4VprAD7IQ5Essuo2G/36LDhPZTB8oH8f
	EYewcB48Ech150V3uTb+PYKpu7pHRLKcA/7l7s5tfaFxrqek0Z6YKGG4zpPr+VLfywGPc9wKQcFkR
	sTJYwKSQKl7n++u4VeG2YyGTzok7mQbzZE3xgSEoM11AOvjA9nkVieYwx7nJWXslJrNya2R2zdL2a
	i6t7hkI80ayCrjgsw7NFIyiIRWEpGOXxIm19cwYqWzJLDov2z/Uq7qy39YpB0vj/2P1cf5UZkFr/X
	XlTRmMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9AjZ-00000006mih-0AFS;
	Wed, 23 Sep 2026 00:21:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9AjY-00000006miX-05WK;
	Wed, 23 Sep 2026 00:21:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22DEB601F0;
	Wed, 23 Sep 2026 00:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2BD1F000FF;
	Wed, 23 Sep 2026 00:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790122870;
	bh=uzB1bIu4DCAXkv+EdyAIgxF9xElFNSnl6zM2ZgAtCWQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UP5W3GZlkEXz0RmChr/UZd5XuxVjbLtw/24ppTpDkV7iRPvGRVoFmS/7rTsUDKWbs
	 TQEuHvWtVPskwH4QBnZoOYuNkgZ8O3GRJGjuRxa/Wk+GgMAsQlJOow7q+0DcEFEmyW
	 PpyjJgWaoPsn3EZIY2g4hD8/DaiMrrWFQDaxiXQLvNUSA4dztpn8duHDqjKsP3rv3n
	 XAS7XoRlTEYPuWL4QpBOMztATDHSMTbO085x9nfyYi/uITT1IbqZr0ZYUCscLmLpFa
	 0x2SBL42d1tEDMDJb/u564g1YjuxtuFFkLhHTNDH4g49MEn7ckFtHlP9eRZb4gCdj3
	 Gz7d2tqU9o3tg==
Date: Tue, 22 Sep 2026 17:21:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Vladimir
 Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle
 <daniel@makrotopia.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell
 King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v22 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
Message-ID: <20260922172109.1e666b56@kernel.org>
In-Reply-To: <CA+_ehUyFH_ZSsjhp-U9WBFoRZR-ZMWnNQ5pY5vAy1LxUU5hSsw@mail.gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
	<20260915123812.14747-5-ansuelsmth@gmail.com>
	<20260921134410.13a7173c@kernel.org>
	<CA+_ehUyFH_ZSsjhp-U9WBFoRZR-ZMWnNQ5pY5vAy1LxUU5hSsw@mail.gmail.com>
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

On Tue, 22 Sep 2026 12:14:22 +0200 Christian Marangi (Ansuel) wrote:
>  I also didn't receive the email for the AI review... Did it broke also here?
> If everything else is ok, should I send new revision or maybe we can pick this
> and I can send followup for this warning?

Clashiko gates on build and kdoc being clean, to try to save tokens.
FWIW this is also how the CI (kselftests) are gated.

