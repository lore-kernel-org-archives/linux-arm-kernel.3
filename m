Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD12DCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzjtudXBoeDJMAmrpGr3WXAi/sP2pduwjgnBqvaHH8Y=; b=vomVXMfxR6whgXn0qIcaEfv/3r
	+PtJfxQfDlfNt7f86ZHU6K6i8yD0aVNeDzAtV0zAF2CB8ORyaJjNbfB3iN10whrRmrpj8mum+/2l2
	vZGJuBTMIP70sbbLol5dXe672y5Gpeeat6Xr4j8QgFg7VROocIr7YA/N64GgFufUXqJln/rDOGm8d
	G9NMAQAFtJ6A2Ff8gWxfH3wk2xPYKIs3XLJEnjvyE8e7+ll81SZlto7mESTbDG41t9NoQv1dmHdmh
	gD/041dh4t5tKHE+3pDuc9CELZXfekdGLqsQHsjPbSdedrE4a2O6ZZDaKa1/n/lVb3X9+mMJKnd7S
	v1UDMD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcd1-00000009EGd-1kRx;
	Thu, 11 Jun 2026 10:27:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcd0-00000009EGT-1az6;
	Thu, 11 Jun 2026 10:27:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CCF7540D6E;
	Thu, 11 Jun 2026 10:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0361F00893;
	Thu, 11 Jun 2026 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781173633;
	bh=DzjtudXBoeDJMAmrpGr3WXAi/sP2pduwjgnBqvaHH8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eWPvu2MyRHUhkqDgQ7mrXD7ZjH8z2e1yojjtPmMT8cHxnucb6N5T3oMp7u9xEoN18
	 HBxqHLLmtDeiFHTOAWegGAsMc/K62I84EkY5Ki23cdjefDSo9EcTLtSrhfpfSzVDig
	 JdHYzz1fbRz7CVAFAXeFHC1LsoErs8iSApKdN+s3F6LyT7hPLA+WAhoqnqZaSDwCIY
	 g0MQk9+RPXm/ka5+RcjodUQbIWKHuomXjope1OOOuxV3Ql/bdpzx+pGAAWNZbNlERE
	 jxFh8+XrlDL2o9+/2pXbprwH5zyPG4RORbJ8ATa/ODcyXBVWrZo0spSr0RubLgEj5P
	 F2/sZjeHeqncw==
Date: Thu, 11 Jun 2026 11:27:08 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: move get_sport() callback at the
 beginning of airoha_enable_gdm2_loopback()
Message-ID: <20260611102708.GQ3920875@horms.kernel.org>
References: <20260608-airoha_enable_gdm2_loopback-minor-change-v1-1-1787a0f42b31@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-airoha_enable_gdm2_loopback-minor-change-v1-1-1787a0f42b31@kernel.org>
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

On Mon, Jun 08, 2026 at 11:24:15PM +0200, Lorenzo Bianconi wrote:
> Move the get_sport() callback invocation at the beginning of
> airoha_enable_gdm2_loopback() routine in order to avoid leaving the
> hardware in a partially configured state if get_sport() fails.
> Previously, get_sport() was called after GDM2 forwarding, loopback,
> channel, length, VIP and IFC registers had already been programmed.
> A failure at that point would return an error leaving GDM2 with
> loopback enabled but WAN port, PPE CPU port and flow control mappings
> not configured.
> Performing the get_sport() lookup before any register write guarantees
> the routine either completes the full configuration sequence or exits
> with no side effects on the hardware.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


