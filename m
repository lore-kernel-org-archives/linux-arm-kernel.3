Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE795E92717
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JON7EhFTDNEelfylKALMXTbkwUkKqxujg/BRlfMbsc=; b=IOSONDs8yoZ5laMM7cM/Rd441c
	DUeh1ztPax2Q8CxGPbwznp/etV+jHHQDLfmwwQ+oSGlyFMc+Tfy71HAmsU6v/3qp1xkSPPBTk1hqd
	UwFIQW4FiCleqKQN2Mh/Q9wlOIv8y3OhGHt1FS7kttcoCXf15C86uAhAEsdsJ2+fQwVxbmSg7Rgox
	I1S4YY//OXVHHge5o8pOn1fnXdBJuipfCTEl7AmKl9+gwzAwCnkIA26HdT40SXq+VkSc8B2tpYOZX
	rFYyw5D+V3ifOadCRycnA+Yy8Xez7vkeltzSXxR7aOGXEVyACjfW3KD6JuGr1+PRkCFIayt+b6nFJ
	gklZSaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZYKq-0000000277v-3zui;
	Sat, 27 Dec 2025 17:44:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZYKo-0000000277G-14Ra;
	Sat, 27 Dec 2025 17:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34BCE43246;
	Sat, 27 Dec 2025 17:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA24C4CEF1;
	Sat, 27 Dec 2025 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766857446;
	bh=rEzyn2bOa/coEWORVff+5bDDXl1nAaryf+Cd927xIOk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=plgRFm2xv3fqWW5WRh8lT7O/Wmj2z7xu9xX/s7k4mnHrgMJaVSaAIgUsOCHQxxJxf
	 e6mTos4LuKjclLyR3T6+coydKFAv2N0HxD4b3au0Nb53KzuTbrBqNdvHEyliG8JKtu
	 fXiK6hG42cOmNtGWdwQ2HnSUsXb6lFMVGlWV5WG4Y90IjVbaF3u5zWUYaXHUOOHGfi
	 T4kb34NP9bp5miMS5tqjAdInUe7MkV/qIg2DSNX0OUYLIkOhT8IGd4O9Ht9ptxB6dC
	 b0B5vlls0XTmDuY9T3iuZHkSWJbQzmzXS9tvbgpr7h2Wiu0YnJGKZbh05vwAISYNZU
	 Bxz63eR8a1ZCg==
Date: Sat, 27 Dec 2025 17:43:55 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Heiko
 Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] iio: adc: aspeed: Simplify probe() with local 'dev'
 and 'np'
Message-ID: <20251227174355.0677f93f@jic23-huawei>
In-Reply-To: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_094410_410801_AE2341AD 
X-CRM114-Status: UNSURE (   7.86  )
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

On Sun, 21 Dec 2025 15:26:03 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Simplify the probe function by using local 'dev' and 'np' variables
> instead of full pointer dereferences.  This makes several lines shorter,
> which allows to avoid wrapping making code more readable.  While
> touching the return line, simplify by avoiding unnecessary 'ret'
> assignment.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
All 3 patches applied to the togreg branch of iio.git.
Initially pushed out as testing to let the bots have a play.

Jonathan

