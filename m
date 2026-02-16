Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE51AE63F32
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJHCqRRnankEoC/ErtC2hAAeRlqcyizmIk/mir5pSks=; b=2S+cFqCqJwXSZbwXDiwqDwFmNS
	0ga+vUvoWpC/1H+wQq0VY6NWcOBdAPGFZJq2fu+vLnhibgXoXE+QxTFBkGGs00+/bNivMCb8HUlHD
	SJkrodYVLaz1IBkZCi27r4tFEOaQoZ9ooQ3zzwjceGvbF7FYhKNK+1u9WYswzX/8LC4NByIRCfVh5
	az3kA7EpELVTc0LZPNlo8Dt06eGWI0K1yKt5HGpfd1Wa6+nJcL3+jxF+P+XdMGxD4dbAPPQ0ldVLf
	5ZZdv52TWMIHO/u6Y2VaMMrN2iH1hfqsPo7T7dyQVBvvBqtf5AWqCf5jeT/wHvMx3/NOtM/uUtVIo
	H5dft6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtQr-000000066av-2twS;
	Mon, 16 Feb 2026 07:54:13 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtQo-000000066aL-1YWT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 07:54:11 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771228447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJHCqRRnankEoC/ErtC2hAAeRlqcyizmIk/mir5pSks=;
	b=G3HZUODMvtoogeed1XFbneGODNDFnbuOfeHNYf5KJrz7EnBtOA8efe5w4od6wv1bmVMR7Y
	0ytucaPzok6gtuYcP2hzx2FjfDjUiCkEY07KwZy4cT1aW0JR692rlU4umqKwyIzPmSl7vD
	0KaWsxAX59a/IN2USDzNatyBDh4p0go=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix OTP sysfs read and error
 handling
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CAFXKEHb+D__WYugjdbqUSSnubfsOeibfH-Q33eJGjG3kvfndwg@mail.gmail.com>
Date: Mon, 16 Feb 2026 08:53:34 +0100
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 stable@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A3F0A8DE-C8F4-4D45-B98D-60E896EFCEA2@linux.dev>
References: <20260215124125.465162-2-thorsten.blum@linux.dev>
 <CAFXKEHbCrp57ruvCF2TXXcnoJF93Z5bdUd7Nt5WtM9_abtc66w@mail.gmail.com>
 <2E9C85C9-AD05-4BB3-A945-5ADECCB5C7E4@linux.dev>
 <CAFXKEHb+D__WYugjdbqUSSnubfsOeibfH-Q33eJGjG3kvfndwg@mail.gmail.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_235410_602653_F1CD81E7 
X-CRM114-Status: UNSURE (   7.69  )
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

On 16. Feb 2026, at 07:14, Lothar Rubusch wrote:
> [...]
>=20
> This would work. I'd squash this fixup together with the proposed
> patch and resubmit a fixed version.
>=20
> 8<-------------------------------------------------------------->8
> root@dut02:~/atsha204a-modif# insmod atmel-i2c.ko
> root@dut02:~/atsha204a-modif# insmod atmel-sha204a.ko
> root@dut02:~/atsha204a-modif# cat =
/sys/bus/i2c/devices/1-0064/atsha204a/otp
> =
0001ED86032D0002154C033750FFFFFF20B0F703DB0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF=
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> 8<-------------------------------------------------------------->8

Thanks for verifying and testing. v2 can be found here:

=
https://lore.kernel.org/lkml/20260216074552.656814-1-thorsten.blum@linux.d=
ev/

Best,
Thorsten


