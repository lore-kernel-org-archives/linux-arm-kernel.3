Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DE8106FD66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azlN5yyO5v7b75Mm3ixtoaMnWB33fLTBMeAsqttaM9I=; b=2qOCQJNLLW2TIMs94ESB3bwA4/
	gf/InTWcTXLD2IweTUnYI1py62xp56gkMm4o+MtinQbYbI0HM1tWCrlH1z7VTo9p64CYl4DOL3X8n
	jZWgr8wgxeUh6agxJFr4IqXeL1ChYXRFzx2y/KIYDC690/LqlqAr85Vlz2XR6H59eX0hK9iOA2YEt
	ot5nf1m2b/grfAw+Zlfz5MUQWxYgGl1yxoK+VMDQlB4qRDYaERI3XwYBT/w80xwyMW0CM2a3PQGEn
	8QYatRfzwbl6XnB9me6kIVvZRBsuuxOCe17gfpP+IpzxUpXUdUvu1atm+hBgroW+sHD06rb93zZPl
	lEHcQ0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sM6-0000000GFqn-1sYJ;
	Fri, 13 Mar 2026 02:34:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sM3-0000000GFq0-3wNS;
	Fri, 13 Mar 2026 02:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20E824078B;
	Fri, 13 Mar 2026 02:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D41CC4CEF7;
	Fri, 13 Mar 2026 02:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773369262;
	bh=fI4DMsqLEbxULT+64Hl2jZcUeY9iULBhKP8OUx2adlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZcCYKwjAaTbe42TPu6skNnR42pX3ozbbmWH6WAa9A+ON5RVxKNJg0YgrHdHdIlH2e
	 /SKtBOGHV52hJPL6XqnVnI/RM/P100HpyrxOb7wCh6B5AlpTImeIZVogeSpjBZA28C
	 /RDPzVL08Nq3iEGqM33KIJwkzK8MsyCeIrHHGSmoVKPgg2MD/7oc8hb+0GpQSbe7/r
	 B/2foPwYR2Uwzw30bQZP+wSmEefkG0vi9eCx4ia+eDY4gaI8CMY3YigLOW+ctNeC1W
	 IeRjERcG4zRbRscT5zZubZnp9lJYppdupwyyygvM0nNxaq14tcDX/Xq9jUyUSALKas
	 efy3yzSqXsIXQ==
From: Jakub Kicinski <kuba@kernel.org>
To: inochiama@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	boon.khai.ng@altera.com,
	rmk+kernel@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	davem@davemloft.net,
	andrew+netdev@lunn.ch,
	joabreu@synopsys.com,
	linux-stm32@st-md-mailman.stormreply.com,
	looong.bin@gmail.com,
	maxime.chevallier@bootlin.com,
	siyanteng@cqsoftware.com.cn,
	conor+dt@kernel.org,
	wens@kernel.org,
	krzk+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	pjw@kernel.org,
	edumazet@google.com,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	spacemit@lists.linux.dev,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	aou@eecs.berkeley.edu,
	vladimir.oltean@nxp.com,
	dlan@kernel.org,
	me@ziyao.cc,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com,
	pabeni@redhat.com,
	weishangjuan@eswincomputing.com,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	quentin.schulz@cherry.de,
	richardcochran@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next,v9,1/4] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Thu, 12 Mar 2026 19:34:17 -0700
Message-ID: <20260313023417.1577310-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-2-inochiama@gmail.com>
References: <20260312012232.373713-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_193424_013031_B925C11D 
X-CRM114-Status: GOOD (  11.76  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
dt-bindings: net: Add support for Spacemit K3 dwmac

The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare MAC
(version 5.40a) with some extra clock. This patch adds the necessary
compatible string for this device, along with a new binding document
defining the required properties.

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 38bc34dc4f09..98ebb6276bc6 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -109,6 +109,7 @@ properties:
>          - snps,dwmac-5.10a
>          - snps,dwmac-5.20
>          - snps,dwmac-5.30a
> +        - snps,dwmac-5.40a
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
>          - sophgo,sg2042-dwmac

[ ... ]

> @@ -656,6 +657,7 @@ allOf:
>                  - snps,dwmac-5.10a
>                  - snps,dwmac-5.20
>                  - snps,dwmac-5.30a
> +                - snps,dwmac-5.40a
>                  - snps,dwxgmac
>                  - snps,dwxgmac-2.10
>                  - st,spear600-gmac

Is snps,dwmac-5.40a missing from the select block? The binding document has
a comment at lines 14-17 stating:

    # Select every compatible, including the deprecated ones. This way, we
    # will be able to report a warning when we have that compatible, since
    # we will validate the node thanks to the select.

Every other snps,dwmac-* version from 3.40a through 5.30a appears in all three
locations: the select block (lines 19-43), the properties.compatible enum
(lines 95-118), and the allOf conditional block (lines 643-673). However,
snps,dwmac-5.40a only appears in the properties.compatible enum and the allOf
block.

Without the entry in the select block, a device tree node using
'snps,dwmac-5.40a' as a standalone compatible (without a vendor-specific first
entry like 'spacemit,k3-dwmac') would not be selected by this schema for
validation.

[ ... ]

