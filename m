Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DFDC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPC3C1McKSdKHPGsEz7T2BULfXGeP3APrf619T65g/o=; b=a+IstWuJnxBpZEOW0Dr9YQ5Ijq
	it4BWtksEkk0rLoyNmLVRJJVWvmsRWuYgp9/J1Bw/d5qhXnJq3N1xpKJrlPP3qFfiBJBU0aFVC9EG
	ZEC8/d1OdE2sNINxCdznw6ZdfLK0V16F+BSq9FnKMhSEKaXTyCetGBw0qJ+xOaNedr8+oCPok0P3X
	UR1QxpiPagTvBOSiobgp4MVNllv2qbMGyQ1rHRPynReYRQ6BIBLvMHZ4rKISR77j4dRE57NrHjDjg
	/Xc4nbHlEXe7zzuY+o/02kqU4Lo5UVXXSkIRl4mpfibXQwOrIwpUqhSS+uHFsBUPt2mbwuQ5qfGyE
	efth2Ojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmb1t-0000000CVBs-0vnN;
	Wed, 22 Jul 2026 17:46:49 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmb1q-0000000CVB4-3TBk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:46:47 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2caced6038eso86994205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784742406; x=1785347206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CPC3C1McKSdKHPGsEz7T2BULfXGeP3APrf619T65g/o=;
        b=VpHpr263V8+82GJJ1csTO0kapJLPNIjQRTKp8eiSDRQ0Na/aVVvurzvdqXUSbAfiRc
         8jr5TsTQKGCY75ayiJnQcX3rerr7WF/DysItdq4fsdVZXLAPvWPJ+Y4WGp5MeQpEfR52
         l3KFXrf6RMZQID1uBI/CuQMi3Wa60VhxDeHKAoJMeuZ8S5mgVxD6Lvgo7wxhY9ByOJPA
         2hPboIap7SoG6ic5yS6bTFrWcIhK4qNWYr57TD77N++XsEZnJu7RtdsB0DBWV78y3hlG
         jaDA+F5Wg4hSk1XZ6J4QHRh65ybsgCqgdOKquogSmxEtg2ENllk8lng4JJVnVG24D7cC
         eIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784742406; x=1785347206;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPC3C1McKSdKHPGsEz7T2BULfXGeP3APrf619T65g/o=;
        b=DudBNrGKMGf9vVFDgq0cz+sU1+cn1PZcTOw9xvbd8jIUn8E0Rwzc8/MKTQV7lEjS0J
         EdnvkYomXmJZSst55oxMKVN7/SKQYHgU966i1jWJ3Xylbk3omgq8FufQtO5McWHzU//Q
         ZB4gICo1U9RIN5MdNnWrJoOjjigIX28durvS1DgItprp65jmgTSX+LOzdivOK0CsZ5Pv
         6vqxVs5+jAhuYR+OYYxaOzQ6E2LxMyx8t2Px3DNCv4g/yIHve2sih2GgbCnkyiOlxq0T
         p7Mrl772S5PQOY26oz8GMUyEQKJpCUpBagD6lObj3r/HUzVQZYMuDAYZonsLDSKbEu/2
         Ut5g==
X-Forwarded-Encrypted: i=1; AHgh+Rp2NyT2GSm6SogbH7Xo5+CGLWg59zff4A1Y+57cbhkurPLL+LmUib7C0rW3Kar6Dzao9ZQMGuYFWbipkTe+Scv4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+QvWvu46sVg+oV27UfMDo8/hvGSNIPtF4r2MPPrLzGZZx7Ygc
	hgfb6Aekm//k92BNS2kPNuNihC3dfw/IhgvV/WdyR243xoTdCgwbtAO+
X-Gm-Gg: AR+sD10hd8y6rufWh2cPbA8LhjUqOl+j3N9ecZDOmzrhoLlqM8iCL6bqhHNyAA3lsoS
	reOQfu8f4xbm8SBMqk8Lc8FoI249Qvg1eBc7JZ1EhjNGMXah0RV3aRdhXVhjj/CEjiSLc6ojENO
	4IshXkTUzyKTeMhbrmfMM0QUHDDaVwFm2ODoh5roA6d+38geDMvUjRS/C0sYqwMYuThPYt6M0bh
	47WUIY3rw4CqB4bPEdC9MkP1rlUESdt1LAWLDug8MjVVhssZna1y2ErveVHqeJllybn9ssWEs8E
	WLSwcS+u7ArPM0NIqjBkUzU+P45Ze4/T8C/F9TfzTZJRWBIlX+1ERkjen1OSu4UND31xh6oouOu
	DKr79D22t9Qz91AizkVeyn6Nt7N6eSM+xJt8ATXjfcsr3KzrRvL1oPtHRl4KdbX3w8fsU4BcK4d
	cGZtBO7fL2o9Yc+apEKNqm+/VMz3oGXQx1Rg==
X-Received: by 2002:a17:902:f68f:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2cf8dc9920emr53255485ad.9.1784742406067;
        Wed, 22 Jul 2026 10:46:46 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f386c68sm18445405ad.74.2026.07.22.10.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:46:45 -0700 (PDT)
Date: Thu, 23 Jul 2026 02:46:42 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: reset: Add MT6589 toprgu reset IDs
Message-ID: <amEBgRmQktZ44jc1@buffalo-ssd>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
 <20260717151134.678839-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717151134.678839-2-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_104646_875836_474F2902 
X-CRM114-Status: GOOD (  16.38  )
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

On Fri, Jul 17, 2026 at 05:11:08PM +0200, Luca Leonardo Scorcia wrote:
> Add reset constants for the 12 MT6589 toprgu resets.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../reset/mediatek,mt6589-resets.h            | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
> 
> diff --git a/include/dt-bindings/reset/mediatek,mt6589-resets.h b/include/dt-bindings/reset/mediatek,mt6589-resets.h
> new file mode 100644
> index 000000000000..ee08c39df513
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt6589-resets.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT6589
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT6589
> +
> +/* TOPRGU resets */
> +#define MT6589_TOPRGU_INFRA_SW_RST		0
> +#define MT6589_TOPRGU_MM_SW_RST			1
> +#define MT6589_TOPRGU_MFG_SW_RST		2
> +#define MT6589_TOPRGU_VENC_SW_RST		3
> +#define MT6589_TOPRGU_VDEC_SW_RST		4
> +#define MT6589_TOPRGU_IMG_SW_RST		5
> +#define MT6589_TOPRGU_DDRPHY_SW_RST		6
> +#define MT6589_TOPRGU_MD_SW_RST			7
> +#define MT6589_TOPRGU_INFRA_AO_SW_RST		8
> +#define MT6589_TOPRGU_MD_LITE_SW_RST		9
> +#define MT6589_TOPRGU_APMIXED_SW_RST		10
> +#define MT6589_TOPRGU_PWRAP_SPI_CTL_RST		11
> +#define MT6589_TOPRGU_SW_RST_NUM		12
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT6589 */
> -- 
> 2.43.0
> 
> 

Correctly compatible with MT6589.

Acked-by: Akari Tsuyukusa <akkun11.open@gmail.com>

