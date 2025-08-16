Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3567DCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 10:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c8/K9OcQh+VZ2ps1hjk377/rzEGr4MXBz1jHP2xKk3A=; b=LjsYhlxcjlJ86qHXJYrFa/10A/
	PqFGeIvJus5+S09dXl3miyaqIsEMOQ7bFNfr/ZXfgDgT4m+D2L+p3eL3aQEiEORxDt31YctK0Aj1f
	7NjCg7r28St81EMo9LWLqmnv+VKgG5bCNY4NJT7HDp+zfWPwOzBxsGXOVYDkPuljZkkvVsgaKlJum
	CpPFiI6S40QQ96OydwsH7Mu3BZYAIRCQYwbYZLB2lytJ5NouKWLzG2oFCV0ymHd7DsV+42nrrlLSu
	6qWPFLuGaP8w2QOFJSteXvUArKjlV4D67TvNNMD0u61ghVb3FrPbIOeeX0gO53+WQsBNMdxr9cny/
	bmNbbyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unETl-00000004UQy-2PTc;
	Sat, 16 Aug 2025 10:49:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unERD-00000004UGQ-2Oc1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 10:47:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b9df0bffc3so1739739f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755341222; x=1755946022; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8/K9OcQh+VZ2ps1hjk377/rzEGr4MXBz1jHP2xKk3A=;
        b=Bf9xSu6ezqKnDU3jJUmPZkTF5azlTZQH7xNvQnfVCHd4s6oXpNs+TMPs/vl+9OkcmY
         SkFgtbtGpMa8FA6B/C+oLgK/RnA2LnQi/v1daKcnOPafOnL32ILIJ7mALxNm0nW3HMCH
         NrKqO6Fc+9/aLTMGLTnIJdgWqwmnJK3gP8CYq/i0Jqmtv6D7ETTJxmI/ZfpzzWxRg/a9
         SzkAgIV75N+xx/rZKR3V4l2oN24VLgzQ3OMZbXYcISkblZ61PD0bXt0ppk7hrVHq9xyW
         g4hTC8EdmR62jcVz7WpamSD8EomzQF6QWc1cZ/9hkdn7pRCMTj4fQWxWiBKUtJM6/p9R
         Ve4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755341222; x=1755946022;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8/K9OcQh+VZ2ps1hjk377/rzEGr4MXBz1jHP2xKk3A=;
        b=gak90iZZj8/YxZ8juasRoFIrC8UUjlsN6AQGKOytcejHQm7B9zhjTMKw7RSKnY4jAw
         U8Hvuuj7vwvVDI8jn5sHvt+Hibygn7+ylGyxwcSC/PcoaY836Rwx8zPVVPe5nWq99DRC
         YzR6oazaQYetCrQ1uLVKhkUnGfrXs1S+QH5d7FhOh59Dxq0OW2XnEDyIwxPvr3kYGNC2
         F6KaZkG3DmU0nbk32O59HCteNkqOdZS0PDXC8nh8BhRyvkhvIsOEpFfjH0n1XXgrki2J
         ATqP0whgWHEPKnxontC+T1CbiX6EzSpolMSSvrI8BtID9BCT+hbSx9Q024XH180GdezK
         I7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT1ShRp3qW2RkowPwKMYGcyhwHE1A7PDXpmHtN/GGvlyN376nQqTZGUPTflYa16cczQWKZGoeVp0NZv07TUdS1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5sm/Zuaw6yqqCRprDSyCSqaJjyuSHeIS+nx6LRFQyj7Kp9bLh
	yxUz5qY/C3GeHmpOHmLvOafmlGVHaTc9bEN+gNKu7+Ey11TYdzHaXeOIbcG8D4t3SUc=
X-Gm-Gg: ASbGnct9OujoDaCmt9vv5rljhuAiEipJ/dY4OnJKU/BJ1mpPBajn6QQtnDfonEp5hn6
	H51jLhlaOVq9nmTMCf22e/cXwx7t/tw6bnurYRt89qoo434dzGXt+KeRQ+6b4OIum4NRcip5u8X
	s76ngL5X+7RcstzRT4lj6Hceb/Tpjj2rt4xipky/izkuS04QvITZFeWjG/jcupjjFLqA06MMMOf
	8EdqBG1K3GqnuIzTdc2+ZvLIuH7Anvc9K+DAa2Ztiw99z4uuJY9Ru6lNX4eifh5zqMJogIebZDs
	xgpKLWqBMRWTKUxI82fKuVRfqBgxNLwHG5kSrugtB6PSy5VmNWDFZpcPWSWdYR5iPM0axGu2nux
	vIOAQWK4kua244CbTdrADxSuo9Nad7JYKu2SWwgws8gA=
X-Google-Smtp-Source: AGHT+IGeBUxsWM8TKjBjOCNR7N1cHTH9VLKWrA4KdiQror9m/vvPgYr7/Et0/P2bYgMxSkrNqMzKvQ==
X-Received: by 2002:a05:6000:2f88:b0:3b7:84fc:ef4c with SMTP id ffacd0b85a97d-3bb66180488mr3569613f8f.6.1755341221916;
        Sat, 16 Aug 2025 03:47:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a22210ab4sm51914445e9.3.2025.08.16.03.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:47:01 -0700 (PDT)
Date: Sat, 16 Aug 2025 13:46:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Ciprian Costea <ciprianmarian.costea@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>, linaro-s32@linaro.org
Subject: [PATCH 0/3] nvmem: s32g-ocotp: Add driver for S32G OCOTP
Message-ID: <cover.1755341000.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_034703_618680_C92ADEDF 
X-CRM114-Status: GOOD (  10.50  )
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

This driver provides a way to access the On Chip One-Time Programmable
Controller (OCOTP) on the s32g chipset.  There are three versions of this
chip but they're compatible.

Ciprian Costea (2):
  dt-bindings: nvmem: Add the nxp,s32g-ocotp yaml file
  nvmem: s32g-ocotp: Add driver for S32G OCOTP

Dan Carpenter (1):
  arm64: dts: s32g: Add device tree information for the OCOTP driver

 .../bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml  |  57 ++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |   7 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |   7 +
 drivers/nvmem/Kconfig                         |  10 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/s32g-ocotp-nvmem.c              | 171 ++++++++++++++++++
 6 files changed, 254 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml
 create mode 100644 drivers/nvmem/s32g-ocotp-nvmem.c

-- 
2.47.2


