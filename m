Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682E3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrvN1J9qQHCCErdHQ3qLnkC3Mf8XZ2hYifvJ1suxwRQ=; b=gzxMo1f/5C+QUkHMUotBXwWXzo
	/RqKh2WSo2vMfi1pz4DRQIVhC+pp7ZOXTtgjWZ1HpnvqbpjS+eoIH59DRfNb22BcWh1lU9DyXIIoW
	5ijsiCv370CMh2JO33OYMTuIfuH3ZVdV2QeQ9hvADxxMA1bfUcfT/JmxWVvps+GiEJaTofXIEphD0
	k7TzKJH4KQ157pyI/1OV6hwImMYqvlTI4QvUioaED6Y5vs6pXIb0M08DsZP6G+DgTMUlHgzFf0z6l
	6V48IVVa0p6vQNDBWDRdqfU4gUtMsblYrGZjhYOQaG/RFJAUUsAYjvUHQ9fasByY7J1EN6d61gMXv
	VGR55aFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6w8G-00000004wKX-0qfj;
	Mon, 21 Apr 2025 18:44:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6w61-00000004vwG-3Tsh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 18:42:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 125725C5844;
	Mon, 21 Apr 2025 18:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81192C4CEE4;
	Mon, 21 Apr 2025 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745260940;
	bh=PKCtPZ5e16IZooE+CufNWIVCR2UhdYPQvpu/jck5oIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJso5JEpx2oKtGorQjSxlvbsd2Hn5Vx7W7R0R2WOkGPTWmFulwzG6jwFHz/wkFHj+
	 CBGggxCEuBFtwEo3wk4QR1HbecDqNr7jHdV1fljhr7jW2gxFjMlFaSMq5fsijPzwzR
	 hwAGOpisTFLNPxo7lfualLMzNFlX9K1Pi/8aagmGpRFZzgiMNa2ZRRKgdKH7wFIe34
	 rB2le5FiNLcZTblfpCso2znlJmw6nPmLiFLUOPall6XrAA4KtVmI2RtP/8KYioRVgx
	 mAQaAj/50QgJz1lcWzCbAt/ODlwwEq9m8ZvUVD26IBYlqRrwc/zRmbmu7HVWAsnOvO
	 kZR3OeeWA8i4w==
Date: Mon, 21 Apr 2025 13:42:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Nishanth Menon <nm@ti.com>, "David S. Miller" <davem@davemloft.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, linux@ew.tq-group.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <174526093810.2599006.6297495760471249185.robh@kernel.org>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_114221_912173_AEF3A004 
X-CRM114-Status: GOOD (  13.73  )
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


On Tue, 15 Apr 2025 12:18:01 +0200, Matthias Schiffer wrote:
> As discussed [1], the comments for the different rgmii(-*id) modes do not
> accurately describe what these values mean.
> 
> As the Device Tree is primarily supposed to describe the hardware and not
> its configuration, the different modes need to distinguish board designs
> (if a delay is built into the PCB using different trace lengths); whether
> a delay is added on the MAC or the PHY side when needed should not matter.
> 
> Unfortunately, implementation in MAC drivers is somewhat inconsistent
> where a delay is fixed or configurable on the MAC side. As a first step
> towards sorting this out, improve the documentation.
> 
> Link: https://lore.kernel.org/lkml/d25b1447-c28b-4998-b238-92672434dc28@lunn.ch/ [1]
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  .../bindings/net/ethernet-controller.yaml        | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


