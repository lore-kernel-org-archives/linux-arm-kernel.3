Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20393C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59e1GCro0WbneHQa42anvap4yh18L8Tn1Jdf7L1xdeo=; b=KdBg9MSPYwOhTpdb244mdmJVm7
	oNWXhHC9lBtRi19yeghTUAJC4Ndj4UQaC8b1sVqjzJB4JCb5GIrlcAjngTPRhXWVdFWnsFyxr5Xmi
	veZzVruSxAEBwN2euR2K2Gk6uGtDiP1D6OY9oSzPxubgGU/73JJPC6a/bO/HLbK2SkZk6SHAKh1oE
	f28U4mf60QNTFSewn/yXTX46m4SG7GRNoia50EX9wyDcfa3GZ8kpU4RWRwG3ISnWVRqiq6PMvZ2Ag
	2p3TjFFEK6hdcLs2Ao/CsBWlhTdm0U7+Bk+iblTTDiB/kpSDO9EJ2rAR8XjG5oKvxSJDfhOZaJeOM
	nTXOk1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOMJ-00000003tNP-1RrP;
	Fri, 09 May 2025 14:05:51 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNUy-00000003hrn-3yj7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:10:46 +0000
Date: Fri, 9 May 2025 09:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=59e1GCro0WbneHQa42anvap4yh18L8Tn1Jdf7L1xdeo=;
	b=x2rBzAvElnG6TGCgmPuydA6mwOtLGxwMcukr7iwnachfNhT3vVHAJ0UOeHsHo9txStuAk6
	9x7Tev7ubxwG4a4LQxi8lf4OYRYE4xsgu284Zgm0RyRwpNqERvC3o5N3H4GJjHFF/MeJ/G
	gnNuCAYAz686/rzZeYj+MgzlWYuZsnTY5qD7VX2XHJ9wJPmHmzsMOCNjgbHYv3S+//ySMH
	rbS4gVEMLpdDoZzHGanW7eBIAXnVeSs9/vrJdDx85bQIuZVlVoZEyeb7QL30LS4JfXZQ70
	k8N6JJeqEQNDs1hyimaxjF7MmrpYYhTyQIVNoJKE4tRBz+G9hZrpMITpmVt8SA==
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
Subject: Re: [PATCH v4 5/9] gpio: Add new gpio-macsmc driver for Apple Macs
Message-ID: <aB3-yygZvdgiE6L8@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061045_125271_0DC27C58 
X-CRM114-Status: UNSURE (   7.51  )
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

> +	count = smcgp->smc->key_count;
> +	if (count > MAX_GPIO)
> +		count = MAX_GPIO;

count = min(smcgp->smc->key_count, MAX_GPIO);

