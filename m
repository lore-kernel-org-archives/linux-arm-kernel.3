Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED18C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvPIJtAzDVboI151Nn+q4SZ7+4wnshK+MhqR9iXdoac=; b=DRRJ8Yhw5p6xucOGdQD0K9PpY7
	8Hp9vNri8S4BDI0poNmGvvN0s7yuH+fOLelgT987KScyH7cBg8pCqRyCYULKaOMTDkWcnAhlGVnCc
	N4CLeNSCcGQ8RIGn8dyuIpsgCUK08mfVMPq16nvmkgN+c+NQ99x3WEfplZD5dTdCUOm9f20CfE5zN
	qXgN9HUjw3i3F5/sjasbAK+c+6j5/uQo0ez4oe7C1k9dPuONJwlwuHfGmHxvn/JCiZgYi+j+12lnk
	nB0C5e3WuxQH4GdxaTZZXHdg3pNU3Fj2zI7wZDw0Jg9ipgxuWnk3aMWEbGKoqqUnpgOnopbrqLpjK
	w217wUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyS5-00000004wbv-24A4;
	Tue, 24 Jun 2025 07:52:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy5r-00000004s1P-2yEH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:29:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 268A749BCC;
	Tue, 24 Jun 2025 07:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D785C4CEEF;
	Tue, 24 Jun 2025 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750750163;
	bh=O27h05PvealtzA1SswhnPXVG+5x+RcHWMCkh/jC3fzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPEmQW1inTq4Rpz5TUtePLSc6M6wPN0iX9FAI+ANN3bNbUoGhlMxDrBNp4HIv9N8O
	 IfZFoam4LndvThNLZjiuuozIkQldFXvt6eumbSasbO4ll51KjH0wpn7w+p2gDtX4le
	 SNr5kv6XvlY85pE7L3jZNdA1+qRcUn8eegbfyVTvFCFubK7H1VfA6H140rF76hBRAN
	 k5AMMfiXVOBLFR6KPhbmH55pm91lEbGhYT4zMSW/D6IO1TbA4sM566MkDttt0VMA+m
	 697fFdIMkAx7lPtBbZ/GqzgVUgykeoUilBk51aczraYcbmI58+/DmBDu8uGqPobKaX
	 TjlOImCORjQLQ==
Date: Tue, 24 Jun 2025 09:29:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com, will@kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	ulf.hansson@linaro.org, richardcochran@gmail.com, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-pm@vger.kernel.or, frank.li@nxp.com, ye.li@nxp.com, 
	ping.bai@nxp.com, aisheng.dong@nxp.com
Subject: Re: [PATCH v6 0/9] Add i.MX91 platform support
Message-ID: <t5lg2iw2ha3xpqnce64k4xgaim3f2shfe4ccgnqggtouzy2lc3@se4e6ldggjtx>
References: <20250623095732.2139853-1-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623095732.2139853-1-joy.zou@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_002923_765381_D7038EE9 
X-CRM114-Status: GOOD (  16.94  )
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

On Mon, Jun 23, 2025 at 05:57:23PM +0800, Joy Zou wrote:
> The design of i.MX91 platform is very similar to i.MX93.
> Extracts the common parts in order to reuse code.
> 
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core.
> - i.MX91 has different pinmux.
> - i.MX91 has updated to new temperature sensor same with i.MX95.
> 
> ---
> Changes for v6:
> - add changelog in per patch.
> - correct commit message spell for patch #1.
> - merge rename imx93.dtsi to imx91_93_common.dtsi and move i.MX93
>   specific part from imx91_93_common.dtsi to imx93.dtsi for patch #3.
> - modify the commit message for patch #3.
> - restore copyright time and add modification time for common dtsi for patch #3.
> - remove unused map0 label in imx91_93_common.dtsi for patch #3.
> - remove tmu related node for patch #4.
> - remove unused regulators and pinctrl settings for patch #5.
> - add new modification for aliases change patch #6.


Where are the links to the previous versions? Why are you not using b4?

Best regards,
Krzysztof


