Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0FFCED26E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GU/h/mkFSU1P3uYOGjiw2k7fKpuyOTI5NTYh7ZnlqF4=; b=NW520b5fOCau6VPqGPDmHN39Yw
	7VtxeCkEB3oqSsP4tHingOu13O8EOAVwTQ6FHJfijfWNEiTwUN5a7qXeRGA3l1f9AHlL93zFKheKD
	tmBtqR1qpFUn1Aybuf9rYrlMcXsoy1cEHpGK9GwTh8MGnctSr1pOfDIIlcQW88SOD/AC1Y2RrVVSk
	ZxKt54ypWHFhCq9eulbeh9FAMN3gfFoTOfZ6jIzNSQj/jeN+w6y94H/0QOPEJqQb4kPQ71mJcndIo
	K16xxwGXqfJc6JHIgddDjR65I1wUOj4C/QTrrUwViA16jLAqqeAThNyNnkX4BhTAH9LfjD/KMxMTL
	FyC+lz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJLE-00000000HXg-3RCw;
	Tue, 18 Nov 2025 10:53:44 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJL7-00000000HVp-3riH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:53:40 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3410c86070dso4030008a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463217; x=1764068017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU/h/mkFSU1P3uYOGjiw2k7fKpuyOTI5NTYh7ZnlqF4=;
        b=ErBCW26ful3mERssj5gNdTrDo5jAdy4WPdV4r2hx1PzuiDQosj22rKb4+nd9YSoZhr
         +QzuFudbOKI4Uoxr2oG99VnvpF4G8RLQ2hoPg2JzKPVXsb+7DoceWN48EN6GF1LeY6PW
         u8CRMWxpihn7eRemgbwHGbQuS+/hk9fVaoaXaRCrhv3eAFdYSUa45pygxOmjqLR4AlGn
         gjYQ00+lNnIa6gWczu0QWyPmLJve6iVzgSTsSfFvWW88KuAt2x+oxcOE0QN0yuuBF73c
         MKHXQU9pyJQ6DOUqduqJqqT7vnf1BWEQSMtj3jlkUUGhkLr7NTakdz76J66qYoZ7pBez
         si2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463217; x=1764068017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GU/h/mkFSU1P3uYOGjiw2k7fKpuyOTI5NTYh7ZnlqF4=;
        b=VJd9QnAisPWMB6chph15hPrreiG+nXz+Fvh1l8APnwVQbYzP2t5piaGiCby6fl8bzB
         ahaYN6AMwtZEi7vUJXwzp0AT/LimDJUbXOvQvGQE4XLfLSEHJfe8Z1oO3psiGqTNfrsM
         tbFWTSQ7BTk0jQO/QxYFj1J0yCyAWAXe8Kd0FkT3feFpbZEQlYSVMeMn5F/n9UuzJMNs
         UTE7r+rzc6NzEukqC1fcezPMllnJCPPzkeG+37j2jlshk7HgA0WgXo98/qgkaqWsReik
         8sCXL9ENJkoVl9LZ55adxYzkV4xF5NZT4Km7YAOfDfE74eoGQIK3Y9CKAyc6CAxu3wCx
         xZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCXjXJ5L0tVUFYsS+D7TEqM3hxBuHrmCudMBNUa898I2+8TS2kRHpYfEaqNK0TH+GwAWOr3MSzrlVsFOY3tb+mjJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxN6E7pGk02CSe/dO7436UXsVUEj74bLnUaAYLaaqRpKHZtRXV+
	ug3OAwxggYNHEeu/QvfKoPfbmOGpPVxcqti/qOIdQEXM+Iu2FzeELcbg
X-Gm-Gg: ASbGncvWMVkGlAUi4ZxwK/Vypbq0vY6APQBCgnR9PkAeMfamrda+biejPX663zNe5IX
	sCI8EReHIoUc6Jj3Hpc6vIuLoKQTBFSCWDGumdtgqIaOaMutW7S5lPjZ7muMDyUrEIOB7lAnsUZ
	9pVXIsDZaMYnaIDa3whQhsTD6W5IfoQH3rSoRxWQOqwEwPxIDthCBE6pvZkqD5+QwXIO/6bYNEh
	5G6P5zmzJtLCIj8cxyyrpVWINyGl8XDJvwqqv69JQOfcG4oILhfXp7A1TYtW/wHV4ZNcxHdlXQn
	k/wmqMpSdIs94nPmaAl52+jyNzPo2ubqChplMUMM/puVSc2peN6hDkOhrTjYtcggze1Fhutl6Sj
	eSLGnEfND29BwFQwt+fbbU7rmAn9a70w1LOi1qJtz81ltOFd300r5+kypf5MpUwXMV15ttTYutx
	fYnbCdGgKBkypNlJlm/tEmx6fYlEpffU//JEUTTRZgdLbNBhvWa0TW14URhmSRzuFU0Qnaqd6iS
	ErYMMm8CViPP+WwT/2fmymduTKuNeQ6Acn2WYXHNWcDF5x0nQsiTtH6ff5tyMe6L9iHP6LQvAOa
	w30HZKaibQ==
X-Google-Smtp-Source: AGHT+IHuGDcUgS+xNRSjnnfr4/SvXnLaYN9uGNGhSMxNfafX2wXXKUijlkc4li6uBDPyOXHS+DPZvg==
X-Received: by 2002:a17:90b:2552:b0:340:ecad:414 with SMTP id 98e67ed59e1d1-343fa73f27amr17614192a91.27.1763463216960;
        Tue, 18 Nov 2025 02:53:36 -0800 (PST)
Received: from 2001-b400-e30c-5507-a914-c4dd-0879-41e4.emome-ip6.hinet.net (2001-b400-e30c-5507-a914-c4dd-0879-41e4.emome-ip6.hinet.net. [2001:b400:e30c:5507:a914:c4dd:879:41e4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924be368bsm16274111b3a.9.2025.11.18.02.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:53:36 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Tue, 18 Nov 2025 18:53:19 +0800
Subject: [PATCH 2/3] ARM: dts: aspeed: yosemite5: Update sensor
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-yv5_revise_dts-v1-2-fcd6b44b4497@gmail.com>
References: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
In-Reply-To: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763463207; l=1118;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=040YJWLGr4Ks08VhoS2kkw/5EcGAtC35AnEYoaywOPs=;
 b=ZNVKdrYg8F1QHXctgjlhA5bowvaFi1pWjMphGYUUySVwXhU/hQGoMbXxdZul+eIPiGhwbjxHe
 rOO3t5VNW+ODMrRVOjDodFSijyxj3YUldax0HDJXAXqc6NEtmwrdbjL
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_025338_955312_2B4DABE3 
X-CRM114-Status: UNSURE (   9.79  )
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

Remove sensors 10-0040 and 10-0045 to align with the latest
hardware design changes.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 7991e9360847532cff9aad4ad4ed57d4c30668a0..45b8ac2e8c65a4f672e64571631b7f6944f26213 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -674,20 +674,6 @@ gpio-expander@22 {
 			"PWRGD_P3V3_AUX","ALERT_TEMP";
 	};
 
-	power-sensor@40 {
-		compatible = "ti,ina233";
-		reg = <0x40>;
-		shunt-resistor = <2000>;
-		ti,maximum-expected-current-microamp = <32768000>;
-	};
-
-	power-sensor@45 {
-		compatible = "ti,ina233";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
-		ti,maximum-expected-current-microamp = <32768000>;
-	};
-
 	adc@48 {
 		compatible = "ti,ads7830";
 		reg = <0x48>;

-- 
2.51.2


