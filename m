Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C4F106F309
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/Ix3s+Tgcoiyysg+QDxh6RK5P6qQb9s+C3grnl5iwo=; b=UKOB22j0t0i78Wcv2RMP0n3Fp7
	+LrYODNe4omxDUgnsNqxkc699I/pw6FBdWwF7XqfldN2vI6oVxy7Ha2u2FY6XAtl0uAj2Kv10l0Zk
	1Vewi5HCTypQPBNugIVE0FYHGL97LWmhPnH7sKWOXtodVMmlMabSAFi8Vo9DP8+p79YKjYxmoe9eb
	y0MS47GG6JYl6b4TngB1KE6nLCoMSBFDij8l/1OjoJp0YCu7vylt/+5q1mwQDZQLO5gfhRSd0qNbW
	RIfhdP1k8K+vaMK4MDo3/LlqElsex0AGs2C68WeKsjk8M6M1JJT3mGCM/svG6wTnEFI/K4RfhWBaU
	uXIIsHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gbu-000000055oP-2cDU;
	Thu, 26 Mar 2026 09:02:38 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gbs-000000055nJ-48Xy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:02:38 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso399932f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515755; x=1775120555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/Ix3s+Tgcoiyysg+QDxh6RK5P6qQb9s+C3grnl5iwo=;
        b=vJyHZRmnPcvlMOA68M1XVgT9c4T0LTvqtyZ+BGU7N6AtXQBuHLZhECIjtdJDatGEeI
         I0FXiC+vwIS+Qz2X+9quuwYnOMbjBLDJhUJUukzki3Wm/bFHiMkpjjbxuKgvvRPlQWCc
         5of76mKvl1tuk0ozdIJwHtpajywmzTRxoe05gIXc7XPjxl0JfiV71HoGad3m4wP7LaBz
         5wqEK5bspksGPsrDPjYo8oFjDsyluxoZpXP9cxqgmzHR4eB4T9+QGiP7zFyi1XlTztTz
         eV/R5fD8KgwPu2+LEUurCfG7Crr9UMLrbTbDOz6ge6nMp4suxTRRgFhnenRXnYo4w3rz
         6/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515755; x=1775120555;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/Ix3s+Tgcoiyysg+QDxh6RK5P6qQb9s+C3grnl5iwo=;
        b=MH6gw4Q4P0P3UfZdvEVIOpccShX6JGjzQCpILj2GBDFm5SarwlrR15BfOTqyToH5My
         lqScptrRQ8o1ztOJwsrdW99hcuoJ3Rf9Low69JEqZxi0MjPR4VN/eZI9dT0fZPjITfrG
         f9Tumch8nFxa2iEbIklROF8zNrQF4SfxwCMt8YhKtXMfrBj35sOYjNnWqKekAG14KzWR
         6tHQ9D3Odjh1pvk3/NqvdrLlAI1/Z5PQpEoXncIt8yp5vbJdosI3kk7r2bwjNs/5hz4w
         kQlsxHFRM0gccdPWR1kmRCq7zpsh/LEFsrwE3Q+0XyAgPrhcqOtqK2WnmAtnakUG5ksJ
         im2g==
X-Forwarded-Encrypted: i=1; AJvYcCWsiK5EQapKOycqdqbPBZMiawgWwIt3Vx1yw7Wcey/VNjd62KPjvh981yNS8alAD/feUcA6fwaqgXr3PMAPyMcy@lists.infradead.org
X-Gm-Message-State: AOJu0Yznj+XQidP3M+/B1OQxSHQHulj7ZuQqnctvgYnqSkJtwtKzAvPZ
	FxXwytXUYrlqUjvBN/IfE2JLpX+lAxORgS605POi7yXrpYHE0fnVgLkmCCs1HPq1K08=
X-Gm-Gg: ATEYQzzDlCTcOvgn9joP1FPSllmKTWI33708LqBalc7fQMKDkpNBH2r+d1W6LP25hQg
	DGiEWAsMcNrbqur9hR+GJYqKW8L0ZhN1redbBAy5wm2RBvUButaJ4hUDhDyp4wP1/xFnCYsFFZ/
	cpz6zj+G3KH7hykwWCUzB3EnG8KUjjA6TtbYotsoIlImZTIuwjt4P4xlxZiP0Ws2B9PzQbRDelR
	ZxvKFFzM1vP32BYNSNe94vz0fMu94QiEX6O0bOkUKOSxQ5IGkhltS5zkxWSN2ZmcDxCd/ITT5cc
	ud9n59vqRkL+eegPP7mw9LJHfw+gxDVB55WE4V5Av9mf9IDucrtXuloOY34SIrxgetanhtEsaf1
	FWzxnHgivQrPcStMRvNEl+U86aRAW4DZYadDcOyEfq8WSw2PIQ+7Sd8FPHu2tiu3U9/Sn5hr78e
	C/ulgnhYRtCIB9YQd3Hoqy9i+5AFdFzwQYQNgu+Yly8j/g
X-Received: by 2002:a05:6000:18a5:b0:43b:5095:d101 with SMTP id ffacd0b85a97d-43b889f58d5mr10149259f8f.27.1774515754445;
        Thu, 26 Mar 2026 02:02:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
Subject: Re: (subset) [PATCH 0/4] arm64: dts: imx8mp-skov: add new 7"
 variant
Message-Id: <177451575363.103892.5315410631400617574.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_020237_031477_1EBBC139 
X-CRM114-Status: UNSURE (   8.21  )
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

On Wed, 25 Mar 2026 12:31:58 +0100, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 7" panel than the existing ones.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: simple: Add JuTouch JT070TM041 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/87535f27061f3443e813a64f59fb1b0fcb916e08
[2/4] drm/panel: simple: add JuTouch JT070TM041
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7a5b966952c0232d7083a496261880fc11cc8c4a

-- 
Neil


