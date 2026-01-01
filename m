Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1A0E9410C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 03:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtxBcRpBORYIa5rqVGM8zqMG6Euvj5S5afX/620YI/4=; b=0ze0LaRrluYBYP286yv7L4rViU
	Rf65Pja5gNpNezRm50lYnRUFgwRvvnsE/epKpXpo2LUSG3c5LzevHm2e10goNA2XPCRTrUjluhcYa
	Qdf+WTIqNX2etV2285JCE25eCu4E+6hhXUammNteHhbo2fCVjZZfrkqWuDy8rb1b9vL6+31v+f+NW
	cKa5LLFwj7lYu2Jranu0elQhpvGQ23itMGGvlt8WuKz41VUwqFxmjtS7iJhrosrfxjySseRtVvgT8
	IKqCu97wUR1dx6sMwaCxZ4wTTcR8IRKawanxwaNKVOjF+IhkYR6rIJSy1W63uoAlkdZQ9BbGyIjQo
	AQocJmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bT-00000006Yxl-05TI;
	Thu, 01 Jan 2026 03:43:59 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bG-00000006Ysj-1seg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 03:43:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a0c09bb78cso80470345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 19:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767239026; x=1767843826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtxBcRpBORYIa5rqVGM8zqMG6Euvj5S5afX/620YI/4=;
        b=lv1NASPmwPoT81LANn3E0wqYNxCU411ePtF7rJNy228RdbPCKvZVCsTMJJpsV+wFvy
         MhwkxXW1/P/cvGd6DIak2LtFT2MnGa2oz1ppkD0a5zPioDKyNSi5ik8KCyVeVMt/eKBb
         s1NAcW752TUH7v/MU9UfjUTMhvrpFRol847AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239026; x=1767843826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OtxBcRpBORYIa5rqVGM8zqMG6Euvj5S5afX/620YI/4=;
        b=X85v76uusFiJbd05ZgdHTuIFJY4pi1DhFqhlpsaPlDw2TMD12vb5zBx+ZDGzX7rpLC
         Z2YJV4cxCDjQRugVQkNwqFqr3rX6n6+teYaIDP7tm29S2BL5gpjTJw4lCe0oL9bhM8oT
         IxoDLgiegrgNs9A6fkL3JcmxS6W7JbvZHvzB93F8qdr3/7WIq7OKQ76nodbPk2sXaJqN
         nPxcGfE+CQOdIVQuZ9gz7xf8qL0sHZJGnLM80+7gVrfyskPiUec2wYAMURxYNOG03rXY
         ZbzrlQsD9qFH9HMPMV4tr+AHPAZhFY7M1Fe+xgvWkwRbwzFDM31GOnDlUzs4T1BCKqN5
         2mrg==
X-Forwarded-Encrypted: i=1; AJvYcCWdemBplEg++o2U2OZun2BTT97FM+jIEKcGH5essXLtexntPLU7qBEdOz9zJ0Z9/J5qPr5LeVXUfRtX+XQ+u5LJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxylQNv6w6uPkoyzoncAonV4XruhaltiiNe6zm7Aw+Tx6r8NvHO
	Tp9JW69n5Cy5/nKCI+jRPRTpmKEiPLytEPVIWpQ8bcpSfKikbdEOyDqBQzD7zl22Zqg=
X-Gm-Gg: AY/fxX7nyAlG9lqpxXBUn4l6zAXDZqWxDOkCvGOjxsHmWQWRhyzzX36BK+LfyE4UTcr
	SJgZREx6qKO0cvrl03y5STstyFUJzscIVZUU5XYHvbTPSRuVf4nwnxK/4SoeGAYVr2o587wmkx6
	pHRmaVncf63r91z0nZ46iyJT91VdqsWzbK183wEZaE45dnrJnwOmGe4qLXCd1vmnOcTDd90DPwu
	uJal2cZkgal/BlcY1nTcoHuRKdTOhR/wCe7ypGxk28web2e7Rujen4WvwZsC3jHWfJKyjJmvlu4
	hHO/H5MW0czrRsNzbAIdkaudPCjjJ0GUcp9rV+b1FWQyykSfWZZadz/PFwrr3MJiMhAZVSND0oo
	hskfxqhf4EaE3B81PW5eQ/N+dIL2yurO1TIApWm3Oso/ZDew8Zn9rUlJ49SGSDW0crDu+Y5g3ST
	lB/2YmHwIC1W7JKry5tObZQeKbTDyeJzdvOvtcgnuO+ssJ2B5zqKYo
X-Google-Smtp-Source: AGHT+IFbIGzY4aErWmVCmKLoR1euT8Y0I8p4TvriJh11SnfOuAjOjw4SRu58etUjZRyUVw10n6dkGw==
X-Received: by 2002:a17:902:da88:b0:2a0:f0e5:74eb with SMTP id d9443c01a7336-2a2f0d5dbc0mr435134325ad.28.1767239025888;
        Wed, 31 Dec 2025 19:43:45 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm340437965ad.33.2025.12.31.19.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:43:45 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 8/8] arm: dts: mstar: v7: Add sizes and ranges to sram
Date: Thu,  1 Jan 2026 12:43:06 +0900
Message-ID: <20260101034306.1233091-9-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101034306.1233091-1-daniel@0x0f.com>
References: <20260101034306.1233091-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_194346_484173_6AE8B9B2 
X-CRM114-Status: GOOD (  10.61  )
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

Add some missing properties to the SRAM node to make the dt
validation happy.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/sigmastar/mstar-v7.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi b/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi
index db661e189eec..e50e4000d1ee 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi
@@ -187,6 +187,9 @@ pm_uart: serial@221000 {
 		imi: sram@a0000000 {
 			compatible = "mmio-sram";
 			reg = <0xa0000000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0xa0000000 0x10000>;
 		};
 	};
 };
-- 
2.51.0


