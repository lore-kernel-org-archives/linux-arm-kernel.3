Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51F3CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7DiZFC+m9rs0TUa2kmuB/E5ONWjaeXpAJf6tk5LF5M=; b=hu4DMguU+Vaib9MXdyD/krTp+K
	WrkSKfGGsdeK3Tb4fFSjH6V1YhWQYY3pNnpT/DxqaYyt1obpL9a8QB6qgivPtEHYHS84yWt7gAYGu
	YmpbMCNqvw9tSAon8vjmbEvgIHPDEYY7pmFnwvgmUikFBAFA+SWIsZD7rcEF5YXQZerQgfUXRT6Qn
	KakSnJBV4eWLjTdF9ESoevQZWL5A+xBShyOpXBLD3XuhNicKysctwbnEYiy/SFxIUrwGqu2ZIECFg
	amZaEWx7bzThwg/Uo8YJpxgVS0NUN/QyLYA1rb2Qg5Io5O3NJRhshabNMRUUemoXLU6ZERAgdxgRH
	gae8vTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShiJ-00000006NDx-2hKJ;
	Thu, 28 May 2026 20:52:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShiI-00000006NDr-2I8B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:52:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86A9A6022B;
	Thu, 28 May 2026 20:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D2C1F00A3A;
	Thu, 28 May 2026 20:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780001541;
	bh=D7DiZFC+m9rs0TUa2kmuB/E5ONWjaeXpAJf6tk5LF5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hJ54DL13q1oyzgu+NLatQEYrbnn5y0UMNvoSy8ijmk3MPa4qqAeqCgbvkWm8O+Plj
	 FIE9oHywnasoJCt7Y0rc7VklmKIU31tlaXIKxUP1FupiR7i4aQhuYWF3X9SIPsP5zI
	 dPlR3MwQRBS6bMny9BTOcEBPhJglM6uoutZJmrh3Fa/71754sLrUA0qZJMRpDNbF+B
	 gwUKTi0T9o9G2w1Ij2Eflxn02RoqPAoO73AHT/3cvz1fiz6vM1uWL+1VEzSuU2KG1/
	 TZ2hm36E7GEchnj449ZTVFZuhRZI30Q5SEMfs856inQvaUlYREgj/TpkFDwSZ10f4q
	 7nv967GXTck8A==
From: Thierry Reding <thierry.reding@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via MAX77620
Date: Thu, 28 May 2026 22:52:14 +0200
Message-ID: <178000152079.187267.3029370685286533529.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
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

From: Thierry Reding <treding@nvidia.com>


On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
> This series migrates PSCI and MAX77620 poweroff handling to the
> sys-off framework and fixes shutdown on the Pixel C (Smaug).
> 
> The first two patches replace legacy pm_power_off usage in the PSCI
> and MAX77620 drivers with sys-off handlers. Besides aligning both
> drivers with the modern poweroff infrastructure, this removes the
> global callback dependency and allows multiple handlers to coexist
> with explicit priorities.
> 
> [...]

Applied, thanks!

[4/4] arm64: tegra: smaug: mark MAX77620 as system power controller
      commit: ec36d6d5960cf75bea780a639db346cac42fab9c

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

