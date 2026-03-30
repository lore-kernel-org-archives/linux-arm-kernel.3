Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592C81061B22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfUHv4pdZLNaF0EwNnVOlxUfM3PJEOqnTA+BD/qaN1w=; b=Ik708+A8JDU01XrzdPQIeufLOr
	r4hAmQ4GY1nCxJunjItxDFj2Sf0CAaUWQFDY0UmwcrXDW1njRozHWG84gJ6Wyy0BNX9gm2uX4EGj4
	rsN02Oh7gGIiBq+P0V6LSeZQbSvopj3kIQ/6G9LOSQvB3vxx79cFM2SiFtVDOxO3FL6urR/Mpl0UX
	gSDTsCy4IQQxRwL6krmLOqnzYyILLzvh6gJVGw0WMoz72L1voxPQUkSWdPsPImF6WEVejECTkSRCd
	7jylL8swOxo3MUAa+nO8yR2kCsbsii9FTbHW+1H5HxtioR9vR64u3U+CNYIUbJH3kjkdAlxsm6Bsq
	+2Bb0fqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7L2b-0000000ByCs-04UY;
	Mon, 30 Mar 2026 22:25:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7L2Y-0000000ByCQ-3b8c;
	Mon, 30 Mar 2026 22:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774909494;
	bh=RphenkmKp5cHZbTuPcy3VOdJH9R0n5lebz4MDGW0iN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kJnhCKUcUJFcI9rTX+8uPRrlKQaxBe70PwrsqkIcSoQI8ZQWxUscNMnrh/LRVlTHE
	 9hGfYLTHy0+rGNTKUPDou4Mt//azoT9jcZMfoa1OLhOgC7hSfWSPfDiKdcWlkZtN7r
	 ZHfJ5mXIFGPsPbhFUNcghcP4/h1rFA7uIdVDjzhH5wA1hW+dNrjKhV2lNo4CL6w/3b
	 syWWD2s09ujeXhx4eSoI8gVSxOJ7Cy+nfuQsXq0IwcbMHeHZyUS7L6ctlLHfm7vz48
	 Y12kvdBaZvv9adgrmc3cVXWcGAARz4pZmcJvib1bioJL3e7GXX+ijfh3aWkfQPKjac
	 SKbENZPsI5ZUw==
Received: from [192.168.1.57] (host-79-18-8-236.retail.telecomitalia.it [79.18.8.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3E0517E50D0;
	Tue, 31 Mar 2026 00:24:53 +0200 (CEST)
Message-ID: <7df5a59f-8f66-4764-bc85-59eadd0851f5@collabora.com>
Date: Tue, 31 Mar 2026 01:24:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 4/4] drm/rockchip: dw_hdmi_qp: Do not send HPD
 events for all connectors
To: Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>
References: <20260323-dw-hdmi-qp-scramb-v4-0-1d99df84883e@collabora.com>
 <20260323-dw-hdmi-qp-scramb-v4-4-1d99df84883e@collabora.com>
 <47972235.fMDQidcC6G@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <47972235.fMDQidcC6G@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_152459_046642_E473FD22 
X-CRM114-Status: GOOD (  12.21  )
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

On 3/30/26 7:56 PM, Heiko Stuebner wrote:
> Am Montag, 23. März 2026, 18:45:30 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> In order to optimize the HPD event handling and run the detect cycle on
>> the affected connector only, make use of
>> drm_connector_helper_hpd_irq_event() instead of
>> drm_helper_hpd_irq_event().
>>
>> Additionally, move devm_request_threaded_irq() after bridge connector
>> initialization.
> 
> nit: Using "and", "additionally", etc in commit messages, is a strong
> indicator, things should be separate commits.
> 
> Especially as the sentence above just explains the "what" but not the
> why (interrupt firing, before the device is actually there probably).
> 
> If there are no other changes requested, they can stay together though,
> the "why" is somewhat obvious here.

Ack, will split this up in case a new revision is needed.

> 
> 
> Both changes themself look fine, so
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks for the review!

Regards,
Cristian

