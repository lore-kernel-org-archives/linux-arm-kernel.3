Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1799D19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViZnPApGmUm2J4gBM2q37ZW/xc0HmDYJ2pAdJ6BXznM=; b=X0rVqrdMQLs5eDOk/9wlNnggCA
	+9wnjioP+1H5iU3bdSZXkbuLtU04tDtfxe8g7qYAORf7hIhsISsjrDG3PGabslBkYkhHfPapCtxOV
	+4vfIfz7QkyZs+fx99B/C1bh9viHaf1cu5oZghhQeLbYgx4YEKorjUFk5C9MaWlbcag2QwqN2dN1q
	s6i8ikuROAw5slQ+VR7WUtbGFUo9YNFqlgCT5THmgdGONrYufQuMslY7KZHqxtte7375UY8UpLgBX
	g67oX6ReYPVs49rRKXmZCDMP4w0p7oeBaA0CbsUjCn+Uku09J9CFQsA5Y7qwdY6gAsj05vPxZKDsf
	uU6z4bnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQe6-0000000D0L4-1dS5;
	Mon, 26 Jan 2026 17:45:02 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQe3-0000000D0Jj-35aW;
	Mon, 26 Jan 2026 17:45:01 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260126174455euoutp02672a86f4aa950dcb6186a3c4ea3e9c49~OWPEJIrBp1456614566euoutp023;
	Mon, 26 Jan 2026 17:44:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260126174455euoutp02672a86f4aa950dcb6186a3c4ea3e9c49~OWPEJIrBp1456614566euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769449495;
	bh=ViZnPApGmUm2J4gBM2q37ZW/xc0HmDYJ2pAdJ6BXznM=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=EcUJtwIvikdAG2aaXvnIrEnVxjxp6sqj+eN+ReWnmhAZcoZTykDAYnBGn45TjgV9j
	 6IydmTmfZcw7aIGKkxgoTwMd/FiRl51Qw8mUSbmfRj6dgT0++ll3wq8V+YBs81C+BN
	 XVtyFbTgY9a2qQn8fxHgi1EnWme/xadUYtn7+BUU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260126174455eucas1p1f219202580a1033d3e881adc4f37f206~OWPDiMXHA2201722017eucas1p1L;
	Mon, 26 Jan 2026 17:44:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260126174453eusmtip1343282648a6e7de9c928b52e4daf95d0~OWPBrT1zi0390203902eusmtip1Q;
	Mon, 26 Jan 2026 17:44:53 +0000 (GMT)
Message-ID: <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
Date: Mon, 26 Jan 2026 18:44:52 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
	<mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
	Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Clark
	<robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
	Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
	<heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
In-Reply-To: <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-EPHeader: CA
X-CMS-RootMailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
	<20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
	<5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
	<CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_094500_046135_B24403BC 
X-CRM114-Status: UNSURE (   9.40  )
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

On 26.01.2026 18:42, Marek Szyprowski wrote:
> On 07.01.2026 19:14, Dmitry Baryshkov wrote:
>> Implement the clear_infoframe callback, disabling corresponding
>> InfoFrame type.
>>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> This patch landed recently in linux-next as commit 3a4ceb89a972 
> ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
> it causes the following regression on Qualcomm RB5 board:
>
Please ignore my report, it looks that automated bisecting got a bit 
confused.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


