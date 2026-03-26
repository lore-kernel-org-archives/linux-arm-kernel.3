Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48F7106F303
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBn1O2vqdvDeS0601HcaBAOXajFBznMqRCTg4EjsWps=; b=xWBrtH/N9fs7IN99uLyzn/vr7E
	tDikbwpINCtxTO37xRyZaoyj53B4JLSqQJpkhbPs/te/KRhKBCXThV/XOZZeqGzQwss8m/xKlwgE4
	2Ds8/pm3kWCcQDxUdeTfHozFPYTQpdikPOlr4HufSnRckjWP8xsXpePWh65FJdi43gHXQ0bZ59hUt
	qG1Vs1WVhoJ/P0NT+IB9NSvocueOhaVyL3vj2a+5v1seB6sMII/9JwQDSNNldg0gacgC55rysZFYQ
	xi8EjnIZcQLkAcxzNDCicQFYRDREKAr2LKSvmT0AkHugR9fs4uSuQTuJKIllqMhKKTDNI9s289K+w
	APQqskIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gFa-000000052aQ-2EGR;
	Thu, 26 Mar 2026 08:39:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gFZ-000000052a4-0NLH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB1F860127;
	Thu, 26 Mar 2026 08:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C16C116C6;
	Thu, 26 Mar 2026 08:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774514371;
	bh=cBO3567wJtbyK3YMHb75gSNycn+Tf6ScJgtK5vTL3yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhuwY/AXI9m5M+k4ybSnzrjNCdxdLsx+s0C2nP4FEgesT8EQKQ+uV75+9iR2fsj0j
	 tudMwYwYSFeL5G5z5Ef7oHR6bMO+e/USekfDTUGceZjRYPsZGCyfgRY+J9B1BK/gJV
	 +R7YT5rk7rTutN/2y2gWTS0EVtyf1+OYNtwT98Eg=
Date: Thu, 26 Mar 2026 09:39:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, stable <stable@kernel.org>
Subject: Re: [PATCH] i2c: s3c24xx: check the size of the SMBUS message before
 using it
Message-ID: <2026032602-backing-flogging-1632@gregkh>
References: <2026022314-rely-scrubbed-4839@gregkh>
 <acQYnURilS0_fTvS@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acQYnURilS0_fTvS@zenone.zhora.eu>
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

On Wed, Mar 25, 2026 at 06:17:58PM +0100, Andi Shyti wrote:
> Hi Greg,
> 
> On Mon, Feb 23, 2026 at 06:05:15PM +0100, Greg Kroah-Hartman wrote:
> > The first byte of an i2c SMBUS message is the size, and it should be
> > verified to ensure that it is in the range of 0..I2C_SMBUS_BLOCK_MAX
> > before processing it.
> > 
> > This is the same logic that was added in commit a6e04f05ce0b ("i2c:
> > tegra: check msg length in SMBUS block read") to the i2c tegra driver.
> > 
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Alim Akhtar <alim.akhtar@samsung.com>
> > Cc: Andi Shyti <andi.shyti@kernel.org>
> > Cc: stable <stable@kernel.org>
> > Assisted-by: gkh_clanker_2000
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> merged to i2c/i2c-host.

Thanks!

