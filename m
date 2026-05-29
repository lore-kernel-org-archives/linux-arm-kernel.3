Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEC0CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pkLvwI8vTIWszKqjFw4gyZw7rkDmLB3Owe1rS5Li2I=; b=BYEEPsUjO8kBwmFCT3rkiqQFv2
	rxaA4vAuTlneKPaddaxDNqmWnHuovu6TQl13ksjh7ULx+pr9Kc/U45bA7cmHNbWi2n6ft+3BVUYLJ
	1C8WyPdx3Z3BfQUsBQOxxOrxH4pPFYQUInEX8Txpi+kJnK/okGT3DqFOLwwgkASZs8elpNQ+xpqIP
	C+ncJLUQaXT2a5BLnOLS4xlF6V/s08nB8mkcYzTUeaiv97QDzL61K0DRyD5tsSlDd5YAHDdblK8KM
	vTk62QiUoSMdjCdtmB8nkzWcdvl/WM2Y0TciYHWD5SPuVh5ONur4enZieQ4oVuZEaq/REmtUbPOPZ
	ILSxMcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSupq-00000007E3l-14Wq;
	Fri, 29 May 2026 10:53:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSupj-00000007E0p-4Bkm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:52:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45ef42dfb26so120156f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051974; x=1780656774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pkLvwI8vTIWszKqjFw4gyZw7rkDmLB3Owe1rS5Li2I=;
        b=jRLWvLROKqpgoKPPZ0CFRbyiNkqJDUBHb0vZUOa05BWB3DylE54axjiiD+MKCd2iTv
         8JWG0jf523hI2aL7HQT41rPd7tsxAruVAVCcrgmH4062d7GmVfkNTJoH44Ey5tha1irn
         O+e2l73vTwDCi/pTZUDKRutzuU6XRhWprvdTmh5NL2AkjhUUw9abH09QGNiwDE48Xj9v
         kbygxkct1xCM9WhJ8cXyxPBoxnWwzdfbJ957C2FIY+t/REdgRsv4/2UBHxM0JLslWd7c
         F85XgEwJx+NlsvP/+AmXrYAgDdFK++Z7ZJzsaBANUUutNvmBMyFVQWCq9YIHI52BrpHd
         sFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051974; x=1780656774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+pkLvwI8vTIWszKqjFw4gyZw7rkDmLB3Owe1rS5Li2I=;
        b=fPzNVmazFjYezdV/yVIDR0luPJeAUVLRAglSg4a+KT3vPE+2aIKTLu684TGbm2Lfuj
         VevK/qHRoJ9zQaJnQ7G26irn31PwHLrytVLLpHKijKkz1cwX52eIyeEvp4cpj0pWZeYM
         /RX3NHqrCuE3NqGeE8q7D2F8isbHx/p6lcM4lK3t+JFMpTn03whlkJek9kwtvNQuPQ49
         7xPu3ZspW/ZjvsoNwQIdPXt8Zc4ChYpa/9FlH/XeeM0GvcvRhIKzzyVGHhrG14Vo1zUi
         hnAxXPbRzRePihT5GPFBuC/Zt/61U32uGrp1wRvTGz64DhP9SiiaScXDG0pO9HHBHTWa
         S6vQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4hFqVHynmZnWQj6sKfWVLUhHaFU6HTQRybhtIKeDeUEy2C8GtTtoIRN1TTpfR3EwCXmgkPZNsqhJiETpl3LYX@lists.infradead.org
X-Gm-Message-State: AOJu0YxtOSY0XT/BHJzDvrNTmEZg+JR6SF1ID0peKwXV8RsEa2+y4GXY
	aXJC/bHIq6ym4Au3DMPBmrPcdIRTI8hsM9xIixBJGz7TE2q1bur2NDhV
X-Gm-Gg: Acq92OEFIlE7iRiSmCQMkkgf+g9mV+QYzrZt5uUSirWp4H5xnSx+qGY9hyh9jH+1szO
	YsVulGzEC4oWi6R/j27pFCsS3fJv7NHeInBjMUY4RBzieIVJfKogMrkLC7B/bzs9goeYQxi6mCE
	xmu5mq0/RkI9IvQzVOTjxBCvFloo6BXNqCQHxsEllps/fLhS/0E7lb/YEX1wrNJpHiwsXOr5Ld6
	Y6kd901+sUd9+Q1Ol43mln/IsWvmkE5chlq90QD5QoWPq95evjsKZ6PXNTHA4vlaVUZ1mw+uaGb
	bUE/j26goOmczZXxHDbHhWTzlM3cbfkY6dToB5dQQBWF7fbhLDpDwuNj17HjMnq2ZVf9KAj6S7C
	0zx45DqEItqKNEJ/Fmzg3zgg+biLihPOyyov17XtSNm9j7PkAgfzvTmHU8dYE5V+iNfLBdNtYJJ
	CdjHPEZvKzvxsNYNXrSqtXxVD5HOU3/JDg0NpBkhfSBJqTmFjGODjzzD+e+w2Sesb159UuLhJ4R
	CM0KD4tE4iRJE53YTjxxOqWQHxJ5rikP735Pn6Kywow5Cg=
X-Received: by 2002:a05:6000:ccb:b0:45d:4a00:b927 with SMTP id ffacd0b85a97d-45ef144d81amr3284071f8f.31.1780051973876;
        Fri, 29 May 2026 03:52:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:53 -0700 (PDT)
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
Subject: [PATCH v2 3/4] arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
Date: Fri, 29 May 2026 12:52:46 +0200
Message-ID: <9eac3663982e4d0c81e3fc80fbbee3fbdcbe5090.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_035256_049782_4E4272D8 
X-CRM114-Status: GOOD (  11.69  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index f313f168cfb4..37bae4913bcf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -222,6 +222,14 @@ tpm-enable-hog {
 			output-high;
 			line-name = "tpm_en";
 		};
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3


