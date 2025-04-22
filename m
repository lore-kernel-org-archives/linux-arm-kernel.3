Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DACC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNY+lSA4LGDF577T5xVfC+u7ea4LZESXu5gOyjCWZx8=; b=rZvaiMIUKihPANkfkG29g9URgX
	NLUAxv2sqFe+Ih3HTQeAjtW4jF+0dVR7jvStVblA2tiynUwREfhefDysvv+DW+NRBb4S1rf6BeObJ
	MUMUUhupfCscTfIm0n4GVzmQxVkjfK+GXT5OJGDjq8WtgRJk4WwUlpGA4y9XZhZZVxdk1j5fods7P
	p7klauRdye7MnVOUgGBf8K9r750uriLe34If2Jt9PsqgsHWAFgOn8b6v2R/hbLQX8sLisTysrpTwo
	BVCbF1dmr9uQ7epKDdZRc6WlAnlRs6I7chugSxt2Z56gU67zH6UzKoGWR59rDdug9LY3ToU55Pw7W
	ZhUsHbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fk4-00000007lNP-2ogs;
	Tue, 22 Apr 2025 15:41:00 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EVv-00000007TKe-28vo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:22:20 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEM7Tr1240879
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331727;
	bh=hNY+lSA4LGDF577T5xVfC+u7ea4LZESXu5gOyjCWZx8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UGPCEvO+TgGjuZR3JPdLgeRfzycdeM26ZB0pPryMntMIdCbSK6Tw0QRt3hyA1VAMt
	 +DIei7Qmh32lnQmTjX0DQNSKuFCFgFHBVdqlq9NaBvTOVW6vEstq4amSmSKFfYuioa
	 qjYrJui330U+98eg7bYdR6/MYIwNQQqRElU55Z14=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEM7kB092213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:22:07 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:22:07 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:22:07 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MEM7W5130099;
	Tue, 22 Apr 2025 09:22:07 -0500
Date: Tue, 22 Apr 2025 09:22:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <lumag@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
Message-ID: <20250422142207.2tu7gmhnjercmoa2@basil>
References: <20250421201055.3889680-1-jm@ti.com>
 <55d306d4-c9cd-4119-8798-b65a6956f4df@app.fastmail.com>
 <54b6880a-bf65-4a79-8f3e-9fa66b6c3550@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <54b6880a-bf65-4a79-8f3e-9fa66b6c3550@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_072219_634856_1E51EC94 
X-CRM114-Status: GOOD (  21.12  )
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

On 09:15-20250422, Judith Mendez wrote:
> Hi Arnd,
> 
> On 4/22/25 1:37 AM, Arnd Bergmann wrote:
> > On Mon, Apr 21, 2025, at 22:10, Judith Mendez wrote:
> > > Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
> > > across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
> > > default on am64x SK board.
> > > 
> > > Signed-off-by: Judith Mendez <jm@ti.com>
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > The patch seems fine to me, but you should address it at the
> > TI K3 maintainers, so they know they should apply it and forward
> > it to the SoC tree. You have Nishanth and Vignesh in Cc already,
> > so I assume they will pick it up from here, just put them in
> > 'To' instead next time and move Catalin and Will to 'Cc' or
> > leave them off entirely.
> > 
> 
> Will re-spin and fix the to and cc lists, thanks for reviewing!

There is no need to respin, it is already in my queue. Will pick it up
as part of usual process. The above information that Arnd provided is
for future reference.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

