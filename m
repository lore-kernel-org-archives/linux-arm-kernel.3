Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E932FEE4F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 21:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSPVq81hDm0J74IOqIp8SiqE3KXucHhplBZ4nMoCszs=; b=JNcq9TvG9kmyi6OS6jKKAXGMv1
	UkeNKbBDAkBzk3yCt6jYb6TA1DRdkzO2hHTb49Vz4tnOyO2vXbL1WM1R0jDp1EBtJeWhhyS3MjBGP
	LvW5eyvpjG7xjLdpD8wE2RaLvffIof7kZG9TbE07XgKRAU9JHJ9TYjDwxRcRAWSi8HzN+wk0IHkFT
	ZJdUNJIBzqLukQZqvR1dOHbQi6+1CbFQS1aAroYtE9Xj8YAU2eIDvKR41LAJil54gyP3yHLHzplGS
	EIsGM7pQwNYj509hgHlciYL3A5xm+aXGbYqYaO2kKAlYB7ihNjWo20DdBARxqMVWSIxZa43bD3KIg
	GkUTCyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwRi9-0000000AHun-0JCj;
	Sat, 28 Feb 2026 21:18:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwRi5-0000000AHuH-1vOE;
	Sat, 28 Feb 2026 21:18:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA165406B6;
	Sat, 28 Feb 2026 21:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361BFC116D0;
	Sat, 28 Feb 2026 21:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772313527;
	bh=LrGT6mNI+jCfEdEtzYEm5ownAK+ham3iPLxI8Va3x6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ew5g5c8tzhBv5k8g1mFuy03Thy+F5AuRIn5yAWi6HNFtQv56oq1bs9bzo03rTCdns
	 5ztCwasRq6mudOLB9siqGZycUc16wcm5QZ1B1TxiWUg3IgDAyqw8+XehIMUtMeetPq
	 p2aG7roHkxbBwDGcjGL4QbUj86OrIKbMdR/YtvkVtI598ms6Ljd+UU1rRJBTZmF/QY
	 Bvd+8BZgAbsbjiEjS38dOameD66tzEhzeS28OOQzeSvOo2oZ+K+X0tfA+rTWId+g4+
	 IIGgvxEygphcugx6YHcfaUdz4ieS3mOu77DEXncjwKKns4Ra87Va0+phlJS0pZ47sW
	 f5fWCxoljvdEA==
Date: Sat, 28 Feb 2026 13:18:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan
 <dlan@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Yao
 Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, Choong Yong
 Liang <yong.liang.choong@linux.intel.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Shangjuan Wei
 <weishangjuan@eswincomputing.com>, Chen-Yu Tsai <wens@kernel.org>, Boon
 Khai Ng <boon.khai.ng@altera.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu
 <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin
 Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add glue layer for
 Spacemit K3 SoC
Message-ID: <20260228131845.70421792@kernel.org>
In-Reply-To: <20260227075718.2243818-4-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
	<20260227075718.2243818-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_131849_548469_818AC4A6 
X-CRM114-Status: UNSURE (   9.11  )
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

On Fri, 27 Feb 2026 15:57:17 +0800 Inochi Amaoto wrote:
> The ethernet controller on Spacemit K3 SoC is Synopsys DesignWare
> MAC (version 5.40a), with the following special points:
> 1. The rate of the tx clock line is auto changed when the mac speed
>    rate is changed, and no need for changing the input tx clock.
> 2. This controller require a extra syscon device to configure the
>    interface type, enable wake up interrupt and delay configuration
>    if needed.

checkpatch says:

ERROR: "foo* bar" should be "foo *bar"
#110: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:45:
+static int spacemit_dwmac_set_delay(struct spacmit_dwmac* dwmac,

ERROR: "foo* bar" should be "foo *bar"
#148: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:83:
+static int spacemit_dwmac_fix_delay(struct spacmit_dwmac* dwmac,

WARNING: line length of 99 exceeds 80 columns
#243: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:178:
+	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node, "spacemit,apmu", 2, offset);
-- 
pw-bot: cr

