Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5337AC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 06:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxvFYtSORWPE4XH4lAVRbloEchSO4ipPmXwG39eL3XA=; b=im3Ej1hAFOzyzZtnvmIsMLAmQO
	9oP2tfG8bqIAdWhzY/gmQw89kcNfmsmGqQYG0k5i7tyZMqNsYag4KTP8jJBh0SKVrJeIYCDwai3nG
	OMvj+70wqQP6RqsjzziDxuy8fh+72fXsN40OzhqHbeJ6d7mPKsBspe1kQjOK5mWgxE9aRVdx9vKCM
	50NROd0hYGb9B/o2TC49IowBuKW/VVqpSbgoeokw2W7swtRvW+CO4yHEIXGpHb0yM7bpV5QvNy16L
	JMk5DYIdUGkYJazJbO8xOr+aL/WcAJkpbTN9fJCPiiFAZnvUhSi60osq56bdZUm2fGOWDA6+qis5i
	Ei879wfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Mzp-000000016N8-1jLK;
	Fri, 04 Sep 2026 06:01:53 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Mzl-000000016MX-2CqK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 06:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=qxvFYtSORWPE4XH4lAVRbloEchSO4ipPm
	XwG39eL3XA=; b=m1w6G2Js1KYV5PzPjNvkVsERZSadMo4n0gnT0LOumG/HhbOVD
	H777NkBxN0d4mZzjTTr51BSNrjMYWtHUCyLN5ykLoUm+ID6nTVNjni7apYj1MhsO
	N8l4lrodW2TL3rLmgH3lnJPScLkoGU0RK5R6a4UEnWGh9BmSDIaA2wqzkY=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAesXppqTT0AAA--.254S2;
	Fri, 04 Sep 2026 14:01:17 +0800 (CST)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add UltraRISC DP1000 GMAC
 support
From: Jia Wang <wangjia@ultrarisc.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jia Wang <wangjia@ultrarisc.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <8611dff3-56ea-4798-8303-b0a8af84580e@bootlin.com>
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
 <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
 <910be156-b631-4b62-972a-79d9a9e38697@lunn.ch>
 <178842162417.2701756.3296149694160507506.b4-reply@b4>
 <1622b0a7-5516-4e72-b5e1-60c12b65b52e@lunn.ch>
 <8611dff3-56ea-4798-8303-b0a8af84580e@bootlin.com>
Date: Fri, 04 Sep 2026 14:01:05 +0800
Message-Id: <178850166577.1486454.10728134844652956076.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788501666; l=2449;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=6w6Si8JgjupbPLn9IvLmhgJhBOpM0WXa7jWCi1Z6cbI=;
 b=o6bJEJIl2iIflheKi8feHmKqG99WDoqDO9RKKIEE7kBxcrr7p85xxGUeXA9HIOj71A3EkuwpB
 mtI33Oi3JQrAOwXck6meyteCpyEbOLmUo4jP3AB5fIHPUzIcOKVZ5HW
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwDHQAesXppqTT0AAA--.254S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy8GrW3trWUGF1fXrWxtFb_yoW8KF13pF
	W293Wayw4DGF4I9w1Dt3W0vFWYgF18XFWjqw18K34ava90yF13Z3WrK3y5WasxWrZ7u3W2
	vF18tF9rua98ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWqZGSQAUAAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_230150_215427_4D93A648 
X-CRM114-Status: GOOD (  25.90  )
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

On 2026-09-03 14:30 +0200, Maxime Chevallier wrote:
> 
> 
> On 9/3/26 14:10, Andrew Lunn wrote:
> >>> This looks to be 90% identical to dwmac-sophgo.c.
> >>>
> >>> Do you expect any further changes to this driver? Is everything
> >>> supported? Are there more clocks? A GPIO for WoL?
> >>>
> >>> I'm just wondering if the common code should be pulled out, or even
> >>> dwmac-sophgo.c made generic so it can handle all plain boring devices
> >>> which have RGMII delays and not a lot else.
> >>>
> >>
> >> The probe boilerplate is indeed largely similar because both drivers
> >> use the common stmmac platform helpers. However, their platform-specific
> >> requirements differ: Sophgo requires additional TX clock handling and
> >> other configuration, while DP1000 requires fixed TX and RX delay
> >> handling. ACPI support under development is also intended to use the
> >> UltraRISC glue driver.
> > 
> > ACPI is going to be fun, since nobody does ACPI networking.
> > 
> > But how big is the change to the glue driver? I expect the change will
> > be minor, a call to devm_stmmac_probe_config_acpi(), in addition to
> > devm_stmmac_probe_config_dt(). Anything else?
> 
> I agree that if ACPI support is added, let's try to make it part of the
> core.
> 

The ACPI support is still under development, but the current prototype
adds ACPI device matching and ACPI-specific platform-data setup. Some
common stmmac changes are also needed for ACPI-described platform
resources and MDIO.

> > 
> > One problem the stmmac driver has is cut/paste glue driver
> > development. The same code is repeated again and again. Russell King
> > spent a lot of time and effort trying to reduce the duplication. So we
> > should not be adding more duplicated code unless it is actually
> > required.
> 
> It seems to me that all the RGMII handling could be made much more generic,
> as this is commong pattern in glue drivers :
> 
> dwmac-sophgo has the "has_internal_rx_delay" field, and dwmac-eic7700 has
> both has_internal_[r|t]x_delay.
> 
> With this third one, it makes sense to start sharing that logic across
> glues.
> 

I agree. DP1000 is another user of this pattern, with fixed internal
delays on both the TX and RX paths. I will look at moving this handling
into the common stmmac platform code, leaving each glue driver to
describe its internal delay capabilities.

Best regards,
Jia Wang


