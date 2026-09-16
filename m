Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7026EC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J62InCrimYMZ27rtw0DoyvxPBEcbtBLFfYYmokblwpU=; b=1jYKgw6+zk8Arxi5uDBURCYrfl
	BoYFb0cFOmX5mA33/mH+d2yknqULu7WJeBaUy8SA+E5INXORTgXtHODpf9oWN8HHr4UfqdT2slYQu
	Arwmb23oiSjlD3bYuNUUi3trknrQQJue6RFxauFoiF9JTq3/GthiaFZ73JbV+ZmfWsyF2hhPUA5Gn
	0oQhps3ZKqms/J29lwtLbD+871Amksic55gSOF5uj4viLrnfX8CVL3ouza8SDHBaK7SkDfnmR/LUd
	iAvCse1NUti+LsX/iJwahiKFb4czHhpI0X2w52crAxbekaiMmmGyvhaiSc/cNzPT9u2D5NAmT0c4h
	be3jCH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lVq-00000008mpm-06Vo;
	Wed, 16 Sep 2026 09:01:06 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lVm-00000008mnu-0adu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=J62InCrimYMZ27rtw0DoyvxPBEcbtBLFfYYmokblwpU=; 
	b=JkINH3do7MiMnIXbrkujMQRH5H2i3PZ3JEmMIsui0B0s2bRuosH1yJszQudAirDRQVCTBxr+u8a
	m3sgzUGtu/x/YpPrutnHstLhdH0vkG7VSmSESHrD4ogUrXfxNOam0hybPNy8YPfuFdR25A7r4tTCp
	vw4QhF/5XTHe29zU6VHyqf0oRWWjzMViiKfnrMLxW2pZi5IQvr/qpFfVMLb2sEFpwdJnDOzkAvKCe
	RFWeX6CpxHDmoXzhmFDg4brNaqgJ4JPU5x/kJkWlT5OPFD0bxuyERP8Z9QPHn/MDJGH81d97m5Q8H
	ugqEsfJ0wXHdjRO7Piqu8Paq941hrSNUBwTw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x6lVY-0000000EY4g-46rE;
	Wed, 16 Sep 2026 17:00:50 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Sep 2026 19:00:48 +1000
Date: Wed, 16 Sep 2026 19:00:48 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: davem@davemloft.net, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2] crypto: sa2ul - Fix stack overflow in
 sa_prepare_iopads
Message-ID: <aqpawGagrSvRkpTi@gondor.apana.org.au>
References: <20260831055141.1632832-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831055141.1632832-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_020102_400961_1FB02558 
X-CRM114-Status: GOOD (  11.64  )
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

On Mon, Aug 31, 2026 at 11:21:38AM +0530, Siddharth Vadapalli wrote:
>
> Since crypto_shash_export() writes 105 bytes into this 104-byte union, it
> overflows by one byte into the adjacent stack frame.

This should be converted to crypto_shash_export_core which exports
just the hash state without the partial block buffer.
 
> Changes since v1:
> - Propagated error from sa_prepare_iopads throughout the call chain.
> - Added missing check for authentication key size being within limits.
> Above changes are based on Sashiko review of the v1 patch at:
> https://sashiko.dev/#/patchset/20260819142357.3950463-1-s-vadapalli%40ti.com

Looks like Sashiko is still not happy:

https://sashiko.dev/#/patchset/20260831055141.1632832-1-s-vadapalli%40ti.com

Let's split this up.  Just do a one-liner to switch shash_export
to shash_export_core, that should fix the stack overrun.  Then
fix the long key issue in a separate patch.

I think you should support long keys properly by hashing them as
crypto/hmac.c does.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

