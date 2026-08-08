Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B68C5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7MAb3Uu0LO6yvv+qCiCK5kQU9lkaEhyw4ok7BL0cqY=; b=ZoVjDUu3Qb2RA69IPjamDMjjqY
	WoFpuOluILRSBbNl1zIlh7huY3ZWdSTzEQDPqNHo47k0Nj62iRkKpbkbqe7WHW+xJadB2CytCHXff
	ZtGPe49LjZhvmQaXEOSqJ97NquHvoLCEPgS1rsA2UAYKXmwiqCSENyVgQzBsQrkk2by2uxu23VH+A
	1+6GEgZvBh6k7QjxX67KA5g88Oq9SWD2vREN4lbP4nvob4LQNP2tTTgfP5GwJzzRz/1xXqGqRti9A
	JWChriqgxbR6X4s18KjyIsITbCfsMhD+TtvilsZ8M60zMaiR5xScJ87aGEHOa85DxgKRN9jjybHEE
	dmkIKgJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdcc-00000009Eeb-1Fvn;
	Sat, 08 Aug 2026 09:45:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdca-00000009EdS-0RHI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:45:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4957952e0f8so323975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786182338; x=1786787138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7MAb3Uu0LO6yvv+qCiCK5kQU9lkaEhyw4ok7BL0cqY=;
        b=D7Us/c12tKs3k/Faop+3qjklkbN3x6o8Et39AR1mI0B4AGTRbWceumomM663Tqz25G
         FHopgltZwEe2VOKKUprTYhL9WkbgpwReeoxo2hc9GaLi2VPv+UclNByslqd1+N90vvGj
         BpAP4CrNagaAxdAfM6v2cSRZDP8gJxE+IhT4ioVz+vCKVxWQtVHB6G3g0buApcnnQnFE
         rYMbCQLwTKToLk/tTMbqDMi180YGilZMa3LlmXSg+pbTqSLS/XONpmhNrz/G3k2twvn+
         5DqXl9+0bQjfPgkBpIiZ4/Kc9BFNVtt5eZ0xdKYwHZxwfGHzQGm0LoPT0Nt7CvcuwQdq
         V3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786182338; x=1786787138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7MAb3Uu0LO6yvv+qCiCK5kQU9lkaEhyw4ok7BL0cqY=;
        b=XJmfI/IEMLaf8Hoz0MG3kYW7d/O68Zwg64BVzQdgdiPXqXGbbFIjkeg+4W8vI0Mk7+
         h3OGTnr5dZCbfYH/eHySuoUQ50D7fyw5UIJWucU2MpIhxxwn+ePtVkDRpFkgXEOo/V0u
         3tUxMhV2oVemx/aSBIhM7VaGioTg7ySQBHbzZ9v8UppD+TJ9132dTbtS/nUhfH7amzEE
         GupGngBu2KbKCjhqoDBWlIcaI/0dWT/wVuwS69HcXc9hbA4/zbKlCE1iYxQuUrgJWgTT
         0C/jvLcP1qqyPmUjgu6LZwgHkySeXLtQYHiMavkw4iuVRYeHov20371uGSW0w4rcNiIy
         d8mA==
X-Forwarded-Encrypted: i=1; AHgh+RqDUqp2Ki04vZRw41z8sYQpyGnCl2hWra/HROsF+9Sik2bf1Jl01CFUcpTpeiT/gBWwkF1R4RXiF1Cw6d7pIJv7@lists.infradead.org
X-Gm-Message-State: AOJu0YzGfbEAY+5F9JSFJZcgU7/5MkYX85aCIjrJf/apsNN1D/W00raL
	3fyUz3R5PWRvInavBe6jISgRAb94PNzjYWv4h7q6Zuw2xr12Zj7qX2W6
X-Gm-Gg: AR+sD12AFhHwxMR/QmgWT7aQkvmah2pe5M6VPOY03HMCY0epmYtovaRw1H73/9V3kmW
	K7SszGaArJyUhNHYgdr7CsDeMSr+TkfSAV3pnas3lqD0xNsr7KSFEdABl77Lu3UdDixXdwulsyI
	m8pHUFLRI17j+gN/kbChljitHxsKC9sFSviqhQ3pvOqnwTILmx6URd8Cy760A0vv6I7s4mTMqrX
	TA44Y+WNIzGdE3CjepfFcOG8Q0N7SsjgivQkgLu8vdbtuxn5kWUCbt8M3krOCVdFQtagQaViHkr
	J3nObQxp0lK6he2e/HDzq9TxFyvLbB0mssZJuNixkSH1bQfrxWlp2IgGx76Qi5qMUZJm2pLIkr7
	CINNqHeztEJFPraYay/tKcFxzNJgZyKfbEaoNNg5XT3GfrJdHuaB1bDUHihF7/dp4GRyj0Av7dY
	2+UQuq6Fk39trTHwcso9JPHWVv5N6xBxmIHbC/59YE3szHbK9mskhIJsmSiOokxIAFtt8ZIbjTo
	u3a8hJTkNba10qwvXh8lyKuo4PBJouMauaq4rYUONze4tyayL5ZDBbvBNc+LtYbtqQ7vg==
X-Received: by 2002:a05:6000:290a:b0:47f:7526:5a0 with SMTP id ffacd0b85a97d-47fec47628bmr22114967f8f.0.1786182338193;
        Sat, 08 Aug 2026 02:45:38 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145966sm12913518f8f.5.2026.08.08.02.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:45:37 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v13 00/35] phy: rockchip: usbdp: Clean up the mess
Date: Sat,  8 Aug 2026 11:45:18 +0200
Message-ID: <20260808094519.8417-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_024540_159156_F7638582 
X-CRM114-Status: GOOD (  10.78  )
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

Hi Sebastian,

The Tested-by tag is at the bottom.  It comes from the same test run
as my reply to the dw-dp v11 cover letter: Orange Pi 5 Plus (RK3588),
drm-misc-next of 2026-08-07, this series and dw-dp v11 on top, plus a
local board DT patch that enables DP Alt Mode on the USB-C connector.
All 35 patches applied without conflicts.

Scope, so that the tag is not read too widely: I exercised the
DisplayPort AltMode path only.  Modes up to 2560x1440@144 are clean at
the stock VOP2 ACLK rate, and 3840x2160@120 works once that clock is
raised - a VOP2 limitation unrelated to this series, which I have
reported in a separate thread.  I did not stress-test USB3 host or
device mode, and I did not run repeated hotplug cycles.

Patch 16/35 ("phy: rockchip: usbdp: Register DP aux bridge") is what
makes dw-dp probe at all on this board; without it the whole rockchip
display subsystem stays down, HDMI outputs included.  The details are
in the dw-dp v11 thread rather than here.

Thanks for the series.

Tested-by: Igor Paunovic <royalnet026@gmail.com>

