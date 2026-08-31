Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935C2C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dS9uXLr3qezTsn5dVmuEZ66xzV07pi9cC42Sze/GMZE=; b=KG/mRwcfhAyZipcA06KMqv3mIU
	QFzZc/OFdaARUNLCPLWLAKyscVCctMg1gVkoxiUJSyjjN9zdillL/F1daGSylgzxY+a6lvPZesC0V
	2Kfi/JUIhyYpCQ3XU1duSMAX0iXGtpCwbPpGmJQbsrsHT7cYu1DAQBk+WVIEXXj4eDAfq3SKrG9hd
	Q2a3wyCWTV3P0yLRHFP7V068ijviD0Zn6yyxIPDghPQxaGeQ/shaVOP9UTKvRhgsI0vDJF1ei/sdK
	lReFrMKTyVnCNYMpbx0pKC3nnrw2oJWfiJp08tkO52mq91J+BRbvNr8dmjSVy+z01nQRcqIuqqPmI
	0qVRoWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10GR-00000009BER-0j4V;
	Mon, 31 Aug 2026 11:33:23 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10GN-00000009BCd-3euP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 11:33:21 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c96c92c0980so2185712a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788175999; x=1788780799; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dS9uXLr3qezTsn5dVmuEZ66xzV07pi9cC42Sze/GMZE=;
        b=HSBIz4X0OAp2YmX1By8sscv1ZWUE6qmm7ErMcKb9WRinitPn4nqFsVT/bJkWkwQave
         5HjRDvcuoP3PhX5jCKF3wTiMc3heAn97jIYNEfM1sZO/nN3uh1NSYmSLu4Aeth2SDNrS
         sjELUcC9+tEnfEdyOBBQXsYXBh56XdMoFU/1+1VpEWaT7NbrxIQGmB2CNlGZxx6d/d5V
         A9wLtViup0a4fFKArQQkShdmu+NWeze1ZKyG37f3/5A+2PJeUS3ihkpWEU8I2QO53h7v
         lZEs87MY6TehgnmMnIOSsSkPw8ev1bPyzbzJcYN6YmN39Ddi5ZD1krh/95lk/u6Rxcm5
         d1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175999; x=1788780799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dS9uXLr3qezTsn5dVmuEZ66xzV07pi9cC42Sze/GMZE=;
        b=IEBFkFL2tCtsGTABAKKzC8F+vppom543x+RdzVxXaX+Z2Km4eLoRwZtedrzbi8O5K6
         2RXdyGVlvN7uZe8iFbmsxsFO/lJmsxqifQcNumnaoJ8N/6Bt8WRzEkBimRq44w41cPvs
         SNz6X3Rn+yj/JnJuyM2WFc+dem+2Np/m6eScOs80Y3usjFUaHOOJq2UFjW92oTJ5bmgv
         viv57jtZ1S0uw38VR12Ya91DY5YAVU+h1iNJNGzvretnyRItbYjcPPCbyOJBlATxXPXK
         zaEdUGjb0Dyl/UhETfLdq/9H+jDOui/fwvMtVp0Tr7b145/WxSEGFFX9Lfln0R+g5zC8
         hsJA==
X-Gm-Message-State: AFuF++mr2BaTZ/XT6xMVG5b5hTs7l2bFRJZ7iIJICFdM6rvL9pNReGWl
	rpTV5RAPpFuROO8eQg8rEeZ7vcyy2htn/0g5Gw0X60WNxa8na8PniiAUf9hGwA==
X-Gm-Gg: AYBFou2BB7yKmC1yqFrqWAu7pMFeoAyO2SMt0je7PU3kkVkFUK3rIQTpsIgaPJvbmpg
	TtG3a8p6SgkA34B4WXEpebbtl5283KCLo8Ky7hqyW0+uAU2AUlFHlRvKQWIsPOAdFBzLUeD4/xw
	xjoQgPsQ0JVs0X9lt1S9obPSXApvf7L18s7Vi1xl8cKFHpzEP1KUIb8erPdCqMYjHrOqop0mKM4
	L+YZ5j29ZPSsDlQWVr/FsvpPd3J34f7AzQPqXfRKj0LNDJRMPMM1fcBsQ/D8kVUe6eszEs7nQQW
	eINfCp41zYmWhCdepLlMci7hIVmThWMji38ALKWCGSwkTusHoozwhQjsb10kV5RpktIYwONyB/2
	SZ/vp/RADvsguRQuIjux+y7x41lFeHgVsxITjQCX4WBNX9vIC14ZAZjMamaYaPp+0vcHSMH53NH
	JJnWTy8IX2yPueTDBnaLUe0OYB4i5bZsscHHoQXrK07oI+sV41JqOCd/Lmw5uX+GKyf2FT05IQ6
	PnPiQjqS9pZAfn8S5QLWd7r23a61zJ3CUViUNykFH+6nW3zr2fDbirgf+HfZk+UY26KLGXNHLZC
	N0BsRcoiVt6uV+vqCiz/qxfDi8FaXFqDwIspBo+tYR92Sv8=
X-Received: by 2002:a17:90b:564e:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-396d0ee7010mr36676598a91.6.1788175998887;
        Mon, 31 Aug 2026 04:33:18 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:39 +1000
Subject: [PATCH 1/3] arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple
 Silicon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-1-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZRo1GcG9w93sfzG7bw0j1Jl6KpqxxS3Chp+d8qV6No8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04oMJE42LXo8Wb8t2cF478qDHBbL2O8eXvXK6sppi
 xrf9ea7OiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOdVc/IsO+wxZql0dWHOg3v3+Zhf1SSpPpFdL3D47ja+qai5Xnyzxn+Fzp47bW
 +9UfwAfv7oB+f6lvnPa1f715rdE43Q2VuygRdFgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_043319_920237_195484C1 
X-CRM114-Status: GOOD (  11.28  )
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

Apple Silicon Macs use a shared GPIO line for all speaker codec
shutdown pins.

Select HAVE_SHARED_GPIOS for ARCH_APPLE so that we can use the
shared GPIO proxy infrastructure for this.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..76a6a0e6ae4f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,6 +37,7 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	select APPLE_PMGR_PWRSTATE if PM
+	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.

-- 
2.55.0


