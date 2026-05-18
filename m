Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E917ACD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wj0yR9PYapzRO9WETQEouL8N/6Cx3siFuTTA4xukOso=; b=GKTH2DxL1oJDovPalRdV7mJNkP
	/krChpRXL3oC/D7UmcRXu9ZHnXrZ/Cs66IbtvF77C/MLnuOdz0OtkQga5GWFGH//Ab7E2cA2x9kV2
	w7tx4nmboPUafCJIgxR6jP3SMj5s+UXjLSQCwuXESr5eXHrPf/uyR23a2SA6hNMh/htweo6zkAdGP
	Qu9uqBSyTJ0JfbJzNUVg6NN0tpYEXxHuGUq7Y2TVvjVY1+wyC8yLkWBMNxIdLFpeJlRvb7/Bj7GNC
	2W6v1UVRjaJ41bpnBdAXT4Stv5rFpJWN0TcVtrpi35NGXOmbKoBA6XJfZYqjMAyyM8OwJGzZucOur
	jWXaYoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx4p-0000000FdCo-17ec;
	Mon, 18 May 2026 12:28:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx4n-0000000FdCS-3WNd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 12:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wj0yR9PYapzRO9WETQEouL8N/6Cx3siFuTTA4xukOso=; b=WCfOuLwDaNOEUn/gy5CUQMGFlm
	F+aKZeqi2f/hp4O+zCbYAmwl4dsgLLjZUF4JF5g6MZk+Um6xSTsWUKRM7f9KVUjfxNSg7JzWAM8Xf
	PRTNWHdZqjh+KBRbHN6vES9b5F2d/4CVWezMe76FrCk/QzGiBpjavjlnYfPU83DoSvpGi5EkPd8fX
	w07tIWsa/glebCmSk43qZrMl9YsClMftvxSJmgYNXAYtX+x3D7Tsv2IYupaQjBsWubdQXxI/Hopmp
	rKej1XAJwv5DKAo/k3hVruAWjYiaCIcZsr59B48lUvzOQPlcOtBwpdkRTo+x7yVqpt/Bc7seIebOb
	T4aUl29w==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx4k-0000000B8Ap-0KuM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779107279;
	bh=wj0yR9PYapzRO9WETQEouL8N/6Cx3siFuTTA4xukOso=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JgiEpNGsV/MptSZiLUBCsoKNZCnbg/Pong+ZdioH3V1VMSsXzpLBszyHPglpYeEcu
	 AA4yQrnj8775FFAT69kdOk23mSjjgbjGlDpcGnQeRBk1PS/sNMIoLX3emWPtgQuaqn
	 qfvhc4ndnsfwkJf72cqvekBDXC67fFp4PwHbWmpKi8EejioKsEwUZl2JjroUSqL19X
	 lflx7wLZeHr1i04ctMSPuOy0vrNcSC3iw9tT8M2IUO8+iTlY3dX7RhzKMp7HFsutQ1
	 kYi8C9ccG7DhQC/HcuCfVynQchUH13RHHhCtUMPBuQbQdvezOMrPCM1GOy+WXeoor2
	 BKnxh2aQe9B0Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4F6096024D;
	Mon, 18 May 2026 20:27:59 +0800 (AWST)
Message-ID: <663d06c8c42892586075ddb2ba7111b06c58752f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v13 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "P.K. Lee" <pkleequanta@gmail.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Date: Mon, 18 May 2026 21:57:59 +0930
In-Reply-To: <20260407081700.2658011-1-pkleequanta@gmail.com>
References: <20260407081700.2658011-1-pkleequanta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_132802_746646_928CFB46 
X-CRM114-Status: UNSURE (   8.94  )
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

Hi P.K.,

On Tue, 2026-04-07 at 16:16 +0800, P.K. Lee wrote:
> Add Linux device tree entry related to Meta (Facebook) Ventura specific
> devices connected to the BMC (AST2600) SoC. The purpose of Ventura is to
> detect liquid leakage from all compute trays, switch trays and rack
> sensors within the rack, log the events, and take necessary actions
> accordingly.
>=20

...

> ---
>=20
> P.K. Lee (2):
> =C2=A0 dt-bindings: arm: aspeed: add Meta Ventura board
> =C2=A0 arm: dts: aspeed: ventura: add Meta Ventura BMC

A few things on the commit subjects. Can you please:

- Capitalise the first word of the short description (the word after
the final colon)
- For the DTS patch, capitalise 'ARM' for consistency
- Avoid redundancies

So:

   dt-bindings: arm: aspeed: Add Meta Ventura board
   ARM: dts: aspeed: Add Meta Ventura BMC

Cheers,

Andrew

