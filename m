Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433FEC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQIE8XgKYt/EUINULOT/JC5r+V7wX1jbi6M/ucAZS60=; b=ijmhk+agCJe9pYrPWVEroqT5ZS
	niInAEYgN9UTDKO94f5yuSh0CQiZWZfbdTogegPVa3TznyeaqEOtDot5YjCwdm7EkDZwhPBMVYgMM
	mRu61y/99NT2EYSoXk+ZfSsv1BJsLjqxRSW9KP5OQsd5NQ1H8uWbrbubG1H/PTF9uA+Xjo1UMJqtq
	rdvUq2iBXDDHz55gP553L+qMypnLHHKEAs/kClxLKqxMwxvQAx+v1o0YmN865z5Wxrq4hCC1a5d12
	dNuTsEu2BDsHcuMNW9utYPD8KHEu9yeyZ03O+ZrydIcmUJaocdAePdLgJYprTMLm+7s2cpHxZCpe5
	w/7jJrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZxp-0000000Ft7x-2sw3;
	Sun, 02 Aug 2026 17:27:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZxn-0000000Ft7k-3KbC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 17:27:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 347476001A;
	Sun,  2 Aug 2026 17:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9C91F00A3A;
	Sun,  2 Aug 2026 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691621;
	bh=YQIE8XgKYt/EUINULOT/JC5r+V7wX1jbi6M/ucAZS60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kdgOrd1gSiqTPL+atSoKrTrrQNdxHnVW3zeXTYGN0bZ0IJt+tn32WLspNIF4GpFUo
	 wlWn+kttl0ZfBnn6EWmiwJE4IaGwzwZ7tlYhN0z62Sde5LfTyLH5fOGdojkssJoaVV
	 0ebz2uTZr2QjAnNvFSACZzMdH7ZEuUzeWz4ewLUPbsUH0gvFSp8VU6VelC2+BZzmCM
	 oylCdz8nLuyeeZTjm3Rx/xfzOwlcnFLP2rgSI26tZ2m330+pPhfJC/o7Tj0zFl7hIM
	 DxiJVCY5w20PT0sr69VcS6SWzYxyQQTYe+k04rurnfyZd24g7ioAEuJhTh2MQzVj/z
	 YKZ3Y97yMp4LA==
Date: Sun, 2 Aug 2026 18:26:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: mdshahid03@gmail.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joshua Crofts
 <joshua.crofts@broadcom.com>, Broadcom internal kernel list
 <bcm-kernel-feedback-list@broadcom.com>, David Lechner
 <dlechner@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v3 3/3] iio: adc: bcm_iproc_adc: Convert probe error
 handling to dev_err_probe()
Message-ID: <20260802182657.65d459e0@jic23-huawei>
In-Reply-To: <20260802103520.114582-1-mdshahid03@gmail.com>
References: <20260802030433.696454fe@jic23-huawei>
	<20260802103520.114582-1-mdshahid03@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun,  2 Aug 2026 16:05:20 +0530
mdshahid03@gmail.com wrote:

> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Hi Jonathan,
> 
> Thanks for the detailed review and suggestions.
> 
> I'll address the formatting comments in patch 3 and also reduce the
> unnecessary churn in patch 2 as you suggested.
> 
> Regarding the suggestion to convert the probe cleanup to
> devm_add_action_or_reset(), my intention was to keep this series focused
> on the dev_err_probe() conversion and submit the devm-managed cleanup as
> a separate follow-up series, since it is a larger refactoring.
> 
> Would that approach be acceptable, or would you prefer that the cleanup
> be included in this series?

I'd leave the dev_err() prints where there is a goto alone
and do them as part of the devm_ change so as to reduce churn on
the code and shorter the eventual set of patches.

Just add a note to the dev_err_probe() patch to say you are doing
that and then they can be separate series.

Or if you prefer just do the lot in one series.

Thanks

Jonathan

> 
> Thanks,
> Shahid


