Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C04C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWg9hCOLqFxOrA4F6TdJHIMFdDYu5fIc3xaiM79wORA=; b=ZMw0yEm7Iwust6GF6lXxZjwuRK
	80woI6LJWFavrhaEOIoEq/TJPN9iJdv955TOuRsSRjtUG1+LHh0tgl+dLAm1CPTVMGK4kSO7dphpM
	sHNuKEhBeLS+3/uMzKx/dDXi9nAdiEMFHDo61skOt/6X4BzHTyZLeRlOvPi+wMQS1bZf6FTeX3sY4
	F++aZX0zYBCFiMR6nywgyjVYpPbsYLEr5PjMnRCKf2OKU7tmdAaUkeRJcJG8ByulP0VBk1lXXqC03
	F7vLna15DJHDuVFrb7MSoPEFtmId2xuE3DJ/b381CHZ2q5HXNmYmViPpi+/aywx5SRMpXrc02fU8I
	aAuPKtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2As5-00000000EmD-1fJZ;
	Thu, 03 Sep 2026 17:05:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2As4-00000000Eln-2XHM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:05:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 128826022A;
	Thu,  3 Sep 2026 17:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA1F1F000E9;
	Thu,  3 Sep 2026 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455103;
	bh=PWg9hCOLqFxOrA4F6TdJHIMFdDYu5fIc3xaiM79wORA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Kpa0PuKTgQmLiHG9kdJoZKCepP4pUgtmDC2oADbYk+GTYSUs+YgarBcUcP7s+4XP4
	 qqKHXCcEtUHLbqb7U2aawCpajPW0ycWyGDUWfGTMju1434BIpbEs8UabeY2zDO/3z5
	 4/8Tlf/bu7i5mPePS2ZpTUq/938qA5u4mdrTNvKFRRPfCYPiEKchNshfYS5x3Y+Y/p
	 KLvwyAuFTrjbL3nE3lG4p/clKKlCAKwuQkR1LjKPjG03Ek0gl6mw5zxUGMMIiuQEQk
	 z6WZ3Wl08HlBH4TGeglIjmKxDmdZyGU123ztGrmB4M8ag5HUkobFXbUp5bobR4KLgL
	 oZMr+t0nwcSNA==
From: Vinod Koul <vkoul@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Peisach <jpeisach@ubuntu.com>
In-Reply-To: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
References: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
Subject: Re: [PATCH v4 0/2] dmaengine: apple-admac: Add support for M3
 generation
Message-Id: <178845509899.1711546.15996486451264669043.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:58 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Sat, 15 Aug 2026 12:41:37 +0200, Sasha Finkelstein wrote:
> The ADMACs present in M3 series devices (t8122 and t603x SoCs) need
> additional register writes in order to function correctly. Add a new
> compatible chain for those, and change the driver to do the write.
> 
> To simplify the merge strategy, the device tree entries will be sent
> in a future patch series.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: dma: apple,admac: Add M3 generation ADMACs
      commit: b16c2ef38cc45fa73a68aefa769c0139f6a53006
[2/2] dmaengine: apple-admac: Add M3 generation ADMACs
      commit: 40c92b5df91f5b4a7bf562a6829f044f1a748375

Best regards,
-- 
~Vinod



