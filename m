Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E86C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mZRoA9PODrPhpIJV/r8XJ2VpWLCKH5KZbcXxYdds34=; b=3n27QVrVsjG9iHBU+NJRVmYG/v
	S3tJEGagbcDBWLm5rIraMUaD1MsHGZi5UoObKtJN18Etl1NYQQeUEddVAgEVQfM7uNn82bNEkY/bU
	Gqhf9NAAiajlGYg+molB5Nhre074qi1Q0Eb762tqujWDFhijgxYoBC/lkAA4UQsVDhVbb0bxU/ktA
	/bvUPQzdWsaVxORHf1CvX7LgFM1dXHagP1WzjnXtlSsvxDt5G9Y/ANmQBJAGN0PnRbtba3dzPZhpg
	yOeWZcYpIdB1LSn7VHpiq0M0QFPHha1jNTbxzLH56/WLjLsxPrjBtmTp7gJvBOXbQGr7PGaEI41i0
	Q/jgKaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tjF-0000000Frna-3Zll;
	Fri, 11 Sep 2026 05:23:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tjB-0000000FrmT-0dzo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:23:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD52043BDE;
	Fri, 11 Sep 2026 05:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A8B1F00893;
	Fri, 11 Sep 2026 05:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789104188;
	bh=+mZRoA9PODrPhpIJV/r8XJ2VpWLCKH5KZbcXxYdds34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P4RXfBs0nPp3VWp10lsNlf2bnkwuFmzTreTSpWlbyZPkzqZ8fM+k7sRwdeD2L6pig
	 GuaHY/gzhEwxZz7MYL+Z+q0XqhlqrLRHzljXZ7m+VtdTlNCON6VEHPcQJeCfmNMSxI
	 6QPNykGgyEvwD9NfBO2BVyiKEMRgJG3podow0KFbj1QXvXjSSao/vbpgEBWyx3hZq8
	 T8MppCQOFy2T3Um5yvLPEYoRY0YABML6mTn1uGukKb+pWxKejY+tpvzCR1L3CwtpHY
	 d/1W1KKGxmT7AnM+i+YCuB4Nwip5pNftCkvFAbJN61ucbfGzFX1EfTGDQY4/Eykuvq
	 f6DhMbMaM85KA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vincent Jardin <vjardin@free.fr>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: Re: [PATCH v2] bus: fsl-mc: register the object drivers after misc_class exists
Date: Fri, 11 Sep 2026 07:22:50 +0200
Message-ID: <178910416254.316287.15938875439475759696.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909-for-upstream-fsl-mc-initcall-order-v2-1-b7a04634fcf1@free.fr>
References: <20260909-for-upstream-fsl-mc-initcall-order-v2-1-b7a04634fcf1@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=797; i=chleroy@kernel.org; h=from:subject:message-id; bh=K0L3yJTFVuuzwDSP40fpMdTeNGFWENUWsbw5HIR+7tQ=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQtnmDQXeqnfltynoyFjlbODMfQg2WuBbks9bn3pt9O4 nt8VO9kRykLgxgXg6yYIsvx/9y7ZnR9Sc2fuksfZg4rE8gQBi5OAZiICjsjw4oQcQ4rmUt9K80s y+5de716Rtn5FzFnmLtsPorNYpjb28HIcCDA+2uV7LPe9zqiXdtstztZ5jyfcfWgR5BMuqTDQqf VjAA=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
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


On Wed, 09 Sep 2026 19:04:40 +0200, Vincent Jardin wrote:
> Unbinding and re-binding the root DPRC fails with:
> 
>   sysfs: cannot create duplicate filename '/dev/char/10:256'
>     misc_register / fsl_mc_uapi_create_device_file /
>     dprc_setup / dprc_probe
> 
> It happens when the fsl-mc bus probe is not deferred, without SMMU:
> - the dprc driver is registered at postcore_initcall,
> - the DT node is populated at arch_initcall_sync,
> - the root DPRC probes right there, before misc_init() has
>   registered misc_class at subsys_initcall.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: register the object drivers after misc_class exists
      commit: 7e9023a18eec88b716d8d46a29c4207186fbd828

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

