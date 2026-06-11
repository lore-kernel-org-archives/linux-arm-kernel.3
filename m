Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CCCCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8taPUMkZmBuuh6ROfvirO2CTHxf0EYoLMY7xlzu/I08=; b=JZFJQZLxWoGagnV+2E700Ub2G9
	nJ+z/u3EKXZCESnjG/j9B8xK74aXrRZkzxXfq6pCOFc7THBC8TBP1hg7R4ZW+o75p9Gfsg38bWUuw
	clSPihm7Kwgl5cCTzWaJtzMqOeImWvAXlZdNerw356Z3JnSj3SOTF0mVzSJl77VZdHFLArk4nOkQ2
	Q0boyPnmy0lLwinBJEsI10geufOQQhCY/GIWi6dXZRrY7s3HtFpgqKMJaMD8K1yRhr2BUF3SftEeO
	fd6u5y7IPEHDA+EhiJEt7sVZvDFWHYHcc99zr8pnYYzaK4ol/UYqH1cREfOUw5obpn7gfO4fVL96H
	kDhBmzyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXpHz-0000000ACza-49LT;
	Thu, 11 Jun 2026 23:58:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXpHx-0000000ACz8-2Zih;
	Thu, 11 Jun 2026 23:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781222299;
	bh=ypszbHyzB39x79bcGaB6iFn+Y2ljrD/Div0NqvLkCCw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=UQIZwuINbbo1Gsuv/8GDU95NlR1SVDlU/WBPSgbAkgafvPSpVxq/rUa5sGRctCvHR
	 AvQUY9nUEE40TN3oREpbavfacRDXhf1WEOrFZfxkudAAd95M+7tKF2M2RsncYYlFX3
	 WXi6J19/BO4tphd+y0pjwCN+S3EJ4jCl8EyT7Y2QeWi6faQhez/5SJGetgFhcC3DEm
	 zws31jK420nNdX1HsO0DUpOqFyycHFlacnGtwTO0QNzXMDwccr640I2+qYVBc5bH43
	 bHhdg1irQvFXGL7m43avpv+dVxjOlk7kLcOfNjaN2tQ93WzIVYWdQG7d+J6OR4eBp/
	 57e5DlKRHRUFg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8BD2517E0416;
	Fri, 12 Jun 2026 01:58:18 +0200 (CEST)
Message-ID: <25f0a87d-0607-49eb-b297-b45c11b4df1b@collabora.com>
Date: Fri, 12 Jun 2026 02:58:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Niederpr=C3=BCm?=
 <dubito@online.de>, Simon Wright <simon@symple.nz>
References: <20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com>
Content-Language: en-US
In-Reply-To: <20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_165821_829323_48973CA8 
X-CRM114-Status: GOOD (  14.30  )
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

Hi,

On 6/11/26 3:31 PM, Cristian Ciocaltea wrote:
> This series provides a set of bug fixes and cleanups for the Rockchip
> Samsung HDPTX PHY driver.
> 
> The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
> calculation and synchronization issues.  Specifically, it fixes edge
> cases where the PHY PLL is pre-programmed by an external component (like
> a bootloader) or when changing the color depth (bpc) while keeping the
> modeline constant.  Because the Common Clock Framework .set_rate()
> callback might not be invoked if the pixel clock remains unchanged, this
> previously led to out-of-sync states between CCF and the actual HDMI PHY
> configuration.
> 
> The second part focuses on code cleanups and modernizing the register
> access.  Now that dw_hdmi_qp driver has fully switched to using
> phy_configure(), we can drop the deprecated TMDS rate setup workarounds
> and the restrict_rate_change flag logic.  Finally, it refactors the
> driver to consistently use standard bitfield macros.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v3:
> - Replaced div_u64() with DIV_ROUND_CLOSEST_ULL() in Patch 1 (Sashiko)
> - Fixed theoretical usage_count unbalanced issue in Patch 2 (Sashiko)
> - Rebased series onto latest phy/next
> - Link to v2: https://patch.msgid.link/20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com
Please use v4 as I added two more patches to address latest findings from Sashiko:

https://lore.kernel.org/all/20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com/

Thanks,
Cristian

