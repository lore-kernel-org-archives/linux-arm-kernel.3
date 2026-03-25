Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1576FEA839
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dPn24ee3Ut3if8Ncvi7vY0xSmV1MlIqacbWnXs0wBFE=; b=vgDjEwhJttZlCi
	luY6ySt83B2KMB/Fzp5QCTaDEXfeKlE8Hma143iyIyeZuuYO2/zaS6gU0XA+QgBV0xG6I+A7MPjnp
	x2cbHlyVpRlxcRBL4GKPQ2Qfs/QFv8Mwbmcv5ov8Q+VBjDBboW6Iq2vLzHUVdiJ0NbhunYYgQ5xK5
	XbQkNaOL+dfaS5hESEE9a4dChEdgaojGIsKrsHniPXMuXmMJ7nlCd1/yvidORH5Tmxdy7uWeyNZdw
	F2Lrb4XhGABvGdPFvPRqw2KmWHef2SNMNef5kb6Z8EU4gAaFOZL070V3y4VskTbDsjFidadKwGG/C
	sxTX/pC2egNtNtCzwmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kt1-000000034yL-3sfe;
	Wed, 25 Mar 2026 09:50:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ksp-000000034uC-2So7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 09:50:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48541edecf9so19887875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432238; x=1775037038; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPn24ee3Ut3if8Ncvi7vY0xSmV1MlIqacbWnXs0wBFE=;
        b=tDcfmd7YrTWJ4S8XfDlp0DUlWgXhs9dAGfmK8ud6GoqaZ9a+/zSYGLNWLfWI9nZudB
         eZMvCOS2JqzzuirZh/JGkVfgAa2WLeCl8vlzIEeD8fgiQpd/J8gLE4mk3wKsIqlauKPg
         ob6j9Jo/XD1KR1wKnUDIENggIuZIdMCEOaIn7vmqAOjSFW6lLFIiUdjST8mcXfR5MokA
         ISP7QgWzwPkmUq36z/yh6+uwYhj6SOwkJ1RAK0wFrsbgaxBRaUA08KuCuMB3dDemoCYA
         PkmnQxm2QMCqvzNXJ3j72plQYuPVeXAL+8Qhw2jvmbydlQAw5QFkibumF0yrQHCKaJhE
         GL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432238; x=1775037038;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPn24ee3Ut3if8Ncvi7vY0xSmV1MlIqacbWnXs0wBFE=;
        b=nzC1F2gJ0jU76V3uFaL+ILJ23JC557KR3BdE0nebgmed+akPeT/epKA1k5zSge6Ggm
         oJoz9t00jX2upp/qLu1CGConf4NPkimlMZqifKQQXG4zmLnW1nRur6X3VViPz4eZ2Cjw
         Q8XV6kbOVBC+D8fIr5MySBMfZ6e6t6zXUuw/bGG6tdCqdkPkZ0DRZrVAoIJcVcK111su
         CLvS77N7JtMeAKByL3hE+iPToVRDitLVA+xcntoReJiV1FvNsf1HxhSjibm/bCxbocQY
         9paZIg98d7OezTM0D7SqmcL/t+HtVlKljqCwKXPzwB9GzWtKgaK9GS7kRToTLkd4RzDR
         Q62g==
X-Forwarded-Encrypted: i=1; AJvYcCUW6Sd/sPdLs3mLqx72Oqv4VZjXZPV7Vovsx4Xle8g12Ly94VxidCPQprWs9K0dyf1Kn+iOlwGBb9b/4yFMyUiF@lists.infradead.org
X-Gm-Message-State: AOJu0YyNUnd+P/4d03eqhjFdwamBsvhjzwUKAb3h1jt4P8DxGAYravgC
	PGT+Ej5JCvryzwgPWrbKq/4c7l0eSpkfXSb/7+OtKKMoonu+ouP7sXPI
X-Gm-Gg: ATEYQzxzCvAIbtuB4XK+Jbs1UZFK52qeCKF+PPwAsnw4O79JBsXBpGGH4s7ViY6i3QP
	aRjEoLCNJu+tIxXwXVCjHpg8fxzx6Ax4AhCfKg2vx9iSaBAc7jQ7OGx33sqnOAdF55EcAXiWTrY
	VZTpB6OoArBE+hEAJhkj/GEHn7z3VdFDXq+kHPuw0lrg1VPd1JB1NcOy67riD1N8rJwtupOiaLk
	wLw7XhDgWKPB7qBd7VcvRdAMtc6aGDjT9p9YV1fH+6OljY23jopOBiWr+5uBC5qdeHMjxJRfToQ
	gPfOEYfgPEvvTpIlMJbK7TlrFY+ymzyFYnHIiGzD7dI52znoBNBMn0oZ/Pd7EBYl6bkeK5gAfem
	gVcOUDHIOghOA5IhADr+8AMkmoMXjloqDInYrDGGI4jpo+OSeXn2gTxIeoM26gsVgZYmVLX0NmU
	NOyebPMiDKCFNOkG193aiMdTJTGFwiEhBRMSC5XoIabey0k3DTA04vPfOQqPmuwWbJwDJayGT4b
	tt2mQqgCYK3+ZDnQ9CV8r6grN5cY4FtpG1Q+S1nF9eDZ9K1Hsfzm0+tisofXA3rux4ZCVV7HXV7
X-Received: by 2002:a05:600c:c490:b0:485:2c61:9459 with SMTP id 5b1f17b1804b1-48715fd526cmr41004935e9.8.1774432237393;
        Wed, 25 Mar 2026 02:50:37 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm111397755e9.14.2026.03.25.02.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:50:36 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/3] arm64: dts: freescale: imx95-toradex-smarc: Add
 Bluetooth and SER2
Date: Wed, 25 Mar 2026 10:50:19 +0100
Message-Id: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANuvw2kC/x2MQQqAIBAAvxJ7TtishPpKdLDcaqFMtCIQ/550H
 IaZCIE8U4C+iODp4cCnzVCVBcybtisJNplBolRYy0Ycmu3OlsTtjL6yPt6uFYiTWdTcNpNGyK3
 ztPD7f4cxpQ9kZqivZwAAAA==
X-Change-ID: 20260324-mainline-update-imx95-00bdf6c54ba0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_025039_650197_F106B5C9 
X-CRM114-Status: GOOD (  10.64  )
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

This patch series adds support for missing interfaces on the Toradex 
SMARC i.MX95 SoM.

It adds:
- SER2 interface
- UART interface for Bluetooth
- WIFI_UART_EN as a gpio-hog to select the UART function by default,  
  as the MAYA-W260 UART signals are shared with the JTAG.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (3):
      arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
      arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5
      arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN

 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts |  5 +++
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 44 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
---
base-commit: efc6947b672d449d6b4560a55ad3589a6bee746c
change-id: 20260324-mainline-update-imx95-00bdf6c54ba0

Best regards,
-- 
Franz Schnyder <franz.schnyder@toradex.com>


