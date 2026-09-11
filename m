Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A543C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdKT3mgg1Pb/Jdrfl1nwELxR2cBte3Dqhgwz6ZyzOwI=; b=jZr/k2L/TLfgVBLOiYqJwICqMB
	+/IAXPpO1LPU5OstXhXcE4JpkUEC0TdWejPH2LR0ejbaJpL48usXhphngzd/7nkI5QFKwds6Ii+FH
	q+XSb3uCuFWKlwhvvNYg4jA1ZnmEQn+yisxIGiabanxCM8Hat75Kc6wTOShCmpyj1QVa15NiBhqfy
	bkaFcE2ijZ+LPC8MICf7+xY+37GvY9bZMoIFCFhZkWSDC2/PmLmzeK5ubmRGB5OqPfIl2bnVIW++G
	xNb87YDW4vvvyBoQ9QhOMvuQkfGMemrryVixjC8BmBAW8Au/Z3eGGvZtDoVlZdmrP3w669TAg5ogV
	a/nUb+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tt7-0000000FsqX-0fst;
	Fri, 11 Sep 2026 05:33:25 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tt4-0000000Fspq-2luD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=PdKT3mgg1Pb/Jdrfl1nwELxR2cBte3Dqhgwz6ZyzOwI=; 
	b=TIMa3c6GeA4fZd4f2E6nP97mtVPGZ6Brs0UF+lS5YEA2cywF320gAH8RDdDBChvD0RddqlPLGhx
	WXuqzHhDm7t+Tnm/GAwrHmIPWaWJYaB3qnhyhJX9tQYv+NSi0i6fA7FMT4jiDiibym1Z/YaSlFztO
	q7hR/B3xMXUs++aaDluo+STuZciNdkyZ1ufV1DOwBsHTmOAU73PMqgfI2Nr74K+Zu0MrcI7PRUuuq
	JEFjXcSp/CSDwOVHvAT8fmCF7rzl/e8WKLWFeFtY0a40Y+1SXFc8qNHDYZ4t8afbW8+UCeAVsHuKw
	IPkVSKsec5vXBCXbyEZztjYGKnN5+0fEruBg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x4tsi-0000000CuDA-1MAD;
	Fri, 11 Sep 2026 13:33:01 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 11 Sep 2026 15:33:00 +1000
Date: Fri, 11 Sep 2026 15:33:00 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
	Cosmo Chou <chou.cosmo@gmail.com>, Colin Huang <u8813345@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: add atmel,atecc608a
Message-ID: <aqOSjDb1FeLv9Po4@gondor.apana.org.au>
References: <20260830220151.21469-3-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830220151.21469-3-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_223322_698367_9BD835E2 
X-CRM114-Status: GOOD (  10.39  )
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

On Mon, Aug 31, 2026 at 12:01:51AM +0200, Thorsten Blum wrote:
> Add an entry for ATECC608A.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

