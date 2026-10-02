Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68232CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hiRYKmHSzO5SlWk5Pf1admdJHvzaYFkX+u45NJi6WK0=; b=KJukqj65usHmb9
	OissYswSTGPjRZTsAPm1X/5PgGBaA7IM1EzlXSt7FpXTNGLySTjNBktGBuh1v3AkWc0F3aq4HpBpI
	uohHYPzatljFYjGYufQiCJ2c9h3BCpBNRAUEuWSlsyYnpC6Y08QRoBfwYY6Sxjq0LeGwtCycr5wAJ
	egH5D7wP0Nm8ZySkPFgkBwe3oOThPCWX8hbZ7Kezx7W3miH2ZUhM/w1tfkaE6c7ybeKM3cCTc9jOP
	GN1638xNAIWeT/eOv6dBdgfmxBY/7KMkC3k6MjEGPS4keUo53i98nEwBhHKIqzhft5+WiwlWOb6By
	4pcURivC2nQHz0dB4yQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdN8-0000000Bfd2-0obt;
	Fri, 02 Oct 2026 13:32:22 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdN4-0000000Bfbf-3ODs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:32:20 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af929e59dso2958412f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947937; x=1791552737; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hiRYKmHSzO5SlWk5Pf1admdJHvzaYFkX+u45NJi6WK0=;
        b=tOtt3dwIxDq0V9AMzPGR1WMecLY6Lyiz/9S1+9WOYaRwpAOeYE0cpennh/5iGBsflj
         ki4XLb4KsdHWsnHAd7cszMUCFM0+yBa8MthKH+Ctn77H1/v/NlvgDgjmLE+qPANFdW/L
         6wZYHh9JC7CQXakM6wxLo3k3SDsc3l6P9/dz130iEDiy6qth2vyAF3GsYUvwtMhtPGb0
         6giu4pl/8kCdUW61XINEmSMxdbSB0XO963uNohJAdtQM6j9J7JBm0qKFQt7c7fKYPS3V
         u9NHYZTP6oWcvV0lueTz197snoAj/IC5nFuCOgnIJBCJtfATWFkUwTwosJxSnU3qIHzd
         D7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947937; x=1791552737;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hiRYKmHSzO5SlWk5Pf1admdJHvzaYFkX+u45NJi6WK0=;
        b=Ut4rlXXeIcBoOzNAM888VcjjEMqo45xZhhqQqWwO04bBs1dtqQMtD6CHqPjKWM4F2D
         ruKWol3sZiwLt3oc21lxLBhXgpGGYDpmSBgOkoKbkg3Cjq0c/ql8PBvnPpPLWhNwLTnL
         17LnzTKRf10V0vKW+mKeULMMEDSrVNrsy1KZfHpN7s0GGaApwRtoYGJg01LNrggKka1B
         DLcZOcupSKRbuBC/sVFsJrb4/4vW4adbTsYLRCnz1oytSYRChCr0dsNEU1g7RAbvd3kj
         Xpjfx4FqVALTtuc07f/LLD7I3SBjaorUP+YtWCEwU/SCZuU3iqTmY8k0StaRCwFuSoce
         ykSA==
X-Forwarded-Encrypted: i=1; AKwUvBzsB+4y5IJHb7S2NKp4Gy8PO84MtTc+TmfD/XC1EW8BG7lcEikUfoA5xEb2vWNMDYYWHqUkLj/BDAdo+JI+zQCa@lists.infradead.org
X-Gm-Message-State: AFq9FYJ26opbNf0CXcITwxkCH4oua5liW+TrINbOPOsGHfHnmxBumVl2
	sUhk4G1ha70R/zAqvPzoBMH3+Dj/0Ywai7gEiLdDkp95hIxiIx5zi0qj
X-Gm-Gg: AYBFou0mFxTkoFaL0PabUtVEqHYLs/fsjFLAsqp0gV24x7htcIqiwMKM/ClYQT1hz0G
	A+oJWC/AhA8tD3Xq7NbjdGPYk+o7s+kD72+t2EWIZ8G0e5PcR6GJtza/n/do4sxTx45D+VpwRXn
	PJiTA1lmulJCEvxatGYvy7g3Co+iBx6RgWZE5FcJGCM0ue2tcUkiqPS5NCDMRmu7AEQ/sGqE0vu
	Y402geyuu8jvv6PLP8/x/2p8PmqEQSbKhM/pKy0doJudfNmi1uandGLXWpT480+93XRZ5Liq2bv
	sJ9lJ7InV6N8Ayb8y3qPNX8NCNja0lfRKIA40m6bmLmEV7QjUF99ugeZGIQBNWhg20gRcYLJzWc
	h2V2pLDLsdvzDlxoK4a+giJWna0AQCjIR1R2jpKYWnLsVeNw3mVmfCUettAD4S8A5NWYbWhXRZW
	QLaUizhRW+pFbgOKOGkHk4nzo+TzHUU919r9Gly4rP/n84WEmW9QVEZDtCjCoIfF0tRI15zZgB7
	t6xDPwvgqdnGltqy0C3rifjTr5TEUaunX52Cyks7N/0BNP4eneUSq6peGgr80B9pJ3JT9g1v9Vp
	Ct5b3Yb2
X-Received: by 2002:a05:6000:4308:b0:48a:fdde:5241 with SMTP id ffacd0b85a97d-48b12749eaamr5834965f8f.31.1790947936568;
        Fri, 02 Oct 2026 06:32:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm5809855f8f.41.2026.10.02.06.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:32:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/2] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
Date: Fri, 02 Oct 2026 15:31:29 +0200
Message-Id: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGyv2oC/x3MMQqAMAxA0atIZgNtkSJeRRxiGzVDVRIQQby7x
 fEN/z9grMIGQ/OA8iUmx17h2wbSRvvKKLkaggvROxfw8miFNKGUuy8nJiqsZNjPMXaZgsvUQa1
 P5UXu/zxO7/sBEtjHR2kAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_063218_866370_E5C48FFF 
X-CRM114-Status: UNSURE (   9.68  )
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

Add OV5640 camera overlays for the Toradex SMARC iMX8MP SoM and its
development carrier board.

This series requires support for the toradex,camera-connector binding:
https://lore.kernel.org/imx/20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com/#t

It also requires the following patch because it relies on the on-carrier
3v3 regulator:
https://lore.kernel.org/all/20261002-smarc-imx8mp-display-submit-v1-3-f578c63fb676@toradex.com/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (2):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add camera connector nexus
      arm64: dts: freescale: imx8mp-toradex-smarc: Add OV5640 overlays

 arch/arm64/boot/dts/freescale/Makefile             | 16 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 26 ++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 ++-
 7 files changed, 230 insertions(+), 2 deletions(-)
---
base-commit: a1f0ec0d615b3287faa88cf9b8b8a125e2b6e470
change-id: 20261002-v1-smarc-imx8mp-cameras-8b664da20da4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


