Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB368C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=; b=T7dba47VT39qnqgTYUzLexlEBj
	ts4W1dGQdPGUs6ha6SBYpvslUffI85EzLyrYss5cG1+FoalQSHh7qEEvfzbx9BOkGhItkwjlFAhXG
	O+kI2Z/kD5uE+zQCWBf+WrTBTTYR+5wg6jzKH2Vh+bZlbN0ZugDIW1Pc0FOEv/jturvpjEQhPoY9w
	iPUk5ptSpn0d7OuDoeNuM8gujL8ShwgET3EBv2qrs3LaSlU5ymsKkOaKgMWQ3mQwnhOC1+PFmFsEE
	uzg/hgoqc0O0sC/WDbiQ1Z4SBXfTBkrdVTkjuABirFUPGLVgeO/tGXoTtamQj+BVkAKmi6fdTJK/k
	mV4Q/jSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXfx-0000000F98Y-2X9p;
	Fri, 20 Jun 2025 09:04:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSX6E-0000000F3Ql-3yqW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:27:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4531e146a24so9915225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408069; x=1751012869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=IMT7luGK602MgECSeQc4RhiHJVqea8Kazm0eIaa44q3LhzEbD6pVTRutM78mPi7j1g
         i9LDuxxmCTPAJS8iqH1cKUhdhBip0Yj4kkx8aiS6H8tTkcQp/WzvolZeb//6zj7FdIKf
         V/ibvWWPD083tHKYI4CixmUu7S9oIA8s8qBHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408069; x=1751012869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=tr/SBWZVIC9RPYIHX11SfnIc6yUoQgMImdL7v/fiemtrGBdhHm7F1v/xPzrG+Jn5Gr
         wr2PcUOiERv3K4BgKuYdXr2oIwIXpLfaW+TWpVMmUpIr8bbeNpFyX/4W8PwkrCJInVis
         TLTZenw1xhsA/1tBWy0swJ9SlRy4IYigv/kcbAuCl0mzpeM8rGELEmrdJ4L3C2J5/Piu
         UKcphUS0E3Cjpe2ux8nSAbZXn4dYdVqBBdynapA6GwZrcO9zlRXomDWCf+djF0QIFsQl
         NEKQ1AXiGSG3UcXSm27vH19wnmPyZJGp+iKNdQvYqZpJ1q7uu/o5duBNu02AUYksoxHI
         mzfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRZNFUUICW9i9kSkOP0/xUklYdSrghl2kg9ycosHhg3bkK4/ki+ppNCOCp+RqznHnAco8T1Us/DdUG4WYSHBt6@lists.infradead.org
X-Gm-Message-State: AOJu0YxdW5zz90iS1Ndep91f7NNWPvFbCqgqRLR68TomscCZ75C1T9PR
	yjqoPMJL++nYIAWAsOSGQBm5YXt/qovDcPMpVDuuKpgqN/OUbRD/T3WTSVI2za7yPtQ=
X-Gm-Gg: ASbGncuOYfdnb9Nke3e2lCprNVrC2B8A0ViVVdDIleGijKcANRHKSvN9Ip+1OIKJLcU
	7AfKa8oOagRhnV7vbQHLj/dL7ULEq3eHLnnbyZPtQY7OC2i2kDo4wseg00csi0R1yLhilRsxKb9
	m3R8ZJ1u4XsrLZKsWjYmwiMXKwlWRFCPrfjg6PJlVu/vKPogDXldtX6ZuxtHVam/ypbe/8EY+Pd
	+xA7ixoPUXkoQ8sHAhul0uZZV574zCYO2oiU2bHqoiSr3U8/OWW2CSrUjVkyw+j09zbEwvFhHtw
	t+fSWi3eDN55ynQZYrgIq+E+quRmZchcPBa7ck++ADqQZpoLwMzUHAASJrORKfsMC2Rw3f9i3lD
	ZvAXBiw3Qpt+0Qx8d2OHgG63yBOwgiNtNUJtlhA9Eg8fqf5rJVIxz
X-Google-Smtp-Source: AGHT+IFxJQt2EMofYFFEc+wI60+FOtOAa7Jz8MXXVt/8qC8IgOmSsAJ9wzBvAyuIOyuqmNjPgJydyg==
X-Received: by 2002:a05:6000:40da:b0:3a5:67d5:a400 with SMTP id ffacd0b85a97d-3a6d1322ba4mr1436177f8f.33.1750408069390;
        Fri, 20 Jun 2025 01:27:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v4 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Fri, 20 Jun 2025 10:27:09 +0200
Message-ID: <20250620082736.3582691-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_012750_984211_40F1E6E3 
X-CRM114-Status: UNSURE (   9.43  )
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

The driver is required by the Engicam MicroGEA BMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index d40ca9edd264..917bc8a27794 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -180,6 +180,7 @@ CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MMA8450=y
 CONFIG_INPUT_GPIO_BEEPER=m
+CONFIG_INPUT_PWM_BEEPER=y
 CONFIG_SERIO_SERPORT=m
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_IMX=y
-- 
2.43.0


