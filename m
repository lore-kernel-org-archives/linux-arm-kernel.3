Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66480C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Br03zaPymWOmp5DzQkScr+PbTLXI2KHvIOqgBOpOx4=; b=29B8M8IiQ8e61LfTpBEkaDUzgG
	VXHM6BPhOJsHyC7LxVlXD/pSNPniDBwF6teRrEj2BQdSU/mzkOsnDky6DWnrqtCcPVLKeVsT2ix7L
	niqLXCpt+df17Gq/qkaHoqg2SKDG8h8DHDLw+hhnFz5VzXSRsmIQoX1yL5cdnk+EIegOdQbRuF0se
	CwxOihjQyAgFOTiS/znv2F8IxFjDsC65/i5u4Qf5JDd4YvN1zGjl+oa+qeO8of08G4nJ7Glo2ZTO6
	ThQCpBxC59v4dfsW+Zzp9c5JHqQ9sGmXN68Ml3x+n+UeBaACLiVzMiMBV5YOtQYRooH4LpDGAe1X7
	oJqKWWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfsh-0000000FLGR-3pwR;
	Wed, 21 May 2025 09:36:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfkW-0000000FJUa-01L9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:28:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so4244998a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747819710; x=1748424510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Br03zaPymWOmp5DzQkScr+PbTLXI2KHvIOqgBOpOx4=;
        b=JEAIgpmpRq1xoq49VqErVLQY4XP1BsE8lUo3TPI2WzjWlQjvaWDdu7CHVKDNAM1MDp
         Qc5FmO2JjeR9EJqlTTzm/FcoQox6vCmGwy3UZHhHB4S1GmfA1OXIwzScxXxFXlEKKHU0
         Cx+o4I+zRUvSjOveCKmdNJfjt+zyi16pdij+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819710; x=1748424510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Br03zaPymWOmp5DzQkScr+PbTLXI2KHvIOqgBOpOx4=;
        b=qWrr4HTRUwu3tFCJObw7oLovYO42x8w2QFXqoygSdPMOwwetEXnIBN/Dp6CviIqLOC
         JtPOJnDyD3mefHYLWz53VeM5Bf5XW7HIDPorlWt+ciyxS0Bbz6rgg6fUqOVaf3oOPbdb
         0wqIWsM3OjbTmibkUiGo37oU1MnTFFduLUnaVZe6kGWliez9tSOzZqth9RwMqwGY1S+L
         EMbOERQF9kMmKxEqUhyWAfImjirNrBrI6qeXe7kDZIMUSkmOz5dmk3BZLlVusEzTvzFR
         w0VA0gHD9WL7nTKELsHAgNqtB089ZdduMi0bF7ghyWqRqVAO9oqHYozY9+GD136Pf2Xh
         N4wg==
X-Forwarded-Encrypted: i=1; AJvYcCV29kCqYVgtusc75HrGcAe84HAdLYZAdAEwkvdvlAAvFQy0Gt75fJFD7eOMUwAllBo/bfVKZm7zE2BVxHjARGxX@lists.infradead.org
X-Gm-Message-State: AOJu0YzzLwk6g6LbGO7pDmz6zRKyJqXb25Tq2z/REqQd+Ntp/8YaoOgz
	QW7Oel8XdElvjyL83OyQUBLhnl+hY4PIkodFb/7eNcS8Zv3H5HOWVzTMkF1bctLDygc=
X-Gm-Gg: ASbGncvVQv1Q8E23B44dBOuXtytcFzlq+pgwmZz4ZCMbC3bhGQZkis53LH4YlPjb8B/
	njfARdFz39eV1lOFmRdGQgfoEbOi+znibnzaREYjnxTdxQdCmYsPPNpy9iWODURQerYphUoYB+v
	vBvXy0c0jiCrqNhERw2Rt6Y7zEavZspjyJnOLpdnHmgTls8z2ZH4ZDVyP4CftHbC+93Wr8fT6Gj
	7r/u2lXjtK8IVK1oF9BdecEVgZskkU6kjy4H4w6UkKt1gG4RU3yMuSZSuaqRMlhJB2A5Xz3zAuw
	omxf8MFsEY5Tc/jMiUqQQiEsk18mvPsbPh8j5upGDtJKNAIfS5DZgiQgYKOP32pevKAB+cc6i3z
	rbourB9AjROji
X-Google-Smtp-Source: AGHT+IE9Rsd+fMS6VUFvdncItJY6md4j6oNw2IpDZyEuTisqE10/bRSVI7wzKmHIESJJG3Xl38x7OA==
X-Received: by 2002:a17:906:dc94:b0:ad2:3723:6bf5 with SMTP id a640c23a62f3a-ad536b81a94mr1643951266b.22.1747819709868;
        Wed, 21 May 2025 02:28:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:cfc5:5070:d6f4:1d86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d275d9fsm867442466b.74.2025.05.21.02.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:28:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Support i.MX28 Amarula rmm board
Date: Wed, 21 May 2025 11:28:19 +0200
Message-ID: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_022832_047056_25F4FCE7 
X-CRM114-Status: GOOD (  10.43  )
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

The series adds support for i.MX28 Amarula rmm board.

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 256 Mbytes SRAM
 - LCD-TFT controller
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC


Dario Binacchi (3):
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 302 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 4 files changed, 314 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
branch: imx28-amarula-rmm

