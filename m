Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50B0C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPdcUbMGRK+z1b/Gm/3XVB9Hvm8i227aTAHPO618ltQ=; b=feCowxBJhCMtA0NUTLUbwI9S6g
	37j3UJMXmLh7j9uG5sI3n4JS/aMjRolYBGgitmSq1P4rgvquNMOLch53iIT9ijO7XJETktvFqr5I5
	JYFYV2V2O2GTCjoeQ8m3KocYuSCgNVMsUcsi4Y/d6tQMbWtcM2aVbYuQlJ4TdYxoRnNzm2DZILKyY
	bh9Ep9RcSBBQLzfbLA4yHDySZfAuB6fEGlAwAbK7zL4J8leVmhtwpK7jAYcOhtWpKRa4xxbpx6pj8
	UtyN/sLD1/jND8uuBhTBD2NuQv6Vaohfs2UfKsuXc5ZQzKPTRRZ5TmJmcgi75gpd1ajw3iKlPajqo
	3QzddZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHjZ-0000000FQEd-219b;
	Fri, 11 Jul 2025 17:40:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGzG-0000000FL61-1R6w;
	Fri, 11 Jul 2025 16:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91F38A531C6;
	Fri, 11 Jul 2025 16:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2CCC4CEED;
	Fri, 11 Jul 2025 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752252757;
	bh=37aDaZMIwQe0MnbI8n+TOJ4i1Co5chVtDfQazgIHjJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y8RWVzC5aaFoplaLrZVGviuxjnrXgUTTc1YujyZ+kDYetAOaaaXiiTuU08K2rNKiI
	 vFemxUCHfjaNFj35eIPBFU+kGlAV6RvkUg/+g5eKfHKDpJiTXiKzN6OKMHLEIKKYSd
	 GaLLOXYgiQROidWlt0zzqIHf54gWwK4EGvsTQqQefhpzIhwnTDE6mn0j2uKel/X9iN
	 +ssvqr7F+PQmVvMcy27+nnqLrOuHtu29/L5ovZ1gt6su7fBxmk6mBux6dUR8JZCw0B
	 Do7pUNcAAOOuB8VCN3EAMMsM/5snWNK1CgjsqtFyVzQogAajV7/7WsevrwDiqJjYnE
	 h2VOZngIXfDfQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250610063431.2955757-1-wenst@chromium.org>
References: <20250610063431.2955757-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU
 speed bin post-processing
Message-Id: <175225275439.24435.9556126932579316402.b4-ty@kernel.org>
Date: Fri, 11 Jul 2025 17:52:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_095238_449670_D90CD3E1 
X-CRM114-Status: UNSURE (   8.71  )
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


On Tue, 10 Jun 2025 14:34:28 +0800, Chen-Yu Tsai wrote:
> This is v2 of the MT8188 efuse GPU speed bin post-processing enablement
> patches. In v1 [1] the change was made to the driver. Angelo, the platform
> maintainer believes the change should be made to the DT binding instead
> [2]. v2 adopts Angelo's argument.
> 
> Patch 1 updates the efuse DT binding so that MT8186 is a base compatible
> with no fallback, and MT8188 falls back to MT8186.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base version
      commit: ce32f3cdfbc31dab626e20122e577f75ea46b940

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


