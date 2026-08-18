Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC863C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8Peqt8WT9DHzwVxnRsjnPx1R7Yii5C9/fDHVNMD5OM=; b=MskTOxLb+6byFJEt4DqUOHUySU
	cOZzV05cgNiUAfIGIPTCcLV1gb3LB2Q59GcXYfU+gWJ6PI9Fo3HrMNIvY+8PFH45Iuz/P3bmXv8Zy
	hs/U2SQgZ9r64OsiPIC0YQWWwJ+cYYC/tzuSaInKJRwwe5o9V5a0G5d9dYwHsY+LyJYlzVJSV6fnm
	sfbJIJai4GBeRarNuW1tJrh73Rs/cu/4o1SlPvm3LjFSgjO4j0LsEw05TURIfTCqhGbo0rwxP9NsF
	P0mafb//fVxoqyUkDox+bSxIOFGN8plfCjDoSJC5PfVn94TjsYoQomFTqBdgP4+NQancFxOHwYJMJ
	R/V1aGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwP0t-00000008Y0H-0Pae;
	Tue, 18 Aug 2026 18:58:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwP0s-00000008Y00-0xfF;
	Tue, 18 Aug 2026 18:58:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E22B601DE;
	Tue, 18 Aug 2026 18:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DEA1F000E9;
	Tue, 18 Aug 2026 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787079497;
	bh=O8Peqt8WT9DHzwVxnRsjnPx1R7Yii5C9/fDHVNMD5OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mNPmA0KJ5e1sb3umUDgc+4IqrU1UL+fZSsNk/G13SaU+3hP6f8diRPka2DRXpOvyg
	 UAtxBPME1LgL9MdcbOoOTC0zSxLTS4eSYchw9gsstaNGFXloZKpmpzYdXaD4iKcUdg
	 EOb4DY9ciHXm4WoTE34miBDG5zk6GNTqep8vksMjBFkJLGG0bT7MQG9V03kjnGQ8X6
	 XWY0Xf996doD5tXFTMzVUVdq7yp5r6PkcytJmDpWDpVBVvkY+j5aR8//GTn4WyqVuK
	 A74iy3KISEgZrKulbuPPcuXiyPXddXs09m3ZItzFc2C+Vui8CXDInOSd/dnDDpmqRF
	 7/0Jx6V+FtLEQ==
Date: Tue, 18 Aug 2026 11:58:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Dawid Olesinski <dawidro@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Corentin Labbe <clabbe@baylibre.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] crypto: rockchip: Add RK356x/RK3588 cryptographic
 offloader
Message-ID: <20260818185810.GA7030@quark>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <DKF8V3IHKTL2.1PUA8O5IVIRYC@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKF8V3IHKTL2.1PUA8O5IVIRYC@cknow-tech.com>
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

On Mon, Aug 03, 2026 at 12:42:03PM +0200, Diederik de Haas wrote:
> crypto-rk3566-test-no-crypto-module-log.txt:
> https://paste.sr.ht/~diederik/bb5dbfd59f244a6422b965b30f9796ebbfdb1fcb
> crypto-rk3566-test-with-crypto-module-log.txt:
> https://paste.sr.ht/~diederik/ea72297678e19cbbc987de9548f9884382e1d1cc
> crypto-rk3568-test-no-crypto-module-log.txt:
> https://paste.sr.ht/~diederik/309e519e6b1c31f4c1c5bcb1ea16cc8569a54830
> crypto-rk3568-test-with-crypto-module-log.txt:
> https://paste.sr.ht/~diederik/1e1e938ebbbae75128974fe0a7c240843bce04c8
> crypto-rk3588-test-no-crypto-module-log.txt:
> https://paste.sr.ht/~diederik/9a2adc2b2e42131445ce4576589e00ecf51ccb4b
> crypto-rk3588-test-with-crypto-module-log.txt:
> https://paste.sr.ht/~diederik/e04c11c8809031ca45662f7d4c227c1ba6162b65

Thanks for running some benchmarks!

Looking at your results for rk3566 for example, SHA-256 on 4096-byte
blocks is 115 cycles/operation for sha256-lib (i.e. ARMv8 CE) or 3027
cycles/operation for rk2-sha256.  So the Rockchip driver is 26 times
slower than simply using the existing well-tested CPU-based code.

Don't you love "accelerators" that make things 26 times slower?

I guess we'll get the usual argument that this driver is really just for
"testing" or whatever.

- Eric

