Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAB2CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jbpj7od+TV+IzXBxJrvElPKTl19Mzk+byoMNx/6qPFM=; b=YECPD29U/ucPZx
	ZA0Wv3w1tOwI5AacF5EVPEc2kCwn4xybpAMhz9VyWP3iqi4tYEjUWvB4eLz6TxmvL+QGP6C2ghyPS
	IZCzTpK0iC7288fCo2yXV11TAgpvlu/O4o4qBqC0zNZhmLtDcqmXvwPeSdr3K3CnONuQySEi+sT4L
	VkA7mh8SRcgMaL/Dnnvn3lLGyfX74MMRIKN8lYJEb5RB2UCMDYIrWBU9/Q43mx+gVRQcqH/yu23MJ
	VSint/wEfXSW2tsAVaR0d1Nu2P9KKfK/M/h8xnfjeVbW1qBfeyvxpgwB3SfVUKh8UtjuzfCLC9GVa
	BSZxv5RlsY61hzennuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RDI-000000018J4-1Zjk;
	Wed, 24 Sep 2025 15:15:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RDF-000000018HX-1QYB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:15:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so43973595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726919; x=1759331719; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbpj7od+TV+IzXBxJrvElPKTl19Mzk+byoMNx/6qPFM=;
        b=rdW8l+zuk1hoHpPozD/qPsMRR0xIvO6JEJjah799XT7PaXxTEA8R33Cug1cCwRalNx
         wu5t1DTRfBupzegC8DsgPchL1wvfovJwPLx1HztNj5QQUhqjOu1SarwVawAgF24pMmME
         f6nAAObDajCDJaDXL25W6QgURda4kNMc1aQ8ELpptVBkvS+lTQe0rgjaAfDTgL0r5x+M
         STEa4a5Qe88YfWaqaaRCdVXKmT/BWzniXD6w0VQf5SN6c+Fa428k3qFElSH8/28BM5xP
         GzOtoQOYjUxU9pZg6xVlV40/5cWUGEp/FmcZAMogRcG3f7voeJGP+ADqH0XmSRrUYJbl
         pNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726919; x=1759331719;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbpj7od+TV+IzXBxJrvElPKTl19Mzk+byoMNx/6qPFM=;
        b=UYVzoFikmTraTBsQw3DlOjMt1MP8Qrm1ruYzBuVe87Vp2MinIYndGdWC/ve9TFuxX2
         MEuU6A/R249FqZjjzfNG5pR7fgc0zLImHw9t3ag/0jE/XRCyOVxQZlafdotPVuTHaH61
         DEVM5u7E/toOdCF5yisQRuQlAfw7FQAtLnmr+RMl+ZG1L/OoD/AfYLK77SIZs04r0W1+
         1W7t3sDSgE9GIu66zGYecDxmZczvy2pwCzXQDLUdXxwVCYfNAjZHRBQll5zfeCbkU99K
         BUWvhOqjUmCRfbh3MozqAOfmXzpzkgz/PW+tW9M2/zf1394YtTUV6LJkVWxVDuac1HzB
         S98w==
X-Gm-Message-State: AOJu0YykGIKbfW/NliRdWqvpZ42HEsCQr7qAReElMwAIhSmNIjYxuPp1
	K6yNoJ7MgvauxxvFJOJ/Dp7ZlLNtSVJiDWWuxNWx9YEVmrl+ZRIkPItEZu/lM40OuNk=
X-Gm-Gg: ASbGncsZB2hWL0TLqtbSOvoZW8PBTuLTSKJxZzfgR089jBFt7BRJkLqWYMvuIfklfmo
	CEb9OHSIuLNZk39Q4G3D3ctu2r8QRO5pxlISscl+sQRUMQGtrIjdxPBpvF7E/rKnZ4A/k0WoheK
	NscQ48pC/WBa8CuhtGrZg1xTx0XKIC/7bLIf5fQwAWfdSl0yjaQSx6xqpvGz3Xa+Qb2p7IlHQme
	+c9/sAs3gk9lVV7FTb3xbQ72DH81G+FMsxjfdfOBGt0iQ4eP1MV+c2FZGGS0nexzLGL5AKSA9SY
	EhDLne+iGmoIHKxl0B9fqNBFF0x5Je841beRNdvEi4/ZP4D6kMnsycdmBYNtM5boDLSqVFbNyfn
	7xqAFsNRwXpVoXAeSrfJycF4u85A+9+kxSW/JZfaCEhp3iQsEHGtQsUOfs1nQYdUieGuSJTOOUR
	I=
X-Google-Smtp-Source: AGHT+IEIcfDqKrBiciMrBL2BnTBcgOSqblrqMr6nWvMZe5xfLOYpgYG9knlnJMKE7RPGTu6ZiHxPvw==
X-Received: by 2002:a05:600c:a43:b0:46d:d949:daba with SMTP id 5b1f17b1804b1-46e329a7fe3mr2802315e9.4.1758726919462;
        Wed, 24 Sep 2025 08:15:19 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996bf1sm36541855e9.1.2025.09.24.08.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:15:18 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/3] arm64: dts: exynos: gs101: add cpufreq support
Date: Wed, 24 Sep 2025 15:14:40 +0000
Message-Id: <20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAK1GgC/3XMTQ7CIBhF0a0YxmL4teDIfRgHBb62JFoaaIim6
 d6lnag1Dt9Lzp1QgughodNuQhGyTz70ZYj9Dtmu7lvA3pWNGGGSKKpxbYc7drlJ2I2YHI2ttDD
 OWocKGSI0/rHmLteyO5/GEJ9rPdPl/RPKFBMsgCujpSDKivPN93UMhxBbtJQy+9Cs2mhWNFDHl
 CaOMvOr+VtrwjeaF90wQaQGaZ2WX3qe5xd3S12JJQEAAA==
X-Change-ID: 20250819-acpm-dvfs-dt-06bc794bdccd
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726918; l=1425;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=bhWNtW8YfXRFrgAGBa8Pe/LU7bIl4qECaoks+lgJxd0=;
 b=nc/cwrihP0XJJ/99OHcjZsa0WdK1sLevklpPI/Gmh2co9jIBvtLyBkmkIkXMC9i0kAKCg/GHU
 eBlAnjokIYaCeA9SWUwuE0fuigcuV8LgtunmknD2H4uHaDlwYnqSkpe
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_081521_405722_3EE72A3D 
X-CRM114-Status: UNSURE (   9.39  )
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

Define the CPU clocks and OPPs.

Patch #2 has a dependency on the ACPM clock bindings sent at:
https://lore.kernel.org/linux-samsung-soc/20250924-acpm-clk-v5-1-4cca1fadd00d@linaro.org/T/#u

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v4:
- update clock-latency-ns from 5ms to 500us (recent downstream change)
- collect Peter's R-b and T-b tags
- Link to v3: https://lore.kernel.org/r/20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org

Changes in v3:
- the ACPM clock bindings were moved to their own file, update the
  references accordingly.
- Link to v2: https://lore.kernel.org/r/20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org

Changes in v2:
- acpm node becomes a clock provider.
- reword commit message, extend cover letter with info about dependency
  on a bindings patch.
- Link to v1: https://lore.kernel.org/r/20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org

---
Tudor Ambarus (3):
      arm64: dts: exynos: gs101: add #clock-cells to the ACPM protocol node
      arm64: dts: exynos: gs101: add CPU clocks
      arm64: dts: exynos: gs101: add OPPs

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 285 +++++++++++++++++++++++++++
 1 file changed, 285 insertions(+)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250819-acpm-dvfs-dt-06bc794bdccd

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


