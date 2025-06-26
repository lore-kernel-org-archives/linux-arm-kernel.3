Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1D5C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWM8VJDmUOIHrp/C15adgUktxEx+lnhctNL4Eg/IoNI=; b=RmgeeREPJwLvgImHhszZMOaASu
	Q1wfVXEufwmEbnXuEDZDMu4IRsbKtfrtblctCi2m6V3SNED0ZecizMeqKYg7+N8E8wPrtOG4Cga2d
	brwo5tGpY5PKr80dOyTphGGkODIY93Cosfjufsx07UJVtNJvzdo4oiEcqSsRHHg4Bt/THhzJUDzu3
	Q0JXkkSn9C+1rBa+Z/7PaNWcmqqyMtVSuubKWq+vojCRGk8r0Yr07e3IoFuAX3WBBu7He49aKieWg
	b0xnn1zOzxgUDwrPdFiG1pUp0PD2TDfCxOXNAA3q2fTzqclq2Ko24Rkw/B7uQkf2Z91lNMYdEMfm8
	95i14JXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwXK-0000000D8fr-0UmO;
	Fri, 27 Jun 2025 00:01:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUux7-0000000CvKL-0cYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 22:20:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9020437E4;
	Thu, 26 Jun 2025 22:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E10AC4CEEB;
	Thu, 26 Jun 2025 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750976416;
	bh=ucsBH0oET7oAgyvEDa/a3datI+skfPNQCt62RZ9yLVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A4p020ppAY3ZUq9GxVphQHtmW7Nv2xB3Wlg/q5yrQXm3EkE4bNikZUjWa5OIG8tnY
	 qtMYEw3dh73r/bTvkyn9L9gXBaKwOB4wvwcG7etPZo7YfoQzeQrJnM2fJmTcw7SUp9
	 KmWoOf20XipOsGc1GkCMmgMDT6jjEM70DyFcnzkBLgas24Ko1EjFvkEpghCb0YZfVB
	 bn4kGt9o7Ov8zt2bA+jqmXecRQJDiKeFJCiebQvy8IMVUKoksvX4xWLOwHccsA/+45
	 Jtlbp/Fs/ev4/nB1b/m1NOqovgi6S4APtgI0cIT6LKyITOXVq+b1qCAn0TcVGABlqO
	 tpqQ/llYEUv0Q==
Date: Thu, 26 Jun 2025 15:20:15 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v7 0/2] Add `devm_dma_request_chan()` to simplify probe
 path in atmel-quadspi.c
Message-ID: <aF3Hn_yWPMOXOb9f@vaman>
References: <20250610082256.400492-1-csokas.bence@prolan.hu>
 <f21f9aa5-974a-4326-88e0-cd29fd24555f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f21f9aa5-974a-4326-88e0-cd29fd24555f@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_152017_209567_CC7D6776 
X-CRM114-Status: GOOD (  10.73  )
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

On 10-06-25, 12:49, Mark Brown wrote:
> On Tue, Jun 10, 2025 at 10:22:52AM +0200, Bence Csókás wrote:
> 
> > to their devm_ managed counterparts. Patch 1/2 adds the new
> > `devm_dma_request_chan()` function. Patch 2/2 then uses this APIs to
> > simplify the probe() function.
> 
> I'm not copied on patch 1, please let me know if/when there's some
> progress there.

You can pull in this tag for the dependency

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine_devm_api

for you to fetch changes up to 08bf1663c21a3e815eda28fa242d84c945ca3b94:

  dmaengine: Add devm_dma_request_chan() (2025-06-26 15:18:04 -0700)

----------------------------------------------------------------
dmaengine: tag for devm api

----------------------------------------------------------------
Bence Csókás (1):
      dmaengine: Add devm_dma_request_chan()

 drivers/dma/dmaengine.c   | 30 ++++++++++++++++++++++++++++++
 include/linux/dmaengine.h |  7 +++++++
 2 files changed, 37 insertions(+)

Thanks
-- 
~Vinod

