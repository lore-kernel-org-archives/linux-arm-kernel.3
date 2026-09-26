Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77F2C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2AoDkHxt5/ck9ZyVPAFqWeUoxXW3bq3RmcY+WbOVMQ=; b=KcoGQuE30pVb8CuPCacJH8pB3Y
	0W55xTM+ed/oRPnG6BAPbuoC176qXVuwlV9WXIlOFxvLN9iHcoUj9FMTHp6FKik/QyF2AF1sGAavr
	4hw3Ya3yiHDdH4FabgUJHwR2/I6T/9e2RsCaxgOLBcQPFZyiAvgvYzaw3eQ1G6r1RP9yE9DR3O1sQ
	jWW8mzG61DWphNrNlZLn4o1fXZtPuxzZ4PzKONqM0DGu2Bk8prsPolnKGhwHsJxr1s9lvdcyKbB6z
	tXRYfJYth8r+RGnabT5RHxJrSCoHYswCBjiyJyT5PxiIve/ZLttRxYoXX13UXp1KRY4s/NM+rRdXv
	Wox6fd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANzc-0000000FAik-2kH7;
	Sat, 26 Sep 2026 08:42:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANzb-0000000FAiS-0DnT;
	Sat, 26 Sep 2026 08:42:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35185601E4;
	Sat, 26 Sep 2026 08:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CA51F000FF;
	Sat, 26 Sep 2026 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790412165;
	bh=V2AoDkHxt5/ck9ZyVPAFqWeUoxXW3bq3RmcY+WbOVMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UDSbjbiFlxck3G3UTrDTNp+LBwXGOGJgGWH/TI22gK2RQ9e4khhack8IOymoenAoG
	 //PI20I/PaLEdbgOnUOMEmOg4ZBRQXulshPCcN4rIsaMgPlZruNC3ZtqiJ0cQ4Dgk2
	 503Rhmjw0Hz6JxAwkOrp//mDsVBsPubn/zs6FVZ0qLpEXfmW0EL95EsYXIIQBO3/gH
	 1ee29WJ/vm8pLLWdJbEkXyP3BFkCuqQF5yeUmPSKJvddvSuN6s6ps7CoOyCMWPsrwI
	 Yg7clPL5wuGZhUuWBYQKhSbD6mMov1pBWwQndkC7LcYwy1j2gCs3fJGV3o0eNZ1GQE
	 9ivwAli37OWvA==
Date: Sat, 26 Sep 2026 10:42:32 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 6/6] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
Message-ID: <rdx2u4cnxgbdkumgh4oaux7wvmb545ygcnuidpp6yvfntjtwgb@i7w72g4ebc62>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-6-9ad90a456953@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-6-9ad90a456953@collabora.com>
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

On Tue, Sep 15, 2026 at 05:32:53PM +0200, Sebastian Reichel wrote:
> The driver currently only differs between 4 lanes DP mode or combined DP
> + USB3 mode. This makes sense from a lane routing point of view, as the
> hardware only has 2 lanes of USB3.
> 
> But adding a separate state for USB-only helps with power management,
> since we always power up all PHY parts according to the current hardware
> setup to avoid data stream interruptions. Even if some lanes are muxed
> to the DP controller there is no need to keep the DP side enabled if
> something without DP AltMode is plugged into USB-C.
> 
> This potentially triggers some more USB reconnections during the PD
> AltMode negotiation when switching from USB-only to combined USB+DP
> mode. This should be fine, as the cable is freshly plugged at this
> point.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

