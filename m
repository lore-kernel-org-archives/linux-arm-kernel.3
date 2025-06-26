Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD9AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 13:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/w9ktxB2FSSbC5u5pzpZ+7NBcF4prBpuQgkZmm0hjYA=; b=iE/6XSS4UJ0bGdKe3n5AiZkhuB
	aKrCuPUMkoEo/HRLQubTR8CztKJhKtqqf4cASY5H4eBL/nmCkBMh9Ii3DdDDZnds27VnX0mM2rjOk
	aHAIHqJnWjIq1VkLQCsFyUmmIAVdbiPr+xEaZl+G4n+SfmFq1WOg15XJLDrHcyi7ZbnvVDavVdpoZ
	Uahw/ZpFFowwemMc1Kf0WiZiXKhVjKsz2CPGHj7c+HEX7JgKFYu5pxUhrV4SmmPtD7yDflK74b5Ev
	QFVKm+3LL74yYh9K18f8sBdnDBPXAXFzxOfl7FRHC6UzqKT1y1MtPS5e2VnwBHHmivwHF1TYzOZ5T
	zppyokuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmc7-0000000BfFE-2rQH;
	Thu, 26 Jun 2025 13:26:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmZE-0000000BedK-3EhI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 13:23:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37191617EE;
	Thu, 26 Jun 2025 13:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89813C4CEEB;
	Thu, 26 Jun 2025 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750944183;
	bh=0J9XAPALMHCGTDiJj9uTHhow6UcZ3bYIJmApqHiqf4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqHhb0PjB4oZGRa+tmOszHEDrhs7SMXBOMBdp76LA0Z/dojo0WYe3uPumaSp6fV3V
	 8Aqm9lBOzXBz2VAJbrSWOlWxorNUJhOJwcWx4hfZyMHKr3OmZ7FR5vZkk177JtYHTu
	 Ug7WME5D91qi9ypSo6yxYSNkgeBj8MAAIdyy2JgGddTaiReBGc0ZB8h+qwEgCTujhg
	 iwEXB/ziHc/HTqnwgSORjsITVbRpee0F922SugdrpOsskxLZdiMV/agOMH2Tp3NRru
	 LamukhIm39q7+9o4yiQ1Z8u4lYDFR9GzlYNxD1bNqb5o/KxYo32Nweg5RYuq3V0aIr
	 SzhypWot+Ypnw==
Date: Thu, 26 Jun 2025 14:22:57 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
Message-ID: <20250626132257.GE10134@google.com>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
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

On Tue, 24 Jun 2025, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Replace struct bgpio_pdata - that we plan to remove - with software
> nodes containing properties encoding the same values thatr can now be

Spelling.

> parsed by gpio-mmio.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 18 deletions(-)

Can this go in on its own, or does it have depend{encies,ants}?

-- 
Lee Jones [李琼斯]

