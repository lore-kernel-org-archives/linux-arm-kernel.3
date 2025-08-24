Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD4DCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhs3hXc2N1i8i+aeYyxkNxdwP44WZuEKF8sSvnZTP4Q=; b=QFneAKRLBrHFNhMoEJZ3qCkLEo
	ysRbTnMi2ilzx+kq8Th47AlVZHDH9XfqVNPVie1V6+o67xcYK7yhTO7zKWyRc8MvH9JcX03ZzTywB
	dzumtGqBXjw4R599M2qev1IVWRmuwlGbzS5iUnrEWm5hyd2DXFiKlgGmC6xETIzqtgh1CMvLVsCD9
	bBnfiPBpXf6adhlkSM+JXcKtoyuMnBsS1nTSmbnVEKFtyqqswRimlfxdIHC1sQfhPEVdvoI7p9h6F
	olUR4o5lrj31a7MpHOD4RFXTuTS82qRBepbhgwRehBKF72U54eXnWMuGAmge3IIg6LukttwL7Jqav
	4rx5mZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq52f-00000005pDO-0B5j;
	Sun, 24 Aug 2025 07:21:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4pg-00000005oIQ-1H0y;
	Sun, 24 Aug 2025 07:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=fhs3hXc2N1i8i+aeYyxkNxdwP44WZuEKF8sSvnZTP4Q=; b=wOMk7j5gS72n5mZDY1q9JceRRy
	ASZKPH10REBLyM0d5rrAOStr5P7Fn2eVONJGBIMFSWpv5qXgik3kt4IWCyuSuKfE0uzqbWrtaresQ
	H0Nhs6g66YNIaqe40B9tNpZU8usMhlUoO+3Pjw2NHCyKwHaYJfZS3qBEFWDM0X7wQKlpe0oJH7EXv
	7t8uUPGf4U1T0N2AxNcEM1cXk5pAiZqLxyi99CK/9MimGFhCQftpR/NxJGXdcDe+E7kCfRUuyZKPe
	CVFh822XgaZhmGPr1tSm1hOfLN+SWJkTnnxxFdcZUlG0pFWOt2hET68oCHMU4jSbEjL2508JPNpJv
	EIJl4nMQ==;
Received: from [212.111.254.164] (helo=phil.aerolan.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq4pa-0002Oo-Fc; Sun, 24 Aug 2025 09:07:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/1] rockchip: Add power controller support for RK3528
Date: Sun, 24 Aug 2025 09:07:49 +0200
Message-ID: <175601920179.3425909.10553643582177045898.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821211843.3051349-1-jonas@kwiboo.se>
References: <20250821211843.3051349-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_000804_342131_A0A12FAB 
X-CRM114-Status: GOOD (  10.64  )
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


On Thu, 21 Aug 2025 21:18:40 +0000, Jonas Karlman wrote:
> The Rockchip RK3528 support multiple power domains, one PD_GPU that can
> fully be powered down, and other that can be idle requested.
> 
> Vendor kernel flag all power domains on RK3528 as always-on, this takes
> a different route and instead tries to describe all devices power-domain
> in the device tree, even for controllers with unsupported runtime status.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable more power domains for RK3528
      commit: 178879625f0f10ff708728087d91a5fe79990ce2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

