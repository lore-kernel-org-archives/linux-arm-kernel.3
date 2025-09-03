Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA5ECA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 19:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXbwYHHwDtZG7uyxiQ/Fmn5Mt+BEh2eODNORnfwMtFM=; b=cjhSlMrs7btszCuRo41KQErCiD
	CxbwmJyGYB802cBG8Xk/sHNM23oqRVvoNuyOLMroZTk66j3m8DlfYoicYw4B82iEejCabYxQoZjYq
	ar/tUdkccQ/jutrpKAVgUTnFsFSn+kwJt7rhqisiLDfaoeejVSWpugHC4x4zgDbm1oe77dhRnBSGX
	lOuFUaXLhNxQDaekdh7NnXySTpFZI8h+ortTtA7QnS7bt8DFiCiKKvgiHMSSnutdfUW26yT/60EmM
	XV8PicfoirCR7avvni0rUDJHvahgOZYqlSWdPEd7XarD7jfpBeeEBalKtIGMAlf6/tFBdVfKKKekR
	0hPMF7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsv0-00000007Q2w-3u4B;
	Wed, 03 Sep 2025 19:13:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utoPh-00000006j6a-0sJd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:24:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3cf991e8bb8so3351492f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756909480; x=1757514280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXbwYHHwDtZG7uyxiQ/Fmn5Mt+BEh2eODNORnfwMtFM=;
        b=Sxgju0MjWICWbgtozcRqu+2loxVZFsA3e92iGrnNC37eZKhhVFbvElXMGTphk/G7Px
         QN4wgJ87N9JfaermgFCELJ7djT6+IyDbXTqTYngyXx0O3mModEQl7LJ5iTliyLYII9kU
         FXT5utOal0qyQGQs2bQoV1w/3zppry2JuUYTxBkJv00aAHJHaOGPVNvB1f+v2KcsjfPz
         tZVhWxd9sHXa0CPLGMQ5XcVEhhFs81ekZZR2V5y6x/LVoNUu82PljuEm/yKR/T+dxSSQ
         qYLGamULCwVBJC4DY5lAK3YWKZbIHgkinnMAYtiRpd4HzaMix5nhXRapijcuPBEKG6Ry
         vYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909480; x=1757514280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXbwYHHwDtZG7uyxiQ/Fmn5Mt+BEh2eODNORnfwMtFM=;
        b=l84ib922TtpupRYHHfjaT3/hDc39YFC7x1c0muKVkld0brOguroe0/vaLyjreeem1e
         FkwAhFc4dAJJLe2+WH8cJ1EZFJMmRQfHjsNr+XJ0Jx0A6ia72umheNI8q93+sP58jwsj
         vII8ZUpR4xkhAqEkfnSjfmjcvBWsrda8mXq2iYsoIoEb8RlXWNk3aWe8N9/KhKMKRv3K
         Sha2ZXz8Jkl4SXgHsuWmedb4ltP/CQ4LMVNXM+OYknwi0VfoWn+Fl8QJq2g9nwJoeVal
         PvWyAcs6gpgKZuE7ZudjATGtvlLlcePz5g17qvJZ8xv0sa2nPI8lokRFrc+T8Tb+FYLv
         oj/w==
X-Gm-Message-State: AOJu0YxneiC/TIeeB3g/Y0Pcok+CYF/wZCTDroGv0+fu++7a8Kaxlq5l
	LGCcd5qPpMfRgZzo5zMwhBWm4rVNo4wgWwA3qaNLOdq61peRjCPsH1HHlLIVjmN+ukw=
X-Gm-Gg: ASbGnct5erSpNXmwB/ey/A/3WSBL720flCohiPx4m6b/9xj29vafN/LeHUWJ1L4c1nn
	qClCXkH2SfAYt/aJYUhMymmJ9Z8bNqXVbiIBRwdDKalorurkD6cYOYXjM8TK/KNIdzJjQLLhpaY
	jm+runUpBD/47+G0FziLeoZS7l6UN0lDkl7xEm1LMuPxRfWi5EqiJXhS5f4owuZjPxmycxiiFCs
	UO9voLRso5Nte8yqBUCMDAsAMBeivjxCQyg/uQWhsoRRP3jgwAn5rfv5DWbj9RstbFalFMaGPRR
	+ZdfXmR/1uSk+7qZ4tT//f+qSm4o6/ZK7FQ9F6CwR/ssvmZRKCs0Ou131nkAq2EEwWHCfLej3c1
	tOhUor+ZPI9sZt7+ntr+mn96clY03N7nEE3WApW8XnlW4T+b/W8+Q/rFmWvaJ+NsY8vT2+1ZNMB
	3Drg==
X-Google-Smtp-Source: AGHT+IGElUVvAdnTLsoSyPE4S7KSi1NXgc85bTjMPXuYMbOZdz2o4+8xSGY8r8pqxR543TVqoUC2FQ==
X-Received: by 2002:a05:6000:1884:b0:3d8:7c6e:8ad4 with SMTP id ffacd0b85a97d-3d87c6e9003mr8330251f8f.10.1756909479612;
        Wed, 03 Sep 2025 07:24:39 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm3996035f8f.33.2025.09.03.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:24:39 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 14:24:35 +0000
Subject: [PATCH v3 1/3] arm64: dts: exynos: gs101: add #clock-cells to the
 ACPM protocol node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-dvfs-dt-v3-1-f24059e5cd95@linaro.org>
References: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
In-Reply-To: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756909477; l=858;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=O0ZaIGzNEXwrghncj9YNIJwIZXgEV0h6GP+O9Ob9bCc=;
 b=Vo6WkR/E//OV0DsTSlpds8sKzQhNQBSu+HqfP4AtDKHJiLDyc7STDizBG48Nhd4baH1I3LEcE
 1EAmsYRXET3B43eHFQZqaTcqLTcXr2LlCFSs8nmManOhkxRVzbBznF4
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_072441_252442_A0F15E9B 
X-CRM114-Status: GOOD (  10.59  )
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

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference
its clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c0f8c25861a9ddb5bbd256b62c66a645922ca74e..f00754692bbac39fd828ebd4ef7c269f746f2522 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -202,6 +202,7 @@ ext_200m: clock-2 {
 	firmware {
 		acpm_ipc: power-management {
 			compatible = "google,gs101-acpm-ipc";
+			#clock-cells = <1>;
 			mboxes = <&ap2apm_mailbox>;
 			shmem = <&apm_sram>;
 		};

-- 
2.51.0.338.gd7d06c2dae-goog


