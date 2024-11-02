Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0A7E677F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jpcaovD1uzHZkdDMg5tZvb0Z9OfX74OLNrLMh/vslrg=; b=w+SgP4sml3zeyO
	rSzVOPEGL9or8wBuovXkbzHyo6yObPysDZTi1vtwAA149/jcLWEyaNm4dGlmf/YOPmFiKY1u5XNPo
	Eh77OPiO0nQQTYq3PSiCxq8bdGoZ4m1DykSyCMxNzAK2erFRkZvdF2M+dJWLgJKU+/hP2expUwhpQ
	dkS/D8AURbuOXXehoGPlnWZi0hxHjWijKsZAtTFHpGrEUv27tktFySk8UZ7fHgVBPOAnA9yMNip4g
	VTsaK0zT46nhbk2fB1invo1F8ExifPIA8LfXQ9ZoWhAjHRM9TIybZJKaNYFzc3f/TW/w8wbG6J1U4
	2U2XnJziMv9Pm4+HQ8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Ajd-00000009Q91-0AXk;
	Sat, 02 Nov 2024 09:47:57 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AhN-00000009Pok-0ojE;
	Sat, 02 Nov 2024 09:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jpcaovD1uzHZkdDMg5tZvb0Z9OfX74OLNrLMh/vslrg=; b=Q5MjntzpHzBvczROcNsYoj+25t
	CTplAOz4OXNjmKbeHRPSkC2PF8/2CQ+S9+BpzdDOraNgbvJHl1b2XbDV1IX3zldrAMVgbCnIPBjj6
	0IWTAu3B1HtaRzbcItOeEI76Vhr65Zdrv6Hj7PnTJ9akLQTMtM7LE6EHbcKkj/xmU2QzOxWp4th0u
	J1y5NQ3M1+7fbEZEPyWTXBC1K0HGtCKB8/SuT1fdvssCL8+XduxOZjD+6GgoigCaoEwTAJWXor6+8
	4zJNFOI8kfLHoCcjY0lPk4C6G5wnEcy3WATqplhANsESpNXFLLJLZUN4OEO8S1bcBapdvZR08K4kj
	Lwh8InsQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t7AhE-00Dxdz-0Y;
	Sat, 02 Nov 2024 17:45:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 02 Nov 2024 17:45:28 +0800
Date: Sat, 2 Nov 2024 17:45:28 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: ardb@kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
Message-ID: <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026040958.GA34351@sol.localdomain>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel,apana.lists.os.linux.scsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_024537_257500_DB258402 
X-CRM114-Status: UNSURE (   6.35  )
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

Eric Biggers <ebiggers@kernel.org> wrote:
>
> While testing this patchset I notice that none of the crypto API drivers for
> crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> system that uses those algorithms (such as ext4) just uses the library APIs now.
> That makes the "check /proc/crypto" trick stop working anyway.

What's stopping us from removing them altogether?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

