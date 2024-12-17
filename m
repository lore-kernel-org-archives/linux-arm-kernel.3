Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D667E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 20:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWirW1phG0GYR5AsHZHInNbqgJH09BBkEUHM1pdGE7w=; b=F4H5Q7wB43Lgn2+Fbru7RNvJM0
	8GaYRDRpQk530FLvLs6Z0IUF/hfQwKKLIPkiGct5qqsBIm798Ca4wDu+1PlPWVCiYUi98NsU5HeQG
	AERobtKoSpOPmCpF6GXClONqRweHTHMS9nX67rhW6A6+i1ql7Xx/E4IKGd8lneRJ/jlhAthgYlfGe
	JS+LewtnrRVP9j2sIZuGMLT6oIYOZ5isAjD7hj1ClVvfeK9VyVr5+h267/m/d9fhodlaifXAUrXmY
	d/9heD80kxj+flKXwlXLNcWMaiRqwH+7T08Yng7iqQZA4moPZEKdFRKFoUdYTs9qvh+7s5ukTodRB
	7tTmTPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNeZV-0000000En5x-2XQA;
	Tue, 17 Dec 2024 20:53:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNeYP-0000000Emwh-2LMo;
	Tue, 17 Dec 2024 20:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734468746;
	bh=QTgTwjrLzq+Vh3vlJUekypbgmjzQ4zFJ9paCtPkW590=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gGkDczDweBrHtxydhN7MEf8Pgf0FmBXq6Z860ntzw+x4TerllQUvTIbx8BZLHLxwc
	 lQD8Qe3C01isMn2ZlHk4JGoDudQc2VyxV8dBoyiDMMBxfUp5qhCAQT+M5EkZAzV9iQ
	 7iPiioHO2joqDxWOYGzvItswwkXYqtvFjOy5R92OYOk7bfrHX2LCPKLTjIGmhUvFj4
	 fEYT11ZdPZo6NlFVDxf8+N+LJcTNw/DfdACT+D+/NLaq6yteMODWLiVpjVNRgGhQmA
	 p2p/DMGGMX0YpKIgohX9+dpGT9Xb9cHysiLSkh2Spui1zjeDquY+PbG6/NtT7JEsPK
	 IwNXHq1qS+L3w==
Received: from [192.168.1.90] (unknown [84.232.140.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA7CC17E380A;
	Tue, 17 Dec 2024 21:52:25 +0100 (CET)
Message-ID: <2be9721e-62f3-41cc-83a8-5189b750a655@collabora.com>
Date: Tue, 17 Dec 2024 22:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: Don't change hdmi reference clock rate
To: Derek Foreman <derek.foreman@collabora.com>,
 Algea Cao <algea.cao@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241217201708.3320673-1-derek.foreman@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20241217201708.3320673-1-derek.foreman@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_125229_797742_8165E680 
X-CRM114-Status: UNSURE (   9.44  )
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

On 12/17/24 10:17 PM, Derek Foreman wrote:
> The code that changes hdmi->ref_clk was accidentally copied from
> downstream code that sets a different clock. We don't actually
> want to set any clock here at all.
> 
> Setting this clock incorrectly leads to incorrect timings for
> DDC, CEC, and HDCP signal generation.
> 
> No Fixes listed, as the theoretical timing error in DDC appears to
> still be within tolerances and harmless - and HDCP and CEC are not
> yet supported.
> 
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 -------------
>  1 file changed, 13 deletions(-)

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

