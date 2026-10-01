Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7EECA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38PEju8gJraz7rj/lcXRXGwgYOzwaB6JD1QWV7pLJ5E=; b=M2em8Vf1E8oj6xa3D9WsrauoJ+
	s5z4FVGH6oZER3jXAd8F18O9zvi32uyFdBRfC8S3nvwxcgtTtac00OLBcqRAaY9mB9xZNpJ8fLO9b
	bi6foRv/iNlOR/LdozEDra5k+pj4auOtBb1z61SmhihHG2UUMBo1CwzsHbzfovDsUXrDwXYLIkY5U
	90ioheikIHfAdMMvYt8mD2vKhpd09NBSVpFZnWYPZgtP6oGRe36KI1h07SheG+O0M2yNpeoFdE1FU
	crp5zY1Y3RC718GBnZEQ/bcFPyNMknWTtnpIE7LSJbtDyW7bGfm5aP8t6wWxfx71T2N8iL+xM5zp5
	EPHI8gFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ3h-00000009aYx-2DFY;
	Thu, 01 Oct 2026 15:50:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ3d-00000009aXn-0Y0f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:50:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FDF560A6A;
	Thu,  1 Oct 2026 15:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D4C1F000FF;
	Thu,  1 Oct 2026 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790869852;
	bh=38PEju8gJraz7rj/lcXRXGwgYOzwaB6JD1QWV7pLJ5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e6dqT27Z4SMNBytpWWlfL5w3s5ueCegHCiUgSDc2ZMEbD2bEswlCFECsVY+uPTcQF
	 OJZVcmsT1d1FHkANFS6MKuXP+V3Qxcvg3LoKWk5M8xzSoi9h2qY2b+ToIgzoFn0jy0
	 hVfnyb14YLbGSN3DOo0GfoGPdnSdvlw9WFZGROSEBne/2Uel4Khf3ihI5NHQZzHE8y
	 E+hkT61NbbqlJdoRL7xdrtVlqLBS5UF6NsXYE1uJPNn+oOu2aztEqz/5aknt5MkT1w
	 MIJfa9ZPAgWBbnHXAyzgAf1RXuBlVgGj8KpmK8WhwEbavVVzaGB2iVKFnVEyWTvT6t
	 uU0m2Vk6lOarg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Beata Michalska <beata.michalska@arm.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Vladimir.Murzin@arm.com,
	suzuki.poulose@arm.com,
	James.Morse@arm.com,
	xuewen.yan94@gmail.com,
	seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] arm64: errata: Share broken AMU constant-counter handling
Date: Thu,  1 Oct 2026 16:50:42 +0100
Message-ID: <179085736057.651403.12389463608357199980.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001090050.3849551-1-beata.michalska@arm.com>
References: <20261001090050.3849551-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 01 Oct 2026 11:00:30 +0200, Beata Michalska wrote:
> This series factors out the existing Cortex-A510 erratum 2457168 AMU constant
> counter workaround into a generic broken AMU constant-counter capability,
> then wires Cortex-A725 erratum 3821522 into the same handling.
> 

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: errata: Factor out broken AMU const counter cap
      https://git.kernel.org/arm64/c/573371caf7ae
[2/2] arm64: errata: Add Cortex-A725 erratum 3821522 workaround
      https://git.kernel.org/arm64/c/45f730467987

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

