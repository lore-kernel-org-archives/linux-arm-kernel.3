Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12739F30283
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 23:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIzof5uMfFAlq/YkbW90WMHyCk3LebQ4QmaEMSrM14c=; b=hsJW5bcsZqi3eiCSohURgI1xrW
	2FWBnFpzSeb1Pp1R42zSKDEyOYP/aEFCv7/QLSQXNmZCT7hV6XiXxjUI78PVpZ4QpZLlpqssekP5r
	5d/z7OCF4OUcn29WsFLQF8kiGuCcZXQUn/jo5mIeBu3rFAxROsyuj5rcysbR5AFXJ0Jfk+p6dDgKk
	t4A2B9Un5alhIZ+1h791Ljq8yU+k+VLOhfobpAjRsggTLo0uhczMj7We/ABh9sDwgQMlLIbNl5O40
	d7dsmsOpHvA/82FAy2tuIeXddrcBsqK0l5ELwPJd9sqw/L4YxJWBIVRN4DrJOaA4kOaPgduJU15En
	CnlhvYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1um0-000000030YN-0mTG;
	Sun, 15 Mar 2026 23:21:28 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1uly-000000030Xu-0LBf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 23:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=wIzof5uMfFAlq/YkbW90WMHyCk3LebQ4QmaEMSrM14c=; 
	b=MoxBjgcG3VNAcppuB0AbYzC7W+XR/JictKa0OyeTbPsZzWwwUdfeu3Pv5uvJrm0Tbndb4nwW5Jg
	kkDztmwQhMc3j4fZBICT/LAiVXxDnXYzSCj8p4eH/E+a7pbPyLTf7qjmisLwHGqsk67qmNaCmXZcL
	lfcyI3TSpGv3A1Vr051YUjAoGkhCspQD3dTI5Mk64VaJ+9hjhgTyEiVBTE+kGRJngdwmJvbDDnJX7
	eH/fLLDn4IiL3Kr+RV4JT/fFqRr+JRwN9zt97CPu1c0bR7S7Nnu6EVZlLKEz7lJNptNggnnzPPj80
	cCvjOAJlMrS6Zo/zu5560irX2gGn4MyZuHAA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1ulY-00EgbJ-1r;
	Mon, 16 Mar 2026 07:21:01 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 16 Mar 2026 08:21:00 +0900
Date: Mon, 16 Mar 2026 08:21:00 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel-sha204a - Fix potential UAF and memory
 leak in remove path
Message-ID: <abc-3OGP0kJpWfo3@gondor.apana.org.au>
References: <20260314193627.728469-3-thorsten.blum@linux.dev>
 <abY2HdOs0768G8G3@gondor.apana.org.au>
 <abcMS4YYrHOF6ud1@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abcMS4YYrHOF6ud1@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_162126_122551_586A75F0 
X-CRM114-Status: UNSURE (   8.04  )
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

On Sun, Mar 15, 2026 at 08:45:15PM +0100, Thorsten Blum wrote:
>
> Yes, it should be safe since explicitly unregistering the hwrng removes
> the devres entry, and the automatic devm cleanup later essentially
> becomes a no-op.

If it's safe then let's just keep it this way.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

