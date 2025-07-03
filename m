Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0246FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRGh0xj2sFwXyDAbZuoSz3Vo8ynObNCqrGhzTXEKe0U=; b=jJYvdV79ePj4jZRWQiokUN7SzB
	sRt+oHA0XNidhMA/bKCeTvh9W6xrWjiBSRgNXZCxG6zaExWmCC4rGbhuhahvTjfQC8iyVXTmtxBMB
	KYexkxlpzIIwpWzGuyOIyJKXwQuWVJ9EspjW90imSGL4xA+GDLCMyOY5OvBP/2mxj8W8g5MeJz47Y
	73FWzIrLs7SRQN/5b8HqPM6XPzRUqClKwlYQyY9xFObfpIO49K6KzZSOLVZiCg3EOiZg+hqr5hHtV
	hQYmNWLobFuM3CbBPEp7erbhCpW8CE4s/SL55ttJ85GJXnxP0WyDYuNYaV1HMI79MpVrVqdKm1NGx
	ONWJLiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKVF-0000000Ba2H-21V5;
	Thu, 03 Jul 2025 14:01:29 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJ4D-0000000BKpw-0a57
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:29:30 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 563CTK8v019018;
	Thu, 3 Jul 2025 07:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751545760;
	bh=gRGh0xj2sFwXyDAbZuoSz3Vo8ynObNCqrGhzTXEKe0U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=c7DGm9E0FbN4Y4wHnT/8eA7m9OtbdlnZy7tvegICLYXIuWrXApoESA8Q1hwEsZQWM
	 13QaQqXjp1RmOzDlUC6WCr1yKUh9BxXh4ICJKup90yiryutZo1fSoctaLvkyOGtE8E
	 s2XB1DGoi+JuBmXuDxYiEntckbwK/XDFI79sgY6w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 563CTKDN2328478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 07:29:20 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 07:29:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 07:29:19 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 563CTJHM1104720;
	Thu, 3 Jul 2025 07:29:19 -0500
Date: Thu, 3 Jul 2025 07:29:19 -0500
From: Bryan Brattlof <bb@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: Enable overlays for all DTB files
Message-ID: <20250703122919.yif56scd6fclnrle@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250702145314.71996-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250702145314.71996-1-afd@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_052929_220481_BCF68E31 
X-CRM114-Status: GOOD (  13.93  )
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

On July  2, 2025 thus sayeth Andrew Davis:
> Allow overlays to be applied to any DTB without manually enabling it
> for each file. This adds around ~10% to the total size of the DTB files
> on average.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> 
> Note that Broadcom's DTS already do this, so there is precedent for this.
> And we do this unconditionally in our Yocto Distros[0] already, this just
> moves this so everyone gets overlay support for all boards.
> 
> [0] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc#n5
> 
>  arch/arm64/boot/dts/ti/Makefile | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)

With the current size of the kernel and initrd these days, +10% of a few 
KBs is not even a rounding error IMHO :)

Acked-by: Bryan Brattlof <bb@ti.com>

~Bryan

