Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD9DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGAlrr100jOGhXISplXahECfeKXzM8O+KWMsmtU5wmE=; b=UaA6B2fTLpVpUolZV6IZ5OHwI5
	lyBWxbZvFdFpyWcIWX8IeaTLfp5u+55OpB6fI+PGgQYxo+mFcomgWG/jxouwNrZwJoNIY41ysrS4n
	lf0I0RUNW8JpUkACKVdfQTYp0anCRKYIDyBwVOWKBmh9kqEE/IwcZbR3Rw5UAyN9oQc5eTDo25Gz8
	F8j0C/dgWV6vkZ8E0r//gSNRidGZTJbdONadmDc2HIQtx78o/jDJIyoQpQMgAkv+5nrxsJFWaqizR
	cxI44R7/gZzIkz3zV801dwfrTPFPoWWlagq5DCJ3CcEgeo6Lk4yrzzs+eyJShLP4X1LCobQB9khUT
	cQreJG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wA6-00000004waU-3wle;
	Mon, 21 Apr 2025 18:46:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6w7l-00000004wEF-2aTu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 18:44:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B775460008;
	Mon, 21 Apr 2025 18:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCC4C4CEE4;
	Mon, 21 Apr 2025 18:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261048;
	bh=glKxkR8m972JoWcWuCrVHoKgArMLNJLU61ANVLN9g74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfYpWkIVu1Cn7rJAIR75DsqAt70re7nvWNCC1UutlV+of/OqT0NhP7NN8/p3LYIPb
	 7GDOd2NuEGYVHM1+EEzo1ZwyI2jWX2OS9GjBi4QUFqHCAWIEyUYvwyjJetzdpU09Jz
	 P2H2RH7jCzSDOVIDTqQRRvr0TSbHty5Pru6ujpvQ6a0aKufg9hVLcEmai7lVmtRN4c
	 ojHv9wAXD1V59pRpJPNlssYaH2JIz2niS28r0PjAVarNsx2yb8Mh1SoR4k9YSPxDt9
	 gUKaNsQxoKHLkxIt1x6GyMTnmpaxl9yxed04TjSFppxU+xX24Io7LnJdZICi5YYbPN
	 eFG7/MfLOGxTA==
Date: Mon, 21 Apr 2025 13:44:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Joe Perches <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Nishanth Menon <nm@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, devicetree@vger.kernel.org,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"David S. Miller" <davem@davemloft.net>,
	Tero Kristo <kristo@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org,
	linux@ew.tq-group.com, Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: ti: k3-am654-cpsw-nuss:
 update phy-mode in example
Message-ID: <174526104584.2601961.15778919146661291408.robh@kernel.org>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <4216050f7b33ce4e5ce54f32023ec6ce093bd83c.1744710099.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4216050f7b33ce4e5ce54f32023ec6ce093bd83c.1744710099.git.matthias.schiffer@ew.tq-group.com>
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


On Tue, 15 Apr 2025 12:18:02 +0200, Matthias Schiffer wrote:
> k3-am65-cpsw-nuss controllers have a fixed internal TX delay, so RXID
> mode is not actually possible and will result in a warning from the
> driver going forward.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


