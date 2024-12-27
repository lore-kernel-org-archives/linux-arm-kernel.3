Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A78AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhxWDsh6z6UGdA/4uN8oWv7QY/79uJfIgjYBFN0difk=; b=Ob5ZEJLTq77gCxSDZtCkhD1may
	5rOhy9GXMNYdTNfyUSRmFmvQ0yzMnt0BdnyJoumffP2J4i7ceJayuaxlLl4Is+MqKUjdJXDmgsMZy
	X4J1uYcTAzVQHzZ8wF4noxx9G6aAziYEEnwxeY5GywiNpwclLPnoQtuJ1M0CFgvgZ44EHvOMkxZRw
	mM9RrJl4B2p+Av5jSPzMmtrUTB18cEl+Q5D6ZZPri6tRr5WwQmO2XOY+1yHbT4i4Xn/RQz587nOZ/
	abgQ54bLKDOn3uCSxYdbEVK+gJcWolaJ7d+/wjzX6eauOJxFP1biZkuPSOwQfLseQPWdXv3emo6aC
	Zw7vnHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRASS-00000000IYg-00Gm;
	Fri, 27 Dec 2024 13:32:52 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRARG-00000000IRB-3eJE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EhxWDsh6z6UGdA/4uN8oWv7QY/79uJfIgjYBFN0difk=; t=1735306298; x=1735911098; 
	b=HWgTVwetFmWRC5Ks6ts27RsO9BUW455JVVEXV7HYKvvnbM9JtLimXuCMtMQcAcnWlE4gHw2fCch
	nSpFQO2xIp4crP4paZo2p9b7rboKMwxvZN5b8RZBmYXQ56t10THLBNgAHc5ljZxHgI0xavQTDscEk
	gHZG2f3NLeprpIaXLPSIBPyt8CpbXdtt8BJjKZCdDW1ButNIEkS26CdP80LkRphTT0eEpu513Y9pE
	DL4T0QNCLDZKVVK5lEEKg4ZY6l8dWtxzHyX56vrhTbWEyNgHp4J+cGucru88kcON5BW8LpqJSEv79
	OJGn9bYoVQ8laB7zXnYUDUYLOIiimYIL1JtQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tRAR9-00000001jdy-3nmP; Fri, 27 Dec 2024 14:31:31 +0100
Received: from dynamic-077-191-186-045.77.191.pool.telefonica.de ([77.191.186.45] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tRAR9-00000002ODh-2uBP; Fri, 27 Dec 2024 14:31:31 +0100
Message-ID: <92669b2d182b314f10fe7cc92ad6bc7fd4096d35.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 0/3] modpost: work around unaligned data access
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: gregkh@suse.de, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 nathan@kernel.org, 	nicolas@fjasle.eu, rusty@rustcorp.com.au
Date: Fri, 27 Dec 2024 14:31:30 +0100
In-Reply-To: <CAK7LNARRvax0ph2roGd9YmdaG-dKqj+JMHka4SDRwv0FdzKm6g@mail.gmail.com>
References: <20241225153343.134590-1-masahiroy@kernel.org>
	 <20241225162656.26005-1-glaubitz@physik.fu-berlin.de>
	 <CAK7LNARRvax0ph2roGd9YmdaG-dKqj+JMHka4SDRwv0FdzKm6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.191.186.45
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_053139_073191_E9728676 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Masahiro,

On Thu, 2024-12-26 at 22:55 +0900, Masahiro Yamada wrote:
> > I have just applied this series against Linus' tree and I can confirm t=
hat it fixes the
> > unalignment access anymore on sparc64. There is no more "Bus error" and=
 the build succeeds.
> >=20
> > Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>=20
>=20
> Thanks for the compile test.
>=20
> Loadable modules (*.ko files) are relocatable ELF.
> So, there is no alignment in *.ko files any more
> if the latest binutils is used.
>=20
> Just in case, I did run-tests for arm and arm64.
> Even if there is no alignment in *.ko files,
> I confirmed that the kernel can load modules.
>=20
> If you have time, please run-test and
> double-check loadable modules are working.

I have just verified that. I applied your series against v6.13-rc4 and can =
confirm
that module loading works without any issues on sparc64. Tested on SPARC T5=
 LDOM.

So, please extend my Tested-By to both compile and runtime testing on sparc=
64.

Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

