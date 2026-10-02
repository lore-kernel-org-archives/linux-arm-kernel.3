Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5B4CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8FmFOHYSHqj+TvFJEfarN2rwBXQ1VT7J59Vq32Ksb0=; b=KJXHk0HisuYSWQ0Bvcabdo1xGC
	RKN8TPTYJ1fvveX3yma6PsSch7ZlYycGMWtGYPpTQS7qpib6FxppypUl9wRPglbQpAJlwEk+yBjrv
	APaFMED5gpdHwJAM9LhqoV68CppyIOo482rU74/Mey5SnrxBeD8TWGG+tzDhAjKRSaOjagEnNK6Tq
	EYd/wGEcSolwNBqj2qw12senYM5erlFX4/9qDJqGXFSqBkswFoFErkTySvryMfoaZvalPpC/jsNtF
	8DTm/lqcZxjY1Gq1eIvTOYVw/1/xHpAukQCpnw83FR5SJpSmIkYtPR2MzMoL3ND9PhSoqqIYBr5Ch
	IMsEMJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZNV-0000000B6yh-3krJ;
	Fri, 02 Oct 2026 09:16:29 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZNS-0000000B6xH-154k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:16:27 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b0f4efe31so883468f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932584; x=1791537384; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8FmFOHYSHqj+TvFJEfarN2rwBXQ1VT7J59Vq32Ksb0=;
        b=D9xk+y9fDdTl8AU5uv380sDEBKM2atoBwC+rkD2WwSDDe52bL/zV2M83epy0G92EiM
         Lmp/YTv5qYTxkLo9h93qfizBefLhOBC706viHu8g09U+qDc9DVHdNmBuJPKzhy92k12o
         w0DUuVpbFO7tGQLg0CMnEl/+hcuMfSIDDaoowFvWajHcWncMCjndr06ps1bM8LS+Z6td
         AyujW75aLvGU4IXLXxUjVxVuDWsu97DQ7E+8Noov/I30Tn22Y698H8cIG/evotWq+0Ji
         wudd5uM18ewYeIsJpO1cSDm+hMQxxTRJh68qZvMdtv2HO0QL5jmSJ1X8U2UaBsH1FOeM
         FBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932584; x=1791537384;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8FmFOHYSHqj+TvFJEfarN2rwBXQ1VT7J59Vq32Ksb0=;
        b=SP76uGAEIDJOv1D2EE+H4nIYiDdJLeAMd3zJhOq3UC3/bf0dN+oAManR+stgtyto0+
         II2CGtCYH/ESerOyJibVUhpQzz7RZ8/nZ1x3Vfz+T/JnI34N7JxFxoIKDprPN2wUg0Tp
         1GY6fjl7TyfkPlFTMHSSREh5mZ0L+9Sv3xmGRWx3NbDboOcTjaKXu+Gy7JNpmt0vrn38
         4FfmsHjYD+Axo8UXNV4mLaOadmWOSOQ4NLz+CNHUkvOCF0ZB8AnOHfB13f3ISdB8ALga
         kUQhw+wWYuTwk6GK3lS7L8CuLKAakkZu5MkYs7lz9FKyTIdXyCng0gEx/Mz2WxGrRAsd
         S4/g==
X-Forwarded-Encrypted: i=1; AKwUvBzlCWS8lwDqX9Jb0sOztYCxzq4/sq+YYS9pNSoM96SMdi/JNNVKcP6yOD0sqdgbZ+XdTpFWJ2umzvtKF8PGsi8C@lists.infradead.org
X-Gm-Message-State: AFq9FYK2qJ7oztUKLz94PglmrZscMLCg7erqR1pHLlWVBL5irghbxI5O
	8yqzCaD0ei5InBc5xzBeunIy6WX2cViyDLM6vmsbqL9doQtjZPeLEzHUCm/NNfkElM8=
X-Gm-Gg: AYBFou2R7jLXJNHWAWyfugHEmp3tYPp8a/fEJRqpIYQgHP2p//XAkpS2HAhs3RkBXxZ
	yVDfJyLuaoKqhVGGni8wnWLCcICsisUxhie7MbGAziN1O2UGeTy+uEAoPionjPkCTqGUUXe6TCJ
	SyXEC4rf/Gt0G7RUEak0gNsEJEUX7UispKe5j+6+q+rC65phD3DX8LrIU6I1cYoi0h6xE5vwGcY
	5d05THSx4T+5369lcZMc4dM91wsc1Yyl6p905U3z/P14/95Lvk9Lmm42Gv5RfSNXHxzQNMwxNLP
	xc3TAATB+aTzFQzgs0/qE7q7rVI29DuoNJAm0a1kEImBiauS3gBaDlNeg3XXJV7KuitJuJbJ5Ju
	x4sOEH034pnSFVA1lzpcfE0G4eKNGekhVMYIaUYCQCyB7Hg55IrYmqro1e6ZoDBc4I5yHFIrcUe
	3MR2nAYe67LGi/EeC+bk6TQMAi7Z+fTQqt8YytqORz5uiSq4IaW4XcLAASO93wedgkUkV98ejV+
	6KgTvOxulUSMrOKu+AU
X-Received: by 2002:a05:6000:4816:b0:488:79e5:cb2b with SMTP id ffacd0b85a97d-48b127297c5mr3802494f8f.43.1790932584104;
        Fri, 02 Oct 2026 02:16:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ad6sm4461292f8f.40.2026.10.02.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:16:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nickolay Goppen <setotau@mainlining.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
References: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
Subject: Re: [PATCH v5 0/3] Novatek NT51021 DSI panel IC driver
Message-Id: <179093258297.2282096.1579513931131957273.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:16:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021626_322864_C4EDBEC1 
X-CRM114-Status: UNSURE (   9.32  )
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

On Thu, 24 Sep 2026 18:08:13 +0300, Nickolay Goppen wrote:
> This series adds support for Novatek NT51021-based panels
> for upcoming xiaomi-clover submission.
> 
> Although according to datasheet, the IС has three power rails
> in the use case of xiaomi-clover, all of them are wired to one
> fixed regulator.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: panel: Add Novatek NT51021
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7d2dffd72625784945b8a467b6d47fbed6fe7d74
[2/3] drivers: gpu: drm: panel: Add BOE NT51021 driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/94e45e3ad539291bdddb3cbf8f1803d42786c70f
[3/3] MAINTAINERS: Add myself and Ryan Brue as maintainers of NT51021 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/27282474cd58e274bc866fb881643cf93a1c01c5

-- 
Neil


