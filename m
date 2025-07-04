Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7711C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 01:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DC/cBZO4f5h7yIL6Ec05XXIZpY7LlAOQumaUsmGIiWc=; b=em35QkA0J5YNvg8IM+WoDuDmdA
	Wn0XGxfVC9NRkktLD3nnRoYtQSMuGaywL9ImegrbuGG420aWyz9GKAbNarTvv0VQ6IbIhnCZYYHtr
	iLqM8EjTLkSqbuyP4nvzBAL7MQLj6298+dNgX6/J/MSn7geFRouWlkQeeYlYiRekvUqBtcN+O5Ddn
	DRvlUHNhUul/gVsmtneJDT1mmW6rnjd6EAySblXHlkcfMyJWo61KJcDT0iSbW6DsGnUjFcoSkdnB0
	jmFOcg0kMBW2cAenZtOclNW4zEogc9GNc+9CjJN/PZnmgZ2xHWkhkVubETYNKcCDBL+Q/Rlvndwxq
	QXURMeJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXV8W-0000000Cz6e-2UY1;
	Fri, 04 Jul 2025 01:22:44 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXV69-0000000Cyo7-0nwl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 01:20:18 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-611a7c617b4so164636eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592016; x=1752196816; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DC/cBZO4f5h7yIL6Ec05XXIZpY7LlAOQumaUsmGIiWc=;
        b=lZ2qaKF3iIz6Izvt8j8rwgnmAlo8Wd+9Hx6iX3btnQxvk8Uwl5zZD2aV2l10YQ0MFh
         RYwSbCj1bBioAkRoUt+nBlq76f55jQ1r/3zHUIDCeRTmnwx65gCinDdpsll5bp7gcrUy
         sgAHctqHm+0B8bifylR0ASNvqzWCk8RbFVlV1/XY6rbS67/XdNHnT/2FLGdxQokjlI0M
         2ra9RxvRXqtxUgLa8yqz6g3ZSnztfb3NySFWP34MMa7L0hr5ry0dyqX1R8IEnU1g+e5D
         5+DmvVq5eVgziIvyIJOoJxNZTFT05GpQEXP+IJt3tD4PSGE13BY+JM9edrapVO8XG63U
         Rw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592016; x=1752196816;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DC/cBZO4f5h7yIL6Ec05XXIZpY7LlAOQumaUsmGIiWc=;
        b=o7QNvcVdQg4SSX/7d4doK4meecvq/GNWZRP6dxWEzMvEYbHe0KnV0nsqe81Vif8dyo
         lRROLbpoq0jSNuC6BZVlWKmw7zNFpKtLBN8mfG3CTLkR3FfUyOQLcIMVmxsUQWr+kbNT
         9TgciGV0iryR2c78QxCfhf4XGZS+m9rUb7C5VlSKdIPCiSFFXJhEMgPM/nmNwhfMa9aK
         Q7MUgFqugr8Cyfgmp7K50KDXzwK3rwAhNhl1zrekQ6XrhxZuknineRtR1E98woFRc7Rf
         /0ZKc77Scg5N+B/C/8F0wOGYsi650O0LHKT+/YKzUw8NzomwG3t0nCSSO/phat6tfr9f
         N9EA==
X-Forwarded-Encrypted: i=1; AJvYcCUeEj0/xqYtu1Mw0mq9QKZ+TtT9k7RHJ+zFNx5aaGAGl97DgDWUFuNQoIhduLCWkyFGkMpGEqHGGDM9V2MwSGNr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0A/Y483hzSX7kaZeUacNsPhvIkFzTSRWEwvva1jGnJ6hNbclA
	Kr8VfxviMyYzdDgqU3qOhLz5X88jk1LlKi+Na9/UfOGYkqudBMrVECGosCdVdK+V/r8=
X-Gm-Gg: ASbGncvYeFXmZ9e+tZ66IGzvSe3usAKKUkSrobsDinZLNSdXmbYl9ZwrQ4YG6y09P9W
	KtI6SGMwT68XBrfRuSk989+6/QlxF3BZgQhoeaP8RRXAGis9FdVHlQru3K9r0HoGY10ErF8XCuT
	QpuNAAKJGmAODX039MKLqN+RGuANFak7Jq8Zv4oLLYsUgMUc1FJc7yLV9Nk1xgj7flEVbD4Drgx
	u+Cmuci+X4lXFsHKPpPIsi+sZr8qz0/LxiXVMGYKZpZ6tNbRddoRHofeNFAKuBH7+XSfBEckifA
	FFwsQxHFPshkiryXq4v3vLMZZlp+n+zCsCFKNoEhSpBKFaAJioLT/hqdBrdwdbaUc2DWAg==
X-Google-Smtp-Source: AGHT+IE2gfIyrgT2GmZQ15R5wrbiEzA2Rw3RJESsngVF1fw51ISYnu4DuG+UdMI6ohqlrXf2k5q/SA==
X-Received: by 2002:a05:6820:2901:b0:610:fc12:cbb4 with SMTP id 006d021491bc7-6138ffbca71mr549586eaf.1.1751592015623;
        Thu, 03 Jul 2025 18:20:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6138e4be31csm164217eaf.9.2025.07.03.18.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:14 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:11 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 0/4] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <5c3e57db-0642-4e8a-a194-f204da5fd2e0@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_182017_255630_4861E1B9 
X-CRM114-Status: GOOD (  12.24  )
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

This patchset adds support for the s32g2 and s32g3 chips.

Changes since v2:
* Add the dts changes (patch 4)
* Fix Signed-off-by lines
* Fix the device tree spec
* Provide the complete errata information in the commit message
  and a link.

Changes since v1:
* Put the device tree lines in alphabetical order.
* Add imx@lists.linux.dev to the CC list.
* Use power_lost_check() instead of creating a new REINIT_DURING_RESUME
  flag.
* Change the Copyright date.
* Leave the .compatible = "nxp,s32g3-usb" out of the ci_hdrc_imx.c
  driver because people can just specify both in the devicetree
  since they are compatible.

Dan Carpenter (1):
  arm64: dts: s32g: Add USB device tree information for s32g2/s32g3

Ghennadi Procopciuc (3):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  5 ++
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 23 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 23 +++++
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 88 +++++++++++++++++++
 6 files changed, 147 insertions(+)

-- 
2.47.2


