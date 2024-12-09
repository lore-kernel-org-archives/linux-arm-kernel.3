Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E27E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+U/2c2oZlKC2157S49D5OO/8anE8SSNsca8MtUOTBw=; b=IWDM1HCvQHNU7sJrtD+8mxQfZj
	yIAB+fJgZZs7/PEXcte0lxGZECESEBfEvgGSTa+6UahnMBqR5MoNza6eBnsTSqRduyVdaGspN4M9f
	ROgLNAJ483Lo1am4qQZ52Q5A7uaJRZnjbQlvtvqjrVbcE1+0whuP+cYpopGJYyelxbSvVoonjO7BY
	2jirY6/SldP0q7P0E1LP0T3zBXKPve1821S8Vc2wJSDIQ+4QxEgN+7l6WjDRr4L1eCSX7w54Ehr23
	c13REaX6p5p/0bILF5j9B9aLq1Pjg5DT97ocgPLWwq1v5IOjKZfjy2LY9e5eSImCFEePWLoAha3AS
	EEb41nlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKn2P-00000009Y2j-0DxK;
	Mon, 09 Dec 2024 23:19:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKn17-00000009XjY-1IJv;
	Mon, 09 Dec 2024 23:18:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B5325C5F5C;
	Mon,  9 Dec 2024 23:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E296C4CED1;
	Mon,  9 Dec 2024 23:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733786295;
	bh=hmPA1RbKTwQnOsHyx4RnWAjW6XPcda7839gBgswa0Kg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ezRxn5lBkTzNN0EGCUbugwW9spneaZXOJPMMsVwsQMcm4L0P4vnuSUhjAtDK8f8Ay
	 HIBUulUfDYuQCdk6B1IQrv7tzx2qB6Dq1DI3Eqijv/o0wx02yNC0pYwkLprmRTv7zR
	 PuTZ4YFiYKmF4ROoDR4qctEQTrPD/ZKm1fmq9bVqI/Zf6EPLiEPfpLvwNHAA+4FP14
	 qH9+jEhFK+T7FUAjjo7cf/qnYaP30n0UZ8+6bhj2QH9Th5TIiiCA6boczNHbzh+HY/
	 oY3mLguXSp48182n3hVjI8/GIga71eVeDxpOFFLNvG4rn0pdYbzVmN0vBHdZxd0TXV
	 whdtxyT8UIbBw==
Date: Mon, 9 Dec 2024 15:18:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Vladimir
 Oltean <olteanv@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20241209151813.106eda03@kernel.org>
In-Reply-To: <20241209134459.27110-6-ansuelsmth@gmail.com>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
	<20241209134459.27110-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_151817_391454_9741227B 
X-CRM114-Status: UNSURE (   7.22  )
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

On Mon,  9 Dec 2024 14:44:22 +0100 Christian Marangi wrote:
> +	regmap = devm_regmap_init(priv->dev, NULL, priv,
> +				  &an8855_regmap_config);
> +	if (IS_ERR(regmap))
            ^^^^^^^^^^^^^^
> +		dev_err_probe(priv->dev, PTR_ERR(priv->dev),
                                         ^^^^^^^^^^^^^^^^^^
> +			      "regmap initialization failed\n");

wrong ptr?
-- 
pw-bot: cr

