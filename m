Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDB1C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPcQkNch1dlro+P09FAFemSnMdYXsI9mjXSoWgS8Puc=; b=mMYXXnytftMQaf4iqYVrr4Sz5Z
	jZxB+x0kEqXBtMNntCwk/rHYJGDgpI0nznIWnL7r6Zi3iGJyThEalss117H26jSjDpcujVfp7saym
	tWzOx+cowUmUVJbySdUd5vfr0LsVTnCddCd+tH0tN1BpAPeLtIiAHqEzu0FA59vuIZhD2jWauU/nL
	FKuAshPhJmhVNdiK1YJlbecr1wNEzYbvbxdUk0wZPFZOzVsgQXoTW1kLLMttl8lJ+SuGgAZuKyXZF
	a+z5k+xaDymWIwW+vsuijBomEFh2B2mcuoQp6g3Fy+lhEGkymFVtoMGKsjAI88LVW3ursbdaHWNcK
	aZfmwtmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIL-00000009ao7-2LuE;
	Sun, 05 Jul 2026 19:14:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIJ-00000009amB-1ndr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so15359245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278862; x=1783883662; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPcQkNch1dlro+P09FAFemSnMdYXsI9mjXSoWgS8Puc=;
        b=Ov6uqR3znrAnmsoL9CEl0W8GEdM+rQW4WuH+Dse8/kip9EbYARgUNNEVA7RGcZYq92
         dqQzgoRB1JYN3Ti0f3IMAObtYq9qcAHuExAyu52lNKX25nzEfKnFUdIeN6m89AmXqgwX
         ybWyd8qs9GEiyCtjrV4EQNEDDDW9f0W7Hr5TxVVlh/s07V5tFegZb1t0Cuc9YJ4U6xFk
         2CY+7ofc3SEcLyTt925RaTBWibvIMux9mGJbc/v7gcMHBRb7gvbzhxhQWAnptuJhpQIB
         ncjIhZf23xTIkaTzdXOw15onuu/RMmurNXx05vmIZ8msKvos0f+BSdqThlxG8KpuF/3q
         7Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278862; x=1783883662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPcQkNch1dlro+P09FAFemSnMdYXsI9mjXSoWgS8Puc=;
        b=PhuWgD/fpRU12YSG9xXNDmr5l6aizizB6rpWO4JtIN72VkcYP3bZOu3uYDvOMr/rIl
         mcMiSWkYZawEQa9npl5TexDUoUAndWcdtRNRbmONZDnYw1CJ+RBXROSv5BLXbYWddml7
         9o/EgWDNTYAti4O0nO9ISpEjgyqI0/V2hXLPm9PYxYY86u8JdRC+xbF9EzdpqVgfMWoh
         jzpqFz1S4OVtNbO67X1fJX9HlKr7DzjQBkS31Bkg7J59sxcsM03zrZZ42E9dRUeBnWcO
         WE2AoI87c1FUq4nme1CPaBoAMpJEi16ie+tihH5aqBBSbrVC3zi56RlJaW8dn7zb4CMO
         SPOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpceLhnKTOTZD21/e6Jj1XOUomdRSw3WYPXNlJwiRGveQ/C/EF/ymGZ4JGKeSjJtJIWCiUqLGpbKFAAHE7z1osV@lists.infradead.org
X-Gm-Message-State: AOJu0YwKWzqDMU1w8nytM/HbcexeS5Ai26jidfQyRcltp4lfiZFAqqd4
	y7RLKT9jT2fZjIYmC4rdqrYWjA22nv5e9YvSRRWroWCDYyXUKsE0OMY=
X-Gm-Gg: AfdE7cmyvytZJNghusJ9c3AZGBjgV9rtr9orXzKI/mFlM21n2COfXWUsK/8Kq42MFGN
	6OleJUh41R+fOBLY2ELXd2y9YuzcC1tjJhEenhn5pQBKRXKuzxAdZKPWlkEFz/hjplREfQul5y2
	RuTil6ImGAhPJOy0EITrqCbNW7xx0D2EnF81Ksr8AoDoMS9SmFwkppzuEpUHn9ppr+Neoe/yUYJ
	ISeDvxHomqIitOioEYYrppb3p93WUgZHjBQe9+3gSmav6+5eJjMtrDbMxDRlQQf9nRGZ/KkzJkO
	5DDk7hNqjVsUg4WcEiQU2dYL8oufNz/5dc845XjvPtbBcJRPuQE98yQ/bpqYHANn/XUeRmbt9yB
	/Tp79KbGLiSa/MlW+xbrAlKjKSGMOKmUiqqCAzvLNQDaL+zHvuJwUk2usqf/a/l4/VKSEVrac8e
	qbf1RmEKKY6bKx3FMC/PSV8kqpKF2p+Q==
X-Received: by 2002:a05:600c:3f0a:b0:493:bfad:9d99 with SMTP id 5b1f17b1804b1-493d11db690mr80342755e9.13.1783278861616;
        Sun, 05 Jul 2026 12:14:21 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:20 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:38 +0200
Subject: [PATCH RFC 04/13] arm64: dts: qcom: sm8650: move smmu sid 1 to new
 lpac device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-4-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1315;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=W9JuocKrQv+AohpUo+PmkcNR8I1xfDAl+4Cp7RFtojI=;
 b=kEwYPS/vxpnj4j1Y93tuTQI1VkpzxodgIkiDcPohzvaSRPC/w1pcsAEP4JHxHA84titeQ5f9H
 M3dIrUAZLjTC7VIAtRzh7eh4qQ+kjl3T5Nk55cOzsLMoPsgmplJk+HF
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121423_498710_8DE615BA 
X-CRM114-Status: GOOD (  12.81  )
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

Previously both SID 0 and 1 where associated with the same domain.

When LPAC is not used this is needed so firmware can acces memory when
initializing using the same page table as GFX.

To use LPAC however we need to move SID 1 to a different device.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..44e5f9d4b335 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4133,6 +4133,13 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		lpac: lpac@3d00000 {
+			compatible = "qcom,lpac";
+			reg = <0x0 0x03d00000 0x0 0x61000>;
+
+			iommus = <&adreno_smmu 1 0x0>;
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
@@ -4144,8 +4151,9 @@ gpu: gpu@3d00000 {
 
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
 
-			iommus = <&adreno_smmu 0 0x0>,
-				 <&adreno_smmu 1 0x0>;
+			iommus = <&adreno_smmu 0 0x0>;
+
+			qcom,lpac= <&lpac>;
 
 			operating-points-v2 = <&gpu_opp_table>;
 

-- 
2.54.0


