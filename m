Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369CAD64095
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfujg8/O0zWHhjIR9pfaJn5dYWdiKI7tk4dkgx8mmsU=; b=GsCWlNiLMvQ3ksUdR8au1NHl6/
	16iI/zLxaHArhgnHxgLtlUCO9G96SeiVWY1OXI/P0gXPIoaG/r6DQJlo9vmq08bqjheK4VghSW+TM
	DuyAl7wAGT+fIyUyYmpmrIEX0SKLzT6mqcX5RXLROmc6/Ub2SpDiKCNnVawgJumTir8wDLSaI1A6G
	2vdmS8+V0KYWrFhpUxAuaBnHsSLv+gm3MBFKXg1MW7gZi58/D8Epn3hXHkRhIpFrJYv2hzOK1LKSE
	Kn25kI5NSvl64wqsrnMRKEQx0D3AfQGTeBaW25G4By4yIGMJYZWKN/N09nxIOUSp+NtTx2MRqYISh
	UsypBEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnYx-00000006OlM-3ebV;
	Wed, 17 Dec 2025 09:11:15 +0000
Received: from mx-relay36-hz1.antispameurope.com ([94.100.133.212])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnYt-00000006Oks-2ddg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:11:14 +0000
ARC-Authentication-Results: i=1; mx-gate36-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=xfujg8/O0zWHhjIR9pfaJn5dYWdiKI7tk4dkgx8mmsU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765962642;
 b=hhsP3fCQb2Rigl8R+ras6uICPUZLQAELa8dan2vDyiq2mQRiWiuvB8TIKJewezt4k4M8Ppdb
 fGmAE1v2NTlafRucoGwDenTVXjWR8+Nhe70V7XAl7MwelEUeAlcynwDSjyr4qnYtyfMbqCPO3vM
 qF9ieY3ULMuqagixp9XeFNYd28/k67OktKl5CfOPoJgYPYoF1YI7lZBNUMU7gsM/rIqczjV1928
 h5gTZ1ssjmNcoHedDbqWp0lrEwh7bB/AmoyL/mGLCPts7qnEaxQ5D7J3acIku+MMwNMY0UFJ/fC
 o4f1laddlzEME42LdfRBzBObnSFuEn9s7gH6wUG/OCNbA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765962642;
 b=dO/9udcLZQTiQN61KmYDcIlzZSQjzX0tVigWXJR/q8W0A6f5edymyOkigFUBI5Z1rBk4Td2n
 tVERDcFO0IugSgfvJeaRYBOWD4GJsbvSvKFdUBIp9S2P8qxf/cZrgDvHWmq+cXt6FpdnfC+6tLh
 3M8mJL1JgBRwitIY11wIOMF3MyAvY5oD5Dh+kMkCA3CDtnEEYCZYbctljnGSIYf3ZgxIjHufgvu
 +L9sU5FBPB3M+u+r9yDV7kziW+D/CpaE+NMpdrJ8ONYn2q+DG2O/eMFXVRRaCd+QHckLWuoPbuy
 lQzxv/q9WoMsSpcHe68l7fG0MMvy0TJHaREnCuUSGq3Aw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay36-hz1.antispameurope.com;
 Wed, 17 Dec 2025 10:10:42 +0100
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 90E2E5A0FA5;
	Wed, 17 Dec 2025 10:10:16 +0100 (CET)
Message-ID: <637f14d1c77c2a1d19f7ea221addbbea51392bd9.camel@ew.tq-group.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and
 MBa62xx carrier board Device Trees
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>,  "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Andrew Lunn <andrew@lunn.ch>,  linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org,  linux@ew.tq-group.com, Nishanth Menon
 <nm@ti.com>, Tero Kristo <kristo@kernel.org>
Date: Wed, 17 Dec 2025 10:10:16 +0100
In-Reply-To: <671625aa-f5da-4e34-9c8c-7a1da282aa5e@ti.com>
References: <cover.1762775119.git.matthias.schiffer@ew.tq-group.com>
	 <0079cc291c78b94068f3d8c59df103e951247acc.1762775119.git.matthias.schiffer@ew.tq-group.com>
	 <d13a95659bdd1c840dfaa46afd6d8583f1b7c88f.camel@ew.tq-group.com>
	 <671625aa-f5da-4e34-9c8c-7a1da282aa5e@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay36-hz1.antispameurope.com with 4dWSgY2fCdz2HYqw
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 3ce335cbe13af60b1b355940102977ec
X-cloud-security: scantime:2.793
DKIM-Signature: a=rsa-sha256;
 bh=xfujg8/O0zWHhjIR9pfaJn5dYWdiKI7tk4dkgx8mmsU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765962641; v=1;
 b=Y/YIiX7pltTZyFTTqYQ5ZqLrrPMaLy9EvoXSf0Hnd5FQ1ikO9Eryy9xH0cGJs3d1xZZeSlqk
 AsBIVAr4mkyRmHK5s3uHd9JPMwfcmo0mRbuGoG+hiePUyWKoAubZp/mFly+u04k2ybYZpu8zqvc
 865kQkYtR0UYZZ5wea8L026abopwQsp/TyYEYzswIlD8dHpdhCXvJ95eHGJg/U7FoRceHXd9i6x
 UaXNUos7q6rOHr0wcnLORTehbYXHtXYxPYhxjz37w1JMvVMWoCyGqntjgETqb3xsU/Be7xPBbNX
 kDO1z2EJUQyYJTrna15w5BNGH2M078KO464BsQX4gJGpw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_011111_921286_3DBFBA62 
X-CRM114-Status: GOOD (  14.62  )
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

On Wed, 2025-11-26 at 10:47 +0530, Vignesh Raghavendra wrote:
> Hi Matthias,
>=20
> On 25/11/25 15:32, Matthias Schiffer wrote:
> > On Mon, 2025-11-10 at 12:49 +0100, Matthias Schiffer wrote:
> > > The TQMa62xx is a SoM family with a pluggable board connector based o=
n the
> > > TI AM62x SoCs. Add DTS(I) for the AM625 (2x Cortex-A53) variant and i=
ts
> > > combination with our MBa62xx carrier board.
> >=20
> > Hi Vignesh,
> >=20
> > do you have any further comments? Can we get this in for 6.19?
> >=20
>=20
> Oops, this somehow fell through the crack, my apologies!
>=20
> I have already sent out the PRs for v6.19. Sorry, this would need to
> wait for v6.20 cycle.
>=20
> [...]
>=20
>=20

Hi Vignesh,

will these patches by applied for v6.20 (if there aren't any more review
comments)? Should I resend them?

Best,
Matthias





--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

