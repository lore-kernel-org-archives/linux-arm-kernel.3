Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35578CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DK6t/sZOXlOI0flttlBEPNoSoc64x5EacC7Gj68MXFk=; b=fkJtCVtcFO/LMV
	0+RQmxPK8l14GqBYd2nB0dTJLN+5v7cb+z8eiZxmEiDF3Gf4XvwhlUsBGf07C6s830D/LvRlD9WrW
	LMZIuZOHPPymzJxNrJxBsaitomcAYBz9pkk0fhXx4RQNkCxPiHexdwD5/ltfrjhihe3q+71wm4eAZ
	8nx4qi91vfSzwdZq4Gz/0Sk877CbrpzEjlcQUfVMXuczjGmv2Cj3dCT/DUjXmBE/FAE/Kk/PjjV7m
	juv1TYsKDcx1TIHj9ZmrsO20p+b+D9PHDAeD48tMGdPffKCWKS4wpnYSUdFESgA1my4LYYAq/5Lzt
	7ccCxpWq+OiTdqv3yaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY8N-0000000Av4W-0S8B;
	Fri, 02 Oct 2026 07:56:47 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY8K-0000000Av3b-4C6z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:56:46 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso10562735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927803; x=1791532603; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DK6t/sZOXlOI0flttlBEPNoSoc64x5EacC7Gj68MXFk=;
        b=Q7/ia6jq+UWNVpvFtwcT4Q+OGA3NJMSrjaJMcdCKALleLGriQ2YaOGNeDDDDYiZjsS
         ieVxUIc+8JGWpfsvKZSAC/CZq0/SWriRhlDTT7wUjdVbvCuR6w4ZuszescNFFt4dMUWA
         G4mN1hKLZK6tu2rCzstKyGzkekfiott29zGQZ9wKxqr3wQ+mypyowEqnXbrGmAmctzVS
         PaaGraYvL30lSbvl9+GTxV4ZXp1uiEAyMaVUy9TmGW1mReLzy98xe15+xfdyWPkJtLnt
         bRYSndEMf0ZR71Tt0ULXtN2WFGhQfoSHGFVNDVpAM4YqnPpEkTO0osYc5HaQjsSWg9o8
         pZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927803; x=1791532603;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DK6t/sZOXlOI0flttlBEPNoSoc64x5EacC7Gj68MXFk=;
        b=I6x7H337YWBt2NPNuVcrl7wYsYR52a7gWQGo0eJOIr0cHajBN24WezHF0Ssyx3mz+5
         Pa9L1eonnW5wPCENYuKnSibCNycz+3pvNJr8qmGOthI5fDyCSTP9jK2dkBEjO2vhaAZ4
         di7nF4C2i2EoMQ6ab3coK36Xw9RusGsAdpm7aJMO35FbPIDsMnYCgYhB9kz1M1317/zG
         sxr0gN8UgvUPP6HHEpDA12PB5xB1NaM3AwX1+v8WTAkykLs20/8ztEu2SVaOMqKr6Ygh
         wbEjm9L6eNSQ1TMNP2b1u3t11pxlCYO0yYLS7HkNRpteakvrF4rktTzM+y/75tvhFQ9L
         iZNA==
X-Forwarded-Encrypted: i=1; AKwUvBzszMGMfcxsAJgU9eTwq5AJ/rZ7KOed0b+8h9HeCrh5+RRPm1Y3w4RZP4+4iFOMQ1nHJQZi3ebwFYZza4KfaQZM@lists.infradead.org
X-Gm-Message-State: AFuF++lUDwYuRdEEdwlD8fKpUxzT8TtkUfVmAgbLjnrV6tOz+aKiiAfc
	yguYnoAUzUlQwSqayrPHVMYFom5NoxdSxQbBX27Y6jdNdXy5/6AsGg4n
X-Gm-Gg: AYBFou0kTrBKBOapnSNko+brwnfoqqDPQUoszETd3cie78C9rsSvYhaMo3l9JiQa07N
	2LzF4nJpA04ceIDuNDGeaWWc8wRoRbQXwM+X9rroDBHvIRNpJTAUAczvhZ/vgOS/fSNzCIkdSVI
	zWoiyIP5f59c/lD9IcUxKeilJosDeCOzpMTyRnUwxmi6S+pssO8UFNRASkmDIzBgqkNSrkbsh90
	LZhUsAvGi3CnLM4u+XJkWh/NYF6Q5FZPbRNnqUNseJipokC0pBx0/YoJM7+KS4fTX4zWr3ZnoNR
	HRsYbQ/bZpRDK2UJm9ilH4EK9f9dneCT++8TPLxQ8KF/PNIEm7ERnFwuJnTlje6J2kxWWoQ7e1I
	cpOM/eMnwbQvCtJnIQr9J0/6FI+lTvkqgxGyG4WMQFHbCDAbtYXzZQ7teXD66CWn00D0V03m1nW
	Vjatiq3eiyZde0Ye70c8fKtKvUeGUkmli9Xvtc4Kj0ylQl2erVOisUhw6nigsk4S4AracfwN55P
	6JMyJHj3ubG7aUHXmsFiN088m0lgs54koq90NYME9GB4VxartT6Jr5PiMxWvooqlynTx+hubA==
X-Received: by 2002:a05:600c:8b2f:b0:4a0:e45:e8d6 with SMTP id 5b1f17b1804b1-4a027559b0emr30989015e9.13.1790927802784;
        Fri, 02 Oct 2026 00:56:42 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:42 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/5] arm64: dts: freescale: Add SMARC iMX8MP display
 overlays
Date: Fri, 02 Oct 2026 09:56:36 +0200
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRjv2oC/x3MwQqEIBAA0F+JOe+AKYTtr0QH07EGshVndymif
 086vss7QagwCbybEwr9WfizVbSvBvzitpmQQzVopTvVG4WSXPHIabcpY2DJqztQflPiLxrXaqt
 7EyJ5qEMuFHl/9mG8rhtBB9uObQAAAA==
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_005645_071183_05596C7E 
X-CRM114-Status: UNSURE (   9.52  )
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

This series adds device tree overlays for display accessories on the
Toradex SMARC iMX8MP with the Toradex SMARC Development Board.

This brings SMARC iMX8MP display support in line with the corresponding
Verdin overlays and makes the same Toradex accessories available with
the mainline kernel.

The series adds support for:
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Toradex Capacitive Touch Display 10.1" LVDS

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for the SMARC Development Board.

The DSI-to-HDMI adapter, 10.1" DSI and 10.1" LVDS overlays were
run-tested on SMARC iMX8MP with the SMARC Development Board.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 7" DSI

 arch/arm64/boot/dts/freescale/Makefile             |  16 +++
 ...x-smarc-adapter-panel-cap-touch-10inch-dsi.dtso | 123 ++++++++++++++++++++
 ...ex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso | 124 +++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |   7 ++
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++
 ...-toradex-smarc-panel-cap-touch-10inch-lvds.dtso |  80 +++++++++++++
 6 files changed, 453 insertions(+)
---
base-commit: e7a7fb1dc235053369094c3f8afdf67fefd67983
change-id: 20260930-smarc-imx8mp-display-submit-3a128293dfec

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


