Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE074C4450D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v81RYgZzr05KCDxoR1cyj6HFcz85Vml1RF/7JkwpDYw=; b=xHtWxe0j7Nywimtx88rAsTiBBm
	Nx4D/rAHkW3ptwKzcSfKU9UvlqWx1YNQr5Xen0B/gF3+U7GvBT9oa5ttIDGiVHjz+tttoAuziyIga
	173rN6n9uMan8nawJvhEXr9DDFEQQezC3VbTSEDjf1UhJ9XZgmJTQvYWH+4QKp5f0mvyOKk+E6hw4
	sNjXvBpEFJzlL1cAw8JHzSDUE/94SUbl5ENgXkxGnse2sLXcVWOoOlh+VpXXzqUso8RANOmZ5OEQD
	EnPO1ZcNxyWwLnUoZMhG9aivgMxao+q5y9c/8l1JqHOzPor1WO0LGYTMgBulNQ0sndJEdL+DoQBgO
	zCU/zLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiFk-0000000CwGK-1wND;
	Tue, 14 Jul 2026 18:53:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiFi-0000000CwF6-0vYe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 18:53:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so33624905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 11:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784055188; x=1784659988; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v81RYgZzr05KCDxoR1cyj6HFcz85Vml1RF/7JkwpDYw=;
        b=PJs2NnqPG3iD5oLW3T9s2OuET+YauI85u+A3RcUs0iz5YVqVOxRrOVRmWOBk4S22M1
         7LtQbHm3Gm8ZY+4niJ8DSegd5nJjsu5oHMJ0gv+pb5WoyI+NSawKLWrWdvLx8TOxSXKo
         orvQ6U0/AYpsYaFLI4lAUo0NtRsfzKI6JpTs2LdX06bxhhV2xudEfLVUCYqdDLxWV26Q
         Zy5hIhMWxstHWNGcOXVooZM/BRiuJROgPt/HIMOmYfB25hAz1icpuoQ2muZBsGG7aps6
         h9nfJeLAtDciOG250XvvS8wT1HO0Xyg8A5DHU63m9n4f/E9Vd9Mx1XThfpO6bZidM3cq
         DXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055188; x=1784659988;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v81RYgZzr05KCDxoR1cyj6HFcz85Vml1RF/7JkwpDYw=;
        b=bhR2nZleHkWe7RjwTQhv20gNVCOp4u5kvWpFP4XUfE7kLxhBlOtUay2v0rgyl26vte
         uINxsym1R+UVyirB6wuyhM5DlRDHb5sCEKGByevBlh8lmHzcDTIpPWplFyxzvVhWuutK
         PpyY041UAJk1guYXDW+3lW5sqojWcORiS7WsLT+OrMI8sQhX9z5Eqkq1JDBF2iUM7gNb
         nJWeM2vuGeAr3s7X1kGHEJZT9K20638YhkWZZ1Vo8YDyZUeNysM8k1V2JalAJngEfguc
         o2YtyNkMfgVAsIp5f6fIOxy+6xWxn9v0nK+RCWI370r3kRVotHKB4lfJ1XoxHU6uWVlU
         sXeg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9+as3MOtporWMDRJX08FDf7GnwvPo4PQED0eovmi2avOauzwxS8q+Noqwkxofvu8SERhEOd6TEveWrRI1eVTF@lists.infradead.org
X-Gm-Message-State: AOJu0YxVIMr+hMWH3StjkE73Ef+o1t8jQX9+Qrx/XI/FM7TYWrAJjWbB
	DD/mk7qcm68xZ1xGotJ1o6/cHm1ZUOPTdoW54+HCfrSznLFFoBjVKVOBBR9h5QLTH6g=
X-Gm-Gg: AfdE7cnqd8NmJul5zBesj7/JUkOClo2iotW5Ce2FJjqSQ3GNy0s9HpUjt5D3dkD34Dr
	A7Sci0RaMG2fC6rHsSv/fiFhs14Dut1mqE+FKPP0nOOxn6r6ciQZH1ofZfMM1Oq1nkZEFFvgZJM
	6XlBVs6rJ1zQQHCA9/y/Tg26oew5R4ThRvi1wpsnHhrubrqQWyYOUvOh02W71qEh6VJnffGH3g8
	RAfUc5d319oPh4cZpCFDj3fo8q4CR9cK61kqsJbcTYNTG6ASsWEGJS1SHSTCs6dR9lSf1pJB4rk
	ibBHyuy+bM3TPUjnLBgrvwoshO3OHWo3Netnyyzw66rbwVqvkvovQTYjH7N/x6nqKA0c2n+b98s
	bkiNiwRFn+PxR395vxkLidj+B/tdpIv3PR5dDip0Ojx/deYIa3QkDJp7+KNjZxPliohc5GCG/1R
	smNls8OMjGluZl9ufNTn5o4Ya9RLH5YA==
X-Received: by 2002:a05:600c:3150:b0:492:53e8:3bc1 with SMTP id 5b1f17b1804b1-4953c1624bdmr714135e9.17.1784055187650;
        Tue, 14 Jul 2026 11:53:07 -0700 (PDT)
Received: from [192.168.254.124] ([2001:9e8:2fb:8201:c26a:83ef:161a:409b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508725c0bsm94908715e9.2.2026.07.14.11.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:53:07 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 4/7] serial: 8250_aspeed_vuart: add VUART over PCI
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 20:53:03 +0200
Message-Id: <178405518337.194693.16062290686593842402.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055186; l=4160;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=ZdMjtjALJ9INUjixbUCM2kZrdun7GikDbIME1A+PLD4=;
 b=GZ6jzOrhucR05WwmvOfO9a6YYLoB752Rjv/H4tteyWXK0nQoP0J4vtOVuXDGA+QefmBBarWe8
 Ma1Cg3Obz4gAvCucwwSYpECAuo9Mbmv2Y1RTdL+yzoGUgXHEqBazp7d
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_115310_388230_D9BE80A4 
X-CRM114-Status: GOOD (  35.30  )
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

> Enable the VUART over PCI for the AST2600. Activate it only if the
> 'aspeed,vuart-over-pci' property flag is set on an
> 'ast2600-vuart' compatible node.
> 
> The AST2600 has 2 VUART that are usable over PCI. These are already defined as
> the VUART3 and VUART4 in the 'aspeed-g6.dtsi'.
> 
> Sets the BMC PCI device enable bits, sets the PCI class code to
> unassgined/device specific, and configures MSI interrupts.
> 
> There is no disable function. Removing this driver should not disable
> the BMC PCI device, as other drivers could use it.
> However, if all the drivers using it are removed, the
> BMC PCI device will still be activated, which is not ideal. But in reality,
> this is not a use case for a BMC, the drivers will never be removed.
> 
> This is useful on PCIe BMC expansion cards that use the AST2600, such as the
> ASUS Kommando IPMI Expansion Card.
> 
> Register initialisation taken from ASPEED 6.18 Kernel SDK.
> Add return code checks to each register write.
> Simplify the code and add macros.
> 
> The ASPEED_SCUC24 regmap update is missing a macro for 'BIT(14)'. I was
> unable to determine the purpose of this bit. In the AST2600 A3
> datasheet it is marked as 'reserved'. It is only used on the other
> revision. As I only have the AST2600A3, I was unable to try this code
> path. This BIT14 was set in the ASPEED SDK so I kept it.
> I can remove it and the untested path if necessary.

There's not even a reference in the datasheet changelog, so I suspect that it
has always been reserved.
I'd be in favour of removing it.

> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 6afa2f4057e1..4d09c04cb972 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c

*snip*

> +static int aspeed_ast2600_vuart_over_pci_set_enabled(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 silicon_revision_id;
> +	struct regmap *scu;
> +	int rc;
> +
> +	u32 pcie_config_ctl = SCU_PCIE_CONF_BMC_DEV_EN_IRQ |
> +				SCU_PCIE_CONF_BMC_DEV_EN_MMIO |
> +				SCU_PCIE_CONF_BMC_DEV_EN_MSI |
> +				SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER |
> +				SCU_PCIE_CONF_BMC_DEV_EN_E2L |
> +				SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE |
> +				SCU_PCIE_CONF_BMC_DEV_EN;
> +
> +	scu = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +	if (IS_ERR(scu)) {
> +		dev_err(&pdev->dev, "failed to find SCU regmap\n");

dev_err(dev, ...) instead of &pdev->dev (defined above).

> +		return PTR_ERR(scu);
> +	}
> +
> +	/* update class code to be an Unassigned/device specific class device */
> +	if (regmap_write(scu, ASPEED_SCU_BMC_DEV_CLASS, 0xff000000)) {
> +		dev_err(dev, "could not set PCI class code\n");
> +		return -EIO;
> +	}
> +
> +	if (regmap_update_bits(scu, ASPEED_SCU_PCIE_CONF_CTRL,
> +			       pcie_config_ctl, pcie_config_ctl)) {
> +		dev_err(dev, "could not set PCIe configuration\n");
> +		return -EIO;
> +	}
> +
> +	if (regmap_read(scu, ASPEED_SCU_SILICON_REVISION_ID, &silicon_revision_id)) {
> +		dev_err(dev, "could not read silicon revision\n");
> +		return -EIO;
> +	}
> +
> +	if (silicon_revision_id == AST2600A3_REVISION_ID)
> +		rc = regmap_update_bits(scu, ASPEED_SCUC24,
> +					ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_MASK,
> +					ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
> +	else
> +		rc = regmap_update_bits(scu, ASPEED_SCUC24,
> +					/**
> +					 * The bit 14 is reserved in the Datasheet.
> +					 */

Even in the oldest datasheet that I've got (which was for A2 apparently) it is
marked as reserved.

Maybe some ASPEED folks can enlighten us what Bits 14 till 16 were used for on
A0-A2, and if they are relevant for PCIe INTx/MSI routing on the older silicons.

	Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

