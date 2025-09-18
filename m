Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1822CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tc1vqbLWYKdxdC2HbYUBoMGCTCbsrF5FMeM/L5RcKc=; b=kyh+SxDc2uRSHcIzmV8i+egDy/
	+k1ZViyx1Gx4YnW110lvuO4qWujhsADfLRXcElBZdgvWJNiIc1sCZZFA+xsFomIhehOX0Lxy82zfG
	uMnmw/TR53Or72WnYHK6nevh3Jjkx4BM2Ofkzkg1OFkq5RceGtqcrNkytbvsAs8jfSGNkOE70jejO
	Aq/9GZ7IFwjix1CyNU7efxGCb80bomG7yD5v8QDlJHAcWl1UD+Sk6f6Pe9I+M9BM1/5xB8rI8jPsV
	hQ9qGOmB3hOgQeZ62j6CqJKggglsFWNHqEI2SoXXertBvw968NaOYwC6LHitTG9qIAe6kBUvFBob8
	lBGP8AyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzB0g-0000000Gt9w-2dGT;
	Thu, 18 Sep 2025 09:33:02 +0000
Received: from mail1.nippynetworks.com ([91.220.24.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzB0d-0000000Gt8Y-3ohq;
	Thu, 18 Sep 2025 09:33:01 +0000
Received: from grunt.nippynetworks.lan (unknown [94.228.36.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lists@wildgooses.com)
	by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4cS9RF14Z1zkd2v;
	Thu, 18 Sep 2025 10:32:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
	s=dkim; t=1758187977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6tc1vqbLWYKdxdC2HbYUBoMGCTCbsrF5FMeM/L5RcKc=;
	b=Ic5GZJM5984XdM2DRZFc3j9G/IxFWtBsnoLYqs89Tak9cL/KN1MavtLM3A9vSSdokNn2bc
	EhocY5Yr/iwhY3hyHSu7h4qUjuN1l5WiLHkvLbPEhs9OaB3+u1gpLLdgwIwr/8iqElCciR
	bJlmqVCvzqPYiVtgI0m+wVqQ1BbU8GU=
From: Ed Wildgoose <lists@wildgooses.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ed Wildgoose <lists@wildgooses.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: rockchip: fix dma and pinctrl defs v2
Date: Thu, 18 Sep 2025 09:32:44 +0000
Message-ID: <20250918093246.15623-1-lists@wildgooses.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917114932.25994-1-lists@wildgooses.com>
References: <20250917114932.25994-1-lists@wildgooses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_023300_145145_2DD8C38C 
X-CRM114-Status: GOOD (  12.12  )
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

Based on feedback, I reworked these patches. I've re-presented both as
I realise that one had invalid formatting (spaces vs tabs) and I've
moved the dma-names definition into the same board level dtsi. At this
point it seems reasonable to also squash the two patches, but feedback
appreciated?

The default pinctrl definitions for the Radxa Zero 3W don't match the
datasheet. Possibly few people enable extra UARTs and hence it wasn't
noticed? I needed all 5 UARTs for a project and the first patch corrects
the pinctrl defs. Without this patch, enabling the extra UARTs causes
issues such as the MMC devices disappearing, due to collisions.

Second patch adds a dma-names property, which appears to be a
pre-requisite for enabling DMA on the UARTs. I've applied this to the
board level dts as feedback suggested there could be unintended problems
if enabled across the complete rockchip dtsi.

It's tested on my Zero 3W board and appears to function correctly and
DMA is reported as enabled.

Ed Wildgoose (2):
  arm64: dts: rockchip: correct uart mux for Radxa ZERO 3
  rockchip: dts: Enable UART DMA by adding default dma-names property

 .../dts/rockchip/rk3566-radxa-zero-3.dtsi     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.49.0


