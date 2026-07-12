Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39BFC44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=; b=JI12xuv5Ar9Dnk8Mu92lhzLmbk
	6kNaODXhwFTWSvQGzW+WZ0TbEMBjFWxnf6mxO22wHuxxTGKowTRIof8uTUILbwS6szYjkHKH6VYyM
	Bshot401cNi2E/7gtxdbUbQ4ohTURnAAHxZ76QtrrnV4FEkiqz3YurBZ81oMEV6Cr1DPMhUPzcAtO
	6L0GwvVmhVkc7zdIB7tbZKBzuePbZLeijHzAAHTbIrELzMRv6vxzd3Xm0jIByPTOd9iXkbFY+rLxR
	p5m1IHEVGYbJJpHbNx5piQr3tJx7eHK3yAc53jnMeZc9ZrA+O74kazZSb7vOZZl3lF4yXBlIAQJBI
	JY28c1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqk1-00000007JXu-18bL;
	Sun, 12 Jul 2026 09:44:53 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjz-00000007JVC-07Kx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:52 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-381891a9525so2602517a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849490; x=1784454290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=oVmZ0d5RZdOhkYnzg5Pjjyo18kQWdp3AgVm7G2kvPmy1z4RxB7awNuPpSfKv6eaerz
         GtRTb8Uwp9OdbW7vyQd4r3HGbAu/v/mJo6HoRLK9y7ZWkgzVtWf9ZTC6IcJCoFmyfW06
         cWYjTourCCjxlQxuWcSrvWAnEDeVR3+8zZc2w8gSuyq6uc0Jml/Nj2AmH7NUEyGyK9Os
         QHG+QFm67+yTdLxdWN7dW7OH2pkMHk1BfwNXY7zY4yCMgM9MJkem3n80aClPyZqTqGUv
         UoNEU3/mX9pvs4ObrJoQzw3yutHDGysO5YaGYi5OFIY64RKHGnt6mxn7DjpbOd32apDV
         pISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849490; x=1784454290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=GKIkzNhsgW7W24OeHy1CowAggBaEZLAWztMPgNtT1TSsJYQA0cRSn4kHyfSrX/1hfr
         c5pUrKs8TPIr0kAjOdOI/bk237it0E4WZN6lFuHlTcPGAreq02aE+ehOzHIbPHbhyi1I
         DUrwfv+kcWsrJvEgDnt59HbBkFf3GeEmVUrBjWUf8ej2snfMfF+F4LNxqOVoZbIQjXZE
         vtC6XZRPNpnu56bWsiT6zBllhRbI6ZYHZi+Oi9sqPwDOdYrjVOYJ+Kz88iB95veR+9nC
         WRlSR9kzTesnKRvBBP3WBwx3utujs0z8Je/zw0oTjMENw7GWP2OCpdA+9t6lxfzbXfG4
         5pig==
X-Forwarded-Encrypted: i=1; AHgh+RqLxLPAltkeZ0hxyUs1VS3Hi8COgnCfAY51IKvM0QDZZbN2rM3viySMnsQSGJXyJB9j1X90AbnCL14v1mSa2FWx@lists.infradead.org
X-Gm-Message-State: AOJu0YyTef3w8gAXt2rIfosrAN+5popKVDRoHT9pLpw+3vILx7Jl7wK2
	ciJV9lGOr8mqu+SZE+lYUgqWwk07g6tc9qOyRJQbXbDO4HyZiGl7JTHD
X-Gm-Gg: AfdE7clcnfJb1z8EtNr7OlCmoWLNRCsO6rC7zK5CYVG9czJG6QPht/fFY3gn7dr2vNd
	FlVMJYtlRu/rt5mOF/XBKKpLNG+kYjjt93s7RhfOfBA71FSJuidsRovizwGA8kM05YnDg99CB8s
	3hQDIwbZA8oQcBt7Vc11EdTdKFS8GRghFIBm7/N9CHLiYqxZL11YgtgsxS3qGo41S95v4nRsSpX
	sWCGDoFPb0abo2XdDUlKnBTXx+6pND8gfq18qL8IiBZ6rveHNeg4BLj01a0FQfxUQkpGVD+m0B/
	HLLLwW01sD1FdIDPb/kfCuVNCJK6L9eIqXcHz0/ILPtlnKCz0ekYdvJQCuCn6XmL7y6ibftX3wF
	H/zt95gS/40rlmmZC5mRNgRKyZShs2UDKUw3fdgrDHA9dOspdmrG2HN79Tt2gwtTDDpJwaCgcpK
	NclwvVq68wyeOtloszulF2L0MneuKvrNoDk6asAiM5U9WG8F2gaW8C4aqjSqKsKi8aFU/uefy52
	yQ7KzteGXvK9JnjcKPqaozUaRWvBlppdqwleYgxysjoZOdlfqXGtOadathy+usA
X-Received: by 2002:a17:90b:184d:b0:37f:9ce1:736a with SMTP id 98e67ed59e1d1-38dc77759a8mr5253734a91.32.1783849490211;
        Sun, 12 Jul 2026 02:44:50 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:28 +1000
Subject: [PATCH 09/12] arm64: dts: apple: t602x: Add common SMC hwmon
 sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-9-7763006d57c7@gmail.com>
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
 bh=IymUvUUOlIyUk7vYIWm4si7rSp3+FNzQ5/l7gdZ5Phw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU8TKxXf35MvkalK6o9K21j6o2hri+zsdi739T66n
 gVl/Vs6JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAU73mGcP/6g7/K1G3BJf84hN0Dj9n3f7JvSm3bfVEBzG/sKObqph/M/yv6OBu21D
 FyLQ8yndOkFnH5fQwsTVZeY93/Tr60nQP+x1GAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024451_087781_C3BDE0E1 
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
 arch/arm64/boot/dts/apple/t6021.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6022.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6021.dtsi b/arch/arm64/boot/dts/apple/t6021.dtsi
index 62907ad6a546..5175797baf62 100644
--- a/arch/arm64/boot/dts/apple/t6021.dtsi
+++ b/arch/arm64/boot/dts/apple/t6021.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g14c", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
index e73bf2f7510a..7585fd609d34 100644
--- a/arch/arm64/boot/dts/apple/t6022.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022.dtsi
@@ -347,3 +347,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g14d", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0


