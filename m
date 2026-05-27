Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D14BCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIpiJo4iCvjtRLJCUK0kvO6KWTuUncctdjuI6Z6+PQ0=; b=YgehJEVPuhZYI+j441LXbwWxLy
	2Z9Dbg5ZHxyNb4UPVxx8Icu7QqUmtX222pIy/NgEKUZ012Njgt+/AxVoRiLOHTXDe/1k7PbdwpcKK
	WD+aC9Ph4O03gElI0gSqC8nHfSErI2sVnaxyA+XMreNae9XHmT0zIYwenYO+fE0+lr7xUjE1eJTII
	rKbC5kxFCWPw2Fvg5i3EY44ey0e4U6UPKYpS4JfjZgQj5D6SrIbsk/NvuDGJtxNca2XOROpnbu2vQ
	IPM3ureFFIzD9EJ4dZLsRMdk/1ZPQ1sZljWfl5MDP0Xdv3eUo6rHRQQcRh6C+IMhFRxj6XQfnb2VK
	+5hZEK1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBBh-00000003ibb-0PpC;
	Wed, 27 May 2026 10:08:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBBe-00000003ib0-2fms;
	Wed, 27 May 2026 10:08:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF222405C4;
	Wed, 27 May 2026 10:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07581F000E9;
	Wed, 27 May 2026 10:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876509;
	bh=rIpiJo4iCvjtRLJCUK0kvO6KWTuUncctdjuI6Z6+PQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KWf39RvxLmV0Nl+vilSfwl74YjQVWACxnTiCx26aUEnrVpysov1woI1ljZ4EzWiEj
	 O77lDsCAYY4natY2LkN9j/GTMgByYhWJJVmkx313bM2kkmuoDwcdv0Cy0SDQaTnKwT
	 FWqBcTOn94EmVWgTzreCduP7PpjwFiiDOAflX+ojBb8JFCvQDo40Wp343CI/zD9AVf
	 VXZFU0Wx6T7z1y4YJ62BlNIJoRZARcpBPtONaseHqRAw1VyjweXf9nR8+rtsaSbT6D
	 RYuQn1sgnH1Gr8QNc5c7CxtaWU3cGE/+GyehXFvY3X5d8oBb5F+8w3a6k6fS5ErlM1
	 ILpuLr0yq0bCQ==
Date: Wed, 27 May 2026 11:08:24 +0100
From: Simon Horman <horms@kernel.org>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH 2/3] crypto: inside-secure: add EIP93 ESP packet backend
Message-ID: <20260527100824.GJ2256768@horms.kernel.org>
References: <20260523121522.3023992-1-hurryman2212@gmail.com>
 <20260523121522.3023992-3-hurryman2212@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523121522.3023992-3-hurryman2212@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_030830_694605_F5B816A6 
X-CRM114-Status: GOOD (  14.05  )
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

On Sat, May 23, 2026 at 09:15:21PM +0900, Jihong Min wrote:
> Expose an EIP93 packet-mode IPsec backend for netdev drivers that need
> ESP encapsulation and decapsulation offload without advertising EIP93
> itself as a netdev.
> 
> Add provider selection, capability reporting, SA lifecycle management,
> IPsec request completion, and provider fault notification around the
> existing EIP93 descriptor path.
> 
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>

...

> diff --git a/drivers/crypto/inside-secure/eip93/eip93-ipsec.c b/drivers/crypto/inside-secure/eip93/eip93-ipsec.c

...

> +static void eip93_ipsec_abort_requests(struct eip93_ipsec *ipsec, int err)
> +{
> +	struct eip93_ipsec_sa *sa;
> +
> +	while (true) {
> +		bool found = false;
> +
> +		spin_lock_bh(&ipsec->lock);
> +		list_for_each_entry(sa, &ipsec->sa_list, node) {
> +			spin_lock(&sa->lock);
> +			if (sa->aborting) {
> +				spin_unlock(&sa->lock);
> +				continue;
> +			}
> +
> +			sa->aborting = true;
> +			found = refcount_inc_not_zero(&sa->refcnt);
> +			spin_unlock(&sa->lock);
> +			if (found)
> +				break;
> +		}
> +		spin_unlock_bh(&ipsec->lock);
> +		if (!found)
> +			return;
> +
> +		eip93_ipsec_abort_sa(sa, err);
> +		eip93_ipsec_sa_put(sa);

sa is the iterator for the list_for_each_entry loop.
However, here it is used outside of that context.

	"If list_for_each_entry, etc complete a traversal of the list, the
	iterator variable ends up pointing to an address at an offset from
	the list head, and not a meaningful structure.  Thus this value
	should not be used after the end of the iterator.

	https://www.spinics.net/lists/linux-kernel-janitors/msg11994.html

Flagged by Coccinelle.

> +	}
> +}

...

