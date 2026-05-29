Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A51FCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1/AzmjwYbvz5ac6FUFa2AXbd/guUDNm7WSGUACd+fE=; b=Y1BmEDm3sGka6I8rXWk8ykWwLV
	nDMBrWxDaGFQOTXbEBl1aWBnaeFpBL/Zu4q8KVwhLbD7+pQfgFUZSQ0EvSXiMJj2lgfQQeBDGQZIE
	9C9BZq+u4rOSr6A44hKNkASHQAHq4wfzIhwofL9OPWlmPhrUFU/jIdacdB+NtacuYlg78qizKKvcF
	NVpBRoebjRTJqJpmX5pgk7fNhQYOWbe4PzgeW3RtWTw9l4JuHBk7VXsUJSuK2ikDqr5/Ls7sa1Yez
	slsgy6jFuSrnSwjRsW+I4lDbFTKVYVOX3kfBaG1FQ5njFMilo6Loz4Jy3IUpkQ0It/dH8HytuO2ah
	8+TFRE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrHk-00000006rDb-403E;
	Fri, 29 May 2026 07:05:36 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrHi-00000006rCz-3Rxv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:05:36 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780038331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1/AzmjwYbvz5ac6FUFa2AXbd/guUDNm7WSGUACd+fE=;
	b=XnwYGh/o1rfZsynwCJXEx2rjmGjHm/owl7jHyuy0Vc0OrpofbU7dzYUkbSlAaUFJjPR4/p
	xQPqAlKZN1UOhyKM3lEBNMxrtajO6d7x/ot20UyfuhDIhBX6uwlSjN5ReQvSMwk4DDxicw
	KOVYDCuWjg7i/lyFRKx5guKlq+7jKBU=
Date: Fri, 29 May 2026 07:05:24 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <554bc5c03d16e7a76db35be4a1c0d23cda2d4df6@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] crypto: sun4i-ss: restrict PRNG seed length to prevent
 heap overflow
To: "Herbert Xu" <herbert@gondor.apana.org.au>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <ahkuI-Z2w0sea_ba@gondor.apana.org.au>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
 <ahkuI-Z2w0sea_ba@gondor.apana.org.au>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_000535_067538_A45423AF 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

May 29, 2026 at 2:11 PM, "Herbert Xu" <herbert@gondor.apana.org.au mailto=
:herbert@gondor.apana.org.au?to=3D%22Herbert%20Xu%22%20%3Cherbert%40gondo=
r.apana.org.au%3E > wrote:


>=20
>=20On Thu, May 28, 2026 at 02:53:17PM +0000, Tianchu Chen wrote:
>=20
>=20>=20
>=20> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c b/dr=
ivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> >  index 491fcb7b8..010fa891c 100644
> >  --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> >  +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> >  @@ -8,6 +8,8 @@ int sun4i_ss_prng_seed(struct crypto_rng *tfm, const=
 u8 *seed,
> >  struct rng_alg *alg =3D crypto_rng_alg(tfm);
> >=20=20
>=20>  algt =3D container_of(alg, struct sun4i_ss_alg_template, alg.rng);
> >  + if (slen > sizeof(algt->ss->seed))
> >  + return -EINVAL;
> >=20
>=20This should simply ignore the extra data instead of failing.


Thanks for pointing out, silent truncation is more appropriate here.=20

I'll=20send a v2 patch with min_t soon.

Best regards,
Tianchu Chen

