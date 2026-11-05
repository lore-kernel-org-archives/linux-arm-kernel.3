Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA87606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bi44umbu;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YcWNzHpg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SK6M1yEyoNJDKCmPDiRQL//tqqiAKTuPZku2JKGAd/0=; b=bi44umbuL2/Ht+
	335Uojcil9thGkigzlZrxDC+slkzjptlZ/0i4NZ+u09w4/bdEUD0iMZDmiVKaN7LYGAO6xN9hScI3
	lhsOjCvHzwuM7ENZIfv1lUQv9myQ/aWn5n4RrHW0gLzlDYVObqDVfKpPzGCxelgYwdkjeiIOcK4tb
	UpFM8L5mSbFxT704bFoAHzivxcEdszXQLI2/AixCvl/SvOwnPcPTunl75eJ7xE2hP91iME5SjoZGp
	dLsZrBGWh5+5vOsYyu/XDHIqlRZVWs12eQmiTQrmiIE34HToawbRfG95dlENIAumTmXaZiseKEyYz
	DsdV78giyY6hbti/hpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx1I-000000091w9-0hHm;
	Thu, 05 Nov 2026 12:56:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx1F-000000091vJ-3fqT;
	Thu, 05 Nov 2026 12:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793883399;
	bh=GPs+492SkQ6n56PuURgzlUN2tW15KC8nazsGp2krMJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YcWNzHpgN6DIBbNmSNj0a3hHz4OrUISwJrYlnEz8rYdlVTCTV30Tx8vUV3194HRc0
	 Q/CBab+ZR1vajKuDfnE/Fcs+YeeSJgRFYsPwa52diEKlvNZq0b4n8zD0WMUX/RYQxT
	 d51CUaeq33D9+6aE6SR3N/tlooeeBsvHO6ES3dCaqUJ1Keu7h3Ofx9D6KQWZdSzNq/
	 G6DqlwF7wHZ/SOBak9xlD1HVCOYQP6Wa0yJcdLJ1+7QWYyYub9RC9EcdVeRzRwQZUM
	 9SsW5J7JZ+kg/x1doCi9gtPhHlVzaOqgYswlHkixoppBiSPQ2o8ZBezIpd8dWnS9NZ
	 d2udkK0xjhS5Q==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89F0117E07F6;
	Thu, 05 Nov 2026 13:56:38 +0100 (CET)
Message-ID: <7b86ca7f-fe7f-492a-bf88-0ac7afee3963@collabora.com>
Date: Thu, 5 Nov 2026 14:56:37 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
To: Daniel Stone <daniel@fooishbar.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Stone <daniels@collabora.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com>
 <CAPj87rPk=girxTziKY5ROV3ZYqGhKRz471BLWpkCjtvNNseuog@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPj87rPk=girxTziKY5ROV3ZYqGhKRz471BLWpkCjtvNNseuog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_045642_081693_A216D3E2 
X-CRM114-Status: GOOD (  13.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/5/26 2:18 PM, Daniel Stone wrote:
> Hi,
> 
> On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>> +               if (pll_hdmiphy) {
>> +                       ret = clk_set_parent(vp->dclk, pll_hdmiphy);
>> +                       if (ret < 0)
>> +                               drm_warn(vop2->drm,
>> +                                        "Failed to switch DCLK to HDMI PHY PLL: %d\n",
>> +                                        ret);
>> +               }
> 
> I'm confused ... if we have switched to the PHY for dclk, then a mode
> switch wants us to come back to the CRU source, don't we need to
> reparent to dclk_src?

This is actually done in vop2_crtc_atomic_disable():

    if (vp->dclk_src)
        clk_set_parent(vp->dclk, vp->dclk_src);

Mostly to ensure the PHY related resources are released when not in use, e.g.
after unplugging the display.

Thanks,
Cristian

