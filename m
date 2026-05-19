Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE919CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfgV7rZCOgdgKN2bD2aqkQrOx3uzKFQAsb5ch2X4sfQ=; b=yUE+i7wA0/V3M9XNnZWP1j/WFq
	EfljDEMTKnEwlUlXjmUxoTQUCt7KX0g8x8NNIgSA9iOGCbK9HfoVCDWic471ucfnBtcU3WHVQQQ/w
	Q3SLHMhYdtEsXeT4UOdgSdfxughrjdc/goOQqDyjF+7tK0Bch3A4CXwAXMaU6uUGOwuPqNaegr6Jo
	q48DMRZqqCBmIM3F3DqjOE1m3AtDVmcOZvBr/vdAwDuSlCeTXGssxo94mGGZV4MRV3wKuoCbAMMN4
	3CiDm/sKYc6y6BKx04bvzQkBP+PwK/hWU3RV4gqTb5WXCQBDnZ7I//pqcs73JTH95pmbmk6Bd1Krl
	Cr2OgJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFlb-00000000fMS-3jSS;
	Tue, 19 May 2026 08:25:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFlZ-00000000fKh-2hxO;
	Tue, 19 May 2026 08:25:30 +0000
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3B6797F;
	Tue, 19 May 2026 10:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779179115;
	bh=yKScYuuUJS7xZJRRgYdhSorlTkDWtLSZgrLiv6hxvFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ew1EM6jePLOZoXy6YhFq5m77ZX/aS9JzSp8f8++IIR18M4ChpvY692tVYuHAzCqEd
	 ljBbt8YnaPo2zrvvABSe7S5+Gaz/slCnRTSp7Eu4Ajla19YLjrzqOjqvnKTTvRsnNN
	 jnlqRkBSdm8d2JNzZH4QesDZXW3KzMBnngFeT6OE=
Date: Tue, 19 May 2026 10:25:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, michal.simek@amd.com,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, git@amd.com,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 0/3] phy: zynqmp: fix SERDES scrambler register handling
 and enable for USB
Message-ID: <20260519082526.GB16205@killaraus.ideasonboard.com>
References: <20260511163135.2924642-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511163135.2924642-1-radhey.shyam.pandey@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_012529_825764_1C9B392E 
X-CRM114-Status: GOOD (  14.26  )
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

Hi Radhey,

I haven't really been involved with the phy-zynqmp driver for a while,
despite still being listed as a maintainer. I have just sent a patch
(you're on CC) to hand maintainership duties over to Tomi Valkeinen, who
took over maintainership of the ZynqMP DPSUB driver. As Tomi isn't
really involved with the PHYs, in particular with the non-DP PHYs
supported by the driver, it could also make more sense for someone from
AMD to take over maintainer duties for phy-zynqmp.

On Mon, May 11, 2026 at 10:01:32PM +0530, Radhey Shyam Pandey wrote:
> This series fixes three related issues in the ZynqMP SERDES PHY
> scrambler/encoder bypass path:
> 
> 1. The L0_TM_DISABLE_SCRAMBLE_ENCODER mask incorrectly included bit 2
>    of L0_TX_DIG_61, which is a reserved read-only field. Correct the
>    mask to (BIT(3) | GENMASK(1, 0)).
> 
> 2. xpsgtr_bypass_scrambler_8b10b() used xpsgtr_write_phy() which
>    performs a full register write, clobbering unrelated bits. Switch
>    to xpsgtr_clr_set_phy() with clr=mask, set=mask to preserve other
>    register fields.
> 
> 3. USB Gen1 requires PHY-side scrambling and 8b/10b encoding as
>    mandated by the USB 3.x specification. The driver was incorrectly
>    bypassing these for USB, the same as SATA and SGMII where encoding
>    is handled in the controller.
> 
> Nava kishore Manne (3):
>   phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
>   phy: zynqmp: use read-modify-write for SERDES scrambler bypass
>   phy: zynqmp: keep SERDES scrambler and 8b/10b enabled for USB
> 
>  drivers/phy/xilinx/phy-zynqmp.c | 37 ++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 5d6919055dec134de3c40167a490f33c74c12581

-- 
Regards,

Laurent Pinchart

