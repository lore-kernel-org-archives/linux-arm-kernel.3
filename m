Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CDCC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 14:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVMGfeFZrB58Lk7o3G3a6wdkQDsZOBW4TUrkVV5ZwgQ=; b=lXoiN/ChfUooj3JjlmgKiPphpH
	YFJdZcLH4MxSFkWry5D9LtQ5kEA9tLpXONrEy9fwT8ZafJwCMpe2L8fCQa8R4wcqUS8L2dj1RV/9i
	xb2bkCcRpn9rVxd2zgsxhok7Z3q4F5PO2QuyqV1yk8VI1YAk3mIwbhhBTEQUT7lneiFSaW1i08FmF
	Oi6pXnH7MhW08AovZNZs7vDBRv+Gxl480vW/EBWaYIGNWUJJUES/FxfWb9kknrbyFU9Of3Y/9vSWi
	itYb+YAROIdeK4fORyPH3QsYuYbV8pzhhFLDxtkJxa2FKq7wnzmo4ExhacbWiSxa8L3oUd+isJmES
	HVLqawdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ELO-000000056yb-2wx9;
	Sun, 06 Sep 2026 14:59:42 +0000
Received: from email2.ecloud.global ([2a01:4f9:4b:5387::2] helo=mail2.ecloud.global)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ELM-000000056xt-0Hd4;
	Sun, 06 Sep 2026 14:59:41 +0000
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.ecloud.global (Postfix) with ESMTPSA id E594C72128A;
	Sun,  6 Sep 2026 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail2;
	t=1788706771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVMGfeFZrB58Lk7o3G3a6wdkQDsZOBW4TUrkVV5ZwgQ=;
	b=a0Splrg6zB00oeVpK4FriY8N+4GX17As20bPsA8Vx68XwCxzPSyZuXZgKfTgxovlJtlesN
	bxEs+wzrGffdT8Ih5QE30TKCExhKjyzbY4otFGSd4YbqpIKaQ+RA4/s7K6HAQBMS8FtR1X
	CSWgY5ki1wIZLfpJGmpXWo8D0uBPuhw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail2; t=1788706771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVMGfeFZrB58Lk7o3G3a6wdkQDsZOBW4TUrkVV5ZwgQ=;
	b=THJSY92/A/bjlj/pBTmUxyu7CCDs80zoyeYMIggATaIpL8vqJFlBrJhaPBJPGEI6RyIMtR
	NAU+Lsj5+v0YaaS4T+naMaa4I6xDz4kCMWURKf1LKkssivQ9G1gjaQ/S0TqUwpXElYkKGN
	iejrNvcdKwjMq5n3hnEPRs5vl0+GPmY=
ARC-Authentication-Results: i=1;
	mail2.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
ARC-Seal: i=1; s=mail2; d=murena.io; t=1788706771; a=rsa-sha256; cv=none;
	b=AyIWxjPgvVFrVvAxTXlq0c74VZgXwUKhdAsaAo7owEu5lfVisTLR+RN6ywUsHXhiMJkRFL
	dLC4XUaP3ekFGA1Jjk/HdAWNPCsR/hNMIYi7EFT4SXTQoHtELqbI3vmzjEzvEMPKBN16Z4
	TzdFhlnMtX3Oyh73K4IEa6RNY6VrHLU=
Message-ID: <cb0884b3-c9be-4cfd-ba43-27add3821ddd@murena.io>
Date: Sun, 6 Sep 2026 16:59:28 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 13/15] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Dominique Belhachemi <domibel@debian.org>
Cc: m.wilczynski@samsung.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, alex@ghiti.fr, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, andyshrk@163.com, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hal.feng@starfivetech.com, heiko@sntech.de, hello@big-grey.co.uk,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@esmil.dk,
 krzk+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, luca.ceresoli@bootlin.com,
 m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com,
 maudspierings@gocontroll.com, mfd@lists.linux.dev, mripard@kernel.org,
 mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 palmer@dabbelt.com, pjw@kernel.org, rfoss@kernel.org, robh@kernel.org,
 sboyd@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, uwu@icenowy.me,
 vkoul@kernel.org
References: <20260828-jh7110-clean-send-v2-13-331680c8b9d1@samsung.com>
 <0ccb4168-ff88-459c-972d-3c091c155db2@murena.io>
 <e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io>
 <CAAvaLCwvVUddS14MPx0FHdnp+QeZ99+ox17pXt2hSWPTCFcHtw@mail.gmail.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <CAAvaLCwvVUddS14MPx0FHdnp+QeZ99+ox17pXt2hSWPTCFcHtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_075940_308909_3E7F2A7A 
X-CRM114-Status: GOOD (  16.23  )
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

On 9/6/26 07:39, Dominique Belhachemi wrote:
> On Sun, Aug 30, 2026 at 10:17 AM Maud Spierings 
> <maud_spierings@murena.io <mailto:maud_spierings@murena.io>> wrote:
> 
>     I was still having some glitching happening on the display, but I've
>     found the way to fix that, the question is what is actually
>     happening here.
> 
>         0x29590020 <- 0x00000005
>     This one I have no idea, it is 0x00000009 with this patch series but
>     with the vendor kernel I get the value above. When I hook up my
>     external
>     display (regular 1440p) this becomes 0x0000000D on the vendor kernel.
> 
>     But I can't find this register being written to anywhere there?
> 
> 
> Maybe this needs to be swapped?
> 
> drivers/gpu/drm/bridge/inno-hdmi.c
>    -#define v_HSYNC_POLARITY(n)          ((n) << 3)
>    -#define v_VSYNC_POLARITY(n)          ((n) << 2)
>    +#define v_HSYNC_POLARITY(n)          ((n) << 2)
>    +#define v_VSYNC_POLARITY(n)          ((n) << 3)
> 

Those seem to only be relevant the 0x08 register:
 > #define HDMI_VIDEO_TIMING_CTL		0x08

also in the code:

 > /* Set detail external video timing polarity and interlace mode */
 > value = v_EXTERANL_VIDEO(1);
 > value |= mode->flags & DRM_MODE_FLAG_PHSYNC ?
 > 	 v_HSYNC_POLARITY(1) : v_HSYNC_POLARITY(0);
 > value |= mode->flags & DRM_MODE_FLAG_PVSYNC ?
 > 	 v_VSYNC_POLARITY(1) : v_VSYNC_POLARITY(0);
 > value |= mode->flags & DRM_MODE_FLAG_INTERLACE ?
 > 	 v_INETLACE(1) : v_INETLACE(0);
 > hdmi_writeb(hdmi, HDMI_VIDEO_TIMING_CTL, value);

