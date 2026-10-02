Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76943CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvI5rA2BsHrApBR9QCfo5HYzpkgGUKmP3+iH/QCnwts=; b=QcggB6MdJqYKHXeXYoLACiyM3b
	y4z2RmDlty/G0TPvX5+PlHt/R6lccOQDWPJNJhZpRhaDpzgwX1EA1x659F5e+9MKefS0M91bvaxS5
	osYaVtQanAv12NCc1dIxCawRCTf1Q+9Vd43UyBd6fOAMKu2LjeiC3EYZLGfN2t5+5qiovJqMsvRwP
	kCNTJjjm00EZ1xDtykKEU7GCL64vwLN9IWCrt8UAwgRWUh8yAFNDiJz/mgZ0xKp0a8K9zeAqgbYXD
	CngG63FNcauXbOyPF+cyDHkg8yDSOzhfQ5f+Nxp1XAvtH7qoPanIePbZcHJ634HlBZx4S+4cZR6iM
	Cn29V2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPc-0000000C4ah-3gAf;
	Fri, 02 Oct 2026 16:47:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPZ-0000000C4Z8-1Yw3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:47:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF56160214;
	Fri,  2 Oct 2026 16:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912811F00898;
	Fri,  2 Oct 2026 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959624;
	bh=XvI5rA2BsHrApBR9QCfo5HYzpkgGUKmP3+iH/QCnwts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Us4l3jQnfMXzXUgE0mzhupmPL1OWdNmOIsauX73UiJG05fZUnIs/uldB+LCv9BpE+
	 3k8r6TjA5cJSWl4NJNP7i/XN9qhp4iMbVjgWBFSPVr34fDxzZAGkugx0hJVIyn60Wp
	 u9gIF3125QSFvCczjMsq6vV9dz8I0KwFum5ga2B8/VpQ3K/aIMBtjLiuFtcPQeFkWy
	 t/ooZBVLQ7seWXpKdmUUpgAQjrEXP01+pv6r97/3tTfQpDil+IE6Lfsq99FrXKwZg0
	 yuP4AVY1R6vyEyVJBm0DBbsXfqkti7g0TNF9rb2tCqMkCey7YTkVdoVRqvhIgP4ObN
	 CQVN8VFJm/LZw==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	jyescas@google.com
Subject: Re: [PATCH v2 0/2] Add arm-smmu-v3 support for Laguna SMMU silicon erratum workaround
Date: Fri,  2 Oct 2026 17:46:39 +0100
Message-ID: <179095473404.2069316.15351395567657253108.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
References: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
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

On Fri, 11 Sep 2026 21:21:04 +0000, Peter Griffin wrote:
> The Google Tensor G5 SoC (Laguna) has a silicon erratum with the SMMU
> integration where the AxPROT[2] signal is always 1, which makes all
> transactions appear as instructions.
> 
> As a software workaround we make use of the INSTCFG override feature to
> force all incoming traffic to data.
> 
> [...]

Applied second patch to iommu (arm/smmu/updates), thanks!

[2/2] iommu/arm-smmu-v3: Add support for arm,instdata-override DT property
      https://git.kernel.org/iommu/c/937bbba25930

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

