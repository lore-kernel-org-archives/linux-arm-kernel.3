Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC1ED5E147
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4OKaTmlCDuWsYY0puQ8w+5FXTQPWB5TkMTHYnkUuTg=; b=sVRImLYm8YINKM0yGZk7kCx/Jr
	/deg3+ywpPCrRICJURGCz0BEw0Yg1BhYlyO5DrDsBJHEcjPUJ5Q4xOBnhjWBAsIWSQ5lRV9gdkYLx
	k6rPHO3TudDCM0bpzRfQZ5ojaghY2ybaFa7MiyYKqZr3JQ70RhDkEPGYrYnCaCZwsXUQmg4HkzoZZ
	qh163z1K6BaYGIdsh569KzAZ8luvu34zuVxyjYsS49QH5QvCTdo6a6Fy+fJOa05IEQMa3/tcA7YGE
	YC2bYQJUa5fXq3ihsMe1TbhQBetxaDgSN+QP3dry0m397Grh/3naifJfN6AxfzeiKm+lUU3XQ3bcn
	OWDSrAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUqF-00000005EMN-49tK;
	Tue, 16 Dec 2025 13:11:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUqD-00000005ELk-1meJ;
	Tue, 16 Dec 2025 13:11:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 553176017B;
	Tue, 16 Dec 2025 13:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541BDC4CEF1;
	Tue, 16 Dec 2025 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765890708;
	bh=Da1yKunK6yDB+R6mPqFK1cShCjePJ/m3utIT45pGxK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snNOJVhrs1y5uRk/+i8bK7uPgOScGa+5PgY81doUZnze2nir4I8i4wM2DlaXkZyUd
	 kirQ4pnG+67UXT5nng66/vqUHNHCuV2roh4WLFlDKF/GYriw81mSeH/xZFo2c+J+dt
	 3LHtUws1t29HzFPQIq8TFB6ZmXmLi6GpvHK19IiteVB1zJa14FL9YKW9N4a3mkFVxQ
	 2N2RzxO8vK3nN0hzJioU1NOk/ucZgB50OkQpBkYg1WD0Bvbvavt5eT3RY7q+gJeuzI
	 nyar/1Z490GUjBedE70DzQn2U8oPnj0rW426tIWnWCVP2A5ZAgDbRpEM6lZwVQhxX4
	 /vrrFgSN80TYw==
Date: Tue, 16 Dec 2025 18:41:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 0/13] dmaengine: introduce sg_nents_for_dma() and
 convert users
Message-ID: <aUFakHZL8viMN3WR@vaman>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
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

On 24-11-25, 13:09, Andy Shevchenko wrote:
> A handful of the DMAengine drivers use same routine to calculate the number of
> SG entries needed for the given DMA transfer. Provide a common helper for them
> and convert.
> 
> I left the new helper on SG level of API because brief grepping shows potential
> candidates outside of DMA engine, e.g.:
> 
>   drivers/crypto/chelsio/chcr_algo.c:154:  nents += DIV_ROUND_UP(less, entlen);
>   drivers/spi/spi-stm32.c:1495:  /* Count the number of entries needed */
> 
> Changelog v4:
> - fixed compilation errors (Vinod)

:-(

drivers/dma/altera-msgdma.c: In function ‘msgdma_prep_slave_sg’:
drivers/dma/altera-msgdma.c:399:29: error: unused variable ‘sg’ [-Werror=unused-variable]

Clearly your script is not working. I am surprised that you are not able
to compile these changes. Bit disappointed tbh!

-- 
~Vinod

