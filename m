Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0AED2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONSVQRKcPO7Hdq9rjeCJBLbi+rJef9ClGejj6CnM0wY=; b=wlahG3ZhZvXoLSDqhIhxCYZzGu
	DT6LD0tsOiZIe8QTXve9s01sN5guEmOwV/nd1hUWDkDLfrYK1ZSGaa+66wuf3PzNaKcsNvEgQyFW+
	Pp+PAksMw62/hSsied+WTMMULc6UBW1MR6wkmp7p4+GepwHBhRHWTymIuWJLN5dom5U2mG/jLBBEM
	HWcmgovOh52ImMEGPaLzuw1Mhw7wB6gckbb5G5dunPmReSOTsfCDdev0anK7DNef2C+78zJJvvrSK
	UeLGB07znxha6hK2AgYtLn3gYzWLQ6QwSAI/hsb/lgvnvUSu/y7JdmmJQTD7MkS4XqrVStA8AMeWZ
	FvWqJIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9QL-00000003f1b-1P4O;
	Tue, 20 Jan 2026 10:57:25 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9QI-00000003f16-0IYJ;
	Tue, 20 Jan 2026 10:57:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768906567; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ak6+zhg/djoSET/jxpadpQyRcrriZ+Hb4IrbOf1xk69NlUklGQMlAFWHFwmYe3Yesq3b5hQ22GYGsF+HGH1Bt05MaD92p74uwnxUUFvPhFQ84McpHwHIm1iz+EQW9QgEc5Xc5zFv6FwCsoa2iYSN8/h5UXVatAvvTisNw1EldZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768906567; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ONSVQRKcPO7Hdq9rjeCJBLbi+rJef9ClGejj6CnM0wY=; 
	b=NOJakvj5baRnkmXoB7LumnUit/KQxGV92PkXR478iuA98Tdt3Of/28od+qlx0Eepp+TIkIeLBAt5wPapNsAjtx9Doj78v/gkaJqNN5QnZPeD1wRDB6IAZiGhCl9gjGgBF3uF+8QEDy5fAE724YLlr0+UDLbM8smzAJ233CuTkzg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768906567;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ONSVQRKcPO7Hdq9rjeCJBLbi+rJef9ClGejj6CnM0wY=;
	b=UfbY76hCP8zX5WETuGgn6VZM3NN+FjaN8LWv69wwAVNk0zvq8H3HC8pdZHJp2V4c
	sfOY8cbsd+bhCiZhPaWpES7/nq72N3qz3r2DaTdaXMj1PJmH1Q7eUkPXygOtrxsg6XT
	wISiqo24iESoNSprYd3gvxcv3ZhFDNNxXiO9pccg=
Received: by mx.zohomail.com with SMTPS id 1768906565127972.0399174349235;
	Tue, 20 Jan 2026 02:56:05 -0800 (PST)
Date: Tue, 20 Jan 2026 10:55:43 +0000
From: Yao Zi <me@ziyao.cc>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: Add support for Spacemit
 K3 dwmac
Message-ID: <aW9fL7r0AM0flALJ@pie>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120043609.910302-2-inochiama@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_025722_188850_2D5CD355 
X-CRM114-Status: GOOD (  16.59  )
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

On Tue, Jan 20, 2026 at 12:36:06PM +0800, Inochi Amaoto wrote:
> The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> MAC (version 5.40a) with some extra clock.
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
>  .../bindings/net/spacemit,k3-dwmac.yaml       | 107 ++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

...

> diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> new file mode 100644
> index 000000000000..58dd98f79e8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

...

> +  clocks:
> +    minItems: 3
> +    items:
> +      - description: GMAC main clock
> +      - description: PTP clock
> +      - description: TX clock
> +      - description: PHY clock

Why does the MAC require "phy" clock? Shouldn't this be handled in PHY
driver instead, or I get its meaning wrong?

Also, I don't see "phy" clock is acquired anywhere in the driver. Is it
really necessary for the MAC?

Best regards,
Yao Zi

