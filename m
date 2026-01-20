Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864D0D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 05:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFedj4f11o/3T9vWUp8OttHw6rjgwlEi4dqKoM80zmU=; b=TYB1keHUKUIbeeVmcWp2WWC73E
	GTiLUXNO7GCdYShYJB63kD/9JWGU9HvNQvFDqSxYFeNKFNNGowKiMUT7lfs5xx5UaIE7k9MU6pGen
	02iJacefHMMvHqdISG1KIQ6iY3FdqL7yaiVvY7U8e/BL98SND03mLL1RjDKv9KcjaQkn1MUik47qR
	J5wvq123twJ7FUiro6KhIHmYcKrZl6ciqRPEmOQCE0Wwq8GIGhsb0mNRPr4WHv1Tp9KMmIRj1glBP
	Kw03ZT67gffYgc6fMT/Vi/sN/bo96Pzm1bYPzHlMFUwu9GVAZpkni84Kh+/EeF7BWve/9RvvnuWuc
	TQAMQcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3w9-00000003DSr-2Aym;
	Tue, 20 Jan 2026 05:05:53 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3w6-00000003DS8-1vpu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 05:05:51 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1233b172f02so6115000c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 21:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768885549; x=1769490349; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFedj4f11o/3T9vWUp8OttHw6rjgwlEi4dqKoM80zmU=;
        b=by4lFM8WQlXKapclGOIaJcnfqoPRVWg2+WsNMYjkI4rL8M487U0IEXkbXN5xPMlzm4
         wGmMZt6kpZWwBx0XZHbfVdvBiE90bXBE3tZvSyRcRdNCBaXzxyHBsb4I1cSbCcjPUvYe
         JYAyBrzXZ9j17wbHltu7VXu2JVlsdQsomBjiJmh/gSndSfh6wZqZlrmtnI+gRI3JIv0N
         OeD/2DjntLEVkGy/lhKvo64tDxOcaGN03tgwdKsJ6Y2cgJ5GUqSyZTaDb+gXJWt5JmAm
         DO3WGP916SuuoynjwBRiWkmjXrB+RT2BQR1A+6xO7h+heef0+usFkJOxIkqIUGihxjvU
         7m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768885549; x=1769490349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFedj4f11o/3T9vWUp8OttHw6rjgwlEi4dqKoM80zmU=;
        b=ijCp3OS/cQ93U7zalA7MI8dQlAr4h1fzFqA3AOQy/op31vwV8TZFPyQRi5ErU0bdIe
         VAcoO1wi5yTdGjQI1kFe7TH6fJ9OIrHyxiKYdJqmI6r+MMvNaQY83pvmZ0Zd4dkOj95G
         Gv6jTKhKWgzknjVR07zsLrH2F0+asG3RGa+kPa/0BnXHlIUVUbxExOgaaGBW0u1YFJa9
         m4zEHcfMwPPd+h8TcnlWhuE+EEaWifw1DBcx3o1wVD/hEPsBAE8IkGafAOCwkCJNddA6
         3OLQcnsjSpRrLE954pL+sRmEXO1DLb9d7nBOy88L/5CpAbAXY+ewXMXXI9ErieLjAykH
         JyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl4Gxczth9usbklI6AiFvTIA6oKqPkMGSJoZhUTGZIioLeppH/n+IiJbsmFWAHggjVBeWbgdfd9u3zbN+Cu9BZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyPzyCIZIPrgrTUYdc1Ekg+WfWzQNIx/kJtWTR8/J6DTIfeLMw+
	Zg73gD5ZFw0agyW6zbQ3A7xlzHfHQfDt/1PpLMsxil9l3GcvuUEO73nB
X-Gm-Gg: AY/fxX5IEzxjxvANayoVgM3jyiSs5c3Qe21f2LgBTFWgZhgpiRm5jjrYPFWBpEqRbi3
	lRTv+s2BanSVIBBVkMbbIVLkTAfAMf/PQu1/zrb8Z8GhSeNZ9QcIS0EzB2ZWMIlX8QOjkNnwe+x
	QUaOKcl6w2jegvzzk2Fst0Lk98J9cla/nPoJk1I1efcNt0Vr/ULp+4a8eb383NBDf1KUkB5yUhg
	5NyaJurbJnumf/lT3ZYvW2ZX66x9kLaZWz/xeiGj9AgrEcHUlr7oPydviLiAVDsAk+WFhPHZUNT
	fOu8sZzgZy0065RdZRDifys+/KyBjlw7JIoVP3wLTkplWSx++keOJzJ4ANMhl/ZZ0xorT/VfgpK
	SGs+69U+stUHfbGZLpDFHEp1Gb8Rn1hy/+P5hVj7CggHu+4t1HYcHx1BiFOy6ZRgjNEc+7r3svS
	Moop8qDuSSm1qseeurKMpI
X-Received: by 2002:a05:7022:672a:b0:119:e56b:98bf with SMTP id a92af1059eb24-1246aac3151mr600082c88.38.1768885549389;
        Mon, 19 Jan 2026 21:05:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10736sm19178432c88.14.2026.01.19.21.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 21:05:48 -0800 (PST)
Date: Tue, 20 Jan 2026 13:05:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Yao Zi <ziyao@disroot.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aW8MJpERR3TmsiKg@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_210550_508488_29010A71 
X-CRM114-Status: GOOD (  26.22  )
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

On Tue, Jan 20, 2026 at 04:56:32AM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 12:36:08PM +0800, Inochi Amaoto wrote:
> > Adds Spacemit dwmac driver support on the Spacemit K3 SoC.
> 
> Some more information would be useful. E.g. describing why you need to
> fix the RGMII mode.
> 

OK. I will add this.

> > +/* ctrl register bits */
> > +#define PHY_INTF_RGMII			BIT(3)
> > +#define PHY_INTF_MII			BIT(4)
> > +
> > +#define WAKE_IRQ_EN			BIT(9)
> > +#define PHY_IRQ_EN			BIT(12)
> > +
> > +/* dline register bits */
> > +#define RGMII_RX_DLINE_EN		BIT(0)
> > +#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
> > +#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
> > +#define RGMII_TX_DLINE_EN		BIT(16)
> > +#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
> > +#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
> > +
> > +#define MAX_DLINE_DELAY_CODE		0xff
> > +
> > +struct spacemit_dwmac {
> > +	struct device *dev;
> > +	struct clk *tx;
> > +};
> 
> This structure seems unused.
> 

Yeah, I forgot this, will remove in the next version.

> > +
> > +/* Note: the delay step value is at 0.1ps */
> > +static const unsigned int k3_delay_step_10x[4] = {
> > +	367, 493, 559, 685
> > +};
> > +
> > +static int spacemit_dwmac_set_delay(struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_code, unsigned int tx_config,
> > +				    unsigned int rx_code, unsigned int rx_config)
> > +{
> > +	unsigned int mask, val;
> > +
> > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> 
> These FIELD_PREP() fields look wrong. Did you mean to use DLINE_CODE
> both tx_config and tx_code, and did you mean to use TX_DLINE_CODE for
> rx_config ?
> 

This should be RGMII_TX_DLINE_CODE. This is a copy paste error, I
will fix it.

> > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > +	if (IS_ERR(plat_dat->clk_tx_i))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > +				     "failed to get tx clock\n");
> 
> You set plat_dat->clk_tx_i, but you don't point
> plat_dat->set_clk_tx_rate at anything, which means the stmmac core
> does nothing with this.
> 

Yes, the vendor told me that the internal tx clock rate will be auto
changed when the speed rate is changed. So no software interaction
is needed.

> Given the last two points, has RGMII mode been tested on this
> hardware?
> 

In fact I only tested the rgmii-id, which does not change the internal
id. I will try the rgmii mode.

Regards,
Inochi

