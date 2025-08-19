Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D40CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haelXDwMy02Pwc8ZA2q/PxzyUxHWHwhLuI5ijIySm2Q=; b=QhNyHmddIF/WmCjISIB5eaVNjg
	ASOC2Em2uJ3/LFAHP5+XC9+XcznFaK71WFG6xkNDS4QUakH1jn+DhltDE28VjV/Vcxo7ShxzmzlHg
	u7U/XqVN8p4PUY06VYQXvwGGwpOZRivQpGwJXPx2Cgeg05HmvUj2PfByziahuHrqKnUe0MKFRpl+J
	vgPUVddgBFex8LF+JI3arcdcrGvoDmuWPoVT4hDk14FCsHNjbHGcQSSE2A6izYhL7xQ1F6Nm/8iFN
	Xwyq9lpcD12zrGiTVC+/J7jsMgH0w7h7rgR70/JF1jV0FK34E/2pnZs5qmvbPJ3PXF7hVIXntEjaR
	m9fD1UcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQq2-0000000BCje-1sKk;
	Tue, 19 Aug 2025 18:13:38 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMEB-0000000AZRm-3FZW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:18:16 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250819131814euoutp01407dcfebe28b2f1dec4f365b9a0284cb~dLYibZJ0n2008620086euoutp01O
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 13:18:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250819131814euoutp01407dcfebe28b2f1dec4f365b9a0284cb~dLYibZJ0n2008620086euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755609494;
	bh=haelXDwMy02Pwc8ZA2q/PxzyUxHWHwhLuI5ijIySm2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b28gXOmJv53Ukifr2jI0aPiN+kMb9HQZdc90+xIpGWsCXMjzXCs2BhEZzlqeWCbEe
	 XNIxLDdM7+bmLvwFirdlYVt922QudW1edmFOYmAXkyD3uaUur4O+Q/SNp8+NZrmsew
	 6FWIkB/NKoNcUv+wqS/Dz0JkHhZdn8oXOWJ/oSfs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250819131814eucas1p2c57ccc084cf6736fed01a8a5c0b35fab~dLYiBBqeM2800428004eucas1p2h;
	Tue, 19 Aug 2025 13:18:14 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250819131813eusmtip1ef1102cfde54eb4bafb4302017462cbe~dLYhNgGmp2290322903eusmtip1f;
	Tue, 19 Aug 2025 13:18:13 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux.amoon@gmail.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	justinstitt@google.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	llvm@lists.linux.dev, lukasz.luba@arm.com, m.majewski2@samsung.com,
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	rafael@kernel.org, rui.zhang@intel.com
Subject: Re: [PATCH v7 7/7] thermal/drivers/exynos: Refactor IRQ clear logic
 using SoC-specific config
Date: Tue, 19 Aug 2025 15:18:03 +0200
Message-ID: <20250819131803.23296-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813131007.343402-8-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250819131814eucas1p2c57ccc084cf6736fed01a8a5c0b35fab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250819131814eucas1p2c57ccc084cf6736fed01a8a5c0b35fab
X-EPHeader: CA
X-CMS-RootMailID: 20250819131814eucas1p2c57ccc084cf6736fed01a8a5c0b35fab
References: <20250813131007.343402-8-linux.amoon@gmail.com>
	<CGME20250819131814eucas1p2c57ccc084cf6736fed01a8a5c0b35fab@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061815_942319_388E5C66 
X-CRM114-Status: UNSURE (   7.29  )
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

> A unified
> exynos4210_tmu_clear_irqs() implementation now replaces the previous
> reliance on SoC-specific functions and hardcoded register mappings.

Well, right now we actually add exynos{4412,5420,5433}_tmu_clear_irqs :)
But those are quite similar except irq_map values, so maybe they can be
unified into one?

Kind regards,
Mateusz Majewski

