Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CC7C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QThOCW+spE4F0Srm+t3y3bO2Fskva0qz0HPI3WJ3OuI=; b=eCw9IoiSg7dEIYHdb5trKlpKRq
	lNJcKv6s3jcU9pSNzt+UGCXYkFKeJMOY1l7g3WgWX5uwiLP7LYtFD/moqXa9MU3LhhAjPK616AMPQ
	P+n9ZkzejFJzz5aWerYZvVMB3Dhh+W5meB9aikq+64t8Hl9SPMYYoDDfRW1K0AKC9crTL5i1Qvb5Q
	Ks6BV/SWM0mnj0JPsxg38zIBY4iEA3hamcC19tFcf23rw9wia+IOFGbzEvP1iUoMKRRBODt4yG9FS
	zwb+7NhTb351R6yVmh/MLVyRsPPlQxNTH0aTPK8K226RaEdY7frFhcPAuTj3USqnJbjo/oALGcyjg
	sx5IOv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv15-00000007KSg-25Tp;
	Mon, 05 May 2025 12:33:51 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuvZ-00000007JRV-0TAT;
	Mon, 05 May 2025 12:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QThOCW+spE4F0Srm+t3y3bO2Fskva0qz0HPI3WJ3OuI=; b=b5O+J/UMfheJprS0FNIu39QNrM
	62+1pNEYJ1B82BoYcJ+BUzBGUN1UtoFblR5Uf/YOCTQX1Zd4Tb8drZNnD+ZN9RgJtZJJHqPgnix3g
	6ttmCpDmKNBmTYsOy3XaD3cCHiUESN0dOhtcVk3msOvK3wwFMQXsAotObNwy68uV5qub6zCZ1jkvE
	pJ1Go73Kk3j7nmi1LXwcyd67gRdst31E8KSUPLR4O+Ls8eJHtotmlYWaPGPItxgFRzySRi1pFeICa
	rQOAmc07b2nnRhn6dKL3ZTGOKomtfl3xoO0ecu+K/misbBAy5+7VXhT0uq0fRzKW/DD73CxINB1qM
	L87UyfGA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uBuv2-003YHw-2t;
	Mon, 05 May 2025 20:27:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 05 May 2025 20:27:36 +0800
Date: Mon, 5 May 2025 20:27:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Olivia Mackall <olivia@selenic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] RK3576 Hardware RNG
Message-ID: <aBiuuOAcq1rCM0Ob@gondor.apana.org.au>
References: <20250430-rk3576-hwrng-v1-0-480c15b5843e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-rk3576-hwrng-v1-0-480c15b5843e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_052809_147772_723E8A4C 
X-CRM114-Status: GOOD (  21.20  )
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

On Wed, Apr 30, 2025 at 06:16:33PM +0200, Nicolas Frattaroli wrote:
> Gee Nicolas, how come your mom lets you write two Rockchip HWRNG drivers
> in a year?
> 
> In short, RK3576 (and RK3562 and RK3528) introduce another HWRNG IP. It
> actually has quite a few cool features, but I ignored the cool bits and
> went straight for the true entropy. Some of the cool bits someone else
> may wish to add in the future: AES-CTR PRNG that's regularly reseeded
> from the entropy, adjustments for oscillator and oscillator ring lengths
> to maximise entropy generation, automatic continuous quality checking of
> the produced entropy by the hardware itself, etc.
> 
> In testing, it seems to produce about 2 mbit/s of high quality entropy
> on the RK3576 with its default settings when we read the TRNG entropy
> output directly. That's less than we'd get if we had the hardware use
> the PRNG to stretch it, but I've decided to leave that up to Linux's
> entropy pool implementation for now.
> 
> RK3562 and RK3528 probably just need a compatible and a DTS node to
> enable it as well, but I don't have any RK3562/RK3528 boards to test
> this with, so it's not done in this series.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Nicolas Frattaroli (3):
>       dt-bindings: rng: rockchip,rk3588-rng: add rk3576-rng compatible
>       hwrng: rockchip - add support for RK3576's RNG
>       arm64: dts: rockchip: add RK3576 RNG node
> 
>  .../bindings/rng/rockchip,rk3588-rng.yaml          |  5 +-
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  8 +++
>  drivers/char/hw_random/rockchip-rng.c              | 73 ++++++++++++++++++++++
>  3 files changed, 84 insertions(+), 2 deletions(-)
> ---
> base-commit: 4e0a9c660788594b5b49ac07f0fbdccd2218431e
> change-id: 20250429-rk3576-hwrng-8c308b5711ae
> 
> Best regards,
> -- 
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Patches 1-2 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

