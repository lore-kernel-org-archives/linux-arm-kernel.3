Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAE4CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFdw4NU0rqUdnwQkTW5jDTI2TrOvFLZe/E45ZXiDc1Y=; b=Rh6zPbXfft4D9Aaf2k7O3c+410
	512RDwY0g/IHs4RzVtVeWEUQIU9m/gn8kpr3sm/KJxS9EGaqv7KuDr9qFXtgYaUq4TMWcv7w81ySo
	fJysAqlqpvfxDIyC6BFH80ovdPGwvhTU8MlThM0nW1LrzvonyHwMvy6dyZ2QTvu3rSQshZKMRZ528
	hl+pYKm+kNgQo/ImZwurmarkzlZxxf67XhRDIZ9f4zGiMp4EdLUlEzfdPdydt2b2gjjY1/HyD6Pgy
	CLHIK/irjMM0I8Mpcv0nm+e8lkhVwpMc3tCqjssA0QpWOIXBrBXAzWZlaVNj8bNCknD1jJRXj1THW
	Mr2Jntag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIfO-0000000Avrf-0e0F;
	Mon, 12 Oct 2026 16:14:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIfM-0000000AvrU-3Bd8;
	Mon, 12 Oct 2026 16:14:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E356B601FB;
	Mon, 12 Oct 2026 16:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAFB1F0089B;
	Mon, 12 Oct 2026 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791821659;
	bh=RFdw4NU0rqUdnwQkTW5jDTI2TrOvFLZe/E45ZXiDc1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=axltw2OzFfnLto8lDkWnN70zzds5Hzc+9r8r1oqBZPU0ch275Tc7K4iNf8MBEEkZ+
	 ccKwY4IhxJtI0GUnsHXL6WZTobF2ZU9UFuo7FXRWAlaJjzfapOPDVfIfhz5m4y9+R8
	 Qf8uGc5HAa78+rbJgPUVlFGwIkIPkv7vPFiN4gFLW5SDMHvGiKEKfLISv9bo9hVg5r
	 uXUdQCqyJ4mCVBiXIr6g7JW4FAhem74cvuUDquwunje2NHvvz9oODV5HL2aJal5YcO
	 Rpu6WZipcjdV8zbR02T2fZPbkqVDUAbsahyIVyCqeaH7j89Bj+E75itq6p1ohWeTKw
	 9MW1TYxMr74/g==
Date: Mon, 12 Oct 2026 21:44:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, pritam.sutar@samsung.com, 
	andre.draszik@linaro.org, kernel@lvkasz.us, pengpeng@iscas.ac.cn, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, 
	h10.kim@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
Message-ID: <as0G-bk_TKRToOkv@debian>
References: <CGME20260918103249epcas5p49c9b4bf6fd60c28f5f09f0b7b69828b6@epcas5p4.samsung.com>
 <20260918103147.2628614-1-selvarasu.g@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918103147.2628614-1-selvarasu.g@samsung.com>
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

On Fri, Sep 18, 2026 at 04:01:47PM +0530, Selvarasu Ganesan wrote:
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC
> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
> and ExynosAutoV920) provide phy_cfg arrays containing only a single
> element.
> 
> On these SoCs, when the loop reaches index 1, the driver reads past the
> end of the rodata array, populating the second PHY instance with garbage
> data. Since the configuration structure contains critical function
> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
> 
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the
> probe loop and the xlate function to bound their access against this
> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
> 
> Assisted-by: LLM
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

Since this patch fixes an OOB issue, it should have a Fixes tag and the stable
list should be CCed for backporting.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

