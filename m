Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AD5CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+z2Cb+IYqw0oF+ulEcKkpYQyMc55w2fHKqiVKP4B0Y=; b=BVe9fnX94QGjvv/ih3xeG2K2m8
	WtKz7PfBU5QHP9w/Rxsb5Tg/G9jcXwtKQK99W7iEz2nZdm41ZvxSDdJr3o6zAWsewsVXNVYvfDEnh
	sBKejaF19/kjSyWr9azdJpfboV/1/EdxpbScc5ykIZjq+vahph/jo8b0eBO30uLzOpfom6UJUcnLX
	QTJlCgIuTmIngSubGjfC+Oi9D4aPXhghqxyqleOa5HuYLdguDStIoNhgEHZmnf2qlJwe9rHWCEp5u
	EGYUBOnlBvhAdSp6PNYgA/3o/d3IBUf704/3qwFoXKOkS8vFL1bDtAD0FGXhNN0HTkv/IiLdtlR8B
	OELp/8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe1j-00000009Lbh-3bna;
	Thu, 11 Jun 2026 11:56:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe1i-00000009LbY-3DqP;
	Thu, 11 Jun 2026 11:56:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F9B342D51;
	Thu, 11 Jun 2026 11:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1721F00893;
	Thu, 11 Jun 2026 11:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179010;
	bh=p+z2Cb+IYqw0oF+ulEcKkpYQyMc55w2fHKqiVKP4B0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MtrwLgQ6J4LUv5hkXoos/e/FjkDLL6BZyozh+84eapQ9D2wJMrgbqwkUAv3fsfz+F
	 idy+h06nwp0JIQwxvFRUpDpanrKXiQnK9Z3ahs4nk00LPBCBa3hChS5q03HlshSwoD
	 SsNJU+UMmmYmNeibXZbIDEsM1ALvmER06/OnYwj+q39Cye+d9ueGQ2TqlYxq/XW8jt
	 zljVjt+lRe+VZyoL77vWTvnZDLWu2k8D9eWTRR/gpsTWdCYXVH2YXGOoYM28LpTAp/
	 NzTRFnrisXo/0b7wFjeXpvZIhlJDR8EcZ61tDzi1rbDz0pz5AILFzPdApUPBhj7zCA
	 uL5qKlJMzsFrA==
Date: Thu, 11 Jun 2026 14:56:46 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/3] xfrm: extend ESP offload infrastructure for packet
 engines
Message-ID: <20260611115646.GN327369@unreal>
References: <20260523121522.3023992-1-hurryman2212@gmail.com>
 <20260523121522.3023992-2-hurryman2212@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260523121522.3023992-2-hurryman2212@gmail.com>
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

On Sat, May 23, 2026 at 09:15:20PM +0900, Jihong Min wrote:
> Some ESP offload engines operate on whole ESP packets rather than the
> generic software trailer layout. They can generate outbound ESP padding,
> next-header and ICV bytes in hardware, and inbound decapsulation can
> return an already-trimmed packet with the recovered next-header value.

How does this differ from the existing IPsec packet‑offload support in the
Linux kernel?

Thanks

