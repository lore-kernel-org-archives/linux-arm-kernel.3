Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12728CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPYJoeJ6MYjd1Ysgr0+UghZrSDpSf8Mp6i25gOlUkdQ=; b=H+xaRzDBfq79XKYGC58xDGxt06
	A7EYcsqQAxIqFLXaHn+lhGZycykjjZou9ZnQjWI40RcP4K5CAwfcbQnvH1/z18ACco1c4mQZxxR2x
	NXjA4S3N9+mLvLPpLILREQyan5tgWyukIbQq3fKuR1qGPtcegyDdSM9r3NZLjuKsUCuTbj+uGcFUA
	dUPGELwaA/R5i5/6EndxGWFLLtBiosHE9ys4ospNghn/f+4sLhFxa/xTUgzHt8Vt5FKDIqXdt1lix
	Sg2h4oAWoTzrZEhj4CiqXhonHyx0EWgc9D2vEhivRcH9zz8pw/ZqLcUmWELOBzKw/vp8bTf/losgb
	PUdCkhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iUO-00000007kB4-0M52;
	Thu, 25 Sep 2025 09:42:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iUN-00000007kAx-1fWS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 871DA60466;
	Thu, 25 Sep 2025 09:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFC1C4CEF0;
	Thu, 25 Sep 2025 09:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758793330;
	bh=F41QS3ZPsVh0OZ2B5xiSK7R/BbbchGf3UKyh+TVD1DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etu4+rfrzCqNV5ry38PWUR8lUBaF7Tkz89jm7s46OS1rLc5dCVMQuoJJty58GKXFG
	 X0fE5tmYMcNnOpW1Dfidc7+UHW8hnRjzelLyYO379uEvMEXuXnZ7GqLxgzx63UJdME
	 jNCIm0BcEt95rD7MNSPepRIypkQQzkc8TZ0wvRhzdgOHECkb/KztHZJ6DmWR7dNxjy
	 BvY8zpyUihB5isMaTw6m93L6IZHarnEkiqmOSsu25gZM80MhI9fhgKSTJU2F78DvbF
	 B6hf9hNNS2BRt/iD9Ymr0GCdvl+8mcohcL+1upVbQtQV9emsoX2IviYAE4Be6NT5Jc
	 y4DBBcWd1Rxqg==
Date: Thu, 25 Sep 2025 10:42:05 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, xfr@outlook.com
Subject: Re: [PATCH net-next] net: stmmac: Convert open-coded register
 polling to helper macro
Message-ID: <20250925094205.GC836419@horms.kernel.org>
References: <20250924152217.10749-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924152217.10749-1-0x1207@gmail.com>
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

On Wed, Sep 24, 2025 at 11:22:17PM +0800, Furong Xu wrote:
> Drop the open-coded register polling routines.
> Use readl_poll_timeout_atomic() in atomic state.
> 
> Compile tested only.
> No functional change intended.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

I agree this is correct. Or at least, it looks correct to me.
But, FWIIW, I do have some hesitation about untested code of this nature
being accepted so close to the merge window.

Reviewed-by: Simon Horman <horms@kernel.org>

...

