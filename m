Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1541FC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKJrBHLETBJyIa6CWPgESXEOaNq+UTvSooBi5VGZCG0=; b=QHu//Njf49054rf9NAejyIPaQA
	sfKoZth1YiJQlNj0mGzWN2H5YdmCQypX4e2YXtRvBxfPfvMpWO3/rfp/MzJejqW9RrdEHyFxT815Y
	/HOBkvks9y3zhDhLhBZl1mC/LDH1WnqmN2bog4Uhs2fx7jLDeuMsN8QiJOFF1d6TqwDY4Jimq3mBG
	QGMtxhSOthoAv4xvnm5rLUeMXc+HqhTtjCEbgM70Lu8svfgq5mbdGIcJmJgy7pN94Yf3NYbrYssxZ
	T4gB2PqldyOknApBJoUX1g4e1rzHzJDvtttiMqjJoeu2H2MIdv3DYN6PKR8yX8KaouZW1EMdb1wpn
	d+NX/DkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9InS-00000007d5n-0YSi;
	Wed, 23 Sep 2026 08:57:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9InQ-00000007d55-2Rxl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:57:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40B0343774;
	Wed, 23 Sep 2026 08:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E95D1F00893;
	Wed, 23 Sep 2026 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153864;
	bh=QKJrBHLETBJyIa6CWPgESXEOaNq+UTvSooBi5VGZCG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KozDhSeWWZQTg8qR1LTSNd/9vzq5RZIlWfhikFLT+D8L2I5Jz4RW/J/nf5mHhyMWx
	 wgXS1Q6HNz7cfa6/GeElIlb09p8dtUNS1+8zqVqOXIL43y5t/P8Lh20gnxcFl9NmVL
	 9/NSXMsohhFnPB1Cl+3hz7zgSVc7+ozoLDY2L90xLb52BcIsKkVBdbTPRHxQtreTay
	 TeNvdTFh8AXErqEoxXB/6Yado2ZKrr99gMmQdb4CtRLxcnPGxLVfn3rK6asisudprn
	 uTvoSyxmTOtHABCA2ICfTBZw9BG39E9UroKWqES3cl9xK/4Ms6H+te7w8FDX3Jyuo3
	 sDg+z4Sh35R8A==
Date: Wed, 23 Sep 2026 09:57:38 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 05/14] net: lan966x: export FDMA helpers for
 reuse
Message-ID: <20260923085538.GN13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-5-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-5-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:33:57PM +0200, Daniel Machon wrote:
> Make shared FDMA helpers non-static, so they can be reused by the PCIe
> FDMA implementation.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


