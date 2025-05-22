Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AB1C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 09:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70enL7g5WSzQddZPSOmQhAScfnvEWrPL9Q+W5UfnB5g=; b=vbKZ2waXRhPKexuiqmQHyb6qua
	PAzudtUoyIMzOmC1Mg7C9pAnT0N+pm7pZe8ZLqUl8zv6ov13/7XHS+4wytJ+AWikCGlE9YlVaDMiU
	a1AjR7vTQ9BJr4TVfPg6nBv/k3wwpazz2AG4qvHHq4c793exGeuIeWYHuWUqClehzSfXzFoURpbBM
	UT32kHcfOzYUdJ5+kX+8uYthOzz8AspqkvUFuSvo0GzhLMbKiYXXjskwWI1SL8UCJpB9AE8f/1ASL
	epioaQ8W574BK+VCUzzCsnS1x3iGo1Pb4qaiGeW4usUjR5el9ZhK/sjCl1LAPrTQC0dTBLlrHj8oW
	vh2EgYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2el-00000000acO-1rhF;
	Thu, 22 May 2025 09:56:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2cf-00000000aAO-3rAu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 09:53:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E24A55C5648;
	Thu, 22 May 2025 09:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9711CC4CEE4;
	Thu, 22 May 2025 09:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747907636;
	bh=T0pbowsOjTPIPmPLHltgm1guTj5BuJMB/woFP9FHf2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RevpVodLJXvQ0wS4ohgmz+wxoibCLUyT1275uRa6QccMU+8LK1bt6ZpQjjvBEvKnf
	 c49Huy+IAD1uiDKI/VlGR1afy/itNlkQ7csiD2VnwOkHbzL3v0mCUBDsowNBIfuWAG
	 UC97AHv1x63ukf7b6uARgSKznbyJ2eG1o3lilPdqxmxSPfQmIWjeTjmgcuy4Qzscrm
	 ACtfsMnd/TMYzawjRjEnfr5Gp59D9f2seXtsEHfmiRvv2zYVCXSTaJ3bTxembmvJ3V
	 cw7G5l7JeN7yIIXXkX81T1iwgbLU7VmdisGZyKJxIjSFkceAp/rTDvxJ6vb4dGqxJa
	 ZrNJezcfwwrig==
From: William Breathitt Gray <wbg@kernel.org>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] counter: microchip-tcb-capture: Add watch validation support
Date: Thu, 22 May 2025 18:53:43 +0900
Message-ID: <174790756290.777945.12152629166611050360.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520-counter-tcb-v3-1-4631e2aff7ed@microchip.com>
References: <20250520-counter-tcb-v3-1-4631e2aff7ed@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=716; i=wbg@kernel.org; h=from:subject:message-id; bh=FyrqgtuhplOt4MO8YUx+XOl66iMHGL1vISika9BhmV0=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDBl6XwSC4tMesbNKbmq4G8K5PaLweNfJJUlXvz3ZJ9/E/ U9pusmJjlIWBjEuBlkxRZZe87N3H1xS1fjxYv42mDmsTCBDGLg4BWAiUd6MDPP2X7u90yKySKzG S9BX4eQRwXv+Z1InrWmrTon//ZrdaDYjw4xpW36f85+7XvDyNDvmhYcatELPqh66OLnf/23qvXS hPn4A
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_025357_999093_8FEA8167 
X-CRM114-Status: UNSURE (   8.34  )
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


On Tue, 20 May 2025 20:51:46 +0530, Dharma Balasubiramani wrote:
> The Timer Counter Block (TCB) exposes several kinds of events to the
> Counter framework, but not every event is meaningful on every hardware
> channel. Add a `watch_validate()` callback so userspace may register only
> the combinations actually supported:
> 
> * Channel 0 (COUNTER_MCHP_EVCHN_CV, COUNTER_MCHP_EVCHN_RA)
>    - COUNTER_EVENT_CAPTURE
>    - COUNTER_EVENT_CHANGE_OF_STATE
>    - COUNTER_EVENT_OVERFLOW
> 
> [...]

Applied, thanks!

[1/1] counter: microchip-tcb-capture: Add watch validation support
      commit: ae3392c0f12f179b969ce17856ed18bf8d69a35e

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>

