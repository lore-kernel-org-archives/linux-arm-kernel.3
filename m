Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF87C88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frlkioWsr+rn+xQFULLyXcy9YieavxivQ8CM2t3LaSk=; b=V7iLf4wDIfpaseUwvatW+mWZNx
	Rf+kz6xu0HD7UmGpF8kBQdwooZlHvoh9AKNyn8PzSeOAR5NTBudphdpTro6pSys0d/b4txtBXNV2L
	r7y1A9xMpyE/+kEwW5Y3zfLc6/PXNds/8RT47V2ecvrk/eVTQPVm5U40EPrb4LU2jK670XueppxIR
	DkkHJqCyR2WT5fLXa7hkw9awEEjk1D1MyhAdEMysd6Juhyer4UJ8bKx6Z+kPOfjBDJ2ZCR3GUMo9y
	23pkj55z+WIW8OYSvCYXPoWiZcEcQEif/7ShkucpJJ1OEHavOnNKJeUEaHDx5LSQ4FcM2mw1mJlYi
	BNTOFLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5htO-00000001bg7-1lHF;
	Sun, 13 Sep 2026 10:57:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5htJ-00000001bec-3c27;
	Sun, 13 Sep 2026 10:56:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C2D04483E;
	Sun, 13 Sep 2026 10:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890E61F000FF;
	Sun, 13 Sep 2026 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297017;
	bh=frlkioWsr+rn+xQFULLyXcy9YieavxivQ8CM2t3LaSk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mJ/TGJlHtZlAQ4e+c5QMiM4QtzYPwLbu+ChInurBPBwpKXh5r63unwCOCWl5TcT1E
	 nAncKuQ4Ek0gFxbsY9rU4Cz5VcoWx2d2NYuKx7kpcD7kYJUtC1Z/W8kptRjhfqdZco
	 Yw2msQu2FWXHeykNHeczmika9tMKg15yPgYMmunLSKGY0Z3m97L3d9+cahS497tXS2
	 d7Pv4UwKlZap2KTwN0Bv3aERIsTYUfCT4qT7anq+I8w38TJV/Wn8tphxtOfVx8SV7q
	 FtVsgid48NefDGPd6cvr+187tv35tqyRZM/p/M0o6TvdTcEIm8mwlGDucQf5aRgRC4
	 fTOs1AajkNIvg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Pritam Manohar Sutar <pritam.sutar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Johan Hovold <johan@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
References: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] phy: samsung: usbdrd: propagate GS101 PIPE3 lock
 failures
Message-Id: <178929701318.215437.17506405540101327111.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:53 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 23 Jun 2026 21:53:49 +0800, Pengpeng Hou wrote:
> The GS101 PIPE3 initialization checks the PMA PLL lock and then checks
> the CDR lock. The PLL helper returns an error, but the GS101 PIPE3 init
> path dropped that result. The CDR helper only logged a timeout. PHY
> initialization could therefore still return success after either the PLL
> or the selected receive lane had not locked.
> 
> Make the in-file SoC-specific phy_init hook return an int so helpers
> with real failure results can propagate them through the existing PHY
> init paths. Keep the register-only helpers returning success and use the
> new return path to report the GS101 CDR wait failure. Other SoC helper
> paths keep their previous success behavior.
> 
> [...]

Applied, thanks!

[1/1] phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
      commit: 224fcee6fa830574029428d7232ea84e6a2422f5

Best regards,
-- 
~Vinod



