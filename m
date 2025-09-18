Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333B5CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 20:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yH87AIpWHJrQVqycZaZ1oydmRGWxl1BoYFhQjQrHuI4=; b=mGbohNgdUdVt5syRwsOK+E1pkY
	yQTSgoIkS6FsRQxTwlVnuvbPKnRxM9WYIaShslHxKVdfXc8b5pFbCg8ZIduLwP+jPJ5fIgF4N5G3U
	VKH0qacoFA0y1ZCQ5QFHKQdfCf4Z2Se9Y5gAsGfaFvz7rVpJTclbvufnp7WZjeqWYiDXsB3oPM2eY
	CdzGt0QasB0hYUuKN6NJPesc7yb1zV30mZGxu3MiIJ/j5XlLMkpmBXs6a5YlibP4WJQIxK2yokqFM
	UwoRtZlEsUue7LLSpBfWAjZkR8e7oQzZU5bFecL5uPNG4QNdlRNOei+6OSJL6PeJSfg1Fu0uYEnHZ
	N7sa8tsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKyb-000000014dn-3LDc;
	Thu, 18 Sep 2025 20:11:33 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKyY-000000014cE-43X9;
	Thu, 18 Sep 2025 20:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1758226287; bh=Iz1O6jfjq1q9VqakNVUVO7uZ4sHU1u3uu4IY4c2AODg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=idkAdHuL3LERu69pldFSTewZEkM2ke2QlZR8x3wLMExFHvq3v28C00mmuWZtn+QUn
	 eiTw4pD2Od7CeYDMMY7vXIPAw4MFLnzMkpIhAjgCNiCsxwH3SPv4NSgYOvS6Q/Hr6v
	 N08Xf1Nc8bcps8ZPB1eq+PKJC8WOnA+j+ztxd4GZFj94zHDwE9VAY4Ra4B4GJ7eemL
	 fYs8OfYQ53jk3W64OD8//weQjsy47BKG4k4YxDN1Wz4lr7iKZqIL57hF3XU89wyI/8
	 yhcPYwZ3ibt0CiwmEzBEcTmatzqkJvTXZ7c6y+2Jd+WIsSOInaj66atOwHNfi9bJ3y
	 vU1qIJ0k/wCWw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 762393D55C1;
	Thu, 18 Sep 2025 20:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1758226287; bh=Iz1O6jfjq1q9VqakNVUVO7uZ4sHU1u3uu4IY4c2AODg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=idkAdHuL3LERu69pldFSTewZEkM2ke2QlZR8x3wLMExFHvq3v28C00mmuWZtn+QUn
	 eiTw4pD2Od7CeYDMMY7vXIPAw4MFLnzMkpIhAjgCNiCsxwH3SPv4NSgYOvS6Q/Hr6v
	 N08Xf1Nc8bcps8ZPB1eq+PKJC8WOnA+j+ztxd4GZFj94zHDwE9VAY4Ra4B4GJ7eemL
	 fYs8OfYQ53jk3W64OD8//weQjsy47BKG4k4YxDN1Wz4lr7iKZqIL57hF3XU89wyI/8
	 yhcPYwZ3ibt0CiwmEzBEcTmatzqkJvTXZ7c6y+2Jd+WIsSOInaj66atOwHNfi9bJ3y
	 vU1qIJ0k/wCWw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id F04BE3D4D3E;
	Thu, 18 Sep 2025 20:11:25 +0000 (UTC)
Message-ID: <64ea0259-30a2-4264-8c05-8fd7df113bb5@mleia.com>
Date: Thu, 18 Sep 2025 23:11:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/10] net: stmmac: remove mac_interface
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
 "David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
 <E1uytpv-00000006H2x-196h@rmk-PC.armlinux.org.uk>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <E1uytpv-00000006H2x-196h@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250918_201127_506365_0BB65E3C 
X-CRM114-Status: GOOD (  11.00  )
/bin/ln: failed to access 'reaver_cache/texts/20250918_201127_506365_0BB65E3C': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_201127_506365_0BB65E3C 
X-CRM114-Status: GOOD (  12.26  )
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

On 9/17/25 18:12, Russell King (Oracle) wrote:
> mac_interface has served little purpose, and has only caused confusion.
> Now that we have cleaned up all platform glue drivers which should not
> have been using mac_interface, there are no users remaining. Remove
> mac_interface.
> 
> This results in the special dwmac specific "mac-mode" DT property
> becoming redundant, and an in case, no DTS files in the kernel make use
> of this property. Add a warning if the property is set, and it is
> different from the "phy-mode".
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

