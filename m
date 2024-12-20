Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F74E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRqWQ9kuH5smVaJB9GZ9PXPUlnPdZKZchIBVzev3PSQ=; b=3lrvcicQ4XGFY2oKVX0/WK5BeZ
	4n8KITsd2GBKX4hreVEK180T4P7UWx150rhegrGoigeHDZZ2Cpdm6O6o6kav6I9As4plFeTNw75IY
	NwyL0tiudN3as5Jgj3bblD/WvV1/vIfDQoE5tCdVhiPc4pAPGe1+iQCg11OX7ahzwXWp+w0tIgmr8
	znRCBdPxHPkR9oVXKFoQ51JRx5/N95gnrQ1fy7VVdBppWPxm+zln3pmSNYhbzJN2t4hlRjbrH4oNL
	NWb4juYwEjc7MuCctRj+x9wwDZuICQWf/Pj5P5M+U/KlPryvMOOlW891vcnzpb3EtpU5vX4TTZBWS
	K0zcJwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeN9-00000005E0g-1sEO;
	Fri, 20 Dec 2024 14:52:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeGP-00000005BiY-3j8h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:46:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so1168605f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705960; x=1735310760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRqWQ9kuH5smVaJB9GZ9PXPUlnPdZKZchIBVzev3PSQ=;
        b=y0ZNZ05SwhPedgix9mUNwvxu4RjThmgBmuLug5LEGWyV7Ar9tlMVab/mBxtMSEOgYz
         7qj9JyVbj7lt46SpSK+5IlTgx6md+EOc0yXG1RtFvjsMJBNhutXRv516zPLH+KdeqgZH
         3V69mIVKeK8iH3VmrMK7UTlVgFJ5TDJ2s6K0ydMcIsEvnO/Ep6JXzqmT4YbMgW6eri5l
         xB3xM5DuUk+rhp1ZZbHnSR2fNtd74sPApaKEz4eJWg6H02tkYx/fWMDBB0Bk4tuiUjxA
         nTmq7gsmVxAraFZy7im/18GRCYCrPxjI57fCivvGq4PuUkfRNPJUidVZxUANnq4liDP/
         72vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705960; x=1735310760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRqWQ9kuH5smVaJB9GZ9PXPUlnPdZKZchIBVzev3PSQ=;
        b=NO/4S3M3Nh9C7M7dvEycKzyVYHCz9fvocvcjR1F+FO8csMxb6bNNf20GjuiaeoxC8+
         Y1PvSQ1A5zMomiJIrcnqsxOXkCLVZ4iguKSOet3WGm68BUMP5jurDxjYtoKoceCqA/ym
         vduu4NkFg87LnzjuNZqJ+djM1kjLhHVTIT2b2QAmJQ70fHsRoXe1fhjjksF5+Dv2Ls4X
         77oq6YlXJXYtqZS3jXD3O91b4PvwnNKb3Z4umkxt05ABGpr5Kc2Y6B0L/pR4rFK3Qbfp
         RY58QQsLq2Zb6l2ll+1+rXF85AE+Uk4eIsOMPS+Z26K8SjuPlSLGDkSTqZV+viEVCSps
         xHcg==
X-Gm-Message-State: AOJu0YzYSz6Y/0B8IfCamsEdx+2IrUPW6ubV52XDoAIU47U5pR0VT8Jj
	LjJyqLwQekme/Wvt3fQcJeFLpFlZ8p1B8q69qXXRjj0e6wAi9Hlv1SLM2A8c55c=
X-Gm-Gg: ASbGncvadRZN5JDyQEIFhZJz0OKHHsAQ64X2A0oT1PbFVpzmH8HIRWEmiXqhz+0yW9k
	dlQDfcGyl2WL2MsIR10wLKnJacSw9wHX/30pfWS33y6cjDfRR2EWoeaMOcjyWxURPdXch1OO1tc
	m3GpCgHOAupY4OjfRsnwO6bRY7cQQuAg3yQTPTLrDjm8N6o+jYTG/eno6qjslNZ/IrVXdw03w8O
	jydVjBTB3PHXmanELbd/hTLgiq89Vuc7BTNFtxqLQMjH5htLMUUQlgDTj8+/C6bLf8DPER0Hj1V
	UKajJVrTLaeJBrygJJrDdTbvHHoCcvFhkiJF
X-Google-Smtp-Source: AGHT+IGTa4AymaocDQHTU1ovTmqG12Q6/ra0E3vms/hl6zSMw0VKvp/iKmrVp1auYP0DQmQ0Vh1dsw==
X-Received: by 2002:a05:6000:2a1:b0:385:f060:b7fc with SMTP id ffacd0b85a97d-38a221fee1amr3215271f8f.25.1734705960152;
        Fri, 20 Dec 2024 06:46:00 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm4227874f8f.44.2024.12.20.06.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:45:59 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 14:45:47 +0000
Subject: [PATCH v3 4/4] arm64: defconfig: enable ACPM protocol and Exynos
 mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-gs101-acpm-dt-v3-4-642d64daa5d1@linaro.org>
References: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
In-Reply-To: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734705955; l=1030;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=QNflK95J1oyB5GCiuNhKyRcaPvjpw4cTQ+4gOGCRcP0=;
 b=vMDlLV8zkiu0QyCRA1oLZkqsQZqt82J/23WzoFyTba2TkjJ/xdmEoZm0WpCiRzh9wxG2vYg40
 X/OKV9w9QumBwzhDsMK2KNl0vJ1zLENtCaQz3xOvrcCmH9So5edlr+z
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_064601_944011_170B0F1E 
X-CRM114-Status: UNSURE (   9.22  )
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

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..91139b1cf813 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -262,6 +262,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1378,6 +1379,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y

-- 
2.47.1.613.gc27f4b7a9f-goog


