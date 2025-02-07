Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A15C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiSTmHdleeT9noz114pubiKUPkrwZ5cqYyi8sNYyACM=; b=X6JRmBI+N9v2ihIvdS84rv8BA/
	iMp7zU50CCJ/0fqsQOmiVas7QQ9u4Ps8GuAq6juiY64xCl2Ka3Hp1HEQJp6wQZ90ckQ/icqhGnJR9
	3tbGzmWGnsxHGnI1hJoiSE/Dg/f4hvyv8Tv2UJNFGJIGQKXXWrWSQJP2/fZYg2cXocP0663VhNAwA
	I2KhjXs3FsudsFFmZWsO9b1lMgT//lvLOvwCPdYabYbq9TMsPG+D5yoWRuAV/DbU4/m07dUQMo6px
	Pmc2o0aLLvFxtMg+VWx+xdNxrgwb/1i+PTHo/917GnHwTR/hpVULOTOpuUJ92G9g1j/KeRpuCgwx2
	bu1q4d3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL5k-000000097bG-2BdJ;
	Fri, 07 Feb 2025 09:56:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL31-0000000970o-0YNL;
	Fri, 07 Feb 2025 09:53:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFD925C4C11;
	Fri,  7 Feb 2025 09:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7681C4CED6;
	Fri,  7 Feb 2025 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738921998;
	bh=zEp8Uxkr84jq3Q1p4fuCS7o83LuStOvmC/R8ERMZGxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h65NkVK5Sp2r9IKWzJJR3f1XO8G+XYPs83bRVyFqsYjzfz7s+dgHdtyr5ppzOckSe
	 j+WL3TW2yCTHmjdNvZSR8Z/rPq/ZpGOaBMkXcmfUe8gkgv7N1aQ2IxmA4Xohd8pdXF
	 qXIJac7YXGSI6w6BT6VdY5GyDLh5unxKyDRfP+v2ksXxMEtEOmjvbkubOwDwNyDKNF
	 liqhL7Of8oF7L+3kjLNpjbqo2feit6fJ2h8NLs+tTzPNIB+M9Qf5caYYqWFu5vzqyR
	 q59BSO22lvNJ2rO3855//6Pbh1FdKhCtAUkPPkecPyXR+EST4JujjF2Bvn0yNkEPCK
	 G8xQKQuPWAxQQ==
Date: Fri, 7 Feb 2025 09:53:13 +0000
From: Simon Horman <horms@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH net-next v2 6/7] net: ethernet: actions: Use
 of_get_available_child_by_name()
Message-ID: <20250207095313.GH554665@kernel.org>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
 <20250205124235.53285-7-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205124235.53285-7-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_015319_210025_BB586A0A 
X-CRM114-Status: UNSURE (   7.82  )
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

On Wed, Feb 05, 2025 at 12:42:26PM +0000, Biju Das wrote:
> Use the helper of_get_available_child_by_name() to simplify
> owl_emac_mdio_init().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> previous v2->v2:
>  * Dropped using _free().
> v1-> previous v2:
>  * Dropped duplicate mdio_node declaration.

Reviewed-by: Simon Horman <horms@kernel.org>


