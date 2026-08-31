Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9A2C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg3osVrlVujAJNkG/ATHMtl2juMAYLPOw8Bb3Ax+ya0=; b=F528yoxX15dQp2HG6+Up4tFNaV
	w2mh4x+jVw7FSkOcITszmCuCXtk6Z29JzclGELI+74cRCTYL0jfeM0iSorulix3lXVzwKl0y12xBy
	DX9EJ6eWn2qb6WzUpy/8Cqsn1buhprOOSZrMXlA55MNGaDSj6kpMGIazrTljKFALzO8Uo4hxyJP8g
	gbKLggjCThkCFkonLZkqCEu8nj5fYEX1vWtuCA9akyCNJx9zEX+ZAUbKLPDFdp04NEd2hvEB2luUo
	3jrTzbFEhVhSWIt3GC/jRc3gWuzred7UxEqXWaG4kEKS71B/4KY/NtNTHEoeyAZDgojFqOh7AYXYH
	ePxavVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yLK-000000091Ga-0vYf;
	Mon, 31 Aug 2026 09:30:18 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yLG-000000091Fc-1OyE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:30:17 +0000
Received: from francesco-nb (2-224-25-26.ip168.fastwebnet.it [2.224.25.26])
	by mail11.truemail.it (Postfix) with ESMTPA id E86D91FCB2;
	Mon, 31 Aug 2026 11:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788168607;
	bh=Rg3osVrlVujAJNkG/ATHMtl2juMAYLPOw8Bb3Ax+ya0=; h=From:To:Subject;
	b=lZfavcCUTgbZxwA0zMbPbgnJChS5FYFr9quaQxIVd/YU7OaMh5G5tAoCbE4BgcOU5
	 wl+m1JMP9Zta9vhcdOC2lozpxTCaQl9ufIeULJIkXrly2cq0O6klXpk0kpl4wfsjU9
	 r5XGJt8Bo26aoKbT1n7yfayfQj+BcqzWzpX+KSO2/KGNDpJL4PGRCtH8KTxPbngm1w
	 Tm8KPmGPpONlmAALYeKCUa3tUyI7wBwy/bIyphKWHIrmUpsLbqk120yH5iJjt9eFSc
	 iYkrvsK5MeuRaC+eHWjXD/lLHQLB5kJnXzuEfw0v0buZsGAlknrf2J2drtl0r0G598
	 LfTmIqR7jWKNg==
Date: Mon, 31 Aug 2026 11:30:01 +0200
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
Subject: Re: [PATCH v2] PCI: imx6: Move clock enable after core reset
 assertion
Message-ID: <20260831093001.GA38375@francesco-nb>
References: <20260813095003.356062-1-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813095003.356062-1-hongxing.zhu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_023015_440472_A722FBD6 
X-CRM114-Status: GOOD (  11.38  )
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

Hello all,

On Thu, Aug 13, 2026 at 05:50:03PM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> inadvertently moved clock enablement before core reset assertion, breaking
> PCI device initialization on i.MX6Q Apalis platforms with
> ASM1061/ASM1062 SATA controllers connected.
> 
> NOTE: It is not 100% clear if the issue is specific to the ASM1061/ASM1062
> device or on the specific power-up sequence (reset vs cold-power-on).
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
> Cc: stable@vger.kernel.org # 7.2+

gentle ping on this, it fixes a regression from kernel 7.2

Thanks,
Francesco


