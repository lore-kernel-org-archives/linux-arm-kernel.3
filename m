Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58FDC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBnb62S3pox4azVRKerhjkKWZjHIp9f0CrUrLIrizHI=; b=f8T57ytXe9gNgyaYKOmosJvc2G
	9E9cWmPaseaHEGmawjs7WaG3MIgPVHURLV9QuYftrz5oKQ8Lt9lyA4Iv9SL1T6Tr3yoHqJtSesY1d
	NXTVRF7B8oKBpJyjO+MQvCTDgTQgn482kzp/n6wU+jnQCyg+DC9Z+SMeVgdDXhVqXcy0pZqwbkcOz
	sABbz/Cu4oSY0CM6IjsFoYSaZ2x7LaHptqgqI3z0b1fK4KLdNV6dx4JdX+hMljxAFrvNZ02dF9kac
	HpHLXbq8GboV+eEvu6K7MC9nZeDWG6S+4f8yQW9CPGuYAYiDF+RMacYNxvAxISRnhwqXdEFPGoZPp
	qMQKb/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIU-00000009ayP-2iCH;
	Sun, 05 Jul 2026 19:14:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIR-00000009asg-0JAa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1540213f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278869; x=1783883669; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBnb62S3pox4azVRKerhjkKWZjHIp9f0CrUrLIrizHI=;
        b=Ol6wFRnjCfHMDauhMBqMBUko4k9eoFzVWz6hM4vCPwUO8O5qHm0HHVS8KFxvFTiWfA
         5aHn6FIDy6629uXEUq1tH3RlugkNWuFg/vOVS+DhWKdgMsi/VHl59QZtSTRXbaxJqi5Y
         FuEJUXyIoX3laxgjvH3Cm9YuMHJiV/qn8YDEDPX3gvkRCrN0PJlNzZA4sr8NelpocZkv
         jFlY7VdyTQ6Ix1jbiWMyu+MELkT2Z8APUqu/mtbVTPOdPgZFpvzgztw8p/VpJ+Havy1l
         945QJG+kOu+DnxR5dnV4PeolS02Vrwp4F6moYARFKbK7DzMUNUI+ZiWsQ5l724FgxbJE
         gJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278869; x=1783883669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rBnb62S3pox4azVRKerhjkKWZjHIp9f0CrUrLIrizHI=;
        b=OJPrKEHrmM4SLRdZA8gBcdj3W4VRqmoAEptAPqWLxxq6euegflejxk1m2UoLywn2eO
         R75IJ+BejjzRplCbrQIqR5/cXYhu5ew41x2yxyND/nulI9bxAPc1DisCQw39YwpowffP
         R3UN1BqMST5DRddxmnrduN8ibr2OOmSp7RKhvYzSaaZn14PFH8C7FLwOhprtTk5AqHzQ
         77gNxce0xSDKiOPQE5pudT7stBy0F1Jw0/moAlzUuWDY222LXFayCTjMRh/Vugxnqeso
         67cCXeA3VNVcBgMUUEKKghBrZMnfk+/qS2fuFuDqYatfluil7rE51g6pciZuGs+Hdun1
         wFAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQKgDNvQIzRTatkwnIcAkn6FpDfAf9NDFUY2NHbl4pw3Nl/OfiDoGmVhPzowytBOAaf8otv0qN6r9c8HaJxfpF@lists.infradead.org
X-Gm-Message-State: AOJu0YzAKL6evdasgfJTQ17zBEnMgxXl3YS1ApfeMxvLlJpm100TrUJs
	XsVCzY+a07oqH4Q3YIZNzQAqRbCNmR4ZSHeEhglPf/wSv3Q8BnP8Dts=
X-Gm-Gg: AfdE7clEB7YLvzdnYxCyZUBVzjT3JXODnrceT52Wwo+aG23g0msQz4XLcT/QLzRQzpF
	/+MGis1Y60XjevRiYfM942E08JeACbA01/GDrqxnLMLk1mH3rsWZW70MOei6K7PUDlq5IejiUiL
	nXkfsqY4TUCBiBQF11/qZkl9u9S9O/5LmdLceB8gm8BzrzXeRchnt7t6vYaSrUhS4CnUWNbCOuH
	AAznXamzJ5XX14xYjTMi4Tb15m8bh/PjtdtoAUJiCoOCHxdVoChOFIzVvyna+0wOx3TqrOEMWP9
	/mzJPWAkBq961IEf7VYKANc7XblOuNu8o72CMYlpaXBg1k/PdT+djawz9n8mQobevkTjHHe8WSi
	wrZJhV0Sqhx1rbBsTAmbGJ1XXY5C8zMrr6f6aZfVayy5hwKzgDmdtY3BSE3URt9Z1j+xejs0daG
	cBQva1jIvX1y/faIaju0QOGmr2eDU/oA==
X-Received: by 2002:a5d:4530:0:b0:472:28f2:506c with SMTP id ffacd0b85a97d-4793561c1b7mr10294287f8f.13.1783278869284;
        Sun, 05 Jul 2026 12:14:29 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:28 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:42 +0200
Subject: [PATCH RFC 08/13] HACK: use cb1 address in lpac dtb node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-8-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1103;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=lEQBWGFQsawhS3Z+empPXIW4pjOUFPTBX61IJG+8wpQ=;
 b=ghyBtO3mPmOZCBw2AnqYHPShuXdJyTE+gTcOSZ9YU5rU1L9CLwjDKC2Kyv3ZqsOQvXyq+rMJb
 aTedKIXba75Aenv0imb3SDNfjufYxVMYzOkJYRnVags1gnQPFh42M4o
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121431_141328_5D52DE15 
X-CRM114-Status: GOOD (  10.05  )
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

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 44e5f9d4b335..66ea9155e228 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4133,13 +4133,6 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
-		lpac: lpac@3d00000 {
-			compatible = "qcom,lpac";
-			reg = <0x0 0x03d00000 0x0 0x61000>;
-
-			iommus = <&adreno_smmu 1 0x0>;
-		};
-
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
@@ -4254,6 +4247,13 @@ opp-834000000 {
 			};
 		};
 
+		lpac: lpac@3dc1000 {
+			compatible = "qcom,lpac";
+			reg = <0x0 0x03d00000 0x0 0x61000>;
+
+			iommus = <&adreno_smmu 1 0x0>;
+		};
+
 		gmu: gmu@3d6a000 {
 			compatible = "qcom,adreno-gmu-750.1", "qcom,adreno-gmu";
 			reg = <0x0 0x03d6a000 0x0 0x35000>,

-- 
2.54.0


