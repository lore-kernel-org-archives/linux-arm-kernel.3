Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CF1EE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtxBcRpBORYIa5rqVGM8zqMG6Euvj5S5afX/620YI/4=; b=qTH6fl3Ll9ZAiX1Mhpbk+sZLHW
	K7fWhaINeVk7rCyRakaQy3Xfc6dnftMGkC31LgzegZWQrLVM9OCLi8klTJ3stuiv2zK8ZMZaXs9gs
	ABiQZLXl93kL+KuRswKZeuVOArQ7IBxPlUO6OLABTkps+7bJUt6h77/LvcSpoodvt6qLl3TKeVqQI
	CK8guXX7NbFOEeISDj5NJp+R2D8OExWOsBT6MKsbF5RFIg1PZZoZeByNVryvZ9BvV59FQnKXnavxt
	1In+4mi4sgyI1EYYolATVUzii936BI8XdTXgADugaKS46TMLMxN8jOQ5cyF4BEuLUxDCL+0aIDfDD
	g3YRyeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamNH-00000005bUt-1Iy4;
	Wed, 31 Dec 2025 02:55:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamNB-00000005bSH-1Xgf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:55:42 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0bb2f093aso105635135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 18:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767149741; x=1767754541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtxBcRpBORYIa5rqVGM8zqMG6Euvj5S5afX/620YI/4=;
        b=iP16oV/fu8Umnthi5yA1W4OWSVS/OeF9s6VKIcXmT6s+9Fo7jm4KiqtNMSq/M7RFWM
         SDJo44U5TA+E0L9ftN0Z5UtQS89Uz/AWxP4IEL7j+r+lrEKqEJJDedseErY71X2fFIGV
         HcxdnH6kQwAa+/UVMyIqc11mu1/BGAnxKnw8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767149741; x=1767754541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OtxBcRpBORYIa5rqVGM8zqMG6Euvj5S5afX/620YI/4=;
        b=nDvQquhLCOGQcgY7GQMLEoQ80ZMzgWrn8Rv4LkNoXhCgPAt1Ne6PtX3K5YKLJzYI/s
         YRm9P3iUO7LdM10VahE1UfmBqijFnRj//pCMrURIrrz2+Z8FNqFo3WtByHyA54PNlO/5
         fD8BqU+p3BwI0Ua2yUBoPcUuZJl8vMRVfWcfa5vNQNUzioT90PR/WU/Hx2CmpX7lu1oA
         Rt4E1yNvdUjFrzRS3ofAv8U1Nslr66k19bFu0DifZaAmdeIcE9dg4p0tGjCBmUg0Ekfh
         N47HQ70MYdbzfkOkhRAIG0JdxnMa1iXTXu30mvzkUdEDs6gvztCvpjSnv8GGzIgYxffM
         NgrA==
X-Forwarded-Encrypted: i=1; AJvYcCWqOQC/08Xm5/m3H0TrLhD1N9ldQLlxp352X1bfUwzAjoIy7aZIQvvAR+OMmc8uCT3E3BOB+vyh5CEW7bc433YW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8SiDCMhAgY1HfC8SJ3bGp3SAVJFl7/wIeYwXY043FCLubyKio
	E1e/EU8fDIJYTs7lb8Y3+uPhhMTvLFZ76FpDk2BJdlAizzb4T9b9uVbF8SHUqX1OSDw=
X-Gm-Gg: AY/fxX5SbPox9JpbtNQewK6Ck2pyzvY/yUf9HB8YeLa+cnQ6j/r0gDO2v6z7Gkap/KT
	o+U2fj+9ixBuNekA3bM61Pr2rEm8L1lpoy/3H6NiO1uahJr5TZXdIagRMJW5oDKCsYlTp/SwXdO
	Ky5xmdATU63GqCCGQ7scqasnUybdfBKtrNRAd+BrumjN5qmwgSzNcQVka3SwqzRr0FyIIOlW/8a
	SZWPjScqHwRoiXN1695YsjxYY5+dq+P2PYrsheDS/Y3WDvbvTFgCPQ+WUBZvVCLeQhlHeFMDjxB
	ExaJw7NhFV+dt5Eh2YHmn4XEWCr+hNQWLC6nPNJkRTbQC8hCKpH10ELUDzTU3B9dnY6Db+PXJ0G
	51pgTTsxG+EIYdyPStIjdI1WmekxMrxMhiTp8A4IR5XJZ9lG7ZNuvlfDqVUjeQQQyH8AXKGncVz
	KbNIEWHOfOkunGsHuSRMlvtOBB+MB9WJJC5zEvJttegESul8LtJKqG
X-Google-Smtp-Source: AGHT+IHfqKaBGSEJYcl1RPRPR+KftXdRoeAqBfFeFsFQaC4YaWRX9vPiSWkSBKAcgee3eF5BzLLM9A==
X-Received: by 2002:a17:903:110e:b0:2a0:971d:12ad with SMTP id d9443c01a7336-2a2f2732b44mr354805905ad.31.1767149740791;
        Tue, 30 Dec 2025 18:55:40 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5d3e1sm307762945ad.76.2025.12.30.18.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 18:55:40 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 5/5] arm: dts: mstar: v7: Add sizes and ranges to sram
Date: Wed, 31 Dec 2025 11:55:02 +0900
Message-ID: <20251231025502.1139168-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251231025502.1139168-1-daniel@0x0f.com>
References: <20251231025502.1139168-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185541_414714_566004DF 
X-CRM114-Status: GOOD (  10.40  )
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


