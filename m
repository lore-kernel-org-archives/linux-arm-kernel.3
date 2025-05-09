Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1417EC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFKvoeUux8HoPiW0pGkCvuUeRg/1wy8FP9H83SjDrJc=; b=HgJTrz/eDcE00QsxAOxas3oNXL
	dNxwsiADVtRfcWhxv7hJjVAL05oac6eRzvpN6u1Vnr+0Y8UHApPbiI7tMydfYKo0GOtTDfm6mXBlZ
	UR89j6Qhpj8QlSwMcy8GIZHOUVcz8QcxyenTfQ1ruPxtsMjEkbweg1YI3SdTJDsciZWVeWYQa/9EG
	dGpxqTqAtJkEhSMYw333z2Tbr5wBvcMzUTxDQ46Nv4WpbFBcYlYQdZVJXtHIO1vgNFAmKtEDLdD6N
	RmkhAR67Dj8jg/5wyxVQmNUVGL1AFJL+kVNrlAs+bC1qwK396S8HRbY5LKh6uw01DZkSrHuUb5rTT
	FbbWnUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOKN-00000003st1-0FbG;
	Fri, 09 May 2025 14:03:51 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNTR-00000003hhB-1TBC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:09:10 +0000
Date: Fri, 9 May 2025 09:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFKvoeUux8HoPiW0pGkCvuUeRg/1wy8FP9H83SjDrJc=;
	b=TJVNqrXprhXeKjlasx3T+nT9Z+MfWMUC6C20fIi/NWSL5hEPmm4ocdmsUVMc0GtmVr/QH0
	eg7hZxodAb8PCG4569eZd1J+8MiNcG+XNO3Mpf4+5gD+MiFib2WD6sKQfvSKCV5tUrFRFi
	wjxZ58ltIcdQNsoPyUTCwGqnwYbyVqDEj17wu3wjYVjJ76jZ/uY2XSqjDFxCzSRZaLt63M
	A85GHOO6Oyd5wD3pvlxdIWQa+TPCnquoa3FH9iZatwtRImN9gFcPw/YHzH5RgqLR/p9wM9
	CiYe5lVzxZeHT/SaCmawrPwukF8n/zpFyuHzI3t/JJSHbvQnX8Vsjmlj56b8VQ==
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
Subject: Re: [PATCH v4 4/9] mfd: Add Apple Silicon System Management
 Controller
Message-ID: <aB3-bIOJsvlAfKRM@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-4-500b9b6546fc@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-smc-6-15-v4-4-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_060909_525794_57E3BCF8 
X-CRM114-Status: UNSURE (   7.19  )
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

> +struct apple_smc_key_info {
> +	u8 size;
> +	u32 type_code;
> +	u8 flags;
> +};

Dunno if it matters, but can we put type_code first to avoid extra padding?

