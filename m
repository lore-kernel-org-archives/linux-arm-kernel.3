Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D90FF30954
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS764krKV6WfB8kOxjvP29bXooB1nm1bNBDNiujlO4g=; b=sz04PN2XXyQMqJ8wkmS4nmKb5x
	AK/i2ByLcH5cy4WPT/dtnCDHOcJ2stOEYnXBaqjOZ/TpnOewHiIXq6kRhliatyeFZ3coY0YiyEmdP
	zEoeVnWOi9C/cqJCgDv0xdkdhUGlFVU9K8VRfI6CiA6Q/W2PrL2IZJVab27mYGdVEm267Lufy7Tx+
	fiwZgRUcVMYsGihL30o1RU8R/ZJ5S0SiaYrWFyly9EtGw+IKBucQIKKxshUKFjVJxV3fwhpz0KBw6
	d62z/tN+JZCdnDbPKaVbd/ZMTolpRpN2KsyqQPh25m/PHXEqWpoK+hWHM7y3fcnixzU/PW/ByHbI0
	UyByBEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7cB-00000001k5x-0bhU;
	Thu, 05 Mar 2026 12:15:39 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7c7-00000001k4j-2pYz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:15:37 +0000
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35691a231a7so4896009a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 04:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772712934; x=1773317734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS764krKV6WfB8kOxjvP29bXooB1nm1bNBDNiujlO4g=;
        b=QTP8rm7gnrIVdO9WJ3E8D0vKaKLh7n44rcLATVxuHzZ99zu0uzeoHETwlYiLfDp/Z9
         Qo+q/MC9v4WryZX3exAqyGQhRE6x0DUWbbUIdUQjSYggUvvId4pVVMUQQdEFazsQo/pt
         DGZpaYzi594zxcti+GNGRgvaFr2Lwa606kIxKk1yLkmkLa+ZiinuGhqWkqWhbbY8yVHL
         uJYNLurA70TDByVP88lz/SiKFZMrXLvwOP7e/lEnWwbc7xrq7s9UNef7/WWK2kVW+bL+
         ZKQeJwH6R/k7y54HdDFI2nd53ZuoPqHd12EFsUUD53p14atvU9Vr4XcNSm9MZNRNA2EL
         Zu3w==
X-Forwarded-Encrypted: i=1; AJvYcCUlIgCw9Fznq+M4OHhn1vs1vhKxPpknIETPraA9/SzOn+FiQol+IddFz9zV2vTFRQ2Qz8l+A7RMMfizPp4k8WSd@lists.infradead.org
X-Gm-Message-State: AOJu0YxvkGzajUE1X0xncU1I6ttlmJ4Ykvg0D7ssXnyK3YPb2IMCJBjS
	HzltUfuxCZIGicp1SVeFuAhFc7WT1TIBvr9EaSBMxCB7lDp5Gfy1X8A3
X-Gm-Gg: ATEYQzymsO61SKfgNzM6dKrz+prVSemjKm8+YUkFXMf6uwWf2l+CSRtNIypjpz6E3ie
	o3o+PEDMoujDMB5wwl9rXd6yJS3+ephGnSbwHb08pm2F5yzadJvf1yTTm/zzEwCs/HCe0oWLjhP
	SAw1YJnAL7hjI6ez3MXDtVjWVsRpZkVOxdL1Gf7EwWeLrUu5omGngUdCta69bdquIGzGA2/20/q
	mArQ5v39+txG/EvvtwlOkpA4sU6eUr6i2iI1CBFxHWcQ60ejdfmTL555qY2BOk5RnPe8U/g6TnY
	NvOMzoB4jhecQJyQPGb9TI/IqFfXYsChFY1nb09isK955ppEjrn+yMZVAXfxIZCcETxJqwgjl9W
	q5r9mlVSOgPPHtKcIc8cwOrcJh7uYSBogm+jYjFYEtvHUoCmwfqrBtg6ZcKE9CcrgDDcOD3RkC2
	oWivClJazeuGDxb2CFhinF1QvY2GL5S5gdSu8lrnpmQlV4Du4DwL9SOHG/OOox+kBckxr/MWbgI
	BpTlG11Pu+wsc5zqXlqftkeQy+8BU2PCFTOu4Rjr4hCDDFe3qyrgTMhTfaQew==
X-Received: by 2002:a17:90a:d44b:b0:34e:630c:616c with SMTP id 98e67ed59e1d1-359a6a92750mr4210979a91.31.1772712934483;
        Thu, 05 Mar 2026 04:15:34 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2c1daa6sm2391359a91.0.2026.03.05.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:15:33 -0800 (PST)
Date: Thu, 5 Mar 2026 21:15:32 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305121532.GA1649635@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305114352.2f7btqixg4tu5bzl@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_041535_712492_5B6AAA91 
X-CRM114-Status: UNSURE (   6.70  )
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

Hello,

> K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> K:	\bphy_(?:create|remove)_lookup\b
> K:	\bphy_(?:get|set)?_drvdata\b
> K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> K:	\bphy_(?:init|exit|power_(?:on|off))\b
> K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> K:	\bphy_(?:reset|configure|validate|calibrate)\b
> K:	\bphy_notify_(?:connect|disconnect|state)\b
> K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)

What about

  F:	drivers/*/*phy*

or something along these lines.

	Krzysztof

