Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F59C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5o0zE2Ql23MwZK+6c1i+ITLVgBdNKn0CMalQ4FgHLcU=; b=Qnwa3XdDr3XbC555Tj1WeQTau1
	6Vq5l9psuji6Kb9QxgRyIuhvXJZ5griHUbXRIW6BVr6/z1L4F0yw1Q6EDgppEnd0jVrMAFUKssBlp
	sBAkxFbTZn8rJfXusd4lvi0UkJDbdBuGPVnYCMhwro9mtzJYQCu52BJb59qxuvAKP2qMOd9UFO7NG
	2LJffJXYdYIAlT2PGQd0x1v85qykXFI6dBqNdzperR4qSsjzDw0TAYCaQbnEL9eJ5YnNlYeehqq4Q
	Mg+UlN2A3U948SSBC9AFPfMdRWD4n7cLMjH8sVGlG0A5scd/JGG/B39ixUB9yxr0ESIfQoYYYD7/0
	y/hmpEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiB9-0000000B0b9-23O1;
	Thu, 26 Jun 2025 08:41:55 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhhk-0000000Aufu-05zx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1750925492; x=1782461492;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=5o0zE2Ql23MwZK+6c1i+ITLVgBdNKn0CMalQ4FgHLcU=;
  b=lWt6D9iNSPZVhfqLTH5VIgsuZASkCQhhWjw4Xznm8EWs9qvtfkmaM9Qx
   2+Qa2Quu8SK5IUTeRU/W8szmWnMzXV8ezHDJ1+lDMl4m5XHV0RVhf5MsD
   EgXaM0viaifhytPBt1xLYk5lJfPqi2pm4PDyc5iQVhhNe4ExOtYp/1MC4
   sGn9pdwLs48IqBjuhPcPzIHJTiSBqSV9seAiRZzwnkAHj4dQvk5/2URab
   GUzhrAPPKI+o/2ZhxVDvwkMvxN2kuKAjtr/XGpMYLyc6d7LE8gnheCBU4
   DB0TclU0Ki6aauWC25BV/7ZH837qDfGXAEyDDqneTaQtlhYXaj7f8C/OO
   Q==;
X-CSE-ConnectionGUID: 8Mcq54x2RQq4JTkCC9tAQw==
X-CSE-MsgGUID: dDrWJAs0SQuNM3nCxllHBg==
X-IronPort-AV: E=Sophos;i="6.16,267,1744063200"; 
   d="scan'208";a="44863704"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Jun 2025 10:11:27 +0200
X-CheckPoint: {685D00AF-2B-468F1319-EAD2FB43}
X-MAIL-CPID: 71DAA6DCB64509743559210ADBB65D86_0
X-Control-Analysis: str=0001.0A006368.685D00CB.0055,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6DF4165D19;
	Thu, 26 Jun 2025 10:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1750925483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5o0zE2Ql23MwZK+6c1i+ITLVgBdNKn0CMalQ4FgHLcU=;
	b=qdyH+Vf8l2KyL61bCy0nIgFKLs+w3cbh2J4qbwl9+fDuZDZIMwHZRzwHvgezrKsZQcPApP
	DrUXNNHyZNo42WJdllDwILcuqjY8JlJX+AnbhAjhyHF9ERITBMVvcI64rVBnGlrVTJeK9c
	fShkgbqPLKgNH2+rj8woL1uptCA9QK4+aF5FJF73ijYjzzjQjz/T9d2YEH3A3mHYPyJXPl
	tzoEgMASp7pbHfCRvisreMIj9zCtINDLE/ovN2ckD2HlR9nEfcGfibQNTenhNX+sywrZdN
	kHePOizgXpT196B7sZZbQ1dI4tdkaB2yDRz3R3bQDFVh/ejgQhUytZRyq7xbeg==
Message-ID: <f593ed6162e34aa354eff6cc286cb24294195ee1.camel@ew.tq-group.com>
Subject: Re: [PATCH net-next v2 3/3] checkpatch: check for comment
 explaining rgmii(|-rxid|-txid) PHY modes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Nishanth Menon
 <nm@ti.com>,  Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Tero Kristo
 <kristo@kernel.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Date: Thu, 26 Jun 2025 10:11:20 +0200
In-Reply-To: <c954eabf-aa75-4373-8144-19ef88e1e696@lunn.ch>
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
	 <bc112b8aa510cf9df9ab33178d122f234d0aebf7.1750756583.git.matthias.schiffer@ew.tq-group.com>
	 <c954eabf-aa75-4373-8144-19ef88e1e696@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_011132_543768_7577FDE7 
X-CRM114-Status: GOOD (  18.03  )
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

On Thu, 2025-06-26 at 10:02 +0200, Andrew Lunn wrote:
>=20
> On Tue, Jun 24, 2025 at 12:53:34PM +0200, Matthias Schiffer wrote:
> > Historically, the RGMII PHY modes specified in Device Trees have been
> > used inconsistently, often referring to the usage of delays on the PHY
> > side rather than describing the board; many drivers still implement thi=
s
> > incorrectly.
> >=20
> > Require a comment in Devices Trees using these modes (usually mentionin=
g
> > that the delay is realized on the PCB), so we can avoid adding more
> > incorrect uses (or will at least notice which drivers still need to be
> > fixed).
> >=20
> > Suggested-by: Andrew Lunn <andrew@lunn.ch>
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>=20
> One question, how should this be merged? The two DT patches might want
> to go via the TI DT Maintainer. And this patch via the checkpatch
> Maintainer? Or do you plan to merge it some other way?

The first two patches should go via net-next I think (the first is DT bindi=
ngs
only, the second one modifies the AM65-CPSW driver), although I would prefe=
r to
get a review/ack from a TI maintainer, too.

I don't know what tree checkpatch usually goes through, MAINTAINERS doesn't=
 list
a specific repo. The whole series could be merged via net-next if that's fi=
ne
with the checkpatch maintainers.

Best,
Matthias



>=20
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>=20
>     Andrew


--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

