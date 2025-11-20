Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0337CF887F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ay8G70TckXdWe0geBLoljoycveBYJmFxR6OBjgKDvCc=; b=E84JVWdjdIsXCsUGcUw6+8sCAy
	U6XwajrcWJhlUD9FuIyZShMRVmUHthYtCKHPViJPmSZLgMOA1tngzoJHdMt4jvVSoq7T6Gs7Lf1VL
	dfFs/0egJy4zBu52BMlmoCYaB9b2rEqxTWmnVrlQVz5/D6EiRj7q5yTImUUHDAjsC19vk2jUxwMZr
	c0j1IhA4JOglLf1fQ9929vSm40Am7sWm1lPyfdMFqqDULWNM3ootsc8VF3G3HIM2bfLhF/8+YE5cu
	WBXuSFdki8RzYZNwuIPp7F+2RU56eLZa0rr4SiTOQFdOqGwb487r5JyekNr9e6cR2/JsJjGT8P74h
	uGRJOQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMD3j-00000007WAm-2yHb;
	Thu, 20 Nov 2025 22:23:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMD3e-00000007W8f-0mJO;
	Thu, 20 Nov 2025 22:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ay8G70TckXdWe0geBLoljoycveBYJmFxR6OBjgKDvCc=; b=GrDEL2lUZb+iMM2U6dyw1oWvgB
	F6SkWcwJhO2331gNGz8Ujq9IJ1839/huZe55UrbsqN9ZbSIA/Qntx1EI8lj05BQk1Gg2ELNYSxQVH
	a/ODTCDwU9CMDiaeshGJW1Mg1JHisdNLs8nkb5aNruyIeye+W2iUchlgWckP9ku89qC8kn6SfQ9qi
	ptNwjKulD56Pm7Fr33LRmcz+AyYnjBXyXTlC8Y6CqjnLsW7oVwJ4G2z8Ke2mtKRux4ZWVjNgik/D9
	M/dHQsu5vO0T4upaoRhXhuDw6H6J0qQET5ipKeTGTJrY7M0++rTpJNXr6xgYwG+TV01ihQOLJ98Xe
	yhtknFVQ==;
Received: from [213.192.12.196] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vMD3a-0007Je-KO; Thu, 20 Nov 2025 23:23:14 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	finley.xiao@rock-chips.com,
	sugar.zhang@rock-chips.com
Subject: Re: (subset) [PATCH v7 0/5] clk: rockchip: Add clock controller for the
Date: Thu, 20 Nov 2025 23:23:05 +0100
Message-ID: <176367711155.9778.8068115837215397006.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251111025738.869847-1-zhangqing@rock-chips.com>
References: <20251111025738.869847-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_142320_048123_1DFB4056 
X-CRM114-Status: GOOD (  11.77  )
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


On Tue, 11 Nov 2025 10:57:33 +0800, Elaine Zhang wrote:
> Add yaml and dt-bindings for the RV1126B and RK3506.
> RK3506 depend on patches 1/5, so it is merged and submitted.
> 
> Change in V7:
> [PATCH v7 1/5]: No change
> [PATCH v7 2/5]: Redefine clk id(start at 0), drop RESETN for reset id.
> [PATCH v7 3/5]: Drop RESETN for reset id.
> [PATCH v7 4/5]: Fix "description: |", drop RESETN for reset id.
> [PATCH v7 5/5]: Drop RESETN for reset id.
> 
> [...]

Applied, thanks!

[1/5] clk: rockchip: Implement rockchip_clk_register_armclk_multi_pll()
      commit: 826eaa8f5bac6e919cf7c0b4161b2d783fdc45b3
[2/5] dt-bindings: clock, reset: Add support for rv1126b
      commit: d0d9a9629f505ac70e1ffd172e092ff71f5d989a
[3/5] clk: rockchip: Add clock controller for the RV1126B
      commit: 652c108cc44cd961b58b2998ff429f11ee60c9fd

Please address the review comments received from the DT maintainers for
the RK3506 binding - adding the xin24m supply clock, that is also
present on that RK3506, as with all previous socs :-)


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

