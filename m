Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4D4C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzP4xqIsstfeVL1p2BEayzggpWH6XvsfreBjrDZxCS8=; b=WyvUBl3iTr93UEcXgS7X6Vri9S
	LRS2QrTOhoGofLqIj6Jk4p3HVpXn92cpo0G86TQmisfqxxk7Squk+Z+sWE5y6odE4H6mySg4s/Kss
	U3A57UHpDYRgZnzzD4Wn5veJeZBfxP4TShXBIvgh5m5wW1CIomhG/TypIMEq8H8mHCMzfQxdcMdLs
	0DaBxiSrtJ8FUwqyMB53CpeCvODcIuGsjoGskQPiOi+kcf4L6Q/bd+9F19f0BMQCfmALSrQXUvdLN
	DBajCLpFC9t1zi5196Ujq/poOa83MbKeygifSxglY0i3atmVumpF1gOVpI/N9y9T/BpkjXPhL9wGY
	xTIEzU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYXU-00000001BoW-40Yz;
	Thu, 13 Aug 2026 16:44:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYXS-00000001Bnd-3J5e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:44:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-473987fc217so602f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786639457; x=1787244257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzP4xqIsstfeVL1p2BEayzggpWH6XvsfreBjrDZxCS8=;
        b=Z+RHoj39xYpSNmC6rhyrpygnHex3xIoXGHXWm383NtOUGpUrDYlUxF5m4QJyjo6jId
         2sTHJ1Z6/DfPT7vp3uC+fCSM2VljNVnKwMJtm2W/77ORwiyAZM2PzUEFf7jkENLTG8Sr
         tDmEoQEr5fRLn6rRiejDBnRsnKWfcNWtSB1YjQ9MuiIIi1hLFYjuNL687XQw5N2xvOto
         7ziMzTIMwQv8KZiWCjEjq08VwYuxmxGNJl7gNGn06pDrsYBHqbRMjwZqCIDNaWV5uILH
         mq1BdA7AZEgwaI0HjF7jQi92hIN+UJyiIxRoFpIFGM4Rtl3rFv4gvo1zflSDIopzZctL
         r5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786639457; x=1787244257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzP4xqIsstfeVL1p2BEayzggpWH6XvsfreBjrDZxCS8=;
        b=EmMwqumOAgirMeiocdJl54tYQSUvUgX2zOecTC4GAco0JhZZbQokm2RboiJV6rbrSQ
         cmHn+8bbFsJJYbJ+g7HcD4MoVLnFZoJJesHSQj/dGxGN9CrN/eiabYFBl1MfiQ23Pp6O
         akxgn1JIc2eVdxVNuy7JxoA3lOCDpOwiiSk/vMIhqUUi4x0pCU2zpprhmJGOShUHVGjN
         qvMa/w/ebaPxmRRDXZpcckdfjXQkGDqkDzNE0yNUw4/SPh4mhOeBqJU1v+ahSsL04Kx0
         BqhgIg6eHSTsX+7FVP98QsljCjJJJd9VzJUNqrjC11ScfgtpCs7L/U2Or3eVLTqLCiPY
         XFJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqkac+2D7q9WjGQNzH511eOQhhC+Byh9VRr3qCv8FBADa0LYcvfjT0bCmuy8HxWwOdWEk19Gdno5FK7YqDIO2j8@lists.infradead.org
X-Gm-Message-State: AOJu0YzVp8DPWoxYmtzQVC/E8B2wXzzdxSS5q2tBRUaMhGMC/v6rZFo3
	gv6Z8d7SEsAntVmp6h7ipqnFZr+Sz84m9nb/Tg/bicrJpVY2GgzYqbBh
X-Gm-Gg: AR+sD13TV6qA+8Upx2DRPtd3MU6cXFZhOpGc9pF5GXWy/wrRZkz/s9YhTjxO4sgZUar
	3f9ctnScsYeT8/4xOB6filY5J3ECYglvUK7Z9gX7wqllaGvtA33D4xbfUpXfZ9bAgLfQ97dSl/g
	9WG5/hlMghfbZxRrD3NXpoaQSpzwHKLSB9WKdqvZ4xMFLdGY4OHMiLsGvu7RJ40KCKTuuTWO6Ck
	lK2anxN4VUiYKigHqKJUBL/0Cz+fCyldvtdQTZpVNUfD5oAdtQ95hwmgRYsEXiL/qOhMdF8NBgG
	bXvmn9m+haP76V4qPXO9O6/ls/RHVtyynE5Wz594HU+KV+O0MmX3l3HPqBHQChLF6ZdGUPdmRZt
	CQ0HsVJP9hkcGEzbeb9sGTmb4dl+Pul1Y9wCeaUSiK+99Gm9EbvMFb6tHrk73xZrBJgAreiQl88
	cLtZXXvyl6xr7HDLiPZe8DV8nS2HrCpxsjH5BFMVFIE58kb9rWpK1gkZc4/X4FCeu/yx8Cf1toF
	S67/3JXnhXg/VluRIt9oWrN8p+hsBb96WlxsNH1+Vyd1MQtupa9vCxvTvLCWkX8lRzPlE4Y284m
X-Received: by 2002:a05:6000:1aca:b0:481:3db3:8eb with SMTP id ffacd0b85a97d-48159edffe0mr5610370f8f.1.1786639456881;
        Thu, 13 Aug 2026 09:44:16 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B911C00586200462B420123.dsl.pool.telekom.hu. [2001:4c4e:1b91:1c00:5862:46:2b42:123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b1d90sm603116f8f.22.2026.08.13.09.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:44:16 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Andy Yan <andyshrk@163.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/14] Support 10-bit YUV422 and 8/10-bit YUV420 color format on DW HDMI QP
Date: Thu, 13 Aug 2026 18:43:51 +0200
Message-ID: <20260813164356.9625-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_094418_876016_B63991C2 
X-CRM114-Status: GOOD (  12.20  )
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

Hi Cristian,

I tested this series on an RK3588 (Orange Pi 5 Plus) with a sink that
actually needs it: a Sony TV with a 256-byte HDMI 1.4 EDID -- max TMDS
clock 300 MHz, no HF-VSDB and no SCDC, and 4K above 30 Hz offered only
through the YCbCr 4:2:0 Video Data Block (VIC 96/97/101/102). Without
YUV420 output this display has had no 4K mode above 30 Hz on the
Rockchip HDMI path.

Base: drm-misc-next dc2f9f7fed1a ("drm/komeda: Set display/writeback
clone masks"), with the dw-dp v11 and usbdp v13 series applied, plus
three local patches: board DT changes enabling USB-C DP Alt Mode and
pinning the VP2 dclk to V0PLL (DisplayPort side only; HDMI ran on VP0
from the HDMI PHY PLL), and CLOCK_ALLOW_WRITE_DEBUGFS for unrelated
clock experiments. On top of that, the samsung-hdptx clock fixes v6
[1] as the runtime dependency noted in your cover letter, then this
series.

Results on the HDMI-A-1 connector:

- The connector now lists 3840x2160 at 60/59.94/50 and 4096x2160 at
  60/50 for the first time on this setup, and 3840x2160@60 shows a
  stable picture.

- The negotiated wire format matches expectations
  (/sys/kernel/debug/dri/0/state):

    output_format=YUV 4:2:0
    output_bpc=8
    tmds_char_rate=297000000

  and clk_summary agrees: clk_hdmiphy_pixel0 = dclk_vop0 = 297 MHz,
  just under the sink's 300 MHz ceiling.

- Cycling 60 -> 30 -> 60 -> 50 -> 60 re-synced cleanly every time,
  with no errors in the kernel log and the VOP interrupt rate at the
  expected per-frame values throughout (no underrun storms).

To be explicit about the scope, three things were not covered: 10-bit
output in either format (this sink's 300 MHz TMDS limit rules out
10-bit 4:2:0 at 4K, and my compositor cannot force an output format
to exercise 10-bit 4:2:2 -- I can retest with modetest from a console
if that would be useful), and the 4096-wide modes were only verified
in the mode list.

For the series as tested above:

Tested-by: Igor Paunovic <royalnet026@gmail.com>

[1] https://lore.kernel.org/all/20260811-hdptx-clk-fixes-v6-0-75bca0ee5753@collabora.com/

Thanks,
Igor

