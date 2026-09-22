Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E750C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YXAQgXk9WXyXBlox7Yojnplh6D8AEqEL+5pp8xq9FJA=; b=d1BYMGpDLHag6RvIBMepT19gjz
	issj969ywvDiyysbmfAwMT6+d32mmaGP01u6gbFTIJSSBvToLoaQHTqW29A3ZzEbj4RdP9AoJ9tti
	4OHaXWX/br7NkeT+Oa7quSnc43C5GHOO50RCFxYWmKdw9u+F0R+D+okzLJs95ikZojq6m+xckWf1X
	/gEBZMyRHadWmeAq2T8EGS6eirKYKPISNOBeDjO2YObtzQQU5X19oizWHlcqTlriz53TnYkmfG2oM
	PPSSvhxaYJ2fEmI8jAnK/+tEW6UZG3JmK1xSCVZ52/m5uu1Vt8mj1eogLwLiEL0RmqUXTN5O4D+Bw
	vaY6bRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x949r-00000006B6S-0ZHz;
	Tue, 22 Sep 2026 17:19:55 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x949p-00000006B5r-1uMs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:19:54 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so124101a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790097591; x=1790702391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXAQgXk9WXyXBlox7Yojnplh6D8AEqEL+5pp8xq9FJA=;
        b=rvnGfMQYDYKTEM1AAH5vIplxTocSYVORqv6wNL8cO6M1ogwPkAMUIe6rnPMTbTiytH
         SNa6y6s4g0tkf7r26HgRqabnTaGTpnHCymSTHNUbxLToF55tIk22nxtUSN0aR4xHww18
         JIcF9YxhnwJNlBOt4qqLRTPQjY/6ZQbnv3PG7uaqrpvZ+sbcDcOQp7XMC9VHPHM4whFZ
         MJp+B04Az/SXFChfNqik7JfhrEt/4uNtCcveD6yjpe6PW7R3feY3tXM9k2KR6Ajreppt
         w65vnnUpIhes1RJCNLYB8V1Zn1iiFoFkb4GTzieYPRIEO9MrLCQEzrEn2OCeljbMCMxE
         Wf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097591; x=1790702391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXAQgXk9WXyXBlox7Yojnplh6D8AEqEL+5pp8xq9FJA=;
        b=MdZR4jJ0VexJv6XeqzyUca6tfN2FIErTLNY4boTnFLp19OoOctUDBCrOKsqf7HwEml
         3vs6FcgrkugImEs/KIWq/AapzBA962hotg4RtCLrTtaUuasWarosgUkrfhHqw87Fn5BJ
         q4mF7iL/+KcfIrPC4sXuNvAp4Jnlxszaz6mGPT/lglgt2bOGdHLUx0R+pgY7a0uqlXuk
         ch0Do/6aZXYMk1ys48oDN6JAkSIbnnOvWePygoXKjfd8AJ7Ced7CbMqc0zgH9f0+vylY
         ymSDfchntNc2wxNn3/Z/sMf6BE9hmdQXEqZ7kQLoSGD0MF8yQGOSqSHMagb6NvWhAjcp
         DNCA==
X-Gm-Message-State: AFuF++mMyced8rwQjCNwcQd5um6hG1WKQpby9NNEX8r0k9g3RYBTA97z
	GhiXZGIREf9v1+nP1lNsiWAsC4Wg273k0xHoFS58mrwlutx07pRvwSRc
X-Gm-Gg: AYBFou1kXGJrigavMB4Xk+qiRT7b7f0ZtpOZ5QPZWb9mn5KrmezFfzuZ/scAEJPhSkL
	A+TJQwCpasvwZI2HgMEzLJkNC1rdDUWddRmubuuo3pATvPpE+y0WN4hzMtDGb9u5YU0b4uqJN1d
	BUSCqiEWM1470ZgeyweksFdhOObyiEp47+4M1Pu9MTK3LjFKzp3msJzbuCaT/ipaFxvCZN0QFrr
	nox175xZhAu7HDFFCIl+n3Tw7sGunKCNTykMaL9+wlcGQ8ZQHAIriugq17tZlSaIaDpEUNuofph
	6cnIQb6oi/gZZK3Szrcy4soZYAJIVP+HybJUQtoyzpPyM6Y4RC3a5ASpwOxbO3P1WSEkk8kKmaf
	CJMsculqq1QxLblIjrjxdMwNtXemaLKQQ3nFqPESFEyIGQDeO0WeicUYq3/833uDpO3mlLOYNKO
	RpChFysKGrof6YQT3079hdzeReWwoxq13J2DinBFP71d3yw71kB4u3YRgkslbz//DK3YI4f4ss
X-Received: by 2002:a17:90a:e704:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-3a07e642712mr129398a91.22.1790097591215;
        Tue, 22 Sep 2026 10:19:51 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db88298sm438333a91.4.2026.09.22.10.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:19:50 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH] arm64: dts: ti: k3-am62-mcu: Add power-domains property for M4FSS
Date: Tue, 22 Sep 2026 22:49:42 +0530
Message-ID: <20260922171942.201947-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_101953_575010_F6D18B21 
X-CRM114-Status: GOOD (  10.32  )
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

Assign the power domain to the MCU M4FSS (Cortex-M4F) node by following
the device ids info published in TI-SCI public documentation.

This will be useful in future patches that will attempt at abstracting
ti_sci_dev_ops's calls such as get_device and put_device via pm_runtime
calls.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
index 68e906796aefe..1ae0870893c16 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
@@ -181,6 +181,7 @@ mcu_m4fss: m4fss@5000000 {
 		      <0x00 0x5040000 0x00 0x10000>;
 		reg-names = "iram", "dram";
 		resets = <&k3_reset 9 1>;
+		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
 		firmware-name = "am62-mcu-m4f0_0-fw";
 		ti,sci = <&dmsc>;
 		ti,sci-dev-id = <9>;
-- 
2.34.1


