Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14F5CF3961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AOLChH/q7xFQ5th9G1DIz4KNOULF7t5D3A23AyCZ4w=; b=RTrj8GLSTAFMt+DjDXmYGuxLew
	YuNTUW+Vv4zWqy8S3CR+jXmnSTU8ZchfUdFLBJNbTIIpjWn7c7OTKpmHy8MYOfTASEk7sMNzog632
	+/Q+MXn/mQx7Ved3Lz9V+D2ETk1ZXQ/eCTnFX3SmD0oK+z07MhJezhBnLnACblLBKVFgfSVJ5rxlv
	qTQ+B7MVQepj5iTkxgQleBTNcCBAO4ER9m/RRtSSsvkoLTWhc01sqRvf4hKijJ9dca/hRWd5yGIeL
	IYI1SGSXdoSaiNH00qSGtbS02yWIEFV6NTnMidZ/IzgMA79ZLX2INtzWBUmxFMsBhECUQ1TtUY2HO
	swq67siA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlMs-00000003jbr-3QRg;
	Wed, 19 Nov 2025 16:49:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlMk-00000003jZ2-4AKw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:49:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso33601815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763570949; x=1764175749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AOLChH/q7xFQ5th9G1DIz4KNOULF7t5D3A23AyCZ4w=;
        b=Unw392MNPOIXz8SZrCWTvnPbKCAx8HCOoL8pA4kieG3xNmsCLtvr4/9/kNAC+HaFBd
         ZcRg1OOwAovr5fheIOKBBEbWHXr3A0NiQfSJ2+J9PDxfWMQ5WisWiZzJRgSjIjWwVf/Z
         UmINQiQd8fyogBmrGYATnYLIFtRCPRubcx5b08vGHZ/TNaIYA+8de6ueyocfL6tN82DG
         TdBL1+VScX34W/9asbNn91x/F7GcJHNA2I3bkBa84sP+d26L4zMVjpavvcETV/ycMOuE
         vU+LJbDCs5smr4v0UY6c42D/Dib7+A46cj+N2cL5rEZqktwhgPxze7ET8f4S+i64IPSa
         VXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763570949; x=1764175749;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6AOLChH/q7xFQ5th9G1DIz4KNOULF7t5D3A23AyCZ4w=;
        b=P1Ucslzboq0+phnrqJ2sFljK/zQrCxXdQHXvidF7gUsQigzReY1VUtcP536olruaX2
         lJfesXZEBhoGkCLSPbzWeV6IIIWy5asSLGUiAgE3fknpRaEuA2KD6vOzJVzbEGpr0zO4
         pO/eKkwrMnErK5evS2e3TLjmG3kUcxUyp4ESBegkgnCCrF843ByFCiTz/JFDqut9q2hY
         OuRTw9WKiiDl5lz4071tWn5KMAmasRR0bCYStyNGP9sQDSJPbm2dw+VPbTv7JdmjbBX+
         OOh4x/F6PggUsLiyc3ANc5l2i9hu98d87VaxuKgBSD/c57evIwsAu5fbqhm70Wpu0fxt
         lVxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF2CaHIz2uiYtkREvbsFd4Zow7Vum3u1QK+PlHoGCaQKJn+/04KlqhN+0O7KhWy5LZ5P3LlxTAJJJfcpKGq45F@lists.infradead.org
X-Gm-Message-State: AOJu0YzRztLjDd34N84mu/9FqIdSTPcI5hyB22K+emEB3O4/0qhnvAf9
	smQtsEnFJZYB33VlGPw8l6DAzR2zpUtitVUAwF+B1Iwi7HV1H4GLKAqnWC51h5PRodY=
X-Gm-Gg: ASbGncu2jH3gCJwoYGr73yEFGUZLDDaXLn7eh/7UR76lYcQHMkuxgtLYXxEN1YE03Sq
	gL5mt4ewYxHaAzDA3ncaIUqobK1ZCm4nfuv9etBLjFI9ZgfrxvIqTT7R8bkNInfL5FRPk45abto
	FWkoLsCBXO9nm3hr7Ks3X0WCx7PnK/A0uaNLy95+jFy73Hkx8rERhOdw/MqfXVHwav/hFfQgZjr
	k9Y6zexaACg0oqYWcWHjC0hqhyPEyn+mdXiVpg39YObyM5zPbK2JYRKaZj6w/IMeqbh3JGw+LzP
	S3ZSQHj76wbPb0OFPzDytoD5m1AUl5WCtVfGcnnJ7/8sxCsy7mcjmzOjDIaFM8tCc9i+20hr/gw
	MzEDFt4iJR3X0vwMzwq6H9pKHTeEPDrhO4wEPUrYiApmVSG6NdejB+7Ywptjo1UZeq67xlmrHuE
	17gF5vqbMZYEqpGJxKG4F20swcUhxgGGy8iSx1uMRLog==
X-Google-Smtp-Source: AGHT+IEQBWB0Eg1zUiaC+C6Q6xYJagNpfFV4B79UXSjGVI8G4Xbkzgsvf6WhQGX2JHCRNzTrOV+mmw==
X-Received: by 2002:a05:6000:1ace:b0:429:d33e:def1 with SMTP id ffacd0b85a97d-42b59378443mr21197697f8f.29.1763570949083;
        Wed, 19 Nov 2025 08:49:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm117957f8f.21.2025.11.19.08.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:49:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
Subject: Re: (subset) [PATCH 0/9] drm/rockchip: Introduce Rockchip RK3506
 VOP
Message-Id: <176357094817.280640.17849339974679922280.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 17:49:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_084911_069450_2C565CBF 
X-CRM114-Status: UNSURE (   9.29  )
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

Hi,

On Thu, 06 Nov 2025 10:06:23 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The VOP on rk3506:
> - Support 2 lane MIPI DSI interface, 1.5Gbps/lane.
> - Support RGB interface.
> - Max output resolution is 1280x1280@60fps.
> - WIN1 layer support RGB888/ARGB8888/RGB565.
> - Support Gamma LUT.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/9] dt-bindings: ili9881c: Add compatible string for Wanchanglong w552946aaa
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/15e794bcbc9527736d33c96412ce077bd817d9af
[5/9] drm/panel: ilitek-ili9881d: Add support for Wanchanglong W552946AAA panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/89b34ebed02ee39ae02069dcf2e5728aceec9deb

-- 
Neil


