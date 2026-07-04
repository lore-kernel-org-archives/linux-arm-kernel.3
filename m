Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D300EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W/CI0T+kn1yp9pQC8EXUf58GcP8gv1PF56nfEe5TT6E=; b=Ua7vlYYjg80C7Jtx6jqcmChcG2
	eXAsjQZl2UPCCQ61D5eaGhKcNYxtZ+L7P/ukslg427mQJNsrort4OR4D+GmAA/OkfinolHO/Z9cDo
	whkf8KvbDsio1lKUO5KkFqMrPXA0r/VapN6eM6hJdG/ENFPB2H0SjOpcQp7W1uUT7aDNnd9SCZLFm
	K9CGISy8VFyvLkvgxUXwRg2B41OI+Ju0L81Ls0IcxPj+GNJtXIIFWBCDvCtNjI7p6+18qq8/2CFBm
	imp+T8nTGlPtyt/IV38WqJ/g1nnmjfGws1YSUZEX9L2mt5cdbqTWST1CFTRcPrqUbNdSnm6RtPQnO
	RqOTHzlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg3wx-00000008bE5-0bmt;
	Sat, 04 Jul 2026 17:14:43 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg3wu-00000008bDi-33mI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 17:14:42 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-846970f0acaso1502106b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783185279; x=1783790079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/CI0T+kn1yp9pQC8EXUf58GcP8gv1PF56nfEe5TT6E=;
        b=FYpSTkQPsWXbXAcFt2Y+Gw8mWQv2QPsDNolk7ZkbgTVA00N2JMI3bRa4+py7LXatIs
         CD/XpmQvvq26f6Mua2tmMc6nnq2KwwtBevIB2NJNXfHc7ZA2dvtb/sxhvDeSbi4J6emJ
         0EFs//Ci04yYrSyyDB2jqoGqblYcoKTk0Y2sAGPnMqAo/MhXAoiZaGcOVzDLeoe3CnSE
         gvcPffiq/bpPSVw0mv3EBni9P4tTmnJmOXNCTAzwUCqS692r/Fy+6h0z6Cp5SHd7j7Kh
         WbQ0MJY6nx/3H+OfGSqjcjW4QbCEcVYGijXKUZwSMoElBw1N0IFq0gkG5EtCRcLFMfYm
         3FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783185279; x=1783790079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/CI0T+kn1yp9pQC8EXUf58GcP8gv1PF56nfEe5TT6E=;
        b=k+0Y7qmOrFj1v5waD0VWtlNO6nuYUpfAMm8CTSfhZQVKZDe+IMeXbJkiSBmW4zQJ5G
         iRwt5xez2si2mBOIfgQW1VIhPDWI2dIAJZ+66HrX8qrJx0aAyj/53+cgaTpUhhjGOavw
         kN/IuEishFkpjSCNNsqfuaGH7Msc/TEn9oLFOFdFi+unkjrCtwEsqnLBg3dINQwpkl09
         eK8YmWeHPbDfg5ULy4c5e9u9a6sGXk2y8Qyb9DO/5Wn1KhNVEO+E40wkPY+kFav5ut2y
         cXxlQNDEpj5j9FJRadUDqhJQ2ibx9mB6Zl2PlV9kwZVwQP8pKSPTo3wySqRBoF2oWMzf
         1yBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCsZM+ktuhLfTbp/y5XuDIf+/YIQuDqMTjNRTyi/gx6RLr0MxT4bXM/UsgoFwIQ+NK+me3ERowQ4g47YlgSAch@lists.infradead.org
X-Gm-Message-State: AOJu0YxvNHDpQ62AffIByN6ZDynamJovby6Ogt2++9v+X6tsyf4nBcld
	2G4v6Y8L3DzGBQiz3utXaSYK3mcH89LyrbTAM8gLLIC8aE7XtLrdpOK1
X-Gm-Gg: AfdE7cnvJwiqAGx/8aGSsISW/N6dhIjZoIHLN5n+NQj32Q0ZazoeCaHUteKnHLK0YyK
	5W7kNSHem7hpuS3Qaixd1lMUhaoqAaOgnhAxZcJoMnpvODXkeV12ZTxU7803Ec57g0W3QZheEii
	ZDhMhj+xG0EvSIJyrR+kDLVeWjiv1vcQIhZdv8wbIDO33zpEBhLIH0cYpE/KYv4yx4hD1ocNAi+
	pcS615hYdq5oWvqBUrQSkcYzuCQgCAFuLT8B260BgHVrb/5oLfksKYgjQOtud7URfv7fihq+zAe
	GxkNxyUw4QrPXXGlnikiRDwRsTm6alhZtv9qN3+zxHzwAss+QK4QEb+UinmugWpOyGWkmBUdefd
	aXxUYEeFIuxujHKLTaKj6wKbNl7XOO+EauF+K/yApnvW5Igt0WZSJG5Tr9+EvbW5o+bbta5FCHi
	NhBD7P0Q4taRxTHTc=
X-Received: by 2002:a05:6a00:439a:b0:847:904c:8452 with SMTP id d2e1a72fcca58-847f6ef68b4mr3914684b3a.38.1783185279250;
        Sat, 04 Jul 2026 10:14:39 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm1379101b3a.32.2026.07.04.10.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:14:38 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Sun,  5 Jul 2026 01:14:06 +0800
Message-ID: <20260704171411.1413349-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_101440_778491_6333C872 
X-CRM114-Status: GOOD (  13.55  )
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

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Based on 7.2-rc1.

Changes v5~v4:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added empty line between what and context
 - clarified description
 - added missing period

2) thermal/drivers/sun8i: replace devm_reset_control_get to...
 - updated Reviewed-by tag

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - removed dead IS_ERR(caldata) check
 - replaced NULL/IS_ERR check with IS_ERR_OR_NULL()

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - clarified description
 - added Reviewed-by tag

5) arm64: dts: allwinner: sun55i: add thermal sensors
 - fixed patch subject prefix
 - clarified description
 - sorted thermal-sensor nodes by base address
 - added empty lines between trip nodes (DT coding style)

v4 https://lore.kernel.org/linux-sunxi/20260504050245.646078-1-iuncuim@gmail.com/
Changes v4~v3:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - gpadc replaced to mod clock

x) thermal/drivers/sun8i: add gpadc clock
 - removed

2) thermal/drivers/sun8i: replace devm_reset_control_get to
 - no functional changes

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - no functional changes

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - gpadc replaced to mod clock

5) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - gpadc replaced to mod clock

v3 https://lore.kernel.org/linux-sunxi/20251025043129.160454-1-iuncuim@gmail.com
Changes v3~v2:
x) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - previously accepted, therefore removed from this version

1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added changes as requested by Rob

2) thermal/drivers/sun8i: add gpadc clock
 - removed undescribed changes spaces to tabs

3) thermal/drivers/sun8i: replace devm_reset_control_get to
 - changed the commit description to the version suggested by wens
 - added reviewed-by tag

4) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added spaces in the description block before "*"

5) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - added alignment of functions in compliance with open parenthesis

x) arm64: dts: allwinner: A523: Add SID controller node
 - previously accepted, therefore removed from this version

6) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - no functional changes

Changes v2~v1:
1) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - added new patch

2) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - changed clock order
 - added additional nvmem cell with calibration data
 - added requirements for new controllers
 - added description

3) thermal/drivers/sun8i: add gpadc clock
 - removed unnecessary call to clk_prepare_enable() since
 devm_clk_get_enabled()includes this

4) thermal/drivers/sun8i: replace devm_reset_control_get to
 - original function replaced with devm_reset_control_get_shared_deasserted()
 - removed some of the repetitive code executed by 
 devm_reset_control_get_shared_deasserted()

5) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added possibility to get calibration data from two independent cells

6) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - removed magic digits
 - changed description of calibration data procedure for A523
 - changed numbers of array elements with calibration data

7) arm64: dts: allwinner: A523: Add SID controller node
 - fix typo (sun50i->sun55i)

8) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - cell with calibration data divided into two
 - added passive trips for gpu
 - added information that information obtained from BSP

v1: https://lore.kernel.org/linux-sunxi/20250411003827.782544-1-iuncuim@gmail.com

Mikhail Kalashnikov (5):
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
  thermal/drivers/sun8i: replace devm_reset_control_get to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  arm64: dts: allwinner: sun55i: add thermal sensors

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  54 ++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 160 ++++++++++++
 drivers/thermal/sun8i_thermal.c               | 227 ++++++++++++++----
 3 files changed, 395 insertions(+), 46 deletions(-)

-- 
2.55.0


