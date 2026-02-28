Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924B4FEE4E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+ZD0E/Be2DkeoGJSTMXxYgl8VB2e+o0QP4h5bIji8A=; b=Tepl8a/mX1pHD0H2wn00wOBnvk
	bYyVzmqxfd7qK8JsFqLMZGMSJrrU5royDjOamReBsUSY92PtnFesxHsM+qgqFXu9X2B94CJJrdKCq
	ib5sZmRghK/ObLcGBowXW7UnbReT+Po5Lv62xKIIAERROGt4SVBW+by2YeC2fSjWBky57ROpBZ0wR
	HwJMpvyacaMTaT7P/adTvxrQIeyhM2g67vK0AV7V+ux4aJfrEpYQDqTrmLAWpx5VzkEkuf8KgsOQA
	gxUiRGVuL9ZMnFKvArR2gMYNAG+Mjdu/UFUzMLV5whOV/tqS9wlIc7KCK+RajXiA52V6x9XwhtJ9G
	idOY8DEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwH5m-00000009i2i-1c9g;
	Sat, 28 Feb 2026 09:58:34 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwH5j-00000009i2E-2wif
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 09:58:33 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772272705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+ZD0E/Be2DkeoGJSTMXxYgl8VB2e+o0QP4h5bIji8A=;
	b=mvZ04meN/UBkJwE1Q9w6856JK0QYUvTooBgrFSSmSVjY0Rab63Nj0smQneIHTi/m+ZsX/G
	tLoFBvisCyMxVuHOwRMM2VgdYXnaaNsmyo6/25xo2T/0KQrhC6peeRGa1NUKKdIXYv4ahC
	L9Jbs8p78GYmX43/p6kMxoqBMC2JKfs=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix error codes in OTP reads
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <aaKr1E1mPOgxo0JL@gondor.apana.org.au>
Date: Sat, 28 Feb 2026 10:57:51 +0100
Cc: "David S. Miller" <davem@davemloft.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 stable@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <21D21541-8B24-47CA-9BFE-CC3B287CCB3A@linux.dev>
References: <20260215205152.518472-3-thorsten.blum@linux.dev>
 <aaKr1E1mPOgxo0JL@gondor.apana.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_015832_179338_B8532B35 
X-CRM114-Status: GOOD (  13.70  )
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

On 28. Feb 2026, at 09:48, Herbert Xu wrote:
> On Sun, Feb 15, 2026 at 09:51:53PM +0100, Thorsten Blum wrote:
>> Return -EINVAL from atmel_i2c_init_read_otp_cmd() on invalid =
addresses
>> instead of -1. Since the OTP zone is accessed in 4-byte blocks, valid
>> addresses range from 0 to OTP_ZONE_SIZE / 4 - 1. Fix the bounds check
>> accordingly.
>>=20
>> In atmel_sha204a_otp_read(), propagate the actual error code from
>> atmel_i2c_init_read_otp_cmd() instead of -1. Also, return -EIO =
instead
>> of -EINVAL when the device is not ready.
>>=20
>> Cc: stable@vger.kernel.org
>> Fixes: e05ce444e9e5 ("crypto: atmel-sha204a - add reading from otp =
zone")
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>> Compile-tested only.
>> ---
>> drivers/crypto/atmel-i2c.c     | 4 ++--
>> drivers/crypto/atmel-sha204a.c | 7 ++++---
>> 2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> Patch applied.  Thanks.

Hi Herbert,

I also submitted [1], which combines this patch here and patch [2] after
Lothar suggested to squash them. Feel free to apply them separately or
together. Just FYI.

Thanks,
Thorsten

[1] =
https://lore.kernel.org/lkml/20260224225547.683713-2-thorsten.blum@linux.d=
ev/
[2] =
https://lore.kernel.org/lkml/20260220133135.1122081-2-thorsten.blum@linux.=
dev/


