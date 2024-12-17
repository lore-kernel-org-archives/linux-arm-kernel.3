Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FE2E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DncSMB8awaOalGRsmXKLNqehj2Q8AYTF94wrCAJZets=; b=bHGKasr+WYteiUvKaf34X5pkHe
	U+AjG7zdAsMBniL77yKjqBMjDGs7ex6q0JM6zHgEr2ZWIGJXhLFO0Q5juipxVPcdNKClcvgMTTfO7
	d78IE03V6im0rklCxrn+Gx9UTmWRheeu5vbiQFmrS8uzXlmoAiNTW4g25nzoIOjhW56weKUOncqOG
	6YRb0DQXobrkziMtcPOkQs5jlcs8LNMnyffYn6LQrRBLZaGYJ+RvV1G6gZcXDUjtwTGLeyey9Rq8m
	QxIgimdaGnpRfnWjWlYYJ9oCPkReKnMWVeZ0LZGjWLp03O6enqNbRrugcwBibtYplFd/LADTHzmqO
	rGfANZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUxu-0000000D8yE-1FsM;
	Tue, 17 Dec 2024 10:38:10 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUwn-0000000D8jE-2qXp;
	Tue, 17 Dec 2024 10:37:03 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4pZxb025779;
	Tue, 17 Dec 2024 04:36:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=DncSMB8awaOalGRsmX
	KLNqehj2Q8AYTF94wrCAJZets=; b=JHyqdCnAmk49Rks7tVDdl3Y0WoutMvr9mB
	x3iG4Gih0mGgeaQ7b7y6YZuqiBWOeWqniSGkkhacOVcylwjh8Ais2tnzOBK/LMn4
	L0mw7++y/sEhaKUgqkptQ2STbN8qQslOWHFUNPyAGAbUW95HpYe45bEj6R2MacLE
	dr3Wr5bd/vBehFbMarGrAwhRCuKkSl17WHMrxdePJ6CkIqY7VVHogsI1yu/xu+jW
	Wa2jZzHOPe9mMk1J+kcKIRKz7s9P5ZOc7MRlf0NKePCETF34apari5BqsJ3qElvv
	wKRhesX/OXcQJ4j4tQh4kn7cFQdc5GKOyJmpynrAUNV3yzmMWYUg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a237vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 04:36:26 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 17 Dec
 2024 10:36:23 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 17 Dec 2024 10:36:23 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id B0265820248;
	Tue, 17 Dec 2024 10:36:23 +0000 (UTC)
Date: Tue, 17 Dec 2024 10:36:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] rtc: use boolean values with device_init_wakeup()
Message-ID: <Z2FUJhC1Iq5mmkEg@opensource.cirrus.com>
References: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
X-Proofpoint-ORIG-GUID: ZFiaGqpxjixZfdP0EJY2r8mb04vfd9VM
X-Proofpoint-GUID: ZFiaGqpxjixZfdP0EJY2r8mb04vfd9VM
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_023701_717989_6525BB5B 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Guenter Roeck <groeck@chromium.org>, Jerome
 Brunet <jbrunet@baylibre.com>, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Yiting Deng <yiting.deng@amlogic.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Michal Simek <michal.simek@amd.com>, Vincent
 Shih <vincent.sunplus@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>, Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Support Opensource <support.opensource@diasemi.com>, patches@opensource.cirrus.com, linux-renesas-soc@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Dec 17, 2024 at 08:13:26AM +0100, Wolfram Sang wrote:
> device_init_wakeup() second argument is a bool type. Use proper boolean
> values when calling it to match the type and to produce unambiguous code
> which is easier to understand.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

For the old Wolfson parts:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

