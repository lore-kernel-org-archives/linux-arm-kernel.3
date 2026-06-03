Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF95CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQE3iBkc1RZSMQ9nJUxcWEQih73KmCx6bl5R3y0r6gc=; b=Fkxja2XZac3iEDfXBvRjKzKhB4
	FNhQkBCvfxjtQfqNFK/cjtqBz0Leng6WHxeaPuKoW3HsxV5ExAFWRQK/OuoWBJLNaWxB3MYk0ddrL
	aw2SrbVf/uGkUHKe9TjzCAIDeh2GaPAp1zbZg/3qvJs4l1jOb9iUDhivQSCqw93mBqXt/4eqvnN7E
	ZxY1+76nXvovNPHGPjm3dneWguAODwj3+L6ZLPdYei84SAXKuQbzDG8/2MMj0H4pv0XyhL4e0BN+U
	qHWmA6Tie5P+nMgv5rc2QxD6j02uU3FSGjmygTKOLSZuDr3rlWAYHgxdHsop0FmOI/aUCV/nOWn8Q
	OIJObCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiop-0000000EoLH-39T6;
	Wed, 03 Jun 2026 10:27:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUion-0000000EoJL-215r;
	Wed, 03 Jun 2026 10:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780482441;
	bh=6aL4l3Ur3jsCLfcmTxD3VhVZp8AyRsbYnFcCugx26NA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=EOjyakpep+v7+Xow5oK32R8tPEBjHwdEeHbPheiYcss/3buxi01AAA7ua5JJIVn/j
	 al2o63aRvF7fpplbvgGp3DVCVVolK1iQPAFLDD0FcgXyQPe3JEAqOn7e7bPuM8wFCW
	 9TDq+62/gZIMWiM+6P1GAhEv4TDw6/YrTQLi7WdEaIkiiWTT+YN8H1zFxNwLp4qeSy
	 vKv/yOFhPl0Am0Nf59Dibe3/G4IOCPPajZjpnXLjNCDIdEl9aBXghMyGoFhtiHFfby
	 qsP7qcGpRxQe5C1tUwbbSjq55T7eM7Ab3DnktF68go+WtfutOjV/ud8Sc9uf5KpfS/
	 LLVsjHPkgAVvA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5678A17E05DE;
	Wed,  3 Jun 2026 12:27:21 +0200 (CEST)
Message-ID: <ebcad67e-e14a-4d0e-b3e0-79ae1d146eaf@collabora.com>
Date: Wed, 3 Jun 2026 13:27:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Niederpr=C3=BCm?=
 <dubito@online.de>, Simon Wright <simon@symple.nz>
References: <20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com>
 <e0eeb794-11b9-4ba6-bee2-f6cc607d3a16@collabora.com>
Content-Language: en-US
In-Reply-To: <e0eeb794-11b9-4ba6-bee2-f6cc607d3a16@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_032725_682937_DC811655 
X-CRM114-Status: GOOD (  15.55  )
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

On 5/20/26 10:05 PM, Cristian Ciocaltea wrote:
> Hi Vinod,
> 
> On 5/11/26 9:21 PM, Cristian Ciocaltea wrote:
>> This series provides a set of bug fixes and cleanups for the Rockchip
>> Samsung HDPTX PHY driver.
>>
>> The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
>> calculation and synchronization issues.  Specifically, it fixes edge
>> cases where the PHY PLL is pre-programmed by an external component (like
>> a bootloader) or when changing the color depth (bpc) while keeping the
>> modeline constant.  Because the Common Clock Framework .set_rate()
>> callback might not be invoked if the pixel clock remains unchanged, this
>> previously led to out-of-sync states between CCF and the actual HDMI PHY
>> configuration.
>>
>> The second part focuses on code cleanups and modernizing the register
>> access.  Now that dw_hdmi_qp driver has fully switched to using
>> phy_configure(), we can drop the deprecated TMDS rate setup workarounds
>> and the restrict_rate_change flag logic.  Finally, it refactors the
>> driver to consistently use standard bitfield macros.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> Changes in v2:
>> - Collected Tested-by tags from Thomas and Simon
>> - Fixed a typo in commit description of patch 1
>> - Added a comment in patch 2 explaining why PLL config errors are
>>   ignored for rk_hdptx_phy_consumer_get()
>> - Added a missed FIELD_GET conversion for lcpll_hw.pms_sdiv in patch 6
>> - Rebased onto latest phy/fixes
>> - Link to v1: https://lore.kernel.org/r/20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com
> 
> In case you missed my comments from last week on the Sashiko AI review findings
> - in short, I don't think there is anything to worry about and the series should
> be fine to apply as-is.  Please let me know if you would still prefer a new
> revision.
Kind reminder..

Regards,
Cristian

