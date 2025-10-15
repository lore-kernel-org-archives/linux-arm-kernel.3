Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E53CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxNI74sDYCfMGVpriVpNCzTyIEbehNGoBPNsZ9VoCWc=; b=yHbzDoEOo2AaeZDXbk6igMk42i
	RE6W5veU6NR/Sph3eMXzo7czhGVM+OG5mPBD6FEuhuEu4Q1jnGjgMFlMuDaxwqoRP+RxY3LRR0c89
	pCROanBdVtCuFsSd4w9zIqhpyfjbiQ2PAEU3hpVE9s2D4XcMPhF3Vd+zSijagQ5djmiU+omDTLR9Z
	k2fJlamkd+rFdf6uSEF7Kj2p0daKTf0GjnzSqe9ekrFdKbyhDUobeyi5NPdmfic5D6YiUHbY2IlMK
	i1TSXSNrIf8rgGGaX4Low+LL+rLFJLmr5q6pv0dt5gVU0Dx9s/rAbXEIkpal6eyTVz5huyr71ofV3
	nnIAHMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93pz-00000002BO7-0grD;
	Wed, 15 Oct 2025 15:54:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93pv-00000002BNk-3iz4;
	Wed, 15 Oct 2025 15:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86CD444B6C;
	Wed, 15 Oct 2025 15:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF501C4CEF8;
	Wed, 15 Oct 2025 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760543687;
	bh=3Gm4tGlsOa8Zx34REOY2GFsAOIWAL2jmXbC0xdevdvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KaDWqTDSd7SUVWENYTiRxcIxnRzoZ2bTFmLk4YnY3qGkm/yw+3tIP90tP55fqRoil
	 1CJYiJmAF5Ub5AhPuSlXvHIWKctoqfrpUsk7MFBBCM3AvUGNGKVZRL875EWu+XogG8
	 ojtCGeAqRe4vO+HPSCqRub3vJfVEvO6gGcyhBdqM2+gF+PYsG2HjEXIbvTmuVGFi4Q
	 WeDMuiquYDkT6xE1EsRoW3N84Azy1Yy8aC3TEbt1822FJXkI66MkuJrNrwzWlwgNdt
	 FNIjjK8CihdGs5VP1RT8ca6qnC/Y7fEwsaCH1BgqlQZ8qdol4LRLEIM2cP9nVGGUtH
	 UMCYLdm5Vr0cw==
Date: Wed, 15 Oct 2025 16:54:42 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] net: airoha: Select default ppe cpu port
 in airoha_dev_init()
Message-ID: <aO_Dwn9r_32-U72N@horms.kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-10-064855f05923@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-an7583-eth-support-v1-10-064855f05923@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_085447_964892_8625F669 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 15, 2025 at 09:15:10AM +0200, Lorenzo Bianconi wrote:
> Select PPE default cpu port in airoha_dev_init routine.
> For PPE2 always use secondary cpu port. For PPE1 select cpu port
> according to the running QDMA.

Hi Lorenzo,

I think this could benefit from a few words around 'why?'.

> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

...

