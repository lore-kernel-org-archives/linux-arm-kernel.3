Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E98DC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Klj8NdPC9rX4nFDMdyr+gujv99cd2TFqTsaOoeEged4=; b=rYc//6C+5JHlAlhCRUXj60sPsD
	BhjgmdBpTqcnx0WIUZ9XUIzeLrC0Chfk7VnnOYo1Rc54ewtQip+Q/J2bkLxxnJijaC8vu/kxRsG6x
	QjkK5s0qRfSRJOMoD0Lj+2od9E0Hu1raNNiBi7PRhfeBgxbkp6GJRNbqD7Y5qt1dAsHomrWq8uCrd
	Hr0HZnMrUT3dIEMmHLeBXKF3x8LMVlBwTE0MUHGEtFGyu7mNjqvkaWj4CXKMvRIsEoYhycfIEc4DV
	eTK7qzXu8xdx16wKkknK5bxssyI3KndZtW6MtY48L5k3gxCtMdzKVFm2hQoau42j3WKcsL6hO2HXf
	PK6xb+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF83I-0000000EbnA-1frP;
	Wed, 14 May 2025 09:05:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7QP-0000000EUcd-06XU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:25:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so1939495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211111; x=1747815911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Klj8NdPC9rX4nFDMdyr+gujv99cd2TFqTsaOoeEged4=;
        b=XhD7R/YG94b5cHdvFcYsuh99kuNnq4xaHpoJkntnkvbcbdx8IEmFBLs8WWORq887T3
         nvjfU9Jfx4sHUpxyVDWJQZQyGq0WjBEYzw6C5SKD2k+maSRkhO0quW3q8wZS8WqsVYVQ
         PXwVVPYsE6bnbFTL3/wkR/pAl8tPSgd5GH2Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211111; x=1747815911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Klj8NdPC9rX4nFDMdyr+gujv99cd2TFqTsaOoeEged4=;
        b=pZBTvq8CzXnR7vv/HUwiWqDcASdjaTvPApy3EUpRjlpxQw9gtDfiYwAfdtUsBBEFEn
         g9+tV2j+e2llR5yChd+fu6noeyr8JV8TcNunptTdP5V0aSJTnAHP8lAC47FKL0dSibCK
         2MREe6skfFKj8K6cWDYmF9dTHwqSNe61zSIOgI83wDHHr0WLXon1uLZFVCMhlYdL/EW+
         vNBdRgbH6mFgMucvx1Ub7+Y2ACKotmCMJK5ucsNRKgleGxZb86EVSdXDT9hdp7XySmXr
         e10nIreahl4kYKZD375xToEWOtgl5PfZ2T6mPmMRFUaGmX84H4+NNKymSde7f3CWcG4R
         KiOA==
X-Forwarded-Encrypted: i=1; AJvYcCWlb64zGa8IVt9fX+OhFASg9zaB9Y7kCrpb2oLkzfceXL9g1XKvmY68GZS4ueOdszyJbKh3Y6mekk7T83HuZN0z@lists.infradead.org
X-Gm-Message-State: AOJu0YxV6mbNlyn5IigT06f5RV6zssLQHIEFYzK6qJLFGCELaXWRN34j
	CAo184voXT4nKee16L5oyehStQh2QaBrchj/GNkWPT8ddv43mQI0/bUIthzHaJc=
X-Gm-Gg: ASbGncuY/IgaK0VKWfmtY9q/Epg0GevswVM9SALEoSJk5rFu3x+KWXRKd8sfAH7cgRV
	SrZkf03S4SBMAzjR1i3D5ehPGr6f4S0YNt1u4btVtxZxLChBAXb/YGL/Uw36tdeos+BH7xC8+pD
	sW1sZtvXf2WV3vP4edV1N13vsil07DwbvhrEEdYtn+2lItyJq/30ZWGRmeK4vDtTUnQeBHa7jf6
	JnudKLc3/mGfCB9MkpF2aCqZcc5p13pdt4DBwMf/2U5GKKH5ZQQ3dZgEYuivPNxAWDBgpM6ndpe
	IPuCP47mRYZnNK67BIQ8NhYF6azJ0ZqS0z2WC6w+XcXevExvDY/WKqeIZk02qXcMpaFRar/A+5C
	BO1azBNHdebeBxn8zlEKpVwucMAoXWPKxXKRoN56nj20=
X-Google-Smtp-Source: AGHT+IGa+UmxR661YRcC1N4UAkW8IE0iPci8H8/AjxxIIiISRrbp1i8SREEO2kqtiAg1FYOJKvF4RA==
X-Received: by 2002:a05:600c:1c14:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-442f210f6f4mr22958705e9.17.1747211111376;
        Wed, 14 May 2025 01:25:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/9] DTS updates for BSH SMM S2[PRO] boards
Date: Wed, 14 May 2025 10:24:54 +0200
Message-ID: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012513_079013_710F3A45 
X-CRM114-Status: UNSURE (   9.86  )
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

The series aims to upstream some parts of the DTS that are currently found
in the kernel used in the field. This is the first in a series of
activities intended to eventually lead to the use of an official kernel.


Karthikdatt Anantharamrao (1):
  arm64: dts: imx8mn-bsh-smm-s2-common: Enable GPU for smms2 and
    smms2pro

Michael Trimarchi (3):
  arm64: dts: imx8mn-bsh-smm-s2-common: Define suspend voltage threshold
  arm64: dts: imx8mn-bsh-smm-s2-common: Leave regulator under hw state
    machine
  arm64: dts: imx8mn-bsh-smm-s2-common: Keep wifi enable during suspend

Simon Holesch (1):
  arm64: dts: imx8mn-bsh-smm-s2-common: Pull Up Console UART pins

Wolfgang Birkner (4):
  arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for
    VDD_DRAM_VPU_GPU
  arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for VDD_3V3
  arm64: dts: imx8mn-bsh-smm-s2-common: Increase drive strength of pmic
    irq
  arm64: dts: imx8mn-bsh-smm-s2-common: Disable PMIC SNVS reset target
    state

 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

-- 
2.43.0


