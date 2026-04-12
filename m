Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D596E64001
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W2MKluaDGA38IpyehFQb5q6vfKRPVvsv+0GniGglKM=; b=CUgH432hTmfzSr2oGfXUZ29GX8
	PaFBNUSEJtSn+02SVgpSSm6xdSpJsOcSiRR70twWYB/wO2tXaOuF88ZeC5UWx24gMXjBjYbqUzNq0
	iWDCXMaTbPD0ucyoRISZsgK1h+UhzKGMgXiVsUDJD+9I2HLhU0l5RLDLmkeixXof+cTmh32EWPHZ7
	AbpukKQRKFGVirozmr9AC3phu4lHrxwOopM+gsFgKnVTGnFA06g1VzuCr/NTiP3P/4raWUn3wHEYm
	R9CGB/1LvLPXzb44UD6C/nsAk6pW1ydmjx1lrajzbas35dz28hGIXcW/WYujgICAPGEglKavSmKpB
	2T4Fn4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqKW-0000000E9tc-2mjQ;
	Sun, 12 Apr 2026 08:38:08 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqKU-0000000E9tJ-2HN7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 08:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=5W2MKluaDGA38IpyehFQb5q6vfKRPVvsv+0GniGglKM=; 
	b=cmgank5KSX/kNGa3ZwDqUu6wk8C6/cYMdBKPE9sweSg055qqqmONhIq4n/knpY2HHyZ4Huji5b5
	IZeO0B74XIolVNMVRD7bktNo0BR43A8y/NxOI31GWXMEdhzpkBjTtiM0XiLYQjrP3k5yxIsuEaxBD
	76LDNoEZ/Uikt7UBv0HAgBchB0ZvnyDE+1HwKmue2J9iMQixJpTy4a+0uIOpaSnkJcWRCoqwzVGbV
	2A6uohDqpzH5mLlpjoV2DK5xnykeIOzETOKq+UIVe3FM404Ol3Nigv8k10eahMiJ75vtKXKa+tQPk
	CYexXANaCCOBapIg2ndDF5uAeJkNu1nWo4mg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wBpua-005U9U-2l;
	Sun, 12 Apr 2026 16:37:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 12 Apr 2026 16:37:39 +0800
Date: Sun, 12 Apr 2026 16:37:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: atmel-ecc - add support for atecc608b
Message-ID: <adtZ06qiYly4ft2P@gondor.apana.org.au>
References: <20260330100800.389042-3-thorsten.blum@linux.dev>
 <adsyzmm3WSZ1ao4a@gondor.apana.org.au>
 <adtHNa-eMUQO0JqX@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adtHNa-eMUQO0JqX@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_013806_598547_46E4AF9F 
X-CRM114-Status: UNSURE (   7.82  )
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

On Sun, Apr 12, 2026 at 09:18:13AM +0200, Thorsten Blum wrote:
>
> Patch 2/2 is here:
> 
> https://lore.kernel.org/lkml/20260330100800.389042-4-thorsten.blum@linux.dev/

Please repost 2/2 to linux-crypto with Rob's ack.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

