Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717C6CA6CBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3uYq+bvJ8IHWH6k2uOihpa6CKY0ItOKPXbc7h/Pz2g=; b=CL6wwfxgI07uIfx6km5Q0cGXqd
	w7qUPiWCqhWOrhOd5wpwnCGvhTQHg4WcXaQJtRWEFP2TjIdJiImoxes1IolSZaCVV9PLHqNzOUWoq
	yBCftqzJOLbUqZjil/0YP8w+aJ+rApukbsB0elzPfOI0aGqI/I3lXXIa68UqNzmeuYCwc4fUu9VCM
	N8tHoUgJJDEx3WUXRLHSZr4VnSu5sznXR0C9tBpsWrRLMzuChRTu6HP0r0+qvgxz4wDST1uPn1xPI
	dmoOMHMLK2izoNgBDUDyKZs2m53QZeaWwgaGONlfTAH2TLMeY17N2NhKf3TJOpEHIVjiTc09TMOop
	XOIObpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkf6t-0000000DuZq-0Ume;
	Tue, 27 Jan 2026 09:11:43 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkf6o-0000000DuYu-3NmG;
	Tue, 27 Jan 2026 09:11:41 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260127091130euoutp014c75f018134d9523a802741a4410d6be~Oi4Ej8mLk0793907939euoutp01d;
	Tue, 27 Jan 2026 09:11:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260127091130euoutp014c75f018134d9523a802741a4410d6be~Oi4Ej8mLk0793907939euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769505090;
	bh=o3uYq+bvJ8IHWH6k2uOihpa6CKY0ItOKPXbc7h/Pz2g=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ARDcksx7il7K+UJhL3qOUbJrzsCnWlDnWMyBKycHeHqFCGmyemgus6UZuDTSdf+bf
	 sio+/WnMIcFH7Q4EvSeQJPsiIhXonBavFn5UetIdLJJLlTvKiDVGsd1YhwF3xweOeh
	 qSQI7psb+mdS7QYSc32Br4lqAOSfjZL27eQp/MjQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260127091130eucas1p1440fbe9f7c4c663fa3a68f6fcb86470d~Oi4EUDQLX2294122941eucas1p1s;
	Tue, 27 Jan 2026 09:11:30 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260127091128eusmtip12e05e437c03450178ad4e2539faa417e~Oi4CsG4iT0357803578eusmtip1P;
	Tue, 27 Jan 2026 09:11:28 +0000 (GMT)
Message-ID: <002704a5-9ccb-4abb-beaf-5a448c17ea39@samsung.com>
Date: Tue, 27 Jan 2026 10:11:27 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Stevenson
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
	<heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260127091130eucas1p1440fbe9f7c4c663fa3a68f6fcb86470d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-EPHeader: CA
X-CMS-RootMailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
	<20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
	<5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
	<CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
	<36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
	<jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_011139_447091_F35A27B0 
X-CRM114-Status: GOOD (  11.21  )
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

On 26.01.2026 20:00, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 06:44:52PM +0100, Marek Szyprowski wrote:
>> On 26.01.2026 18:42, Marek Szyprowski wrote:
>>> On 07.01.2026 19:14, Dmitry Baryshkov wrote:
>>>> Implement the clear_infoframe callback, disabling corresponding
>>>> InfoFrame type.
>>>>
>>>> Acked-by: Maxime Ripard <mripard@kernel.org>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> This patch landed recently in linux-next as commit 3a4ceb89a972
>>> ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that
>>> it causes the following regression on Qualcomm RB5 board:
>> Please ignore my report, it looks that automated bisecting got a bit
>> confused.
> See https://lore.kernel.org/dri-devel/9ebc0582b0f7990d7df992a07ec8ef7f@kernel.org/T/#t
>
> I'm going to push it to drm-misc-next-fixes.

Thanks for pointing that patch! It fixed my issue.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


