Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1BBC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSebSgpK+gBMGRg8uELs+1r5jKnwccYomQ3BCVKWre0=; b=EfqsXEWWZ8Zg5Ma/f4oCc8Cwol
	ouUIhBJZmG9cdotW34wQbhREUYrPYs7R+qNXXcljoYFsryOHoRrHldu+ZCS6cAyrJda427r82IeA5
	opC+651soVpJ5m4HKWqG3FsQhRCALyq0YJml0bdubIfdCh84Uo1T4ew6CLK+Gb7QUNtpiED/QgSo0
	0RNJuIHeZ6KPpzWrDgoiHS8IK9a47nD5s0W6lrJzqv4X7kD7egrAJTyMNoflQnudt4brybqklfli/
	qQDswXBG58b7esj9804658f5Zh2J2Aew4vGQnNT30b3OOPjSsA5v1ZboY9RpvkjEti3SnuDo672ky
	aKYGPNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHwb-00000007gX1-0BWg;
	Fri, 07 Aug 2026 10:36:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHwZ-00000007gWV-3Spb;
	Fri, 07 Aug 2026 10:36:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 61E2D43C94;
	Fri,  7 Aug 2026 10:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C79C1F000E9;
	Fri,  7 Aug 2026 10:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786099010;
	bh=gSebSgpK+gBMGRg8uELs+1r5jKnwccYomQ3BCVKWre0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cHlCBcxdTbyWLqO6Wol/6WtVaemImlwOJp/79+naYm9RLswPzK3owhwaor/1vhsY7
	 0M167hORpdIQy9Hktbc1ClNNMFMFdCNcZpe5P9mBnztNUU2SgBhqCzzK3hmsUvSQji
	 pBNyewXGYIkHKnwE3DhE2Vz6n9e4VT1hcdCxi7083K+YMh9maV4bgXUvz6f2kI0BZY
	 UMSY/L4mCzPjUhdxffrZWwzENa2i+q04uiT4a1Og3zPD3bBvQZHQielaXmXer7tkEP
	 o2tqjDusx6BdaFNxf0qe4WpyUEnnZ8R/0uGuzusMu8R8bhdhZ+Kzieubq9y7j2mzea
	 4dM2fh6MmoJnQ==
Date: Fri, 7 Aug 2026 11:36:44 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Subject: Re: [PATCH nf-next] net: pass net_device_path_ctx to
 dev_fill_forward_path()
Message-ID: <20260807103644.GJ51943@horms.kernel.org>
References: <20260805-dev_fill_forward_path-ctx-arg-v1-1-f2873d941755@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-dev_fill_forward_path-ctx-arg-v1-1-f2873d941755@oss.qualcomm.com>
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

On Wed, Aug 05, 2026 at 10:53:09AM +0200, Lorenzo Bianconi wrote:
> Refactor dev_fill_forward_path() to take a struct net_device_path_ctx
> pointer instead of a (dev, daddr) pair, so the caller can build and
> populate the context up front and keep it after the forward path walk.
> 
> This allows additional fields (e.g. vlan and ether_type) to be carried
> in the context and shared with ndo_fill_forward_path implementations,
> instead of being reconstructed on the stack inside the core helper.
> 
> Update the mtk_ppe_offload, airoha_ppe and nf_flow_table_path callers to
> allocate and fill the context before invoking dev_fill_forward_path().
> The network topology resolution behaviour is unchanged.
> 
> This is a preliminary patch to enable HW flowtable offload for IPv4
> over IPv6 tunnels.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Simon Horman <horms@kernel.org>


