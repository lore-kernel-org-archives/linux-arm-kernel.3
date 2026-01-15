Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D9D3CC95
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 01:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8qv7zGjKLg/PB6Q6k/X+xJDPtRPLbBTgNo+kvs+s14=; b=z86S+093Iezhz57gIXymZYsdWn
	PWH4yFGVAJTkCbEwQe50yQ+rRvh9KQuHxlnrkxWXUoCDfed0P/LtyTAINwDVceSaKEH+LuGIriipc
	f+zhvGdYswMONlcLpDNwHgGhFXfA8LXI415zKhNuus5QEYS8OdX0luzhe7A0rGQnhB6wlPrTgq8Tq
	av96auhbRXAplqo3IDKtVH8mW+Ve+pGj3D3ZgEU0E71+yXqXP6sw5cqGsUwggO+ZooleQWRMF4ClC
	ixAMFvjFaYIwAKB76FBfAZz/F7vJqct5XfjfjsNKyaQa0hrMgO/IPFYuTgT1zEv8eGoxCgojESCdL
	E8RKIF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBvH-0000000BLkf-0mLC;
	Thu, 15 Jan 2026 01:13:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBvF-0000000BLkN-1QLq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Jan 2026 01:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w8qv7zGjKLg/PB6Q6k/X+xJDPtRPLbBTgNo+kvs+s14=; b=IIu9EHH5V8GudQAAjAqiuGk9B5
	isZdrT0yphR9rotC6a6N36AmkKzoVJ2CAiikjHlZV+Am92wwpELOp5bcBV8hvxFuIkqf4jME0c1Kc
	QMz85OhaZzy5J/OwHciT9MCP9mG0VnJtNDBp9GqpT7u77Lfbjwy8jnLAaMGar/9c/5C8pHD4FQ+oK
	3PMKusbOBrAIw6HCzVrhoZeJTdz6z2vGUHo0DzHvKd0DxtDUWY/uaieOijdXUiAjwGFEB0od++RSo
	CI2JRrh4d7E0ioQNySY76+R+AzLaijUMKuayZ1Je+EwEmsS/s787a0ZdfKF+LikEXalhH7m/lbnQM
	M4x7kEsA==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBv3-00000005tDj-2Cmm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 01:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768439566;
	bh=w8qv7zGjKLg/PB6Q6k/X+xJDPtRPLbBTgNo+kvs+s14=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=REOw9Uf4sZS4m++NHjUuL06qkr98+A08cZmsmF48lK0ym7qvP+7KNER4qUUCM6SWg
	 Y0ZXtHU8pHvntidwMv3EicjRZe9P9aRaPTRaeTurl5e8mEJkWDdsFmhe8VSV9dH/XI
	 2O+NTS41YBC70cEUAvg1/rLJrpmXUwuR49Kx1eX/QLnekXayK6n7jaZkA8Xcn+THyK
	 C2m5QScS9gBSfHobr2RK4y85PCueDDG5mRgpp7DA2NkTAqFBuPFEkGJJMTMN/T1IZ3
	 j/72Mwat04UwCNCJKOsjqKgLZvVA4ZyU0d6iN7TR36UXFP/+1i15u0BVisGKa7NdB2
	 CvthhyFlzMEqw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 286836472A;
	Thu, 15 Jan 2026 09:12:46 +0800 (AWST)
Message-ID: <9cdf03250dd923859638de4850ce4b4e4279bf8a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Date: Thu, 15 Jan 2026 11:42:45 +1030
In-Reply-To: <c391ded8-6569-48a2-9c49-6b68838f91b0@oss.qualcomm.com>
References: <20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com>
	 <c391ded8-6569-48a2-9c49-6b68838f91b0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_011308_601077_4D8F8DF2 
X-CRM114-Status: UNSURE (   9.96  )
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

On Tue, 2026-01-13 at 08:17 +0100, Krzysztof Kozlowski wrote:
> On 13/01/2026 03:57, Kyle Hsieh wrote:
> > Summary:
> > Add linux device tree entry related to Meta(Facebook) ventura2.
> > specific devices connected to BMC(AST2600) SoC.
> >=20
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> Where? How is this possible?

Kyle: Tags only apply to the patches they were provided for. Tacking
this one on the cover letter implies Krzysztof has acked the devicetree
as well, which is not the case with respect to [1].

[1]: https://lore.kernel.org/all/20251223-ginger-worm-of-swiftness-a8fa05@q=
uoll/

It appears you're already using b4. b4 also handles tags for you:

https://b4.docs.kernel.org/en/latest/contributor/trailers.html

As it suggests, run `b4 trailers -u` to automatically and correctly
apply tags you have received for your changes.

Please fix the issue here (remove the tag from the cover-letter, apply
tags to the correct patches) and send again, _after_ you've addressed
all further feedback on v3.

Andrew

