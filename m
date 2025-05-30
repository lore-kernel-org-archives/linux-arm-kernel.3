Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1784CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 22:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zhv6lhB1mI/CkQWC95/D7LVSSPw+u5fXWeWxikhuaZA=; b=301cHGyCt2L5l8lQr1Vt725QqO
	9AY6BaIbUnNlr/+TI3QGoe3/0bwUPSB1GKui9Qq/IZPxd8dt/X8osKAa3euw5r5jK+GX9Tv7fzLx0
	z1y9D8qxnkqoI2Pudm3/yue8SE2qduOB2sIbeV1UOUEGmS0s3nqufgmWHxHW/f9zgy0QYa1vv6TtG
	4nIKCIuFMIdVlZEO1a6cxZr51Ux8v4++7YMAQa7K81OJF/7lhqFRnQQJADp+ZAIypHcUci0moaPyT
	oNg124N9kKZYTDfso/xEC7xpgzKofkBMd6+IKqOcpUxZSVMB8UeMMIx9O8pxeKz6KMiLpGr4IREG1
	0dVnWIxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL84f-000000021rb-0A3h;
	Fri, 30 May 2025 22:19:37 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL82W-000000021XY-2dlH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:17:25 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6fab467aacdso25097736d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 15:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643442; x=1749248242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zhv6lhB1mI/CkQWC95/D7LVSSPw+u5fXWeWxikhuaZA=;
        b=jeWgKg6q77pJR25TIaNqt9jO6dIfi4RqWbs/+ns7UHr+2UX7X08KOJqQN+CrJgnNcc
         KBucd7eKhEiDg9SIWUzsYKQzCRkgqX0sNPEMzrMr2BxMTlxG8s6YRV3ZSzFyBmu0UCc9
         faAvsaM4Y7xScAKBv9Fl4OwCHGzGmPOW0+wjJZ4pMD6QcV1y8xaS4Y2RmoXi8ZuSjuiK
         XqabpHgC+VzLMXeROmaxSdYcp0Lq0Gl7pvsPI4x6oIg8jODUoq4bTeWZPzI54ltrckll
         s+xnJ6i/6ejAJtF0kJml2cVCl2Cr7WZzEaAYVF0K2vHa/Y9FtYgYdFguLQXvp+JPGKQj
         82nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643442; x=1749248242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zhv6lhB1mI/CkQWC95/D7LVSSPw+u5fXWeWxikhuaZA=;
        b=I0KYe5AQh+t0sWVyznxMcXlPku7Mk36RcMiS8MPJxpNp0hme+CeYpqpOKUkppYgHx+
         0bnp+TOnKvfD7tXYB1YJWFsGXOuC64IiwbvH29eWryHWFSLsMkgJfXE4mEsP9XlZPODj
         23wkw3WOpwlXxhpAYHf4vSB6+9XlBFbU9UVSNgJWSuCjtpHei1KJUJZuHQAxKjMPiXF4
         i1iUbDj/mZUqeP/B5k9P8rQ55j9ft7S4025kayvGgciCx5GW0iarqQq5KGQfcxn8Ctqb
         5o/4zJeDmT8fOIKTiWyG5CHZbzeZt1FZI8xNltHR8QFgM/9tWKSxevHnIsgr8iL4Gttc
         NY+w==
X-Gm-Message-State: AOJu0YxuycWin7IDhHbNa5WZGsmC2NIVboYHxHkJUr+qAH7pfncdphMj
	Fk4h1oOjSlRY2jsCmUwoLAd3V3PoYJRPIorw3img8PUShJjS1eViaTPf+sTJhQ==
X-Gm-Gg: ASbGncu4iSnPM/USh62MOwuZy/gb7JqU+RCsbe1QLQBB5sKNlIcswR5lqiOPaADAdrT
	KVO45ZgJ+BUayMQtSvDak0YY523aBaJl8nimWGCstmNkwqpOopXq/eDmjwa/Cvi2o3dS1RuWoiZ
	SnmQVDatBIgzyXlESorhhBxyNELTX8TPUHoy6mxBrkMikL8NLJHk/jtdEnEggcRSCzYQvdksz9M
	tKcZnSKc3Q/NOCgrzcuzVprrkdTxNucPgR8xQuPrxOs0m4FArTzk8GHKLfzg94BqFs4mfQee0U/
	zBabvh+sDjuEq5EFud8sF0GZXnUso1zKN6TYBStj25Pix2uRsJAAOT3a4WPRjCksS5J/4k7d77I
	iXaT10X3yLdMpuf3hUmR9QnS9/w==
X-Google-Smtp-Source: AGHT+IGfTe2JaWKrTjR3it8MKEgzScIlOWAy/yBQKV2n97iFtrmSF6lgii4Qq4047HuVxPTbgYBp2A==
X-Received: by 2002:ad4:5aa9:0:b0:6fa:c697:97b5 with SMTP id 6a1803df08f44-6facebe6d29mr76790656d6.20.1748643442404;
        Fri, 30 May 2025 15:17:22 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:21 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Increase i.MX8MP VPU
Date: Fri, 30 May 2025 17:17:07 -0500
Message-ID: <20250530221713.54804-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_151724_667500_816E319B 
X-CRM114-Status: UNSURE (   7.87  )
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

Some of the VPU clocks are under rated, even for nominal ratings.
Fix the nominial VPU clocks and clock parents, then introduce
the overdrive clock rates.  The fluster scores don't decrease,
but they do go faster.

This series was adapted from an RFC from Marco Felsch which
was setup to introduce the VC8000E encoder and extacted the
parts that affect the existing infrastructure.

Adam Ford (2):
  arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
  arm64: dts: imx8mp: Configure VPU clocks for overdrive

Marco Felsch (2):
  arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
  arm64: dts: imx8mp: fix VPU_BUS clock setting

 .../boot/dts/freescale/imx8mp-nominal.dtsi    | 18 ++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 21 +++++++------------
 2 files changed, 25 insertions(+), 14 deletions(-)

-- 
2.48.1


