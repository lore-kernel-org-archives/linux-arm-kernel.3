Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C179CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 23:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSFS+GHBdAxrXB1XJqJEbk+jn+NwdZUrsQouphXDCqg=; b=wrYNz4DLDsOlwgvVIRfl+CS/YY
	VWD5KYc+3WThjGkEbIqAS6HiVbfkBpeSdgv7pNCQ5dFe9RNBwUBFQNi+SH0fgouhXMjhrvcKTrFB1
	txWd0Aowj8oCGYRs0w5lANHKJ8o8K08fI4nWI8MUJ6nzrlJagZgNBAqRT/g0+uuzYkf58Aon4Xf+h
	+PYpD37PQD18NoWJzk2N0HRsqll5e2CDeE2emMfyEPqJjm0ompLYinxKb0fKMmJqvjUn5wdHJtfy+
	4SkDUBgKOskRWwtgZq8Lg+3tagSjX2k82dGpTzS3xkFq348yLmm0O79ibJuFiq6darYSe+p9zDW/7
	rnlHT9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoseE-0000000FFUE-0BFw;
	Wed, 20 Aug 2025 23:55:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomCg-0000000ETEI-19aM;
	Wed, 20 Aug 2025 17:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A318E5C06F0;
	Wed, 20 Aug 2025 17:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CB9C4CEE7;
	Wed, 20 Aug 2025 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755709345;
	bh=iGAz2ljwaJdqkt9H440YjvvYDSFEfsAKSStmeLrCUtM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o8WHHzrBCF8m1uztqxoxerTqOYUVvqikj/uRwyCVCFDuspbKMmSCWOL58ea/p0Xqt
	 WLygirDGp+yeoV7qPpCbIbUKJkLuDrCWggSL+UeUxtKZZvpYAgmnLO6Xjbcgh3Z39H
	 grkFrAG/YNyXVd1qydT20YlBnd6sSjqktY7BUAlVKp/aPp1Ixjofxb08x3dG8Tgk9M
	 u5Rp1yGWGAkGD6P5OxIEHvJkwNkgBJh+Gz+usbt75Dj8Os/daQRuClzX8WYnXfAbn4
	 DXPk/QU5bOefp3MRv1m0uPGnZD3+lDbu5XAKy4C8FMFuyjhkD/p47i3xHdYeXOly/6
	 fHBGgaE7Egt/A==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Mikhail Kalashnikov <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20250819001522.13011-1-andre.przywara@arm.com>
References: <20250819001522.13011-1-andre.przywara@arm.com>
Subject: Re: [PATCH] phy: sun4i-usb: drop num_phys assumption
Message-Id: <175570934053.66459.17487502489276312055.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 22:32:20 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_100226_357474_E7C16BBD 
X-CRM114-Status: GOOD (  10.23  )
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


On Tue, 19 Aug 2025 01:15:22 +0100, Andre Przywara wrote:
> So far we set a number of expected Allwinner USB PHY instances for any
> given compatible string, and would fail if we do not find every PHY
> described properly in the DT (missing reset/PMU/clocks).
> This is somewhat redundant, as the DT only describes the resources for
> the implemented PHYs, but goes in line with being strict about firmware
> descriptions, and rather fixing things in the driver code, based on the
> compatible string.
> However this causes issues when we make a mistake, like we did recently
> on the A523: there are actually three USB PHYs, not two, as we assumed.
> Changing the number in the driver and the compatible string would cause
> all kinds of compatibility issues, both with older and newer DTs.
> 
> [...]

Applied, thanks!

[1/1] phy: sun4i-usb: drop num_phys assumption
      commit: 75c21418beb92382dda164fdc2554610b49ed441

Best regards,
-- 
~Vinod



