Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27925C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msQsONzw5o/yMkbC/i1/jrHLiW0z7BfiinQ4NyKa5wQ=; b=WIXunN0fqfly/V1F5vBvQV/NqX
	RBWaKkzDS2pA9o8bZrdY8fLLBQT2rwuv1FUI9tG9LkQ+OEi//d339rznlM6y5g9vk5Bi+Y49fJ+jq
	irQCpEqF7LHK6YkRj5Ej0zFQ0CiqsNd/Gw3N8PWWoZJguknMVCh4+q6bgh2ObY+oCjOfNEiukg0A+
	Sh0/aJtXNFKrc7sexXgrhMkqW4kur2oD8HlIvYWdTCq+VJSS7pkqiXnvXxU23GQlDAuYAVxN1QWHc
	A4tLiIq7bAfDF30ml1xbGqZxha6fRhjiUqVQZinU12+Zvl68IRqhM8gjrIyM+M8Xv8ta/yB5Rlj58
	HT80THug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlrf-0000000DQIZ-2G1d;
	Tue, 14 Jul 2026 22:44:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlrd-0000000DQHs-3Ein;
	Tue, 14 Jul 2026 22:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=msQsONzw5o/yMkbC/i1/jrHLiW0z7BfiinQ4NyKa5wQ=; b=kFoAi3hQmzxNwiJL33pGWZ2uyg
	pFtj7bkHrUVDSbAy6SZNLBAU360iI1pPJXgduH9vKNpekFhlv+ohsyV5c5Yk+3wV+GyeQqhOFM8ta
	Y9ZuiCv7e5SZJ7JdaVGumtRPw/c0gubnK7LSznsvMotK7U9KSvuo9hjFyJHo//q5gryw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wjlrP-00CGLo-Fq; Wed, 15 Jul 2026 00:44:19 +0200
Date: Wed, 15 Jul 2026 00:44:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, robh@kernel.org,
	krzk+dt@kernel.org, heiko@sntech.de, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state
 handling for Rockchip RK3568
Message-ID: <464cbdf3-2e9e-43ea-b30a-75b3d1b8a188@lunn.ch>
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-7-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714191341.690906-7-coiaprant@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_154433_835556_2ED0DAA5 
X-CRM114-Status: UNSURE (   7.51  )
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

On Wed, Jul 15, 2026 at 03:08:34AM +0800, Coia Prant wrote:
> Commit 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII mode")

You do not appear to Cc: the Wangxun NIC people. It would be good to
have there comments on this change.

> Fixes: 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII mode")
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Please don't mix fixed and new code. Is this a real fix? Should it be
back ported to stable?

     Andrew

