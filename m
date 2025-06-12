Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B61C71143
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+6Lsaau/SvLorn3/KuyZs0zfk4cChLknIsmfvwpl2A=; b=gfONG4vfT6zoZePmFcrYHe3J2p
	u8KD65glDBwGc0tYtQvYQtbFHh71BL8X7zixeWq3j7Kcf42ehcjdxc11oofbmSfpkUpvN9JhYW0US
	J1/a8Ve1irMPtnqcszhyMumbPSqg6OAXsCLPCjvLFE+MWSic5KCgeRqAK2hughZ0x8zmyb07lMTiD
	m9+oZucuGyn5kX7C7rb8OgrRQa2DAxVMGtN9eYcEKzYfMwmcIrVhVw5V7WKrIUzr3JJ+rtqjVmPgd
	t//zGQ3x+CL0eQkTnvhjsgyuSmMllQoPEVNPCGIY0rIckxlR8MfQrwn/UoiDzccfaT29khNsBCL7c
	5g7yyL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhpr-0000000DN3G-2GHx;
	Thu, 12 Jun 2025 13:19:15 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfki-0000000D5uu-0Rni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 11:05:49 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55CB5hd92898988;
	Thu, 12 Jun 2025 06:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749726343;
	bh=O+6Lsaau/SvLorn3/KuyZs0zfk4cChLknIsmfvwpl2A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fxJDxrI9Fq+6OuWJw5UeXo1W6YnR+zWvsvi+svR9gf9goaxzkk6AuSVsFeoWPrZYe
	 84rOkvasz7vdXxDxllCtpok7rIJCitKHngVWxn6qgqIW9EradsEp3pCjDKLQjiYeLZ
	 V4Xf0WfT2XU3fk2JqI12mBG/iW2PBoC+vxh2ZZuU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55CB5hUj2534115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 06:05:43 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 06:05:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 06:05:43 -0500
Received: from localhost (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55CB5gsw1886634;
	Thu, 12 Jun 2025 06:05:42 -0500
Date: Thu, 12 Jun 2025 16:35:42 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-chavda@ti.com>,
        <p-mantena@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v2 03/17] dmaengine: ti: k3-udma: move static inline
 helper functions to header file
Message-ID: <acc1217d-50ce-4851-829d-38294b0a4d81@ti.com>
References: <20250612071521.3116831-1-s-adivi@ti.com>
 <20250612071521.3116831-4-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250612071521.3116831-4-s-adivi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_040548_227129_71BCEECC 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jun 12, 2025 at 12:45:07PM +0530, Sai Sree Kartheek Adivi wrote:
> Move static inline helper functions in k3-udma.c to k3-udma.h header
> file for better separation and re-use.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  drivers/dma/ti/k3-udma.c | 108 --------------------------------------
>  drivers/dma/ti/k3-udma.h | 109 +++++++++++++++++++++++++++++++++++++++

Since this patch and the previous two patches seem to have the same
objective of moving contents from "k3-udma.c" to "k3-udma.h" for the
purpose of re-use, could they be squashed?

Regards,
Siddharth.

