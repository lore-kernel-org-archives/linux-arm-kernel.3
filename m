Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CE8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OqueOt3m+Hz5NDiZkEdxcD3dFeoon3Sxm9uk7ivrbRM=; b=VmKJAjFDPCCY4E
	0hOpWsvvPbc1rLS9weWF65oZsakfnCaj7cReCIgD8iGdOQwRh+Vgp7TdwhZXW7mhtaa06nWvdgPDK
	WmcbPOGT7sR33r/8GmIOaaPeduBGrF0tLCgAQc/8p084u+q73/P58SWRHxXRAi7C8LVimLhNIEkai
	AEDeQQp5QdDLmCp5FRC9idoiJr7dh5BFLEwGDBsSN37Gd5RY3J1MZOuuawKxCuyuYnmaX2oBHr3RN
	BCLuYDFiTEIlo5ev1pcJeylibKdgFHQqALByTKf4+/HLMktMb1hja2iLLFMIyXWs7v31WUluJXx8G
	96un/EjobtA0QwrxKjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmZJ-000000015hu-2gZY;
	Thu, 12 Dec 2024 17:01:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlcQ-00000000ryP-28Iv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:00:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso5663415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734019248; x=1734624048; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OqueOt3m+Hz5NDiZkEdxcD3dFeoon3Sxm9uk7ivrbRM=;
        b=cqbjZxiG/KwkTO0ltIBHfoIgK1l2x0cQ6M0NOzzm8e788IBD/m2hBPXvdnTZ+hLLpq
         FjCD0FlbYGiEDttZIxW98LO/2Oa7mMnymY/co8UR79FLvRxkv+Gm8W3WbAuScGA8ij+v
         hrL6PhITiN2UmCjZR2LmGc5U3u2oGSVtkGyM5uoRFI8h2MEVxA+8qR94gYwiglf1Rvli
         8az7fLu3+WK16Ktk1BaGNbSXIOWWbHKVHFK+YysVzxY8v/vqMoIPPBNGARTsve+YM9eP
         cI1qbgjCNCBQvQcms7qQqmshdHL0/4jYuBfXvHrPGGUG/tGmLDVOlotr7FvnlGZm3w0e
         NhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019248; x=1734624048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqueOt3m+Hz5NDiZkEdxcD3dFeoon3Sxm9uk7ivrbRM=;
        b=DxFc8JvGOfNXkF+l2WRBzl9kQOw4kmzgpbZ2oMsXNiD4ZMrSiHr7fqON45Gn0kjzVZ
         Cg7x45XjjVE+BzOIYrnZHeGhNdlBxqY+v0XNw+5CciPFTj6lE2jf8WmuKF6v7gGyW0Yb
         4LDYtOFhgMo9Z3urL17I6BtLkPxZUz7Umf3GJlOyzVFNkH9RrIoFL70D//kGmwQIIbsB
         LF8bq8FBPTCBMh+Apb7vtvZZA5e46wsYnB5fPl9xhFog2TfVzG2hfw7oZE0a2K0ydmQC
         3cnzIn7idW//wst3KIn7Q61Jm7hR+5h+ofDED6NxAaxVebX9IHsmpzUk02nU3+DYgwYs
         TKTg==
X-Gm-Message-State: AOJu0YyGMguA2D8/lxxrxU0JDTeYWYv1REWxozn473zWwB888OzNRRFk
	cmZvd0j7Gm9aC7KEp551efhBCQv+5uKJy/eiJq+0e5stig/vLqHMLrHZx4ZvhIQ=
X-Gm-Gg: ASbGnctXCla1xhOxJuJK724zD9s10RmUC0uBIbOLUK3hW3q9RoF6RiBMgoSqbhNSquM
	T7/ElwUF3AGu+FbL6/QMRL3Qm50HSEFxbxh95gXcgzm0NA1Xg8FAcz+kbyfvVYMSTd6n7J8oWwt
	fHzE9ILbSJiGmOISxFqTXO7AMyF/fcouXX+iarGVxJi2D+01Ew7IYU5ywoGbcsrFqW4YvhdI047
	0pUv3tzis3FTA+COqyGJp0YsUb+mSEI9riTk7KFXBq4m7E8frZ7o95ddUY7d+5nZ1pIX6uL/nTp
	ALrj0hBmjzgisd4bhKa/Ot2u1kSQ8dQRaw==
X-Google-Smtp-Source: AGHT+IEO8F14DLA6a9uq51Fn4E/i11A1F4D4K6m8q0VdStEpDipMvlbI8LBPnMinLyLtzeI1CSuDpg==
X-Received: by 2002:a05:600c:4f11:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-4361c3976ffmr61803215e9.19.1734019248210;
        Thu, 12 Dec 2024 08:00:48 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm4462941f8f.74.2024.12.12.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:00:47 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/4] arm64: exynos: gs101: add ACPM related nodes
Date: Thu, 12 Dec 2024 16:00:37 +0000
Message-Id: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKUIW2cC/x3MMQ6DMAxA0asgz7UU3KhDr4IYnMRQD9Aopggpy
 t0bMb7h/womRcXgPVQocqrpd++gxwDxw/sqqKkbyJEfaSQMHjnmDU+Pv2xHEd4wHYa0RBde/Aw
 hMfQ6F1n0us/T3NofDngjvWkAAAA=
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734019247; l=1387;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gPZKjY/Cv6dqyLwE285RezILuvSeCSXXgwbDcAwcRGE=;
 b=hZ8flcnYPQV3TsFaQwLja8Fw09eEAZUxRLkGCgisxH6sMxSgluJopwrXKflaZZNoFnCvdGKQi
 Kz9nhpbJs61DlRKVpDVEdcXwIY5mz7OEpQOlEU6cijK4KqS3rNlA0dw
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_080050_556057_29796458 
X-CRM114-Status: UNSURE (   7.52  )
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

Define SRAM, mailbox and ACPM protocol in device tree.
Enable the mailbox and ACPM protocol in defconfig.

Use a constant for the channel type until the bindings header file gets
queued. Bindings and driver changes at:
Link: https://lore.kernel.org/all/20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org/
Link: https://lore.kernel.org/all/20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org/

Changes in v2:
- update nodes based on the bindings updates
- update mailbox and power-management (mailbox client) nodes to specify
  channel type (doorbell or data) and channel ID.

v1:
Link: https://lore.kernel.org/linux-arm-kernel/20241205180200.203146-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      arm64: dts: exynos: gs101: add SRAM node
      arm64: dts: exynos: gs101: add AP to APM mailbox node
      arm64: dts: exynos: gs101: add ACPM protocol node
      arm64: defconfig: enable ACPM protocol and Exynos mailbox

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 39 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                 |  2 ++
 2 files changed, 41 insertions(+)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241212-b4-acpm-v4-upstream-dts-2fc0b6a3bbda

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


