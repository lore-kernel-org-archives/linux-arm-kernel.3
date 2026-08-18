Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840D9C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 20:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS+hrw7DR5QjvngIhGCIUMUP90zpgBBzUMr8U2SbJEc=; b=0B1WK8CdQAwKGIcDAV2KrWjmCX
	uwEyU+aQGHXrwWsmwE78beCZwjuZBxXrcc/g+Hsv5195voQNOcqmg1zfUf0GGvM/52r0uG0AdyC+W
	3dJ4BnKGoQbu3N8A7fAZt2DFXycdZL+HppspQ2IeBdlgme+D33TwatPWTp3n7WIRsY5SPfkh0+QUO
	PdZf1Kam25T0UizoWKIBvtyBwGPNsVxAxRxodFP6CURUJ4e2OvpxkrxCFJqMCxZWq1XQ36nKVQwWS
	UT5Y7jmCCoV7ySw9oD/crzIlferdRr3bov7NyOtrLiM/4WrtACvWtjNNDl/91v9/ND4NjZSMtfE8O
	5Laf9sWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQZL-00000008dn1-1UaD;
	Tue, 18 Aug 2026 20:37:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQZJ-00000008dme-1ZOA;
	Tue, 18 Aug 2026 20:37:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDC91601FB;
	Tue, 18 Aug 2026 20:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C311F000E9;
	Tue, 18 Aug 2026 20:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787085475;
	bh=vS+hrw7DR5QjvngIhGCIUMUP90zpgBBzUMr8U2SbJEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kp3ftP8lgwzzmR4XG4D3ofqWLPKNHPwk31tk6KCBZ4wcRAzJS9CoKTfizilk33tEN
	 rhX+GqTNYJSKYTogq47ReDOXZiQoiE555xBjVR3wW5XSD03NMgmXcUy625f933ceef
	 2xM+zufoxlvj1A3ZK3MSHgNx8W8AepObJOl424/vHbLr6YI2rpizHCUPf53RNJK3BI
	 etRxeEHEhi81pgkcv8lSzvDM4/v0wD4M6HEHtUsZG38z+OxkoVRwLBQQWPooKQJosT
	 gkV2by9tcrh4zz+wpXh10F3OlKKtBC7HmKfRlTpP4yGjPs8a1uAlVdq9mfI3Xy302C
	 D7zjY38D7YC7g==
Date: Tue, 18 Aug 2026 20:37:53 +0000
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
Message-ID: <20260818203753.GA3388792@google.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <DKF8V3IHKTL2.1PUA8O5IVIRYC@cknow-tech.com>
 <20260818185810.GA7030@quark>
 <DKSBIH29Z9DE.1OR442P0XUSCS@cknow-tech.com>
 <20260818200454.GA2718123@google.com>
 <DKSCMAUXS10I.2AB9KERO16FRG@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKSCMAUXS10I.2AB9KERO16FRG@cknow-tech.com>
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

On Tue, Aug 18, 2026 at 10:23:18PM +0200, Diederik de Haas wrote:
> On Tue Aug 18, 2026 at 10:04 PM CEST, Eric Biggers wrote:
> > tcrypt.c reports cycle counts from get_cycles(), which has an
> > architecture-dependent meaning.  On x86_64 it is something approximating
> > the CPU cycles (3-5 GHz) whereas on arm64 it is the ARM Generic Timer
> > which tends to be around 24 MHz or so, over 100 times slower than the
> > actual CPU.  So 9044 vs 115 "cycles" for x86_64 vs arm64 sounds about
> > expected, and they suggest the real times are likely similar but
> > slightly faster on x86_64 as expected.
> 
> Phew, thanks for the explanation :-)
> 
> > This sort of thing is why benchmarks usually should measure real time.
> > The legacy module tcrypt.c unfortunately uses get_cycles() instead.
> 
> What would be a better/non-legacy way to test crypto performance?
> Is that documented somewhere?

The KUnit tests in lib/crypto/tests/ have benchmarks in them.  They can
be run like any other KUnit tests, though you do need to set
CONFIG_CRYPTO_LIB_BENCHMARK=y to enable the benchmark test cases.  I'll
add some more information to libcrypto.rst about how to do this, but
besides the extra option it's no different from any other KUnit tests.

Anyway, that is just for the code that actually matters, not legacy
drivers like this one.  So you're right to have used tcrypt.c to try to
benchmark this legacy driver, as it is one of the ways to do so, just it
is a bit pointless since this type of driver is known to be very slow.

- Eric

