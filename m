Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663ACC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFoF7QyNRZ9r7+RHzos7assjg+PgG+3CLatxaRnVuRs=; b=A1gWiO+n1s9+Qmgn8TPeGiV7gT
	SMEeTM5aoTjS4UFWUVv6BC52aYUDal9Gf4QiNv/+R9fHPMEsD2jWRDPq90dhQxS9r1N+Mq5SNsgxn
	t/9sIz/Tfmgd8p1cMmuDX2IgB337IzUok+jQaoYCQQ71swA7Syt2tOU4VzNQXvo+5M64kwa0JQiuj
	rSJ9Ppxvr9Q9obw5MKNUdiWZgctSsXBRGFRTlJ2wxO/YQT6fOVeKInTtTOJ5Maa2Qb01sTvyapXtZ
	IPgcwiV5InOeaiOq0QMNkYVmWrD/ISTWqQNLDBto5JEcAb2lRlsjlIosoSbWXq/TZTMckrr1FS5so
	2a0sSlcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtao-0000000H7ZA-2Msm;
	Tue, 25 Feb 2025 11:59:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms8B-0000000GomF-3bFa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:25:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f286b5281so2665273f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740479138; x=1741083938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFoF7QyNRZ9r7+RHzos7assjg+PgG+3CLatxaRnVuRs=;
        b=wzUkvwIKIoq+TZr80gd24OPK8z/oKWX+h+OW2g0A4okrChw/q7d+bUcpVom9lDnZXW
         m4qqBJxarl/bkd9Na5Utb25CNdBk/rQyABe33+tlLHZsuuGKlrKpUfOqTuE9ZicUX6/g
         n1tp392aAayxu/55MHcrDIEIqnkUl5AXEqMGMm8+V07kBD+9QnXU+0RMWcjWNkb2z/NG
         t/6xwdfnV+MNkUChYtmBo3ZCACIdpwjannX2LBZrZReYkj20AwyYN7A6Feb9bbJ8Ocv+
         18BGkC8QIspsc7bE+jNsuCkopv7m7UUul11diKXFe+A5xjIPheG6mg/X7HY4yla9v6lS
         xzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479138; x=1741083938;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFoF7QyNRZ9r7+RHzos7assjg+PgG+3CLatxaRnVuRs=;
        b=oiDKbh+TJmYPw1bNU0wXBA5p0q9+syToX2YhzIWd97kzC/3kYHdjH3GIl9sqZl1As4
         WrQUdaWcb7QbaRjP3cROkGiWifIgGlvTg3hT4rNaUasAFTXC4EYbzy2kB2X/rcrhEoqG
         pt2xA/bSNwMZGnuN4VZMWRAcraIEMREeLO8bcdcETsoaiVGcLFKs0snf1WBTCxXxRFt5
         AgST+IfzSBs1dkDF0ZfNB9apn5AUR4PjJVEOKXTZh33uReOtx/Bxkol9hEGhgnb8GDX8
         zoiCgF3xvp0ERqRN2iQpU+fq75U/7TKNEIsOxHSXPFle5kbEz2nuQKaY4IhD82+J8Zzk
         4RBw==
X-Forwarded-Encrypted: i=1; AJvYcCWK8jp0J5ckVMtUCzozbJAAP3b1LEzPUJ7gKJO2ZX8t1BfWIdQ3lWXG7NHCNh8Astk0k3tNm+MdMiwp5Rs4o9Rp@lists.infradead.org
X-Gm-Message-State: AOJu0YzEWMQdPno7PMAZLmVLZjLxeTE3iWjmTeE3BycPTKvNXOezcUxI
	Qf0hVvAkPWgjLPIGJy7J0HG5ykgA/NRbsKDadkRRt5AcEw/WPX0EvG8NDlHYO4g=
X-Gm-Gg: ASbGncsiLy2z8YAT51Zr9GDp98oQRhi954gyc/H5Vwf5/e4U13JbcuFnz9bg6K/SDfK
	BQSV/kidQhXnAx3V2HlbNaarkJuGOh7u6khztEZr3aT751UrNXg54CPM39Ym49Jm2dxasUImqPh
	8IKGvG7yZCxOOFweMOj6RBtG96EwtXBDFoO0azJUEj6xZBdXhUHOp1dtjzRV+zEW1AO5lXK8IfE
	rJc79UtO0Ldq/ZYfIODWyk3vnkTeLjoTlICPx9ymNe0aJTzhD/tNUlkIloV+fHHlA4gCbG98F9F
	SQ/RyCbXSSjAOJwuD1etfX45UlkJO3GrJTyfQE7n+sIundM=
X-Google-Smtp-Source: AGHT+IF0UNTzcIoMzLzKcwrilDWc3geeDLz1AHdSa0/z4fJP99oSE9XrnUuGZC+x8acSBmNx8F633Q==
X-Received: by 2002:a5d:6dae:0:b0:38f:4b2c:2464 with SMTP id ffacd0b85a97d-38f708626c6mr12904963f8f.55.1740479138118;
        Tue, 25 Feb 2025 02:25:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86707asm1764378f8f.5.2025.02.25.02.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:25:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maud Spierings <maudspierings@gocontroll.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
Subject: Re: (subset) [PATCH 00/14] arm64: dts: freescale: Add support for
 the GOcontroll Moduline Display
Message-Id: <174047913731.2131221.16812340325511859962.b4-ty@linaro.org>
Date: Tue, 25 Feb 2025 11:25:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022539_902773_7DA69DF1 
X-CRM114-Status: UNSURE (   9.25  )
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

On Mon, 24 Feb 2025 14:50:50 +0100, Maud Spierings wrote:
> Add inital support for 2 variants of the Moduline Display controller.
> This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
> features an imx8mp SoC.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[01/14] dt-bindings: display: simple: add BOE AV101HDT-A10 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/761992a4b4deacb519f4a6089936b7fd22b4aa0a
[02/14] dt-bindings: display: simple: Add BOE AV123Z7M-N17 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1a4d1d9f068506f4f334c03514d2e93e21830f19
[07/14] drm/panel: simple: add BOE AV101HDT-A10 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b554c009da1c3c6cb8c4b5da2ac2f37fb527e927
[08/14] drm/panel: simple: Add BOE AV123Z7M-N17 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d34bd3c7cb84425dd6146a8d07af597b93ad4c4d

-- 
Neil


