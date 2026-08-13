Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEF5C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVSjljxeTNiOuA8vcM9heS5OVd8fSR3FWCLRErPJk2w=; b=15laVQ4mZZBvZG2vK17XWMGDRC
	AzCnB50TL/L/B136MSB+cwj58i2hA9I8e9Hejmgkma2wFmNaJkYosX7gbH+Z/lSTIjNgBWRvS+Ff2
	TvA78maNGWYK9WrglYQg5ssQpoGM+Fqq/TP+9lrPSs59QztWwVKCL5jQWLLDJ14oInOp0OilLqSQ4
	RLfuOfbEW/lxA7TmPfErSd9gx2vhYYXwp9TZSsoQR0pXRddwwOJsG8njytPetjiWdG72VjBaR8UYi
	iSDSzb4v4sw/GIg7+101LrnWPWNBuCDSSFG1qings0KCxgdXa3hpUMJtDHWEBaNF+j0EH61t2avdf
	9Hj6ybYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQy8-00000000BBr-2QV4;
	Thu, 13 Aug 2026 08:39:20 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQy5-00000000BBJ-2ggd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:39:18 +0000
Received: from francesco-nb (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id 75CA81FBAF;
	Thu, 13 Aug 2026 10:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786610355;
	bh=CVSjljxeTNiOuA8vcM9heS5OVd8fSR3FWCLRErPJk2w=; h=From:To:Subject;
	b=Rxki+4b9HHk1g177TyUVGYgaFeBxm792nu9YHZaz0+HyaZmeyUOPQQOBJoJptGMXw
	 5+sEXymW6Q0M6fMqt3OHNGJeAErFUS0cXYGlT+5Pm2pShg+oqHnTAyetmaQJyu/BDO
	 klp01qqS7kjZi6wsmior1B0PjtL4+W0gIPeENGYrxaxKjYJm5RwvygCmSJwUZEa7JC
	 R2cyr7yr1fBNZHygeWwHTvFtdFoZe7QQ5ej5EgBpRLOK5dA2vNZPd4eS7IyDk2HT48
	 ziJIr7a9L+gRBEawizjv9g+T3t6PmAUfQPI5WtwtAdhP506yw+XERG0G5jJFeqNxPM
	 Z5PLFlnfo8K5g==
Date: Thu, 13 Aug 2026 10:39:12 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: hongxing.zhu@oss.nxp.com
Cc: leoreis.costa@gmail.com, fra.schnyder@gmail.com, francesco@dolcini.it,
	frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] PCI: imx6: Move clock enable after core reset
 assertion
Message-ID: <20260813083912.GB19687@francesco-nb>
References: <20260813082900.270003-1-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813082900.270003-1-hongxing.zhu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_013917_833560_89AC3EF6 
X-CRM114-Status: UNSURE (   9.92  )
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

On Thu, Aug 13, 2026 at 04:29:00PM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> inadvertently moved clock enablement before core reset assertion, breaking
> PCI device initialization on i.MX6Q Apalis platforms when
> ASM1061/ASM1062 is connected.
> 
> Logs:
> root@apalis-imx6-11486042:~# dmesg | grep pcie
> imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 ranges:
> imx6q-pcie 1ffc000.pcie:       IO 0x0001f80000..0x0001f8ffff -> 0x0000000000
> imx6q-pcie 1ffc000.pcie:      MEM 0x0001000000..0x0001efffff -> 0x0001000000
> imx6q-pcie 1ffc000.pcie: config reg[1] 0x01f00000 == cpu 0x01f00000
> imx6q-pcie 1ffc000.pcie: iATU: unroll F, 4 ob, 4 ib, align 64K, limit 4G
> imx6q-pcie 1ffc000.pcie: Link: Only Gen1 is enabled
> imx6q-pcie 1ffc000.pcie: Link failed to come up. LTSSM: POLL_CONFIG
> imx6q-pcie 1ffc000.pcie: probe with driver imx6q-pcie failed with error -110
> 
> To fix this regression, restore the original sequence where clocks are
> enabled after asserting core reset and configuring the controller type.
> 
> Fixes: 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reported-by: Leonardo Costa <leoreis.costa@gmail.com>
> Closes: https://lore.kernel.org/all/bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57/T/#u
> Reported-by: Franz Schnyder <fra.schnyder@gmail.com>
> Closes: https://lore.kernel.org/all/t65y5d54axtksbfs7r4olcefqhwm6m4dz3njgnrnf7fcotj74i@o7avoznlafbj/
> Cc: stable@vger.kernel.org # 7.1+

7.2+, 7.1 does not have the broken commit

minor: it is not 100% clear if the issue is specific to the ASM1061/ASM1062
device or on the specific power-up sequence (reset vs cold-power-on).

Francesco


