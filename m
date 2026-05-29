Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAAECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Clr1sjugbIK8mVuhgaPmuk7DeQ8AwBiKW3SgLxEYIc=; b=jPsKzRqvqtabk398lujZjxNtag
	Xiw1lblOQy/B2/M6A6JihKX1K5CfXupo6xhai/R6hQ7YVxYMWDOYn8C6xoBt06Qu4X4hWLyvZyMlK
	upX5eROQW6hKP7Ppc2WXBbHfjaSAq0dmOZegfpB2BCMCxTjtNX2LGIoaIJG4Kcsu2y0jP3lBI61Yj
	+7+gwvDwAOkbeBZqWXun4pdDcXOOLCmrTDMXOvQFK51s7it4PirMbnpIPieVioRYyq5tgalKk5pCL
	NWyzvWaOcEBjCIHfbqAuwawVlzcTkFBDOnf9UQaRBgbub1Ig5gSDxzF/ImXMJ2hWdsOiH8RYK4GxJ
	1f816HUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSupi-00000007E0q-42rR;
	Fri, 29 May 2026 10:52:54 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuph-00000007E06-04V9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:52:54 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45ef29c5561so264743f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051971; x=1780656771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Clr1sjugbIK8mVuhgaPmuk7DeQ8AwBiKW3SgLxEYIc=;
        b=Wc8csZBlWIYvcd84S8IchWe7bjMzYuuszbQ8bAVNmq1pTA9LjWuu1BGBMSGVb0+DQo
         VF6EZnpETZIjyxg4c0r8XS0jBS0EPUqMAlOI3rkBcfUioW1stYs+GWm11p0HaGuawETv
         x+1Ou62rLXhsK6BeRhcVFZUhqKip81u0JniQdnUNT72Ntoj346KlI+P+anTZKnCjx3en
         C8/Z/UXkSss3idoEHrDxtQuH0s+p3kBBZzqEdXlmXbFLwCrdibbQPHg9MN1wE4Ff6url
         uyVVVoXUPuPDhIVLa5OIE1ZPsuLCNiwQLLSkbVvcL8ibGEkBsVKaFPRX7IT5dkssDcL0
         eTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051971; x=1780656771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Clr1sjugbIK8mVuhgaPmuk7DeQ8AwBiKW3SgLxEYIc=;
        b=R9e6ihoJfBBoxGg3aAWASfNcxkyxeiUSaS4GfN9r/is4W5B4aJXZg2ZMHt1iyhoR+B
         lGkYnuWhTGiba2a+H6O1iAiO4UglEE4+1SxD8Sy5NrBW9Kk4YN7mFPXruCtdUg6+hTHW
         9MjyJHRnCHkxu/KXz9UmTtZXiHOFOPUUauUbe5Yml9Tjp2KWk+KuPauiKcGixrGHaLAs
         e4KY0RElXkwGDeMfL6NPJ7MrWCdPk9YRmAJc3tWKOA/StMxAoHn0qaki4gMInPcG3uyS
         8BUjM9arfNHb9t7zP6jIQ5j5UV6HSxYf/fWIj79NCmYTcwwqb95u0Siu31kLbrxlyQkN
         rYRA==
X-Forwarded-Encrypted: i=1; AFNElJ/mEvnQfa3zQx5b4TTYMM+l6CE/1/w+1WqdSR0Re/V1LsnHOAjlVrNt4iM1g36Gi7NAw6znFlH3Qfh8NkUe290r@lists.infradead.org
X-Gm-Message-State: AOJu0YxjEaIKEFsZ6pgxEF63CTcr6uVYehHXOBi8VeOiaSedPosamV4D
	m91qP44WnSSd1JOm/D+X2Voq78N2yV83NDu4lRXcXyXWBpqUBggZOMvs
X-Gm-Gg: Acq92OFKYMdj36fmXQVnXbhojdPn5/bSdt+jd7hxPJG76uMssOAnOJNBRrcclRrzkW1
	GFOYe3+t1GnyWJjyLQQC+XhsI+6r62N4eKDYdpuPQXtoHRORmo8Pto4Fg38M0hYq5QOIL9ewPjs
	TXvdy9u6AYllKTymBvEEdNKd0D6+bq5RhdIAQyE6Zmpd4x+zfW6g100PTMGsabdDCuJsIyA3HOk
	tlDnCc5qyG+AEn+87vb3wyMXESs5SYAi7khraQbAAcwg3LfX9m4FKRF78iQrKUGm357E+H1vzFs
	IuQzFUjtgBG8BDM1BapkvpWNVCjHCg0gcWfWM5WB7FNuvGX4l57W1dOSYuRamE07eWFu9xS5ZNp
	Kh4G0wxZqiP45wzZyf3sjWFzPkz19YbmARp4NbuLQPt3WDVWCnadhIvWGEo7bbAUDXR7zaNkkUD
	d7w3Tsf7zXlFwS5kijXb72j9hkJkTdEBs9VO350FeNiRxQsXL+xf/qrNWRCpeWykmD8VgK9WKlC
	GJ1esYpP5sELx784d1hHRFdr4/JRkDYGRCcJPeQVgm/Oyc=
X-Received: by 2002:a5d:588e:0:b0:441:1cf9:4f06 with SMTP id ffacd0b85a97d-45ef144e415mr4343407f8f.31.1780051970866;
        Fri, 29 May 2026 03:52:50 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:50 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 0/4] arm64: dts: imx93-var-som-symphony: align DTS with hardware revision
Date: Fri, 29 May 2026 12:52:43 +0200
Message-ID: <cover.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_035253_062694_B5CC4883 
X-CRM114-Status: UNSURE (   8.94  )
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

This series updates the i.MX93 VAR-SOM Symphony device tree to match the
latest carrier board hardware revision.

The changes add support for onboard peripherals and complete the board
configuration with the required GPIO, pinctrl and PWM settings.

v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

Stefano Radaelli (4):
  arm64: dts: imx93-var-som-symphony: add TPM support
  arm64: dts: imx93-var-som-symphony: enable UART7
  arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx93-var-som-symphony: enable TPM3 PWM

 .../dts/freescale/imx93-var-som-symphony.dts  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3


