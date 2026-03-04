Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB2CEDEBFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 00:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrJ2V16m/x3cJoJRbII2KaLPhBu+skJAcHVHNpTVDnw=; b=o+zpWe2Ml+j9oRAJTF9NWr6tNL
	Uvq8sT95dbNiRqnWgZG1iTV4/PC4KBDdSb0D3TOv+R53znHAXeuid1VBMw5xBo1NKSW4Qh0vact4H
	hsJoqyNRh3wXi133f62bqAlSwac+MuD5FJoiahZnR4FFzQjHejm3KrR6E3SZJ22WBiFeaCC4bf2c1
	EhjVV9xP4CASiqt5b8bwkR5LHgQbC+fNbd2En6y3NhpD0SlZvCqtFSk00lpP7Z91i/RaFKOwQefk6
	P2+15ZbcVla43W9FwM8uGITrL5P4jYjuJldh/ws/cOjt2vmJLRlJ6lKiKb9j6wZWMYE5252vB+GPP
	EtEq38Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaGe-0000000GAXy-0WUK;
	Wed, 04 Mar 2026 00:39:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaGb-0000000GAXF-1aGe;
	Wed, 04 Mar 2026 00:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0171243AA8;
	Wed,  4 Mar 2026 00:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46106C2BC9E;
	Wed,  4 Mar 2026 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772584748;
	bh=XfEFP0ePAMl9RzwdsncvUUKsnGIj/z2blRaooWlL5Bw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eiNKQDh0fZuPPjKMDEPIuS+QqGtWQgilLKQuAg75AM6L5IAQdrKv+e1v5OSDMiS4V
	 NjFXdg18P/JfxObT4XLpKOC+eq9uXsLq+X00iASe0P9aXIRKGY5wQ9cHFXAKSyhn9J
	 q4LU5cBLdUrCEsfPD7VOUKlVDz7qTX4vpDZuJI0bxvIwc3rJFsN7KgEx1GA8RjNTcU
	 MICIu13V5phbG0+fx/tDxJNXIIa1AKchlj8SKp5GZgY07BfNCLA3B7BCtKmpCLSy/p
	 Q7sM5stjqY41kVanYgSyZQnNiX6Scq4tGR4NTv+fdcInFHFVvpcgOLlqtpJw9zxzph
	 bekkRLrZY7Xgg==
Date: Tue, 3 Mar 2026 16:39:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 weishangjuan@eswincomputing.com
Subject: Re: [PATCH net-next v3 2/3] net: stmmac: eic7700: enable clocks
 before syscon access and correct RX sampling timing
Message-ID: <20260303163906.187d57a4@kernel.org>
In-Reply-To: <20260303061711.895-1-lizhi2@eswincomputing.com>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
	<20260303061711.895-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_163909_441180_DC65FA56 
X-CRM114-Status: UNSURE (   5.86  )
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

On Tue,  3 Mar 2026 14:17:08 +0800 lizhi2@eswincomputing.com wrote:
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 180 +++++++++++++-----
>  1 file changed, 137 insertions(+), 43 deletions(-)

../drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:290:33: error: assig=
nment to =E2=80=98void (*)(void *, phy_interface_t,  int,  unsigned int)=E2=
=80=99 from incompatible pointer type =E2=80=98void (*)(void *, int,  unsig=
ned int)=E2=80=99 [-Wincompatible-pointer-types]
  290 |         plat_dat->fix_mac_speed =3D eic7700_dwmac_fix_speed;
      |                                 ^
../drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:129:13: note: =E2=80=
=98eic7700_dwmac_fix_speed=E2=80=99 declared here
  129 | static void eic7700_dwmac_fix_speed(void *priv, int speed, unsigned=
 int mode)
      |             ^~~~~~~~~~~~~~~~~~~~~~~
--=20
pw-bot: cr

