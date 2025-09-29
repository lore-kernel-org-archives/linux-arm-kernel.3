Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415FBCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVeiBXs03x1jC4upn1ck23a8nVsdwG7wDhiz4PogKGQ=; b=nqvHwVu2tx6recztv6ct11IhxE
	9BkhQVXllzlQo7EeoC5xnUv7QKrUlZ4+gKwlBo6+cwee03OVjtpOcULI2BS2PUXJJbOYBRxfpJ9pd
	PKuB+cy4ywyEWmEygcOt9BDKMr8X7T75EePf6QyTkpWxAGOswp6vFTSNluAzgvPn3nePQqS8LOljQ
	+haACOpvYXDF2fVCCipPXtVVQh7Vh6AHScU6UoYwiWYLY6MdbSVtsGu2qHV7RQ5eMfBNogiV9Lhpy
	IgnQMxnsdUtYkHpoP3Wac4ZJv6XA7wvAD1fhwRDWTfkINedCQZPEUn5Vz7ACNd5zewFEbgyqQflSq
	9+rC0fVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3F1H-00000002grN-0YGt;
	Mon, 29 Sep 2025 14:38:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3F1F-00000002grC-1e8U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 14:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABA806254E;
	Mon, 29 Sep 2025 14:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DD6C4CEF4;
	Mon, 29 Sep 2025 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759156704;
	bh=sLDFL9Wl+Iuq12IDgheionrwfrRHgVXtiDYtXHXsCrY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YJ3zrcQLw5rDQWPYhH77bBI8hSRc5rpFYkP9UrVEJCDJhjwfRy/TNVb4CjibWExaX
	 YAcIwsq/RWB3pHd8Zr3yAwxFKU4dY+CCPhezjfxwJjYOK55JhYT7d3d86M0oGDkpO2
	 vfgB0ecsvfPzBlDJNNs8n/Zl3xE2koAiu1xRZ8w3bqrWdK2yyVyY+H82v9S5PeqjXh
	 tZLH1qdn0QFCxXZ+BlkDmokQX3Jht8zTLvGSvK+rSL81LHsmzSLRUAggA3vER/mplb
	 pI9dODQQEaAITpyeuQt/iOBib9HMLB+bK3QyDTJUBtUBmK1kc9JHxs2ICdDczDf+3j
	 7X5r12Veu556A==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, Christian Bruel <christian.bruel@foss.st.com>
Cc: linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250902122641.269725-1-christian.bruel@foss.st.com>
References: <20250902122641.269725-1-christian.bruel@foss.st.com>
Subject: Re: [PATCH] PCI: stm32: Remove link_status in PCIe EP.
Message-Id: <175915669921.12348.6942864048975237850.b4-ty@kernel.org>
Date: Mon, 29 Sep 2025 20:08:19 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Tue, 02 Sep 2025 14:26:41 +0200, Christian Bruel wrote:
> Guarding enable_irq/disable_irq against successive link start
> link does not seem necessary, since it is not possible to start
> the link twice. Similarly for stop.
> 
> 

Applied, thanks!

[1/1] PCI: stm32: Remove link_status in PCIe EP.
      commit: 7d1c807cd2ddf8ef771f214ae4dab9bebbc61522

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


