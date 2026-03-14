Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05FDFD88ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 05:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ganEGWFGHuFd3UguXLU26jhB+9iQmRxlL9M83co1XE=; b=fTTUUXpD+BOHWTBYovTDV0JGAz
	uSIpZz/bfOJH9dkFvrp3RKwdkEXBY/sFErav2A/CyhWEM6y7NuFokOQaW2ybpAtN2P/XfyxCWzSuM
	Ai7t0F/eLStsTwDW0mvQKwqa/kVPCkefTF4TXCNq3aC+uIHQNE922j4LsPbT7r8WltKeegRhTsuVz
	5f3vNcR22czzvhQJrXlzmCnJIfDvbTNmVWqAwROSjla1W3ZqFLui1dOwKrbpsVpOhNdJljdv5gTNR
	P911JaEX40kXFyezO280zQKHDIqkQEXefE3mlRBFodgozFBLKFOga0UEGok9ik1cL5I566uA/qP3v
	SQrImCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HPb-00000001Wts-3IRx;
	Sat, 14 Mar 2026 05:19:43 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HPZ-00000001WtS-22Vx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 05:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=4ganEGWFGHuFd3UguXLU26jhB+9iQmRxlL9M83co1XE=; 
	b=o9QWdN3mDxEP6vmfSPppBLnc71FViTcgayB9VNbNW21GOOwiKInNh5JQIZ0+SfDsBPTjBeJEVVh
	mEpC454OeP6SUowjbNPFGvOsTRNnhryCCSrjVqC6eqRLkVe5pKDqkMfR+1/FODlKjE/5f0AoJswnr
	I6lqwBc8sMdliNJsPlblq7a3gtC6r+Zm+pPt0qevdqe2xScXF0DhVP2iiZFeYG/4Ti0vwxqmFh+Bs
	Z9Sz2mWiBzz/U8duSA/M5ybXjZhtQgdeEAR6B8eXAelzFsejL3iSCVnipYJdR40fKY9wtphXK0jnY
	b02sS9J5nfaljgUDPO6Oi7odWnh7Ef7s8rSA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1HPH-00ELGD-0j;
	Sat, 14 Mar 2026 13:19:24 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Mar 2026 14:19:23 +0900
Date: Sat, 14 Mar 2026 14:19:23 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel - use list_first_entry_or_null to simplify
 find_dev
Message-ID: <abTv22TkMal7_8CW@gondor.apana.org.au>
References: <20260308232230.544209-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308232230.544209-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_221941_522270_6AE7534E 
X-CRM114-Status: GOOD (  10.08  )
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

On Mon, Mar 09, 2026 at 12:22:32AM +0100, Thorsten Blum wrote:
> Use list_first_entry_or_null() to simplify atmel_sha_find_dev() and
> remove the now-unused local variable 'struct atmel_sha_dev *tmp'.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

