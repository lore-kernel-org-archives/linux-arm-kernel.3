Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D9DEA71A1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 16:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGX3dNmyhdVv4EE1zOJ9pmlmv+mOAwv81924pagrMVI=; b=J1ngmiDAlm6ZSFkU9YJUm4vO2C
	PUgDo+6kSRR13cMjGpOgw6PQYRfKogHYgepLkIYBcOSuVKKGbctl0bVTyX973+vzCAfCLmjpZE1kB
	prM7XANzww94DOi14rZF+vndtwdV6aVoNXMj2QRnvVfBeafhkiCHNVfyiDhgcqiUDVB6vp1Ut9pFM
	JGscQPvqf6vPfCQvhrVYqieR9zyBB6ypiysWc1ZWBK2MWU7vdQu8bZxBiihumJcL9FdKEZgQqyyhP
	eWtjJ4kmm3j50GWF+X9r+qcvag18/MYpqjxpSwXon4cjxRrdaJaO1JWDinjEEQ5YN3zSfzo+WNsj3
	KXxmaIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEUl3-00000005uyF-27Wb;
	Sun, 19 Apr 2026 16:12:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEUl2-00000005uy5-2d2e;
	Sun, 19 Apr 2026 16:12:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6977D60055;
	Sun, 19 Apr 2026 16:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4F0C2BCAF;
	Sun, 19 Apr 2026 16:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776615147;
	bh=Ta2f/OBUfrlnMNY37PwVc6dm0L34NOXq5X2MMmQ/Pyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ch2Q8SHAI0HNC5/+1WeMGVq0bNM2M1O14/ZCpUEMGAO9X4mfD2cESDEEx0WW9JLFN
	 HHRUwFaIXM6gZU6pMmvKEFL6b9PHu/c6GV/mcg1FRXuA4QO78gnief+NejpWAUVj45
	 b4PwrqL0Z71l0EeMOFNWmPNDscYoW8yxfMo/wBlW+9DoPwGcuszPAVKwzWkgdNTsot
	 k/zgXcCLN+8ZmM6H3jiG0isGMuWJPVQ/dHP5Y30Jv++SvvyWle+xt7f1IZC0ymC1R2
	 jo3CXQSzH3GzRQMldzGX7SsubtZ3Bm1wWQLj+/6yYCPPe4HvPOlvknf9xsi8G2VsFI
	 H6dvxGFZtzWtw==
Date: Sun, 19 Apr 2026 17:12:21 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: Fix possible TX queue stall in
 airoha_qdma_tx_napi_poll()
Message-ID: <20260419161221.GO280379@horms.kernel.org>
References: <20260416-airoha-txq-potential-stall-v2-1-42c732074540@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-airoha-txq-potential-stall-v2-1-42c732074540@kernel.org>
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

On Thu, Apr 16, 2026 at 12:30:12PM +0200, Lorenzo Bianconi wrote:
> Since multiple net_device TX queues can share the same hw QDMA TX queue,
> there is no guarantee we have inflight packets queued in hw belonging to a
> net_device TX queue stopped in the xmit path because hw QDMA TX queue
> can be full. In this corner case the net_device TX queue will never be
> re-activated. In order to avoid any potential net_device TX queue stall,
> we need to wake all the net_device TX queues feeding the same hw QDMA TX
> queue in airoha_qdma_tx_napi_poll routine.
> 
> Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Add txq_stopped parameter to avoid any possible corner cases where the
>   netdev queue stalls.
> - Link to v1: https://lore.kernel.org/r/20260413-airoha-txq-potential-stall-v1-1-7830363b1543@kernel.org

Reviewed-by: Simon Horman <horms@kernel.org>

FTR, I believe Sashiko's review does not need to block progress of this
patch as it flags pre-existing conditions.


