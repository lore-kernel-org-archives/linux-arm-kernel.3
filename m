Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65157CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFPDhYu4aFFhwsNO2KIFrINwTJBQ61Ce1m0mUZPP1Mc=; b=K0eB3yWpH70f569ijiOcmqUGUo
	g+rMwYc3FtYzc/jZqNNQr/KV1GACXLU1fVHwkHTtZQG065lrMNZYEOoutTbTTC0OR0qVXm8EOrUg/
	lNEFaby4sMSAkfuVuYvPujrUm6kxPHNzoXOqCe9NaU/4PtPSbni6z9QWdWdKlOnhshHvku5epgDJs
	wuEuduG12zPTSnoUV/R9+KcWxKwtRKN1JSQxJ1BcYaoYKgTQTPFPLSmww8flw+zIFBU1wMBNYRGuy
	ttHFa3mMFkdS5VrVfeSwcZXyPOoWUaZv+VJSFrqNsqIBOpIgprbyi+0Csuplcg2ij3s3qvrAF9t3x
	TjmNyiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3r1Q-00000006sfq-3zeZ;
	Wed, 01 Oct 2025 07:13:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3r1O-00000006sfY-3JeP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 07:13:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-46e3ea0445fso28993945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759302785; x=1759907585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFPDhYu4aFFhwsNO2KIFrINwTJBQ61Ce1m0mUZPP1Mc=;
        b=jRlm3PCijvt69ocWEypPtbHJXsL4UeEwpnA2zSIY5oGwsxJW4u0dSiSTfErUcYpTzi
         9tVvUO22ZDPcaDxBw49afdNnQV9nsgj60jA1TrhUONibAlTdd8+T9T53bglAQ04+4LQX
         wCVfCfDUHdPaXq72oGLfkdLE/Buvv69KF1XBdSDN/PiTx7vYVTbub/sLhR7OtWnm/WQd
         QjEQA1NKMkl+ZxNaUnrVtjpBTVRn+ynuys24WqjFEvMWug9sESf2WtiIlXw8/4dtloFI
         Enb9nCTbv3jg1kjbpQE3MSG9I4bgUx+TSoAGKa8RMXs0KANmULuufQw+CRC/56TTBC+e
         cdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302785; x=1759907585;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFPDhYu4aFFhwsNO2KIFrINwTJBQ61Ce1m0mUZPP1Mc=;
        b=ALXIDH4cAnDmBjuXpvEq1SlxNDj3eo10gtBUY3QJg1EdCevP/0CO2+rhoxE6ATGAdZ
         dSqs6JRu+WQozc4ZNmcfvfGhLnnWC9Taa8Gwqen0E04oYsBFPTk7exYNe0Gr/BXn6ZIf
         Q4SNes2VaZY3F0eAlGJ4i+sXedSDo1mWVo5r+NqyC9CDu4sl6WgLdvovGdCS9wAIvOW7
         +U1n3TaczvKUsvlsC9J/svAD0D2LC3tH+xMTQxwmGDr2x+BzXW0oVhJ02muXB96UHkZI
         sxKxqhnrKHNRxoWrDNHpnk8I9lrhiG68SD6kyxLb/mfI06IhYu0FqyglUMYfJHNi6Njb
         NdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeK2sBuo8AbPnPXYsvhRyH8yz1k5Kp7VDmAiLoLds2rZMG4x0i4AcUdK7jSERee1ZR93G939LKiy7FsCwaOHQa@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4NO178k30skAkS5OR/HntP8jFRnMpCT/hYhSspufoPPJRU8M
	m3LkGihFgpEri+tD92Pm0sAQqp4sjuj3p0riwGC3MFUEfuZgRC3iTXO3cgI6ECPtu5s=
X-Gm-Gg: ASbGncvankJC7iSKTtJwnMoyxZieF1NLBmUEr4MvtDqL7XKcgJvVaWDz8st3BHKxJtq
	RuJCoTd9gezIRz6J+wuIGJzNXhuby0s8KqHbeF9XJZKko82bZDbYVACSZLClFOPAgDu4YlVEKZF
	bDmFXp0hn3/ED0f2lwDu8vtD2n/UyH/UcVCxVorlDqNNJDnhcVu/La7HbpDnW9qeaRjKS8S5rjE
	he8ptULE5K8WhPrXd6l3GFiyhGNhAXqdl5iG85KeD+SJgaENk4VS0VWjbCoTmltZUW2509gE+CO
	ejChhoe2+mkoTPlxWz2/hT5BoF8dzGGqbTLGzzZWVxUWfzuA4hwSPU759MjY9pyT8bwwFFTOca3
	aHpksVFExiOZCcyoHkfX/VGXQXUai1aAPcxu/IN04B3mmzqli75LUbFWN5RbgDREff4c=
X-Google-Smtp-Source: AGHT+IEJybYivB1tDKi+V+W73mq1doiRwwO2NMKjXDaYOQiM4qmPaqdgd0jKteaSLsSgV9Peoc95Ww==
X-Received: by 2002:a05:600c:c162:b0:46e:37a4:d003 with SMTP id 5b1f17b1804b1-46e61202096mr20188025e9.8.1759302784682;
        Wed, 01 Oct 2025 00:13:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b36f9sm25077355e9.19.2025.10.01.00.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 00:13:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
Subject: Re: (subset) [PATCH 0/5] arm64: dts: imx8mp-skov: add new 10"
 variant
Message-Id: <175930278378.421667.15230947171150357707.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:13:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_001306_856495_8D6899AD 
X-CRM114-Status: UNSURE (   9.01  )
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

On Thu, 21 Aug 2025 09:55:27 +0200, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 10" panel than the existing ones.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: vendor-prefixes: Add JuTouch Technology Co, Ltd
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e3579cd78ed9945606d281be16708037eaa12c49
[2/5] dt-bindings: display: simple: Add JuTouch JT101TM023 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/510aeefc7c362c1dca57d0d3892fca07d4455141
[3/5] drm/panel: simple: add JuTouch JT101TM023
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/73bd4835f84b5f78d65f37bc97c764cb90501299

-- 
Neil


