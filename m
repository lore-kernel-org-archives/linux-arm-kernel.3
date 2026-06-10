Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C15CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpEtiFrBEIM+OcxmfyVtuRseNKwhQK6Li7jNDIkmsk4=; b=TxRQbiMUVTZCy23X8BfE+vCI18
	/UqYRdIZpClIrETsljyBJe2HjFA+JyJABk0KZ/OHjEjFO9i4kzf+wl2jT6x3OE6BFlFxOvaZP3rgm
	3KVzvHgNnCByy568aBNx/CJhQlFtMwJoXT0QtOl+4AOfFP3SKnhJwp5F6v9NZp8sJXLi1yw/KquPO
	AdmUPM5puLTWvxNb5jq7kVmFUBqr2UYhw64X4GxFWl0QcED5NqgUj7HG+dixxf/QRFPsAna1spJQa
	mLU4L2Rq89g7GP34acnVgHJKsZMySE0FIDxPegcIVeDC3tjclQwIw/vXUVWibxo3ZarvrehhOFj25
	s54REN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6dm-00000006YNW-0SL4;
	Wed, 10 Jun 2026 00:17:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6dk-00000006YNO-3iKj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:17:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE7296024D;
	Wed, 10 Jun 2026 00:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3991F00893;
	Wed, 10 Jun 2026 00:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781050671;
	bh=kpEtiFrBEIM+OcxmfyVtuRseNKwhQK6Li7jNDIkmsk4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mFtZ89aWwYePdEMSZCIYhqOArs44ygPvWB3tdzkh33PvIxn5Aam8KArGCmpQYJplW
	 HK3TYSwyj6Nqzpz/JWe2UWE4n65n/MThJmxsCGFn4Yz8au7hPcaTj5q/6TXHd4101o
	 xtp2nGMRpzqEkkB6785g2Knv4wZz4PI7L0g88up0xmcdA3tyuf6b8Z2OdmlDBftHej
	 U3vxKyg1ajRId2ejVTWRY1/M5g8qcFPR+VjCrSmvBzcLDnh7IrGg/qE9DVqo9XzqHo
	 oRcFiGsy7O/BUyLdAvV6rl8HGAJq6LNbG6QisoQu4CsYbBc8blhbCBtlkPtHxkrNrR
	 wY3sVt13NilkA==
Date: Tue, 9 Jun 2026 17:17:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ethtool: mm: Increase FPE verification retry count
Message-ID: <20260609171750.7c5709ac@kernel.org>
In-Reply-To: <20260605025631.2872-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260605025631.2872-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

On Thu,  4 Jun 2026 19:56:31 -0700
muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> The current FPE verification retry count is set to 3. However,
> the IEEE 802.3br standard does not specify a fixed value for this.
> A retry count of 3 may be insufficient when the remote device is
> slow to respond during link-up. Increase the retry count to 20 to
> improve robustness.

You need to CC the author / expert on this code, please repost
with the CC fixed.
-- 
pw-bot: cr

