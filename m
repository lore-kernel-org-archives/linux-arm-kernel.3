Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B60C71153
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9HiArrZ02HbUfeGxXuFT3mdQ4lNmwORA+PN3sHB+XQ=; b=c1l522SgQjfMuMimQHhURZBeHQ
	rnM7VB6qknOPF71CeJj5pHM5OyFmdS9rgIk/PoIzxi+cC9ZMlrLpraB5tTqmaCyx5T0eAN3PmchY8
	iilRTjJS1F0r9UFOPEi5C4iuvnQjwdOo3i/X+IqmpEYnfdQYHrFegty35qDSfj8NJzCvfhnjanOmb
	diYcZI0HFCGSGixr34irotTt4GkRvklkd90JnUMwpmQpOB03vd7X+Qe2rWszvW96sAG2n4oNZMguW
	OsSQKJ2kKhcZNw77IlSIyJrzIb8ZtSS5XGp59VDUBPXYuTlVBwI0tR1RjZI1Q2UumCEXMUTsWPC/J
	IbVpixDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPphT-0000000EfSm-1siq;
	Thu, 12 Jun 2025 21:43:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDd-0000000Ed84-2qpg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 21:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=s9HiArrZ02HbUfeGxXuFT3mdQ4lNmwORA+PN3sHB+XQ=; b=EWtw2x4iVSiFPVSKJ1BbWbsZcU
	DCFgNbKyz7bMab7urbcnnLQoFkdRzbxC/8psyGX8MJuoQW+8hM5EwxcVFvj1JfURujr0iWZZHH74N
	TnIdzVCA3G7QJzCOfiFE+djkwvVRcIqe39qnJP8koYFvcUKVjBT9+BwY39tAroZAR8n2MCcJUiMDr
	ZWwGi2oyVSvhebV3QkwnHdIYZGhv4N6AounR+jiXqLzT7z+Doxzp63Umurp0kot+UEIRAjE3Ym+rx
	RqWwJ0wwaU2uGxXLhDKNkPp0pqtiMESGhdwwEPT7Q/lDsE+ludcwR2n7OWz8fgUoX0tBI8zS+4r/0
	VwhVCfwA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDS-00000002hzI-2coa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6111C5C6898;
	Thu, 12 Jun 2025 21:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8277AC4CEF0;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=OOlbVfIgzSBqrQXeX6P9ycG03p+lP2ZHx7YjgEpCU6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UVmNVb2Gfw6soyav8Jw1t1IwyIz2kFnRbuRi3hmFF12qeTZUMUy5tTozoCDUiKMVi
	 oEBrxso0VJoAcEmJzA/yVAa/NTGp6St9onOGoTy2+frh21hxPqXhTvdQF4Q9s9Kvt3
	 fYJNnrH6GHUjk3tsjqvYosY+p17eN8lNq2vrZd+M66jP+Bv/qB3Q3YRw0EqVLqGnAp
	 F1m5yFZNrTFG2gym27EcynxVevQvMslRVAjpky2045VYi7H8iF+B7fvsFVcdkm0fkl
	 DyJ62B7/DdeEGtgwENgDH8eRicdujy/J0AHuRRmAg/bFp1p/xxfmolWK23eiMRmgFj
	 NHX0R/Tmp/Ikg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE42C71144;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:25 +0000
Subject: [PATCH 01/11] pmdomain: apple: Drop default ARCH_APPLE in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=OOlbVfIgzSBqrQXeX6P9ycG03p+lP2ZHx7YjgEpCU6M=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a304RI+5uRSxcm2H0JiO3dduZX2HrBD36b5tV1dlZfM
 EnjkDLrKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEzk7F5GhhlGi+Uymmt3XJY6
 o5eV9aXOS3nGtZvsb97re8a/Led9msbwP7ByVZLoA4uPsRrqS1llrFVnWH9h/9D1rOtKQJZHCsM
 0LgA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_221207_479745_F2F56EC4 
X-CRM114-Status: GOOD (  10.48  )
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

When the first driver for Apple Silicon was upstreamed we accidentally
included `default ARCH_APPLE` in its Kconfig which then spread to almost
every subsequent driver. As soon as ARCH_APPLE is set to y this will
pull in many drivers as built-ins which is not what we want.
Thus, drop `default ARCH_APPLE` from Kconfig.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/pmdomain/apple/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kconfig
index 12237cbcfaa983083367bad70b1b54ded9ac9824..a8973f8057fba74cd3e8c7d15cd2972081c6697d 100644
--- a/drivers/pmdomain/apple/Kconfig
+++ b/drivers/pmdomain/apple/Kconfig
@@ -9,7 +9,6 @@ config APPLE_PMGR_PWRSTATE
 	select MFD_SYSCON
 	select PM_GENERIC_DOMAINS
 	select RESET_CONTROLLER
-	default ARCH_APPLE
 	help
 	  The PMGR block in Apple SoCs provides high-level power state
 	  controls for SoC devices. This driver manages them through the

-- 
2.34.1



