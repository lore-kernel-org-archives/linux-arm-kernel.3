Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067B2CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYYU1SORSnF86QOoLhacy3DzKZyj7/fWijxhLZdd8eA=; b=OB4MhW4fsms+TdsQrPGLbQnw4N
	g0Ab21oIq3vReN8/CFfKDxfiapu7TRC40M/fLRgBU+hDd5uLSktqm12//lKpfQG9TkMG48RFxYeGo
	7MOU7MiWEcsaDMHPrsmzj+P8N/7iiUy8Dd0trdHLn2xxqSmYyd2Ztl4o6iI64/kZdjOcfAAUCScT7
	rzA/N/qd9Vdzg3qiENkajAtiMwybdIVJ6DXgiX/UAyCw+rK5Bcy8cNpIlueoB0lvRFlT4m0qkK7gB
	jwu9Fs3T0xySoqGoo2U10JvxoAj2aRahOL6cotSo9YWQcmsIhpb/u/aSh+GDtHxTOcOdfLssRZ8vP
	BB18sK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Y8-00000009myj-3KnQ;
	Fri, 12 Sep 2025 14:14:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Y3-00000009msc-2ihj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:14:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3dae49b1293so1076453f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757686486; x=1758291286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYYU1SORSnF86QOoLhacy3DzKZyj7/fWijxhLZdd8eA=;
        b=woDRsBaJFBnYHQzrGKn2jAB9A0K1BmGXlI56fsa/jC5grznbZGTLAn+00Hs2/e0xHC
         mbrOuSFMVmxl8DOQLD/NwXA73/3cUWY13F5Xw6TurgkVyzXNpMa0ixSSNwOsWELDCxxA
         3N0N4Om51hyNxJ+wxaFk2r1Of+Ogi2Va+Fm+s+SQSe7VR6YiGg/ojySqVQ5BDFaipRqS
         6tfMYIXYOGoIRWbuNu69xJ9Vv+UBCw+aNiiAkqgvEbK+niPvqCvjWnttMNG0tkpRj2YZ
         7SKI3q2lRFrBBIc+FuEQ51pggYQveVrJERcaSCromqt7BGdZTkgA5FXjbTQq0dZ9csWU
         xiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686486; x=1758291286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYYU1SORSnF86QOoLhacy3DzKZyj7/fWijxhLZdd8eA=;
        b=PbADWkNO/i13pYE7TvT/CWM+FIhOhfmhVa962z94sUC0T8UjY0Fv/24med2vGNd+hN
         DA6y/f0hSShH1/X3SbBlCp24GHi7tn4unXoo+KG9Pv20nHYKeo8yRpQqP+gefAPh02t0
         OfQ2Bi9xzGqkjDEBMRBH1q/zBlvAkIT0a/162QtrTCCSzz2tVEG28kNVqt2CRkgxCJls
         /EMc3sP2JLcG1LxCyjkjqP9EwinILHK4fuCIATi/1bHQsbKba9mB2WLFdN4OJdNlLnny
         OCAbeROwDmqN/Mx4WPyr1rqAtj+6f1SgYS1xBiQ27dXX4jVhYOxwbh2Cn3PQUJalc8Io
         OgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq93TiGA0LuzFg37lE18xuacVp0raq+joWEzyzZXfJHeqQ8yMqUXvBs3hKECl7JbAD/Fgyil3qvIhSQKV/+tQQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx5ZEWGo3ZPWt2X6vUN5h8kGX0P4d2irUBRl4gxFekjH/CM/hc
	J2mYtFj37MAO84EFHUx7vu96UJ62vpmUwIx63yfIIQle+h2ac3Ah+pKzx606NwCxfTc=
X-Gm-Gg: ASbGncsni8VPqYmtghhP/f0VdW8JJ+xJu1+nykZ+7Y6boswwPZnkzAqs8JMDMK7oYwY
	MhNx0/zovb8XQyIZAxVn+mmtAOvpP/1pTje7nZle8FWvpXe+9lnsN3czZcn4BcBLL4QdgrcQVQn
	pA7HuRZQ4FW2sSQNv61VPuP9txeVJ9BQk3cjR+VY1hXPl5Nr6+Qr3rKN+l6ibPv9r7WxhF+siTM
	vYHCK6KJVs7UzLstltRFjReaSyZTqymHjpQStrq/ou/2N/dj0bzVYNKw6fs++dGXIAf/V/pbgRk
	8nGt+VpnJuPfCovgc1UPhNZ4T8hbC3qPxX8lVEcXU9YZk+yYDZ184Ni5pPccpH7SrxadlvKfPIr
	ZH7Gi+4/YcrxJTmmwD32VhQDkrXLxczM=
X-Google-Smtp-Source: AGHT+IELwPDPxYCpFOkmaAqs6QS4n+6xPwFX8EClQCkLmWQOaqKB/UsohwY3InyXz3cWYcEWRVaTyg==
X-Received: by 2002:a05:6000:178c:b0:3de:78c8:120c with SMTP id ffacd0b85a97d-3e765a139bdmr2764778f8f.38.1757686485677;
        Fri, 12 Sep 2025 07:14:45 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:40ce:250c:1a13:d1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd415sm6680739f8f.30.2025.09.12.07.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:14:44 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Fri, 12 Sep 2025 16:14:36 +0200
Message-ID: <20250912141436.2347852-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912141436.2347852-1-vincent.guittot@linaro.org>
References: <20250912141436.2347852-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_071447_709257_2FAA332B 
X-CRM114-Status: GOOD (  10.49  )
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

Add the s32g PCIe driver under the ARM/NXP S32G ARCHITECTURE entry.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d32..e93ab4202232 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3086,10 +3086,13 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
 F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F:	drivers/pci/controller/dwc/pci-s32g*
 F:	drivers/pinctrl/nxp/
 F:	drivers/rtc/rtc-s32g.c
+F:	include/linux/pcie/nxp-s32g-pcie-phy-submode.h
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
-- 
2.43.0


