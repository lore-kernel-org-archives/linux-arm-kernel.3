Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD796C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GO+8glDRZ70FolfJHUuyOyuSWWMeXZ0930x4j7bHw1E=; b=Xmm3RgFgjTduAVa4A3axdnawVp
	q0fimR7z8M0hYDIpiAyWkPSb8rUL0BYMCzB1XCm5D7S0vzfHCEl4liRfwmt2P3jnnn39LtfhWEkVV
	sOc6iBGe0B5kRGxtrTodI1Tl3jDXsnmLsOdwd9/FRtztkyM6420FTAgVYKyhjJIshWICSgWWMn0Oy
	0ZGOBMxvhlUkQ6KbgfbEKVZXxCj//5CXBIjBU4dcNcB0IH5tdiIkd1U7AkTjYzpgMhh2XvCr4KlgO
	mrj7UVu9pRanepFvb2PjDPZDtnkA/cfHcNRWUUqDfeQao0+8XBJ50yZFaAG180zuhD3bkGT56Emz/
	YPaQBnIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtcN-0000000H7rz-12UX;
	Tue, 25 Feb 2025 12:00:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms8C-0000000GomP-3KcV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:25:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so51243085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740479139; x=1741083939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GO+8glDRZ70FolfJHUuyOyuSWWMeXZ0930x4j7bHw1E=;
        b=qbCE3biO971YyN2r98XjEfvkh9Tu15jzt2lkp9q3o0nKNaVR/GoNvg2t99LlTUdmcO
         upmyifJ3HuuDk8wHYsOc8xSzZQwSvxqT9TGfiiMBXZyNtZsHDXHDEY+HYuNOgWmZ3ox9
         Qczah6owMUdqmFjHE5hAq+ISH4u4zy/a7DmgQ8GXrmYcFIG1udRLeTU3mrbSKxZ1q42M
         lpdJx5o5Wy9UlDKGSkaml7h0SuGCCeiZBEAmoYUrqEjv9QbIyq6RVkMTxdT7onQ4Iouj
         s1w+ZnFJmmvg5d/2646ef5yhpi8MoDYwAdeOfLr94WkuRO3JCk8Zis/mNWWRv7S7F/Fg
         /I1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479139; x=1741083939;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GO+8glDRZ70FolfJHUuyOyuSWWMeXZ0930x4j7bHw1E=;
        b=wG6PGDf8ClrSByDNWzgM4gaMXO+hbuE86CFvKCgH5xLcvfadBV8Q7Anvp4RMN5e5q2
         9MZdVvsZpu3rhWHbXXSc9l9jnVWfCdctzCh95nBTiOFklBj05zfEMREnHVH/BLKlV1on
         VBlvlhOEUbAxnfxpY6JfxGvWkp8Vw83Lny8FW3XLaRT+75OyLSTWSOTAPM2//E+arJxT
         h6K/1Z1TumRGGjbFyhNDkcR41Ry/1B9wW76QJqiDUPYhQMOnnWYCPr3PyjwGXq7cF+dd
         XmoaNdlENagyoqiFXKzyr7IF4+xxHX0he0+MhOi6P6XDxC0HgQoL57uCfXahqMxNOdul
         443g==
X-Gm-Message-State: AOJu0Yz/b0d12+nwIXA2u8WbtSZn0/+5Uc/K3nEE0LnVdeUyzrHBlc2P
	IjMvu7XceT6P6pTUtSC6rTm5J68mqJ4DOoOcylmjziXjhEpRqSuNqEsvD5N2Q4o=
X-Gm-Gg: ASbGnctP1/TfIMWb/oS8P2p50xNDwncCjb3KkOfhdZBWhjdLwueY51WSeG9FlGhdb5B
	1taZqZ6gABqv5AKSp+DzYVUr/yMdjHvh4fJ/E8Gagq+1C14x39YZz2Sg8AvC9ltizvGuRpdMxDF
	pPK+bXU+UPJDacMTLZx3i5xWwoNWwWDrMo7qpRh2bPoboXcseBJ+B51GT008DjsiqrgHnFObBhs
	mWnz7/6Lt+Jiy0gTqOAcdo5eFwno6TAKTJCtNdvfzfrQKtYptfsi0D9Rj7HBizGOhkq3eJyWmyp
	A2zlyLdYXiIwLeDKLelRxXA6aluzmiqMc1Z8/s2jEnnzYDY=
X-Google-Smtp-Source: AGHT+IGCJja0+bBP6yFXu5tgG751wKC5th2J7f0lmxV62+z2DFSuW2JXXrH5OxE79sHt4myCc7POkw==
X-Received: by 2002:a05:6000:1a86:b0:38a:8906:6b66 with SMTP id ffacd0b85a97d-38f708267ffmr17605833f8f.38.1740479139095;
        Tue, 25 Feb 2025 02:25:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86707asm1764378f8f.5.2025.02.25.02.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:25:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display
 controller.
Message-Id: <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
Date: Tue, 25 Feb 2025 11:25:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022540_841369_5D087976 
X-CRM114-Status: GOOD (  10.73  )
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

On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[3/5] drm: panel: Add a panel driver for the Summit display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4

-- 
Neil


