Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BDECA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lT5VAqVxR7PF2pTcLLyyEAU4ZLvTK6F8FroUmVYH3Wo=; b=xE3xRNe4baKBoDfVd/7PpBwizA
	QHCmDDyGFNZ6EiCooTfEyjFmahf3oe8Jx8Ocrorn94wedwbPmHfOPCT/w0D+DKRKPuJa5TcrNfR4B
	VOQW9pRM3J+pJ3VeR+5imNPGNrjQ4qz0tM4MFtrvQ3kX5JW8rcwGNslvFGrW2jog0NzyXAc8B38eh
	2ytlMJTeFMAKy2+em5PRNSb2+1feMtB0akTJ/dB+W3mo3UH+oNzx+knGMqlPrJtfF4d6fzpPuGht8
	19TwyJUgQdFyVFXzzdONAld2teF5PqMnEAN3j8QdylvZLUL0lAWy70hCnowgwgz2YBddTMbHh66zB
	zfvH32BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD04t-0000000DYMG-01d7;
	Sat, 03 Oct 2026 13:47:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD04s-0000000DYM9-1KOI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 13:47:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C3D860D82;
	Sat,  3 Oct 2026 13:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128061F0089B;
	Sat,  3 Oct 2026 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791035221;
	bh=lT5VAqVxR7PF2pTcLLyyEAU4ZLvTK6F8FroUmVYH3Wo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lKj/UHbMzJwltpJAMI0y8f8w80V9bm1QR5NZOm55IupS366qaMJVDaHcKFWqe9YU1
	 KhovnU3M9d0qMf0JRdyIY13I0JdxM7s96CI0Pp/ZEgwJs++d92ATBh3sifiAwUDAof
	 fRsXTwQ4Qih3fZEqtS4Iw4W9pyAmttSoUlZ+4L/ttp4ESRHt9SOCu9VZ5u4t8++0iz
	 XT6xBuyidX534AF5KGx09dvBiz12RPEvR01S2T9sUFiFmOMEzgj/d1tcxHwzM5BE17
	 Ftehro2PHWaZAwhAiD+MGtbidwcBM3w512hfqguXaDpjyDkiNWkSHngS/YzuCvwPV5
	 4yCveh2HdLolQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20260930-exynos-pmu-cpuhp-idle-fixes-v3-1-4269d8425978@linaro.org>
References: <20260930-exynos-pmu-cpuhp-idle-fixes-v3-1-4269d8425978@linaro.org>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
Message-Id: <179103521882.13392.16561640308024902589.b4-ty@b4>
Date: Sat, 03 Oct 2026 15:46:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Wed, 30 Sep 2026 00:50:31 +0100, Alexey Klimov wrote:
> The setup_cpuhp_and_cpuidle() initialisation sequence currently ignores
> the return values of cpuhp_setup_state(), cpu_pm_register_notifier(), and
> register_reboot_notifier(). If any of these registrations fail during
> probe() routine, the driver returns 0, leaving the driver partially
> configured.
> 
> Furthermore, if anything after setup_cpuhp_and_cpuidle() fails in probe()
> routine, for instance devm_mfd_add_devices(), the probe() lacks an error
> path and leaves notifiers and cpu hotplug states registered.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup
      https://git.kernel.org/krzk/linux/c/f7b2b6acf658be412b0c4746d07d210a9e18f13b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


