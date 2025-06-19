Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8770AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 22:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Y/aI1+KgOz6LLSAu2ncBoBTsqSkVCTLSAMw2PTIoL0=; b=HxIc1+3V66ai5P4ocxnH7+zUe/
	NuvFOaqeaYrUZlCCGQzyS9O8InRm2297AcNjOml47mYy5287ON3dC6hiViuoFE9230LrV4/4qlbAo
	fcCP2nmCIV6ZXFAoYPb/PT0MP7pcOOigxz+hUA47hOJply3rhTjENpQBbfK7hyQR9vSLrPHq6U99A
	rf0WDGKRVoykKhF56j521rVLERbvNF3G+AVlFwqeUBskyClVkZiryR1m+sLrSTnShYl/HDUUChec3
	1CX3bw+ptY7j4SeFvFGfyC9cLMtq8I3qETtALgJp2+hnRv9QhgGfYm6XrjACuZB1u/eYoHES+jZ1v
	BqijpZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSNYO-0000000EMS0-1tA8;
	Thu, 19 Jun 2025 22:16:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSNWA-0000000EMBA-23mK;
	Thu, 19 Jun 2025 22:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9Y/aI1+KgOz6LLSAu2ncBoBTsqSkVCTLSAMw2PTIoL0=; b=liASiEjRzLOVhojwGDYmpVSYE2
	/DM61Ku2Wc7QEnUaf57vFLmY46CMKcSD6sWL6PjGivLcZBT/gFcT8/AkEZxEfnOhMjAQWnKAghDqP
	vV4T6udEV4HxgWlMfUqFsq75ONrCMs6Vs8r8pODGC9uUNwt12GLBnLmO+t3uBKnYPbmhkXqvmeHOL
	9+riJhsXg2e9noOJ2zH9CZ3zaAVQIllgsAmF9MDQKIjDlgSteNfw97gvzwiKS8tYzFi5ALpIk9HVm
	j0PQLgsZmj2Fip5gptktByvP/EavMxCYuMy/yiY1IRYDYKE9wigPn5+EroXq7E7PERI8md1gMDdq0
	/QgxUOpA==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSNW2-0008Oo-1j; Fri, 20 Jun 2025 00:13:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/9] rockchip: Add power controller support for RK3528
Date: Fri, 20 Jun 2025 00:13:38 +0200
Message-ID: <175037106381.1530547.11103096217205983785.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_151358_529161_F8098FE6 
X-CRM114-Status: GOOD (  10.08  )
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


On Sun, 18 May 2025 22:06:47 +0000, Jonas Karlman wrote:
> The Rockchip RK3528 support multiple power domains, one PD_GPU that can
> fully be powered down, and other that can be idle requested.
> 
> Vendor kernel flag all power domains on RK3528 as always-on, this takes
> a different route and instead tries to describe all devices power-domain
> in the device tree, even for controllers with unsupported runtime status.
> 
> [...]

Applied, thanks!

[4/9] arm64: dts: rockchip: Add power controller for RK3528
      commit: 654df8e74dbc19ba0625051079e6889e6999d16e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

