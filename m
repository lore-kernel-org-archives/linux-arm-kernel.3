Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1725C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwiN9uIekPVqs2tPHQHyZPTIBzCxWK6DUDHvufVw2Y0=; b=3lTKm4dUUxeV/T4qFpa+5lfbjP
	gGlvfQ3uGa2p/SfZI4jldDNq4AY9mmsd+H2fHsVfjhsWBIGzoveC22CCCkAXsWj0ls4CdlqZa1T2x
	i9T+CITjZ4pw4OraXXV974GNDsy5XHNTQOlgw4g3xGEQyN4Zdlxf8Qr1Rw5WIJZZCIiRXRT4Q8lCc
	PrhT9afBDZx+YkyszFAm44fW7j/540tOQsTsnRNFg5ytTp74ZX556bV5KPKCFC2TPgO04mgpVjGdJ
	iXoBf72UeWWpcSgKLK2pT/hkzQkLD3LItw9/Ak5TUkjPavMyWNZ4zzUImZGCNC7SNpFQrlXYWgUAX
	SzOHwhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1Xb-00000004YVC-204V;
	Fri, 16 May 2025 20:20:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1Tq-00000004XxZ-3JcB;
	Fri, 16 May 2025 20:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4DD8A4E9AC;
	Fri, 16 May 2025 20:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442C1C4CEEB;
	Fri, 16 May 2025 20:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747426589;
	bh=kAYAxVN/XM+RJhs5dx72zHiddu31wxM1RPXSf4aNn3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDkqBv4O178ZTcf1Plz6dK/m+qu+N7c/E5FVcdVPFbxl3og197zzPSE6WZSO6RQ++
	 vqh58pcKbjMFqmdHvK9O4ClqROEHvzc5dC77JOF1R8ZcidYMBwKchXO/k4Ee+VDnf3
	 6XMGd4vsJj7HooBTQetJz4G6wxshL3Je5VokIouAFrmi6gulN/parOqwDFfy83WUhM
	 3kcsm8bPcon+sR/KM4UWOmg/iv49g0jAeCtmKWqiZLIo7J82URZLgZ4VKTyhBCUTuy
	 xw5tJX0ICoi33n/oH7puYjtwZFglsxRTHxldAXl8IgLd9o40EXQHUu2aUXcWROKcIi
	 +8bCZ1mEmoOdg==
Date: Fri, 16 May 2025 21:16:25 +0100
From: Simon Horman <horms@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/4] net: airoha: Fix an error handling path in
 airoha_probe()
Message-ID: <20250516201625.GI3339421@horms.kernel.org>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
 <47910951a3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47910951a3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_131630_888004_E990F03A 
X-CRM114-Status: UNSURE (   8.73  )
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

On Thu, May 15, 2025 at 09:59:36PM +0200, Christophe JAILLET wrote:
> If an error occurs after a successful airoha_hw_init() call,
> airoha_ppe_deinit() needs to be called as already done in the remove
> function.
> 
> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Simon Horman <horms@kernel.org>


