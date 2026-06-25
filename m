Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D68CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 02:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlrC4XUDtorWQW364JN0VeT9+sVnJidBJZvQBFd/jWU=; b=UGzdOSLpiAyg2oH98UM6GBQkqe
	Zaa0aeo4L+t7ph+ddaAI6S67YzxEtR26ALV5XPStdn5ZjVNMHMT6DOy+VZBZgB8KAqpJ4KJzQ8tE1
	I55ZlsOFGHBYh50AV86EX8LOTmKimZldBp0hA0pOmKeW4Kig9QuGB+kdx+xg/p4oZCMKkuXQBVbV3
	EkJat040QqtB5N7ORG1jFcZJsJJnbSAe97BxNtu97Pv5Him+OQrM1Pq9u0KDRVaRdQ9uzrW8UEXtR
	WIJ6n2UMY8jBnSAt7W4Z8oN79ofuKu1EUjkloQp3TioOsb0Q35mSNNjpasI7y41ekFLGRrapSu4TE
	4ZG6h8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZjE-00000008Z0s-2Jz5;
	Thu, 25 Jun 2026 02:22:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZjC-00000008Z0k-3vPX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 02:22:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F72A418E7;
	Thu, 25 Jun 2026 02:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE40A1F000E9;
	Thu, 25 Jun 2026 02:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782354126;
	bh=UlrC4XUDtorWQW364JN0VeT9+sVnJidBJZvQBFd/jWU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HiOavYNdbdkx11uI3Z7iAu3Qr+Vw+lNFKBH5kxQwAHLtGi8sTYQFSblscjPerahV8
	 3SXc/H+XSsYx1QjjkBQHPtR0TOS/H7pdRKXl9va4pzL60yYe9X6oDu8VIpy5VzmIhl
	 oeG8ZSGjblxHCO6ixyCLeGbenNyIKRcA4sFj04cqHth2B6vUcuW5ozkPtax89wo0W9
	 J69L2VeRA5/9TcOwUMS+Qbff5CiZKPWH6Ip8JydeUXavGLwDx7Bqf5f3FUWJzIafrG
	 vpA6AE+Zz65Bj+JmhZWhZHRRlOAfN1JbjPPcsI8uUs74hlPbVJCJF0l1qTQ70hwkRc
	 2sx0qwAn3VAfg==
Date: Wed, 24 Jun 2026 19:22:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: fix missed le32_to_cpu()
Message-ID: <20260624192205.4485cd61@kernel.org>
In-Reply-To: <b375d36c-112e-4662-b538-fd10fa927ecc@bootlin.com>
References: <20260622143707.497198-1-ben.dooks@codethink.co.uk>
	<b375d36c-112e-4662-b538-fd10fa927ecc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 22 Jun 2026 19:51:39 +0200 Maxime Chevallier wrote:
> Hi Ben,
>=20
> On 6/22/26 16:37, Ben Dooks wrote:
> > The print in ndesc_display_ring() sends the des2 and des3
> > to the pr_info() without passing them through the relevant
> > conversion to cpu order.
> >=20
> > Fix the (prototype) sparse warnings by using le32_to_cpu():
> > drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17: warning: incorr=
ect type in argument 6 (different base types)
> > drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    expected uns=
igned int
> > drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    got restrict=
ed __le32 [usertype] des2
> > drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17: warning: incorr=
ect type in argument 7 (different base types)
> > drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    expected uns=
igned int
> > drivers/net/ethernet/stmicro/stmmac/norm_desc.c:258:17:    got restrict=
ed __le32 [usertype] des3
> >=20
> > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk> =20
>=20
> I agree on the principle, but this isn't a fix so this'll have to wait
> until net-next re-opens :)

Humpf, why are we not seeing this on x86 allmodconfig ? =F0=9F=A4=94=EF=B8=
=8F

$ make C=3D1 W=3D1 drivers/net/ethernet/stmicro/stmmac/norm_desc.o=20
  DESCEND objtool
  CC [M]  drivers/net/ethernet/stmicro/stmmac/norm_desc.o
  CHECK   drivers/net/ethernet/stmicro/stmmac/norm_desc.c
$

