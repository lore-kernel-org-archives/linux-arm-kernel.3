Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502A3C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 22:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKKJqb7n4An5D3uiri+4p3ogAqaUZVkxtTFU72h9IEg=; b=pKqShZGr+HqXoWZu8xJYq9VI1k
	v4dZr/lpUdz7V9y6x1RYUQ7hU7VckzekZba9rGYXFwtvBJp6Aj/PqpCZDxyU5sezcvEsCNM6K+QGS
	qe4l6gPGyH8f2d05ijfNJN2j53NazzYwCOFO/T5NydLLWho40VrTZ+We0is1UmmZkbd6tMwDqBHCE
	iXVnNg7a3LUp/TdTUFRQkQW6vViBPRIEQG08kSCyEE4pg0pRfdHBNnubesLHor4cSMnc/hOmfCV9Y
	YGhsP59BqQ9zT8FtRyH0M2YcylMzW3MFWKkSRT1FAIgOOOCwC64nA++JOW16F+19A/tAel9LbjqKB
	NiylvCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfcP-00000009wiO-3uW2;
	Mon, 25 Aug 2025 22:24:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfZg-00000009w97-30Ob
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 22:22:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5736960244;
	Mon, 25 Aug 2025 22:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A611C4CEED;
	Mon, 25 Aug 2025 22:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756160518;
	bh=96rEtlr/wVeNGcUVV2rp/lcVxCnwOxL8kgWk+EHrEBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlworCGfJZghHIW6KraZlUHCJifNHTnwNHVUxcNBAFJPxSXfKMhKSfJxX5/uWfivr
	 Ce8NX0F/VBU3IYHGzrAZAa2/kjltHh01uepzFQlLoMWKiY6F7fQAlU9aYRpp1Ky5u8
	 aNXHwckNzXUQs4ySBBllJeqft4HSklujIyGXKb0WiXSuKbe1N3ClekdWQk7Sc8F22E
	 3UkecWeotABBk5p1ckLimgpHuZKlHMEnU6/ov/gWV7TK+pif6933/PrEn8tupGkjhH
	 WK/fakAqKeT0T7N6EcZkBJbeYWZ2j0QsO3y3YB6LCULeSE/WKZN/3Cq4v+YuD4f3ut
	 PN6UNm/j0QLlA==
Date: Mon, 25 Aug 2025 17:21:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] of/irq: Convert of_msi_map_id() callers to of_msi_xlate()
Message-ID: <175616051613.748925.14127647667836301013.robh@kernel.org>
References: <20250805133443.936955-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805133443.936955-1-lpieralisi@kernel.org>
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


On Tue, 05 Aug 2025 15:34:43 +0200, Lorenzo Pieralisi wrote:
> With the introduction of the of_msi_xlate() function, the OF layer
> provides an API to map a device ID and retrieve the MSI controller
> node the ID is mapped to with a single call.
> 
> of_msi_map_id() is currently used to map a deviceID to a specific
> MSI controller node; of_msi_xlate() can be used for that purpose
> too, there is no need to keep the two functions.
> 
> Convert of_msi_map_id() to of_msi_xlate() calls and update the
> of_msi_xlate() documentation to describe how the struct device_node
> pointer passed in should be set-up to either provide the MSI controller
> node target or receive its pointer upon mapping completion.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
> As suggested by RobH:
> 
> https://lore.kernel.org/lkml/20250627213241.GA168190-robh@kernel.org/
> 
>  drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c |  2 +-
>  drivers/of/irq.c                            | 25 +++++----------------
>  drivers/pci/msi/irqdomain.c                 |  2 +-
>  include/linux/of_irq.h                      |  6 -----
>  4 files changed, 7 insertions(+), 28 deletions(-)
> 

Applied, thanks!


