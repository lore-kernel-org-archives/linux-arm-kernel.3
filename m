Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E64F45A0C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 20:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beSRkMl/EZljPX3wONrLjzs8nZ/qaSudU/qHKAOssnE=; b=xMdtGyt+bazVyjb+01zGE8OOma
	giYTGqHlr758ax5M5BWiLFbG3k8VmQJLlFjd/KuwQMsyPEahmargzBv/Ze7NVPvueaKElnFNW8Ftl
	7q+Si1ZoYCf5b3v+NdzrKvYszRj0iDWHcICa4+NRKHKVA+2ad4FxpEvjBt4Gfw/Jn/ZuVC58uhH8n
	Zxe1imqoV6+61nsApS4MU70PBFSBOT0S3u1uFxfxyF4ddF+K83iyIkvOoBRp/qSuOFQmp4MCwzFUJ
	Z0IOiXOI2QPI732VAXA1Caj/ZNIqxlRI7AgmtHE6lbko56KLUxYrnFB/pc+C1GvVALSAPpaVc9Dhc
	ufrEnTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBInb-0000000Cmnu-2HZl;
	Fri, 10 Apr 2026 20:49:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBIna-0000000Cmnb-10d0;
	Fri, 10 Apr 2026 20:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D7A960141;
	Fri, 10 Apr 2026 20:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA9AC19421;
	Fri, 10 Apr 2026 20:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775854193;
	bh=BA4rVAHrRJzqSSgJrpMLT50mB/MklDSW0pj2JlzB7vE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KyVIhkT8XM9inBfNeWjmFSxdEzhz83AVmlYNyXhwaY0E3HVb8RbJaopAjQ8YBeugV
	 RqGuCy+Oz+mOhlVHYFEDF9y9zx+LX5cBCWvSVVysUyIQv0+oTQdY+lr8xHpFQXssuL
	 ZHOEWiBr63q34suV665uO5LK0jXLVhHq0BqBjX2YWqqkYh9HHEt5kVdhug+GKUafGG
	 wumlqC7N/G6ZyQ0+iIgDiuSMZIuVzRSt3U9OHDQ+36zXlEM18QYKIeB6dfYBdVStbS
	 mzfwR2IL5Judnz6GTRObeLKvyBnnOmcGLIc5JW9VSW4yNX4ZOmqb++eWWsfKoIR02A
	 rQwwBAU8mOqQg==
Date: Fri, 10 Apr 2026 13:49:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, Xuegang Lu
 <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next v3 00/12] net: airoha: Support multiple
 net_devices connected to the same GDM port
Message-ID: <20260410134951.6f4ee0f2@kernel.org>
In-Reply-To: <adiop-9Mo4ADfvfw@lore-desk>
References: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
	<20260409195950.74e4bc97@kernel.org>
	<adiop-9Mo4ADfvfw@lore-desk>
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

On Fri, 10 Apr 2026 09:37:11 +0200 Lorenzo Bianconi wrote:
> > On Mon, 06 Apr 2026 12:34:05 +0200 Lorenzo Bianconi wrote:  
> > > EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> > > Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
> > > manages the traffic in a TDM manner. As a result multiple net_devices can
> > > connect to the same GDM{3,4} port and there is a theoretical "1:n"
> > > relation between GDM ports and net_devices.  
> > 
> > Looks like this driver uses page pool.
> > If you're sharing the same page pool across multiple netdevs
> > it must not be linked to a netdev.  
> 
> are you referring to slow.netdev pointer? If so, this is not set in airoha_eth
> driver.

Yes. Alright, thanks for checking. Pretty sure I saw it set somewhere 
in a file called airoha* but must be another component :)

