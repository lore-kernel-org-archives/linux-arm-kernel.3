Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED35BC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbq4GNHat/YXSM/ERlCYg0/nrsQ+ewI/Ix0VbmpNdWA=; b=jLKcddmIGD/YGYIftQ5rVi7Vwa
	CsnH0EO6ZIWtwsoikNbRQPzskhgf2+nQN8TV5tfe1/OO0g0LjgSbutypEMyp92wfzEoXQsiDxmFc4
	ssCLJEIdSHzz1z9Ppezwos5ezmceCPV0p/1vjmHvUSJbiR1y23AcL5nQvqoouzv8pnabz1bhzmXFl
	fVynxefTrJo+wvBWqRLmj0HBslV0pflEYBWyzMPcEeSK9rHupR/LDndwYNGqxtvTv9uVEU37DQGQW
	tVZtLLvL0LmrnMS1/IMOsQnq38qOiruXP37c1+id+w6Dv02qwRuBREPtMCN1hy/pqDF2+OruhfA6x
	63kclyPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwc5-00000008KUi-3uvy;
	Wed, 02 Jul 2025 12:30:57 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWw8g-00000008Dwb-3XFt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 12:00:38 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250702120029euoutp022859fc97d95b97e94c6296189ff66b85~ObW9RPp-72645026450euoutp022
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Jul 2025 12:00:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250702120029euoutp022859fc97d95b97e94c6296189ff66b85~ObW9RPp-72645026450euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751457630;
	bh=zbq4GNHat/YXSM/ERlCYg0/nrsQ+ewI/Ix0VbmpNdWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XrJpGbKlXQ4g5MpUQ8I2j+gdIGKeMyxr5rUv2YPxjV+6j2Wd8ur297Q/UJp8bhTvH
	 MRHqXZFqZyB+AAeUUY5vtQYovN5oJGlFYE6O5AqvgogTOpEOcKP6ShT/HZf586I3Lv
	 W+RHCTurgI6RElm8uZazO1lzc22/KCsWKx7/0v9A=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250702120029eucas1p21cb8337b313f134047817c2e5d5790b8~ObW87y1jk0330203302eucas1p22;
	Wed,  2 Jul 2025 12:00:29 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250702120028eusmtip16bfcac7925fd7ad8a957595a387c0e37~ObW8Ik_7a2544025440eusmtip1H;
	Wed,  2 Jul 2025 12:00:28 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux.amoon@gmail.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	justinstitt@google.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	llvm@lists.linux.dev, lukasz.luba@arm.com, morbo@google.com,
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, rafael@kernel.org,
	rui.zhang@intel.com
Subject: Re: [PATCH v6 2/4] thermal/drivers/exynos: Use
 devm_clk_get_enabled() helpers
Date: Wed,  2 Jul 2025 14:00:15 +0200
Message-ID: <20250702120015.350609-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430123306.15072-3-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702120029eucas1p21cb8337b313f134047817c2e5d5790b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250702120029eucas1p21cb8337b313f134047817c2e5d5790b8
X-EPHeader: CA
X-CMS-RootMailID: 20250702120029eucas1p21cb8337b313f134047817c2e5d5790b8
References: <20250430123306.15072-3-linux.amoon@gmail.com>
	<CGME20250702120029eucas1p21cb8337b313f134047817c2e5d5790b8@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_050035_308029_AD1E12DB 
X-CRM114-Status: UNSURE (   8.70  )
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

Hello :)

These:

> +	data->clk = devm_clk_get_enabled(dev, "tmu_apbif");

> +		data->clk_sec = devm_clk_get_enabled(dev, "tmu_triminfo_apbif");

should probably call devm_clk_get_prepared instead, as they are only
prepared inside current code:

> -	ret = clk_prepare(data->clk);

> -		ret = clk_prepare(data->clk_sec);

as elsewhere they are only enabled on use and then disabled. Only
data->sclk is enabled immediately:

> -			ret = clk_prepare_enable(data->sclk);

Thank you,
Mateusz Majewski

