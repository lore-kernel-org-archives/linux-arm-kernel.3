Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9398F3D616
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INKh6Tf9/+Lv0D2IsKobLvoX5JdxAlriktIbLJ9mA5Q=; b=b3lAuDmGYjMfTupcpKfsFKhLpY
	uysjZTxgEC7TMsDUnITIt8mA4/ZdqjqG+7T2DZWXKVj7kClkklXnVE15YmBxLVTjCV0q+v4OxOOny
	6/aFMxHMvPqi0568at5KGmbDLaVhH/5XHD7hIObNA12kA301i4/PllgvcFD2krpgfljktwr929663
	FRQgFzq44SwFvzkvGLHCRDkm0ElD51v6iObsmKdV4OC2Ufc2gDY9835B1ZuY3iwLRn/zU+psFxlPw
	EC0q3JXQV1fF7kikojlhQPzDPL3CwEJ+gsd/UiEg5AyOTZ7DOI900Dt+49+L7uTGFnGFjNDwz4KtH
	zBXTQpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6u4H-0000000ACrm-1KFM;
	Sun, 29 Mar 2026 17:36:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6u4G-0000000ACrD-0Glo;
	Sun, 29 Mar 2026 17:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3518600AC;
	Sun, 29 Mar 2026 17:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FC4C116C6;
	Sun, 29 Mar 2026 17:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774805814;
	bh=INKh6Tf9/+Lv0D2IsKobLvoX5JdxAlriktIbLJ9mA5Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OXxPKonGybrKSvL0N7Xkeuru4Fe5bfOR3H0iVqvuzkxbjtzINxwtjh+btmD4KYSyn
	 v/cssZIm8RIrNDnvUlbiHGfGIiFSsNLXWmgJabE/mfq4HOZtz1PrMFtA7wjH/L5ICZ
	 qWiw27sLVcw9jqQsmn1z5I9k+pIXtdGg/AOBVEH1EBApvLPnyMJfK5AMrP9qF2E8Xo
	 2/HWCYCJlwrytob387UUCTMCFTBa8gQys+Dc3czh8niVjASdx94/MihWEYEg6jg5rA
	 XJwkbb8QN+utfycn+R/W7kKZegwCYncIYYBnvaJJEtdUKrLgQ0aOyzO6QIcAyguCrw
	 GUOqzBPxEbUxw==
Date: Sun, 29 Mar 2026 10:36:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, Xuegang Lu <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next 00/10] net: airoha: Support multiple
 net_devices connected to the same GDM port
Message-ID: <20260329103653.7593cbb2@kernel.org>
In-Reply-To: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
References: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
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

On Sun, 29 Mar 2026 15:07:50 +0200 Lorenzo Bianconi wrote:
> EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw multiplexer that
> manages the traffic in a TDM manner. As a result multiple net_devices can
> connect to the same GDM{3,4} port and there is a theoretical "1:n"
> relation between GDM ports and net_devices.

Does not apply.

