Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D83C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 01:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exNED4G2Car6wsxXN9whsq4jxw9tN1sQJRhqHQV+x+4=; b=GFrugDlaRKDvCm4wSHq9AfSnzY
	BpQ0X7tI4XzPRyoE93/GjDdMqMSk5Lfw9CAIoyTl8YX1JFDJ77xBibK5HyZPTRQHxzGvn1AEgTouk
	AL4/6MQx9wXcyrFKwAgdBBSOKyivjCRUDEhKtptl+SUzdJFDDa/mEqCORvWNsKoRYvddukadSYzbX
	WFRuU8y6YuCst5S27dFWAmQEz6UnMJB0rVug749+mVqLtlWIxcRESYsiTwzWrL501ljA7LCJO1wVj
	JLPYl5ZD9x6hHN2EFkXFW7KZfh3VoquLm7fZ/YJSidZvsgyLTQhdDQe2B1P5XsfTirn5P4sc9ZgT0
	vs24gCTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYXX-0000000ATcO-2WkZ;
	Wed, 19 Feb 2025 01:06:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYW3-0000000ATGB-1CG8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 01:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739927074;
	bh=exNED4G2Car6wsxXN9whsq4jxw9tN1sQJRhqHQV+x+4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ck4KNK93oNFOKpL0t5ECzFTFAm6r2CgNMF/Tb2zwmGPh+HR2xnErZiTYVLNQdKXgL
	 b9boyAHmUkwvivRGZstj7UDqgmciRPlIeOtoimn3N5XRZQ6R9oBC/M0ly8Sc4ufX5l
	 iiiJ5a4lHOH+MruCaCiyuLeZVijM6HV5+Pg33m1vdW4PDBYkBQrD/Wo08jABrGmPCY
	 PWJg87ONt1ShjPxtzyysKYv9nhK5UScccXz6DNKMPRPZhquFavdn9I6NnhsNA3ixmE
	 1abdUpm6UGviduDtzScA7R5JClHHRENS8TC1ThX8eHK0db+PRcKwQ7Naofn8YS3cQ8
	 KFDL8tsJqlCCA==
Received: from [192.168.68.112] (203-173-1-6.dyn.iinet.net.au [203.173.1.6])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CF2B976191;
	Wed, 19 Feb 2025 09:04:31 +0800 (AWST)
Message-ID: <d4945482509cad0bf3e8cd93c1fb21bac2e0c7f2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Chen <kevin_chen@aspeedtech.com>, "joel@jms.id.au"
 <joel@jms.id.au>,  Z-ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Mo Elbadry <elbadrym@google.com>
Cc: "tomer.maimon" <tomer.maimon@nuvoton.com>, Krzysztof Kozlowski
	 <krzk@kernel.org>, "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org"
	 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org"
	 <conor+dt@kernel.org>
Date: Wed, 19 Feb 2025 11:34:31 +1030
In-Reply-To: <PSAPR06MB4949C65DF5C034BD6B40C9B589FA2@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20250217114831.3225970-1-kevin_chen@aspeedtech.com>
	 <20250217114831.3225970-4-kevin_chen@aspeedtech.com>
	 <e43b5f8f-37e4-4468-b3ca-5059a5e6f3c3@kernel.org>
	 <6fd7cd57261ddf9831f57dc4c637b24e9f8982d9.camel@codeconstruct.com.au>
	 <PSAPR06MB4949C65DF5C034BD6B40C9B589FA2@PSAPR06MB4949.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_170443_529173_74C84681 
X-CRM114-Status: GOOD (  17.92  )
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

On Tue, 2025-02-18 at 11:11 +0000, Kevin Chen wrote:
> > On Mon, 2025-02-17 at 13:00 +0100, Krzysztof Kozlowski wrote:
> > > On 17/02/2025 12:48, Kevin Chen wrote:
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pcc->mdev.parent =3D dev=
;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pcc->mdev.minor =3D MISC=
_DYNAMIC_MINOR;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pcc->mdev.name =3D devm_=
kasprintf(dev, GFP_KERNEL,
> > > > "%s%d",
> > > > DEVICE_NAME,
> > > >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0pcc->mdev_id);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pcc->mdev.fops =3D &pcc_=
fops;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D misc_register(&pc=
c->mdev);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0dev_err(dev, "Couldn't register misc
> > > > device\n");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto err_free_kfifo;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > >=20
> > > You cannot expose user-space interfaces from SoC drivers. Use
> > > appropriate subsystem for this with proper ABI documentation.
> > >=20
> > > See:
> > > https://lore.kernel.org/all/bc5118f2-8982-46ff-bc75-d0c71475e909@app.=
f
> > > astmail.com/
> > > and more discussions on LKML
> >=20
> > Further, drivers/misc/aspeed-lpc-snoop.c already exists:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D
> > 9f4f9ae81d0affc182f54dd00285ddb90e0b3ae1
> >=20
> > Kevin: Did you consider reworking it?
> Andrew: No, I do not rework it but add the post code capture driver
> using the SNOOP registers. As a result, I add some code in
> aspeed_a2600_15 to check the SNOOP enable bit. PCC driver probe abort
> if snoop is enabled.

Hmm, I think OpenBMC's history regarding POST code support caused some
confusion on my part. For whatever reason, the snoop device was used as
a source of POST codes despite the existence of the dedicated POST code
hardware since at least the AST2400, but...

> PCC is used for port I/O byte snooping over eSPI.

... it seems that they're largely interchangeable, just with different
hardware features (PCC has DMA)? My impression is that the snoop device
could also be used over eSPI?

>=20
>=20
> >=20
> > Nuvoton have a similar capability in their NPCM BMC SoC(s) with the
> > "BPC"
> > ("BIOS POST Code" controller). There should be some consensus on
> > the binding
> > and userspace interface.

This is still the case.

Andrew

