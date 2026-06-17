Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BB1CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 23:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUtCH2mIavsa719O4vEdePS3+ukWIimZPi7womHrDik=; b=IernVtG6FSV/p40W9R0yekLZX1
	dI9IukJq42C6SeXdwSRX+d7hqlBe5Qc0PqTlPXCTgApO7RWnVwxtDnTOU8uTOhyKVJvA5kLRgq+DC
	pmL91UXdpyvjxt/eZRCbVXpJZuQOfcO9Z0ZbaGd+B26QYWWNIjENzP0QsWTAOe8iQpoDG64j+6zyp
	j8Bbj5I2dLyABbFjs40qGldt49FWk+qAxm7PZW1hriR35eZN90AZmNF716CYlDJApe4bybg1JLPqi
	d7yCcqthZMWGKDANIAZMRzcZH/i4Ly3+AQJFrth/4HlJ0HOTA0eBUdRzWo8wor6UTXyReidTHo39H
	KbLPPKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZzwC-00000000QvM-49f1;
	Wed, 17 Jun 2026 23:44:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZzwC-00000000Qv4-0zkn;
	Wed, 17 Jun 2026 23:44:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BCFD542A46;
	Wed, 17 Jun 2026 23:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271961F000E9;
	Wed, 17 Jun 2026 23:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781739889;
	bh=PUtCH2mIavsa719O4vEdePS3+ukWIimZPi7womHrDik=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ehBABrRFTO7Z4VezmK8POW8KuVNQovjhhnh0LvYAr9CxzY9wDhDUhg3LD45I87Dv4
	 yVaXjElmqTiOGfUCCkGLSEDlUikyey6Hj1t/E3GXCm0FBI2r9YiB/4NLRexOgcpMzX
	 awUGf/LqdpMHOA2U3MBYFHGAp+TPb0OKXBeaT/TTCIL6/xqWIN3b9b1XSt23fBo7dV
	 swkPqyyicZWs7gYYC/K3fCIQU2IpiFqn7qURKIuk7nwQeDcmMMAB/TITf/sqYdZKez
	 Nj+2q6teMCNzp047kNGlXZkX08sThANjueFzWweyMgEjQyo+RuBRMnuneWQJ7bEK4J
	 Gk4OarN5j/NNQ==
Date: Wed, 17 Jun 2026 16:44:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, edumazet@google.com, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Stop TX queues on error path in
 airoha_dev_open
Message-ID: <20260617164448.31e189bc@kernel.org>
In-Reply-To: <178160729880.2156257.7978513589649053826@gmail.com>
References: <178160729880.2156257.7978513589649053826@gmail.com>
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

On Tue, 16 Jun 2026 18:50:39 +0800 Wayen Yan wrote:
> In airoha_dev_open(), if airoha_set_vip_for_gdm_port() fails after
> netif_tx_start_all_queues() has been called, the TX queues remain
> started while the device configuration is incomplete. This leaves
> the device in an inconsistent state where packets could be
> transmitted before the VIP/IFC port configuration is complete.

Not sure if this was superseded by another posting but FWIW
this posting did not apply.

