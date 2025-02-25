Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC33DC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 23:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSvc/XemxvspxE6At8l/Qu+fHyG/W1yOWa6QPQHBb58=; b=1gwIu7BKZ3iHuiuNH4FxQvR1Wz
	GfkBgsWQvLZtQ/rCKPq4Yeojjc6IRLS2uEbm0kcD5tq3E/Wgx2hAV55558759bDFNgXehp/xL6Kgm
	22zP5+suzGl7kserATYSgH4MoP90tgnrmI5Qt8aFp6l5TwhMzfNXXv7ohNhEVx9rnVYu+PzSYgZ9Y
	hYobgvhp10IKyydw3oftrLJRUV97tZIk6548RO9wyCL8Ae4SoqvF8wAvXFcW9i39L705s6p7kBYMQ
	35n98mBPJbALSBfmYqM6YV7GPOCT68tEqJ+LeGEiI+yGgqsVgPd2Myfi/FeNMJXtE7vKyvdoZwT3g
	8XbJ5mBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4Nh-00000001nfH-0h6P;
	Tue, 25 Feb 2025 23:30:29 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4MA-00000001naC-1jHJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 23:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1740526128;
	bh=QSvc/XemxvspxE6At8l/Qu+fHyG/W1yOWa6QPQHBb58=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JoDWORWh5GMuHWhPpH1YC1VOcRnB6A0kfhfXPOGKob7Lozkmp3Ldds10SIb0gMhEo
	 fmHS9hlv8mpFF3iIb62peumhlZfdGhgFv3CgFEpbMtrVtyKku5LWeuo/UR2qvIQH3t
	 Z8jAT5Wcm8SyNW+trXOBYBpF6Gk+cYA+lsQkvKDh7kS53ux52/9KGCGUU/lWA4zwAr
	 8PvFv8z+MShtsR07hsYXl3OkWSbnXfFCkv3tesjsRtL2NBV8wjH2lKY37vYfVp/CYy
	 2rPbc879sPoopOr5hnt0fyzuB0ocRbNoDd1Kaut3S26MhoDuno6+T2IE5VlHCTKMzc
	 HEV5j0ycCFL5A==
Received: from [192.168.68.112] (ppp118-210-173-152.adl-adc-lon-bras34.tpg.internode.on.net [118.210.173.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1415377691;
	Wed, 26 Feb 2025 07:28:43 +0800 (AWST)
Message-ID: <0008bab55f56252016406e06f147ef52f058bb86.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Mo Elbadry <elbadrym@google.com>
Cc: Kevin Chen <kevin_chen@aspeedtech.com>, "joel@jms.id.au"
 <joel@jms.id.au>,  Z-ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "tomer.maimon" <tomer.maimon@nuvoton.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>, Jenmin
 Yuan <jenmin_yuan@aspeedtech.com>, BMC-SW <BMC-SW@aspeedtech.com>
Date: Wed, 26 Feb 2025 09:58:41 +1030
In-Reply-To: <CAOO6b=udHyXx3QXyUE=siuuJopanUxzbFeBujtqWRy=j2ut4fw@mail.gmail.com>
References: <20250217114831.3225970-1-kevin_chen@aspeedtech.com>
	 <20250217114831.3225970-4-kevin_chen@aspeedtech.com>
	 <e43b5f8f-37e4-4468-b3ca-5059a5e6f3c3@kernel.org>
	 <6fd7cd57261ddf9831f57dc4c637b24e9f8982d9.camel@codeconstruct.com.au>
	 <PSAPR06MB4949C65DF5C034BD6B40C9B589FA2@PSAPR06MB4949.apcprd06.prod.outlook.com>
	 <d4945482509cad0bf3e8cd93c1fb21bac2e0c7f2.camel@codeconstruct.com.au>
	 <TY0PR06MB4960EA7255DF0BDF235F0D9689C52@TY0PR06MB4960.apcprd06.prod.outlook.com>
	 <ba2757fd02b3e7c8f9c862c76f2cfcd2b6bfb41b.camel@codeconstruct.com.au>
	 <PSAPR06MB494947E21AB39369ADFA8C9489C72@PSAPR06MB4949.apcprd06.prod.outlook.com>
	 <f7369d6205e05c7aac3f3de7cbd08c3b08960d75.camel@codeconstruct.com.au>
	 <CAOO6b=udHyXx3QXyUE=siuuJopanUxzbFeBujtqWRy=j2ut4fw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_152854_660413_4B0CE823 
X-CRM114-Status: GOOD (  11.51  )
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

Hi Mo,

On Mon, 2025-02-24 at 20:34 -0800, Mo Elbadry wrote:
> Hi Andrew,
>=20
> I agree that a small layer of abstraction is needed to provide common
> chardev semantics to userspace. I think that effort can come where both
> Nuvoton and Aspeed unify their design and agree on a common abstraction
> layer.
>=20
> I think such efforts may take some time for both to unify, is it possible
> to get this upstreamed (after addressing all other comments) while both
> parties work on an agreed unified abstraction layer?
>=20

Given Arnd doesn't want bespoke userspace interfaces in the SoC drivers
this will need to go elsewhere, perhaps drivers/char or drivers/misc.
Greg and Arnd maintain both, so the patch needs to make a convincing
argument to them. For my part, my comments are just opinions based on
my understanding of the use-cases and the SoCs involved, and the desire
for reasonable devicetree and userspace interfaces.

I don't think it's right to try to rush things as devicetree and
userspace interfaces can be tricky to change or remove. Rushing tends
to be painful for all involved in the long run.

Cheers,

Andrew

