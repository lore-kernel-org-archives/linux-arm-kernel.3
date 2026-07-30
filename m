Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E1EC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr+Lmk4Crh+TItQ4euO+pUDKzWEuU0NrXxiTtpkhSeg=; b=qehWUUYqxKTEq2tPXVWMh4UYVq
	sKGyqmMX+RBA2otvh2R34ktfG42vY/sSMulDEFrlboxcYOIfjMEIfeH2LH9Nmz06akJnGcSWmEK+1
	N3/A5Kae13dB1MpRifrzBdi0I13cHU/nIzwMA/p38AvCh68ZT33ggvxYLPXv3Oqivojg5AZwlIfDt
	BRnMT/v7m2k1nn9eQD3oXvYxygktSSnLKzVVNT0OuvGohtfI21ml3CbSK1EYB/G0zBCS1UIwZlhi7
	eLLcRGbpS9nYpix9VkFP4o85DZcIYwpC3f08yzpmdNwCL6Rt2RgJ6GiSHaKrMojoYTRVRSxB+EpgF
	BC+pzMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNr4-0000000AAd9-1MBc;
	Thu, 30 Jul 2026 10:19:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNr1-0000000AAc9-0bfO;
	Thu, 30 Jul 2026 10:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785406744;
	bh=Tn7t5jxGrWrTDZ5FWs65zFahjQJ4IKGASBS+IKuom9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZLJLlXl/SQ03XxUMbNbK5A+kU+fYVaJEO/4d8jO8gOgVEvevQgFGFKbNX0r1lpg63
	 6f4OKrTbtw9uKGiRSahSf1IImDoAETjAqNy5rjL1y9G7ewYTLDd1Jw3xYsDpEjqKf8
	 IyrabVG1pARYE5we6LHYdSW3BA7sbSbLFLz5zbupwunSAHBvRVI+gFVozms1sAf5VE
	 +ayh4GSATHzIc9apkAd5cxA/Etjfewu5mjKUqhOQlKlTRER+2FZ1+lByuKNe/ehIBG
	 wubNcFagvOYXpPFI9QSK894hL+RDeVk4FPcEiGVtesVeRvJ80RlxXUfE64fIQk4LYK
	 0wzwK9RRYFsIA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A82B17E0254;
	Thu, 30 Jul 2026 12:19:03 +0200 (CEST)
Message-ID: <48c1b5d7-97fd-4ba0-896b-0485eda395f6@collabora.com>
Date: Thu, 30 Jul 2026 13:19:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/61] Add HDMI 2.0 support to DW HDMI QP TX
To: Diederik de Haas <diederik@cknow-tech.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Liu Ying <victor.liu@nxp.com>, Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maud Spierings <maud_spierings@hotmail.com>, Sashiko <sashiko-bot@kernel.org>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <DKBTALC5PUJ3.2KU1C4MRVBQNT@cknow-tech.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <DKBTALC5PUJ3.2KU1C4MRVBQNT@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_031907_344932_9E62A5B3 
X-CRM114-Status: GOOD (  12.67  )
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

Hi Diederik,

On 7/30/26 12:52 PM, Diederik de Haas wrote:
> Hi Cristian,
> 
> On Thu Jul 23, 2026 at 3:34 AM CEST, Cristian Ciocaltea wrote:
>> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) on the Synopsys DW HDMI QP
>> TX controller, as found in Rockchip RK3576 & RK3588 SoCs, by adding SCDC
>> management for high TMDS clock ratio and scrambling.  Since SCDC state
>> is lost on sink disconnects, the bridge driver needs to trigger a CRTC
>> reset during connector detection.
> 
> I tested the v1 series when it consisted of a 'bit' less patches, so I
> figured I'd test it again with v9.

Sadly, this is still growing - I added a few more patches to address some of the
Sashiko findings and will probably send v10 later today.

> So feel free to add/update to the Rockchip related patches
> 
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B

Thanks for (re)testing!

Regards,
Cristian

