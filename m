Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50853C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNiqWei6bVR2lcSyh/W3av+DrOCPLtgDwruDBvw5w8o=; b=l1ZjYL8sFY69HsWNMoP+xYUrmD
	gYzuF5Vh+SuNXnKNjM3Th7veCa15bg3mOsTGBUbi+l/dlh4U3FGpncw/2SYY7vB/BJg5HG3vKOwOy
	dwswmlrQZ4jUF6KejoXO6luZLyKmt9oQmtky2b/aCFodURymw+gQw5aqXmrR1SvGoaf0T0CFpGSAS
	a9HQG2mWRa1Unlsm2xdd7PBvqT4HW7Mx7DqLkmN+qRm+S9CNX+X2lq1Uel2RC2CtQdGV6avpVE8Dl
	U0QU16VdW0DXxu50L1MRgiLu4Dk1xHyQRSPxbIxu96uBjW0heGUrt7moZge5BiElC7HrfIPQKHD7V
	3nPsQO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uo1-0000000BCqX-3OR8;
	Thu, 10 Apr 2025 16:31:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2trX-0000000B1oj-3jZg;
	Thu, 10 Apr 2025 15:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CECFE68448;
	Thu, 10 Apr 2025 15:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F3DC4CEDD;
	Thu, 10 Apr 2025 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744299042;
	bh=5zcV/CG8AMLAy9luku1LD5mAKplEIFPVlXKn8cKy+bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQLDv9fwNtDQlftYK63Xa1crTz3K3Nb0427ADYfWdru0Tigrvr36sJaABKHPdTC71
	 hAp8Y5dINwauilTu0E+12AsgghiralaNUR0SqRMla/1XR/Ktnr2GgVfjGCjXazY6Xq
	 Y7M4I6Nt3PGeHCu7f682d50yN1rMzvvC3ahQQOn5VdhdpUM0FtdCTKwDoc5AI4J5+d
	 eL4wHuU93NEBJxoRY5BTPkGCUTnuAAUG8EffgU3+4o+wsHrcZiu+yQ25ZPtJD+Txap
	 N804kSYEPBb14q0T8oF6BfXE0OW1ni0A27NHMAVJn2HBYw5X2aNpf4LTyXG9AUtlK8
	 VnQbMhmImmIGA==
Date: Thu, 10 Apr 2025 16:30:38 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add matchall filter offload support
Message-ID: <20250410153038.GT395307@horms.kernel.org>
References: <20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org>
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

On Mon, Apr 07, 2025 at 09:59:04PM +0200, Lorenzo Bianconi wrote:
> Introduce tc matchall filter offload support in airoha_eth driver.
> Matchall hw filter is used to implement hw rate policing via tc action
> police:
> 
> $tc qdisc add dev eth0 handle ffff: ingress
> $tc filter add dev eth0 parent ffff: matchall action police \
>  rate 100mbit burst 1000k drop
> 
> Curennet implementation supports just drop/accept as exceed/notexceed

nit: Current

> actions. Moreover, rate and burst are the only supported configuration
> parameters.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

...

