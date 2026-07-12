Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0726FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=; b=N+qdIYn4e8ovPZUBq3z0z4k/Xp
	TbJSRwV9yXQ7ToatVdE2ZrFohkiEk8M0OErlxuY3GUexL4zW33dRhgHf3wqDEQT/zdVj8ZmnZCT5Y
	PmhRKuLzaSc6ScqehOrphwd/DFfPcP+gUeZ1BgGYdHSpyrRkc5sUg3MC0/14e4+2sUN4uKFB/4V3J
	FlVwfcIhJbfsebjc2RYP4Lp9Rpgbxy8brUr8jOk9S8FupOoe3CS7WMiiRWcNFWqhZdI1vpahrODHg
	yCN/h1VZJb/lPqYv7qcVxvwdYXYQ5QYEqhQoUd2TJCmrqKaz+zMnShWcsRZB7lyfoihvKiSLyXAeW
	Y1caXYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjz-00000007JVt-0bD3;
	Sun, 12 Jul 2026 09:44:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqju-00000007JRh-33n5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:49 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-848d21bbaffso854352b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849486; x=1784454286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=;
        b=Af4Yzncie2rwyM3620ZqKONbxlxWTIqirobGTd0o5Bl06rL+9S/U5tMm0tGhlRXFvh
         mKaY2712tok8tmClCTwZi7FhXcQdCLLjqGVrWYI+ko1k1ZBGabe5cjP1zHx8eLzeTMD1
         zH3FB3wnR36xx51u/hwgRVwSpCruH8omY0jKDbjaMPXCu/SZmjIE2G196vFRKuYkKdN9
         IzBBX9UW1KPO37iXHl7TKLfoIxNuoo4JTmCbUrPA7JL4g42+OS421ZjGcfNv1SmV3KOX
         8zpud0fnKk3EGhx6mSKvYclMasAh4Seb3za/i+UpWF4sN92wDC5O6AlgDpbx3m6PNQZt
         3Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849486; x=1784454286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=;
        b=cP3cNQPS3ZiHKEKNQOcQKS36dgMSvFuGLdnycblekIagLAcy3mDMS2l4/yKUEk7GHi
         Xud31qnTDwrAeqlDPN51b7bJBvqXEixfSDCBdoj2l9NML+yDr+tXO0gNtRRTlJQ96AtN
         r3eJ6N9HjcR1owBDlDGApFXUKSpizQH/SZh3B8B0IEo9Lwbfn/a9d7iYNkH0p4O7sBoY
         2iglnlOa+A6Qj8iX703qCD86yvjwh8uUlSFWauF6lB03rc+7fk9WPKfREQfijsQm32B+
         qWRHo2NXCaE3S9f43+C5/D5ciO0IgFvK2hN5dNCa1d3jrA+Lav4FT5+Yo1pN0zLT/jji
         DPXw==
X-Forwarded-Encrypted: i=1; AHgh+RpkGSsvlyb1TMkJAtJ5R0foPeRjKYT5ZJq0mhEvcCFUbKPwSwKw4uOmuL6AX6Oxg620MitdYJBh4AZTfJ7ez39/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr6u77DKEgOun8rQzSB0ULDMq8F5jZNULOybmwm8BXK1nDxeOL
	trGXM51auGnIWwG3DQrf4sCjMPOQB8aREN5ynzGsjGRAun0DnE/2A812
X-Gm-Gg: AfdE7clPfOvZkH34+BtC+V+vK5J2JoP4mJB1eqiM1jYfSlmX6eJgyqYx0JlLNSJGj4J
	Fd6R4qxL+E0HLxGR08/BJ0v1pRDv4riVtELhy7/O5fcRO2BaWZUAtK827XG42BJrhQmNK5kyWl1
	q8Eo7S3cwJm5yeUKnUoRZXr6zdeazzmhiYWG9ETZVwDJ03cvPFQ+L3ruqWdcCZskbhPEhM6+obB
	K2xtbsojpfFqsnBoM1LGnbT4Zr03ql6CT/X/UI7lL4DF9XSbEnxl0WoEBEhu/Er+voY5T64SOFB
	k8ZK5p6OMP8hbFlonPPeFPss+NLQ5X3jYU72j0yhty2YQjVnhYOBxGSyLiZAaEBGQ2Ju6c2irwE
	Uuk+m7/9YTWzOWI2XZyAGL2bXO9G/NIdMI+1D/QW+Vp1gIEr54eH+dvu8C+NBS3lpsw5wd7gbj5
	KqCsnQ5z3uVCzUvlO3I2HPloFM7dYxE8B2FsQ76k2+KzvbEYM6iMyNPv/15aAzuJunHS1dxW+N/
	KI4BYbuquJXyDQg3SH0F/TIFlv0Ld/TOD/JGbE2giHytR8orr8cirvJ8L4SRlgH
X-Received: by 2002:a05:6a21:7105:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c110d3a4e1mr5501916637.73.1783849485889;
        Sun, 12 Jul 2026 02:44:45 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:27 +1000
Subject: [PATCH 08/12] arm64: dts: apple: t600x: Add common SMC hwmon
 sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-8-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HLHEl0SO/lEahgCGK95iQtDGGar7Zg/9GoIChI66pAs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU9jNB+rbDxoxi9Xvb3P71LkA7nFa3v9Gqub4l93J
 8e8kNjUMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOoXSxkZ5rd+btgXE7VQfnox08sb7/1VN8/jnMda9b/hS2HA3CatJIb/lZ5R3p4
 nzz/29lFbfZUz41od39njBQKp6/fqOe27cVubEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024446_844019_9D66649A 
X-CRM114-Status: UNSURE (   9.45  )
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

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6002.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index 6dcb71a1d65a..4fb934d7e71f 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g13c", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index a532e5401c4e..0f81fc612a2a 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -305,3 +305,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g13d", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0


