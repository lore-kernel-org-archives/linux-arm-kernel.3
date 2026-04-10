Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A06F36BA0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 02:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLXmBUt+5y/LI0drG1RByAqBpv7xchmUlLNdG+XBJsQ=; b=c46qtB1sGycojHJAHRzr6ykdCF
	0BXfkUx/s8svuvzo7Sm+CxNHC7vSFHiFTiYFdXH4wIfgUptP5esMKMOFdM6II5m9YJdF8BAssV1np
	Z8axwzhFyWLB00UaXb1i0N2e/cWyfwQoK3yT1694sV5bbU0o0PCROwoqzsNWwrvJeRxgpsKzIjOAh
	N0503j4fC0V3NJ2/CeDWk4umiF3+ELp6VkgVPMhKPoHg9q8ih7PSbrXViT86bWl+288jlnEH0gyPe
	1tDZzZPyp4wNngJDLdw1wr79/NhjSYIld5XE81iX0zrd+9IjXf1jOnaoBrIGyqFFzWq03fErIH9of
	GXiJn5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB267-0000000BVeu-1xU3;
	Fri, 10 Apr 2026 02:59:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB264-0000000BVeZ-2RW5;
	Fri, 10 Apr 2026 02:59:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 244A243F56;
	Fri, 10 Apr 2026 02:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401BEC4CEF7;
	Fri, 10 Apr 2026 02:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775789992;
	bh=MLXmBUt+5y/LI0drG1RByAqBpv7xchmUlLNdG+XBJsQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ET+FxGEvFyK5aaK+ipK1ANSh6vQiJyeax0/cD9WmrzLEe2QVyFmRKPWqSObyd+qTJ
	 QSzcUj6m9S1xblsfE44tUvjCAFeYDYC9srazHTj/qsl1mlRTo8vOed9ZeIdSZq6j7D
	 pudl4tcKOjQ2p5tL1gDhD9kNHYDRC4/08SXGsCQlPrs2owo9yVSh3EjVx2JgOqXO5M
	 ajsOf01oae4IUhmEzFaTSw25ZjdD4mYq3oljBQ4Ou3QbodLrpUdlGjyZgIb6Z5XONz
	 IqOPpMtRgIKjzB4McPOuCK5kiTFI53fID9YsKYugOxt2j3/HAkavSgktmlQwtn39rz
	 fVv4wwHryhw8A==
Date: Thu, 9 Apr 2026 19:59:50 -0700
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
Message-ID: <20260409195950.74e4bc97@kernel.org>
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_195952_650647_1591DDA3 
X-CRM114-Status: UNSURE (   7.99  )
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

On Mon, 06 Apr 2026 12:34:05 +0200 Lorenzo Bianconi wrote:
> EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
> manages the traffic in a TDM manner. As a result multiple net_devices can
> connect to the same GDM{3,4} port and there is a theoretical "1:n"
> relation between GDM ports and net_devices.

Looks like this driver uses page pool.
If you're sharing the same page pool across multiple netdevs
it must not be linked to a netdev.

