Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CC2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFCXU7H0oL06u6xHo3YYSGX4POQPEdOnk014fZrY8Mc=; b=eT0hRqnfpRoHMBx0WWHJJVU8gv
	NboZXjAMPLyCN5osQ+4tsinwSu9JowE/OMTluRT6OWEDa0I94Co0z4loe8vQRSuZcPjsfk3KGZUlE
	wVoAmgpGtoxije6IQHN4/cCu9Od5GSPLX+1uhdVMmnAYgrZlS14jRHaBxeuaB0e6ET4q0jsngBqgC
	/SbNZrKQSamX9vZt5bnCVYjzpvT3HGeceBN/56M08BEHCfu9OQnTJjGn2MeTdy6v0q7uPgS01uCw+
	FuhYO9n9hJQdIHN/WdPhOl3jpUbJYJPpG8uNYUCmmrd0nKnqiJXfZFCgUjyxwXWs38yFFWRW5Rb67
	1FXkOAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecHR-0000000HZSO-09ng;
	Tue, 30 Jun 2026 17:29:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecHO-0000000HZRk-0DFA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:29:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B496440A66;
	Tue, 30 Jun 2026 17:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6BD1F00A3D;
	Tue, 30 Jun 2026 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782840589;
	bh=eFCXU7H0oL06u6xHo3YYSGX4POQPEdOnk014fZrY8Mc=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=J0pps8s37pnFzgT0hu1OUti2Csd0rTYBmJZnGeRPO8z/xNw1/CXi78pztcxEHgOfK
	 yZCejPG5gNT4n25Hu5DSl/yF2PWiVVz4otxFwFf6Svv/MaHalUjaMq7UlmjnQTQCxT
	 NV9TkDxK6h0XQHQ9TTwGXpd5UzjJTRdmDesmqjBNEewI0o+8dftz2Q+ayghnT+XsPx
	 5gVspmPIXoVq7RZGNNJKI47y6SuVkHzXgTK3J6EtseejKC7xMNi75A/Km/v5KHdFdx
	 1lxPLhQW6dmEELcVHjnptfWu66sAxVm+d2JKjjgMoHGUWYmvZPoRJr86+rcNTEPGUb
	 uqyqhFHC++NJA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Ruoyu Wang <ruoyuw560@gmail.com>
In-Reply-To: <20260617182202.961843-1-ruoyuw560@gmail.com>
References: <20260617182202.961843-1-ruoyuw560@gmail.com>
Subject: Re: [PATCH] memory: stm32_omm: initialize ret in
 stm32_omm_set_amcr
Message-Id: <178284058522.367186.4955911649619846884.b4-ty@b4>
Date: Tue, 30 Jun 2026 19:29:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Thu, 18 Jun 2026 02:22:02 +0800, Ruoyu Wang wrote:
> stm32_omm_set_amcr() returns ret after checking whether the AMCR value
> matches the device tree description. On the normal matching path ret is
> not otherwise assigned, so initialize it to 0 before the checks.

Applied, thanks!

[1/1] memory: stm32_omm: initialize ret in stm32_omm_set_amcr
      https://git.kernel.org/krzk/linux-mem-ctrl/c/1527acf2295cf2d6e11e3e9b121d63709667e6e7

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


