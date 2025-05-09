Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DBCC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzSnmSwk0nGHtv2iF4t+ebWzcjSFYhcwYVYNbytSiHk=; b=n52dbL6KKDJM/L1niFj7smeO9C
	pgFbzZHks26czi5GgpR9Z8BzsOCRXod3M50DtdgOC5IDmfkpoNMgN3/iNOBhXYWEH4U4+NyM5pVAr
	ChxfE2qotFGJ19vB9sADAf1wttkFAN/uknqZNU8fL8Sz8tgo9RNE/RWaNb/m3mv/mLztVfy0hzQ7R
	Yq7ayE8F6gVbukVjUmeBmSoDC1Dbz3hUc14L//Nyr2Ex4oxzY0TYQU5BIMr2FmM/KYu7dtfuF2HAa
	HLt6GJAiElkawoOtX5Jxj6vMbXhyeFYZpd6x79YhIooHCZp23U7FscYnKU63M0gJHO+jy4Q1Kq1dp
	rBwcr9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOGU-00000003sBB-3Fll;
	Fri, 09 May 2025 13:59:50 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNPm-00000003hGM-0agI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:05:23 +0000
Date: Fri, 9 May 2025 09:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746795918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gzSnmSwk0nGHtv2iF4t+ebWzcjSFYhcwYVYNbytSiHk=;
	b=tIgn3Xe2JeGm376gk4FVSfq+FmP0ZaFCgb4UHTE7K3hNLhS/FqRBYeGELvYgW5MxqZGVZ4
	n0kBVS1euuaTESPcXx/31E0/NnalAoUrBvZt5CdQsj7zWa61fB8zdwAYSvsr1yGN6ayaw6
	FhsDNP1jUAZnni0KgqScKToufJJ3m8+WS8U12YoV9ufY1G6w2sASlEza3I+RbTJWkAvvd6
	kEJQbO8AIxAufRvXll84vR04nBi3tqBtyjeo0QTFDI2fCwGmFETIm6EGohBbQg4tfZu+St
	UjkMTd89YeYTR25UgS7gTl4cm3jzqLDzzBP6s9JlKlRkSU2SLBnk78pEA/ds7A==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 6/9] power: reset: macsmc-reboot: Add driver for
 rebooting via Apple SMC
Message-ID: <aB39iJm9759RYAKW@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-6-500b9b6546fc@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-smc-6-15-v4-6-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_060522_663905_CD6CDDFE 
X-CRM114-Status: GOOD (  10.64  )
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

> +	for (i = 0; i < ARRAY_SIZE(ac_power_mode_map); i++)
> +		if (mode == ac_power_mode_map[i])
> +			len += scnprintf(buf+len, PAGE_SIZE-len,
> +					 "[%s] ", ac_power_modes[i]);
> +		else
> +			len += scnprintf(buf+len, PAGE_SIZE-len,
> +					 "%s ", ac_power_modes[i]);

Nit: { braces } at least on the for loop...

(And might be more concise as

    for (i = 0; i < ARRAY_SIZE(ac_power_mode_map); i++) {
        bool match = (mode == ac_power_mode_map[i]);
        len += scnprintf(buf+len, PAGE_SIZE-len,
                 match ? "[%s] " : "%s ", ac_power_modes[i]);
    }

though IDK how people feel about it.)

> +		mdelay(100);
> +		WARN_ON(1);

...What?

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to register power-off handler\n");
> +
> +
> +	ret = devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART_PREPARE,
> +					    SYS_OFF_PRIO_HIGH, macsmc_prepare_atomic, reboot);

Nit: squash double blank-line

