Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE5ECCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSzyKNmSYwrutfZc4jyjEPS30JfPjVOdeUjEIQN/4nQ=; b=ON1LLbsKKJcEQ8lWO/a2H3qoLl
	tUuOLfMSNlsbTODNsvaY960c2c2t77ZP9XgVM4o6uWP/Bbh390o22oxtsw8MS3sSPvsv5x8T9OGh9
	GCyZNpn0a7jDyEtjgQdgkHS1fh19+LAsZO7eN8Y+DXjSTlPOacxeRv1k1cFoUE4PB5uRctY64zr+K
	/G7XQ5/Mb6LLHG8EM8X9fKu9w0od+XVS5HPRigksEHr7XImhZA9yLyLWLkTw342Va9vDpMnMaDpxB
	Gz/DVZUHePBNTsTPkfcoIwYZgL6di9Frk0j4f4b/lxQd5AA9LtViVkybYL2tpCy18hc0SleH6qNgm
	9c8Wk/Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v942q-00000002E70-3pVv;
	Wed, 15 Oct 2025 16:08:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v942q-00000002E6E-18v9;
	Wed, 15 Oct 2025 16:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C101626B1;
	Wed, 15 Oct 2025 16:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65015C4CEF8;
	Wed, 15 Oct 2025 16:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760544487;
	bh=T0y5eIFSjnQ3NKyt3cDPuOjJjEWbutGOBAvGeGBCSuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uv5cY7w/e9ySfXqgSDXDW0M4XcEG/3Qpbf2WAwHBfBEDaEAe3f7qWZKfq5FIXL/de
	 YG5pyrV6Ep7+T0CYLxR7Wdivvw+qqvWHAOznQ3yu/gQbZym5RfxI4rKT8NPDYw+D6H
	 fVgicFgDTViffSEB7hnFAWg1Lh395dKjNg33JpXCGG8ctbatA2mMZlKTi4n2AAcby0
	 kK/wCmppJb/XtHQ5q1QldDx/jZd9f065uML/qZFkAZIAu3gsPCwag3ZN69bRDUJZiy
	 j6MpyjLJ0H6T3bnvJ+LRREFu8zebDlpJwhyRc1QLhG2Eh5KxnmvLiUUhcEsTrA3p6y
	 fL+4gPJW7zcWQ==
Date: Wed, 15 Oct 2025 17:08:02 +0100
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
Subject: Re: [PATCH net-next 09/12] net: airoha: ppe: Flush PPE SRAM table
 during PPE setup
Message-ID: <aO_G4qCvGhlXq_JS@horms.kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-9-064855f05923@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-an7583-eth-support-v1-9-064855f05923@kernel.org>
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

On Wed, Oct 15, 2025 at 09:15:09AM +0200, Lorenzo Bianconi wrote:
> Rely on airoha_ppe_foe_commit_sram_entry routine to flush SRAM PPE table
> entries. This patch allow moving PPE SRAM flush during PPE setup and
> avoid dumping uninitialized values via the debugfs if no entries are
> offloaded yet.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


