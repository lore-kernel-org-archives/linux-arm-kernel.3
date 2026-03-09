Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E445BEF36FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 07:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6A621qqZMR4RoPezT1l3FqPdT9TZG3nguUUEgKLWOOQ=; b=MUI7jRhv2OJXIpt5FV8S1R7mOK
	UYIGAXLlwRjOLvMkifk4N5VRT0ABLb9BGSKgPeEQvV3CKi7tmbO7pF7wGM/LmfydhxnWZteTNuFfT
	RpFa8vDw2oQ32D2bP7P0cnNYtF6WT4ENkDHWXCM+vewM+TM91iJsBHK9vxNTt9hT6Covf+99EopBV
	W3KgDtyKvR8P6FCCn61xXcMcYhleBkM4jNSpE3CyB9XMw6krrVh25+Mx0xfEDHEevsDASBOg8KvyC
	1hngy6Pq59Wy2GdIT/bxq46+KN/nu9iDnlEVrb/PE6wK8PK2yuJczY3ocwOFgJ+WMM3ic9YrWYjKD
	Li7ZO8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVHP-00000006pBK-3TRq;
	Mon, 09 Mar 2026 07:43:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVHM-00000006pAv-2vv1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 07:43:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 902FC44386;
	Mon,  9 Mar 2026 07:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7E9C19423;
	Mon,  9 Mar 2026 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042231;
	bh=lZZKVhRMK0MaELynDO5IE2fxGhEn83gLbdSckMRB8pE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nJXXszp4tiFB25LtgyWLhe/0q/xDnGp0wZwXkAuoEo1RaJC75AdCjdh5xIlSle0cM
	 tUjvOGSTfukW1MYrDp8h+7qCkaZsV5FuYq1xRqe/Xt0ZpoznnOpgXgtgdTn0EJioFk
	 7izfEjVgQy6ZCCyC18b6pzrU4Zr4hihIU2tldIjiDhib4fE7FUie0pZ5aAhF/pkP14
	 KndApV7fab/EZNk51t6kx+I0nZTHMrF1U9M5eFFExNdIldCeCfQPamqTij6ktmF5m/
	 CGZDCPJc3SBsHW0XLG/TmkaiWQCjuJLYNqqOo5QDpER42c+i/aL5+p2rBETFaWtU/V
	 PGWA1AbFWr34g==
From: Vinod Koul <vkoul@kernel.org>
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Max Zhen <max.zhen@amd.com>, 
 Sonal Santan <sonal.santan@amd.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
References: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] dmaengine: xilinx: xdma: Fix regmap init error
 handling
Message-Id: <177304222898.79304.9472475091542211377.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:43:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_004352_843933_BE016C7B 
X-CRM114-Status: UNSURE (   7.57  )
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


On Tue, 14 Oct 2025 08:13:08 +0200, Alexander Stein wrote:
> devm_regmap_init_mmio returns an ERR_PTR() upon error, not NULL.
> Fix the error check and also fix the error message. Use the error code
> from ERR_PTR() instead of the wrong value in ret.
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx: xdma: Fix regmap init error handling
      commit: e0adbf74e2a0455a6bc9628726ba87bcd0b42bf8

Best regards,
-- 
~Vinod



