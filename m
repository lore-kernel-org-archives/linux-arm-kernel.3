Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C40CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNNRF4Z64xSeC0TtYIjoq13C5zAXQshZP/bVM+z+NiQ=; b=bn3xrbFQE9q3lhhpR3QYFnel7u
	uzr9o9gWKIl055z2O6tErsjI+oh4/SlzDOqruvOHCaiN8lrYehCLDp0qMIJN4jgh9zn1MV3Q8HUnt
	MNKhhDL0vr8n2MrtOy6z+N9F27X84juroPZ2eiyQaYm7KrXnadL41RiQTOagtoWJ0Nd+rZFPqWepT
	bgXnZuDRq/zKYKp80CCGJRyHZgM8edKrlY+i3BbfvvMWNr/yg3OMyTAQRHTK79gL1DAZ6zzqdD66+
	jhwueB51VdZcQiFQwlnqaOd9lnUXyCucohM+S6Hhh8ih9B7x8thpLABQS5mMFn0V8hhyQ5pykDg/P
	7wUJsk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQr1-0000000BE5q-3bBY;
	Tue, 19 Aug 2025 18:14:39 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMh8-0000000AeVA-2ETP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:48:12 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250819134804euoutp022b087f8a681d9e441fb867f54f6c387a~dLyl185cN1433814338euoutp02Z
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 13:48:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250819134804euoutp022b087f8a681d9e441fb867f54f6c387a~dLyl185cN1433814338euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755611284;
	bh=rNNRF4Z64xSeC0TtYIjoq13C5zAXQshZP/bVM+z+NiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mFOUIVthvLpbk8Q9P5dhVu8SsExVI/BPt0Z7z5NmZ/0BURIHyaKRLVRxkisUyW0Qw
	 X3hbHXJG+yJbvi5adKwc/jVgaTg1XRtnfy8V+km6bUL8Xp/Tomxl7s2LkkE0ynwrdF
	 5Jie4pHMZfdyiWkfORKbBFBFRfXHyjsaS5B498AA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11~dLylHjeKm2798127981eucas1p1o;
	Tue, 19 Aug 2025 13:48:04 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250819134803eusmtip14d110ea7c0e1c86224f6c2ecf32b88ba~dLykUPeUf2742627426eusmtip1o;
	Tue, 19 Aug 2025 13:48:03 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: m.majewski2@samsung.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	justinstitt@google.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux.amoon@gmail.com, llvm@lists.linux.dev, lukasz.luba@arm.com,
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	rafael@kernel.org, rui.zhang@intel.com
Subject: Re: [PATCH v7 6/7] thermal/drivers/exynos: Handle temperature
 threshold IRQs with SoC-specific mapping
Date: Tue, 19 Aug 2025 15:47:55 +0200
Message-ID: <20250819134755.92187-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819131704.19780-1-m.majewski2@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11
X-EPHeader: CA
X-CMS-RootMailID: 20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11
References: <20250819131704.19780-1-m.majewski2@samsung.com>
	<CGME20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_064811_015336_A08E1169 
X-CRM114-Status: UNSURE (   6.82  )
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

> +		pr_warn("exynos-tmu: Unknown SoC type %d, using fallback IRQ mapping\n", soc);

I missed this when writing the previous reply, but this doesn't build:
"soc" should be "data->soc". This line disappears in 7/7 though, so 7/7
builds just fine for me.

Kind regards,
Mateusz Majewski

