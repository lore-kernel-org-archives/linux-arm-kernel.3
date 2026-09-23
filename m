Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDC8C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PEG2hQh4VbbIb8Ol2k4AHCAhheLSNq1fmhDKGZBrJo=; b=LCZflcaBrT1s6UB9xMsZVHGrvf
	3u/kflgvKJ4n0YrGh+G0t+o4wYw1wDMCxZ09Hndd9aT9ASVUnVHXnBz/4AuCs6pEeBAWaDzYcD0HO
	AFrdHOI6J9I8JJyCCKPjmYKaW8LIxh+vr0ywBie3J38iKEaeRAObWVnIomOqsFgE27RAmEi+RJ8jw
	agx9OwSxZ+lx0AwKf4f7AVCfP8O9hc/Riek2ORqWvRUw9c0/HKow+drE71YWa2tg4rQvtBcPd0W5t
	Ahur474DIjqRwn36rJfsOxq6pdhPxxYEaEbKwOD7uB/tIKpsO8GBLtpIX4h3YVjFdpOFBXueQWqxR
	xZc90BcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RI7-000000097d4-0zGE;
	Wed, 23 Sep 2026 18:01:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RI5-000000097ct-3mp8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:01:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38C8941A5D;
	Wed, 23 Sep 2026 18:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6F01F000FF;
	Wed, 23 Sep 2026 18:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790186517;
	bh=9PEG2hQh4VbbIb8Ol2k4AHCAhheLSNq1fmhDKGZBrJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OLffsnpNikCrulk6Drxd5vXez6+YqaOmw87TdolQ0I5QmEVYI3ILrMHj40D8hu/MO
	 N100XMsDhvhTcbB/Bo+RhfUqDiNy5Fv69zp6ErYhfPIIvkYDeSgFIusQrWc6FoKqUT
	 22JxqlB+EMXrKiB2MMuBK75/yPkK8dMEwDyWF2Ff9k3J15+I3BRMuVwAL65vol8yes
	 mX9LklkXDq/PTLwfmmuxrYUlDVZ2oeoKND55LqWEakUelKQFQLtgov8ppeHc1HDzFf
	 xyO8pqZ7KTit90Z9rdJAKO4ZuvYdsY7CCC1k89T2t1H3MInkCLGbZJH71Ik9wteSRB
	 3p89msLBSCNjQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260917235925.44185-1-diegomancera.dev@gmail.com>
References: <20260917235925.44185-1-diegomancera.dev@gmail.com>
Subject: Re: [PATCH] memory: stm32_omm: fix child clock leak on set_amcr()
 error path
Message-Id: <179018651467.64819.2245489948858045.b4-ty@b4>
Date: Wed, 23 Sep 2026 20:01:54 +0200
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


On Thu, 17 Sep 2026 17:59:25 -0600, Diego Fernando Mancera Gomez wrote:
> When the mux is enabled, stm32_omm_configure() enables the two OSPI
> child clocks via stm32_omm_toggle_child_clock(dev, true); they are meant
> to stay enabled for the device's lifetime and are disabled again in
> stm32_omm_remove() and on the devm_of_platform_populate() error path.
> 
> However, if the subsequent stm32_omm_set_amcr() call fails, the function
> jumps to the "error:" label which only calls pm_runtime_put_sync_suspend()
> before returning, leaving the two child clocks enabled. As this happens
> during probe, the error is propagated and .remove() is never called, so
> the clock enable references are leaked. devm_clk_bulk_get() only releases
> the clock handles on unwind, it does not undo clk_prepare_enable().
> 
> [...]

Applied, thanks!

[1/1] memory: stm32_omm: fix child clock leak on set_amcr() error path
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a22355280361d2a376a2020059a2bae11e6cea10

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


