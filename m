Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E31FF36BA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 03:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bklhLbfR1ys8v8hxfDXtHey8Rp/a8UoInTCx1wqcss=; b=xZtk4KuBW/KbuS0RacbgOJXR7O
	14+c8zsktJWyKk7ucXmsL4ehjqvNfRIQn9bLDGG3+Ps2ynReubgoJo5OE6C52NuVCzBxW8/MxJL8k
	+VVJAmkpAzy0I4yqmar5x/ssY4Ihf6fDPNLpu2ZMp8s6++9uoixBXIhQoif7OhF2jndeQubuOx5ts
	CMjskvBp+YlCXcaTEo9OyyTcdSajT+aAvc2KmI1K2hgAfx/a6mo4XgeVTjKyW0oJslJ2gV/BfHz1g
	r7sTCUk05vhv3UYVF6XrxLWws10OvIZnCHjIfvGiyRxE6rS93O43gJ+6q1g4tsLhxZREWqMu649DM
	vlGKTGeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB2ek-0000000BY7y-2P1B;
	Fri, 10 Apr 2026 03:35:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB2ei-0000000BY7o-2yak;
	Fri, 10 Apr 2026 03:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2959960103;
	Fri, 10 Apr 2026 03:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A14C19421;
	Fri, 10 Apr 2026 03:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775792139;
	bh=7bklhLbfR1ys8v8hxfDXtHey8Rp/a8UoInTCx1wqcss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RezecpH5XGi6zJlQAcDlO/E+mA+cVXKG+mfp4mZiDMciX5ragKG48onb2lUJFpC7E
	 KGSRkd5LAKOSD4RYXygMWLdnLmAqszsTX4am9u0XjwdhDmlzClAyrL+VVNTWy7wzbh
	 VsS262mEGEoEC09+dmOqb088xofYlVpOgomWGLAgEJFSMfva2/AR4DQUNEAZAQ8o0o
	 LH+broIy0AV4uYEPLkHjKtRBIWboIAqbhkVPCOKA6loQA/cG+Q4Bb5yLtu+eQ1IlcL
	 uAKwZnM/PaTIRISkqinYNhPOxfl7VKkfPx7zbjdzf4Gm92IKp75/bBkAgSsGvKqota
	 ZeBqf8vbco5wQ==
Date: Thu, 9 Apr 2026 20:35:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Xuegang Lu <xuegang.lu@airoha.com>, Simon Horman
 <horms@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v3] net: airoha: Add dma_rmb() and READ_ONCE() in
 airoha_qdma_rx_process()
Message-ID: <20260409203538.35337631@kernel.org>
In-Reply-To: <20260407-airoha_qdma_rx_process-fix-reordering-v3-1-91c36e9da31f@kernel.org>
References: <20260407-airoha_qdma_rx_process-fix-reordering-v3-1-91c36e9da31f@kernel.org>
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

On Tue, 07 Apr 2026 08:48:04 +0200 Lorenzo Bianconi wrote:
> Add missing dma_rmb() in airoha_qdma_rx_process routine to make sure the
> DMA read operations are completed when the NIC reports the processing on
> the current descriptor is done. Moreover, add missing READ_ONCE() in
> airoha_qdma_rx_process() for DMA descriptor control fields in order to
> avoid any compiler reordering.

Sashiko seems to have more orthogonal complaints FWIW

