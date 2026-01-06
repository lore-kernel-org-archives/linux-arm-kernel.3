Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9761DCEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCb4Wh/fRxEDA7/S5cSPc5jeAAPDVe79QHjjqniK1R8=; b=R6WG4bWI9TgMChUU9ZqXEdYsPi
	Fav0M8DBXTRFncCnH2JN9mpo+oOVNaGtqoJpxDBrUP0fwLymcsgOwgZ0Hyh/caxWrN9QUFIogtNKE
	HtwvtjAy6ZTB+TVUwawKuYF/BYozuj+ctLhHCvPaYzMAuu5tCIbSHXD/4hK6UMUsid88hrSG70HHz
	FSKhXxDuR0qlW0gM90rkVzgmPdMXk2uVtWIZX0AxhcG6yVA1gCW7Qq8UgvmwMga/Fulk3BbW6eZtj
	JhoSiartfZtCHNTZ8EzWepNG6COFrPjZvlsYofAztKDkCBGj271HN3jl7ra0+4brcTKMJnRw/j5dA
	YNYUGlyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBEo-0000000DdQ3-17cc;
	Tue, 06 Jan 2026 17:52:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBEn-0000000DdPx-0DKa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01AD660144;
	Tue,  6 Jan 2026 17:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AC9C16AAE;
	Tue,  6 Jan 2026 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767721975;
	bh=TYr/HLKbtkL4zdI4yZFxob2Bqal5LW2iewldEZo+O3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACj6FdzmPV5d3pS2XzGgLCdA8tk56faq5zPfmA2AGWNss0ICYax5cRRKBa1oDl3lk
	 AMO4r/eoRBePrITT5ilyQihSuRgL/et0sL4bHliiNu6HcnnBvKOQoWrtDPtbv/wckN
	 M5hIh7TYyT4EjctKYd05ORPYSzp1ViDVuwno9LRb1V9O5h9Ym+BRmwzTARfRar3lR7
	 Ebq1BWBk7/zIbJjSvzGvO0D2XrIOehGoO8MItSV04VqtG9enuwuMQecTe5alC3CJDE
	 yINEq/9IzAV+wlz/lHLPYT9cl/mzMsH2vnbzdEiqtqHTYHK0QHW/exhsgRVlf6j8kx
	 Dzy12JBLaSctA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 1/3] bus: qcom-ebi2: Simplify with scoped for each OF child loop
Date: Tue,  6 Jan 2026 11:52:50 -0600
Message-ID: <176772196925.3106040.16051762780281428458.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 05 Jan 2026 15:36:58 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/3] bus: qcom-ebi2: Simplify with scoped for each OF child loop
      commit: 9c252f3c8f390fae4ca09de36c9262a35ae88ace

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

