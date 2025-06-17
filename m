Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447CDC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CV8mc/E0A+rPFjLDN5GDkaclgYEmX3SItNdHdGCGzKo=; b=Znrte+4hKWQswHcU1q3GAXZ19y
	bRDrGZCZxIi8VJ25CQxEoFRVqkP89LQxcY5Q9ucVv4ExLqzMJ6ikYCAY2U8XuI/pfSqv1oYZ8ArVI
	FvnfoLJczTky0kjDvSINo9Mc5Q7CtfERUMfIGRxIF3W4n7o/uDV7G8wlOARnmtivMvqWt3VL7teLA
	VIf6PAxI17cgbDgWuEXr+gEqZLxdPqG4zbCFGDmE2J3yBnw95o3QWRln7iwsFBzBcU26/JPiV6gwm
	3qIECPARO9+R2k+xSOsOuUzCQo5B2qQqLvWqCQJPUal7IUm9nRYwQ084E5Md1omZ4xvZQzotuTQn3
	Fiq9NAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXD7-00000007X9l-16SC;
	Tue, 17 Jun 2025 14:22:49 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWcm-00000007P7v-2jHv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:45:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-453398e90e9so31044855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167915; x=1750772715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV8mc/E0A+rPFjLDN5GDkaclgYEmX3SItNdHdGCGzKo=;
        b=S4YARAZmLQaNnhzBuS9U03Cg4ANSUsuA81V2lX+9WZO6TTyky34kA1zFx/9YP9tR87
         R15i4brsZ7S31BtxAuBmofYUq/vPg7XsTQ71KSI7Oigq7c77NSxlyIxLGeE8knqYox05
         8nEQVxsUh/xmM7o/i+0j5085z+qH5jMayjEpIwnyOtOn7MfOv0FDaxQYNXkLbn4WMpxV
         nSWDN06U8aDmUojVBuaKHrbu4KpzOjb+3TJj/w8nYaTrmLYm9VIIdX08LERToRmp48Ad
         Z2x6WyKa7TV5sdNa2jqeGIcggAy5mpOla1pGT7DawCOg0iyekBTfjyBV+dRsWurRJ5zT
         tcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167915; x=1750772715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV8mc/E0A+rPFjLDN5GDkaclgYEmX3SItNdHdGCGzKo=;
        b=QuBmCXnfwy/T1EBWbgt1WuV0bkXnBPuvywDkbjix+h33pqenEL05cfp3R5uTTzsWl3
         dm1/BrF+0JqWIiQ/JLvzf0DCoT0QCWukADi5fs28vnH1fJOCTlGiOtLm2Uqqwk3V2xoL
         a20j2LjxIPW5sle3f3nlha8MhVp1slf+qXJLA4M280U8JXb88Jls4cBiIy0jiBErCsx3
         413iTVSSVcCR9/tJhHvLRWyqT7PDoSXfEElJAU4CYp87nJimqP/a+y9wJJgNjXTSRmZq
         OlbuQ08v9CxYIOdf3ZWWlXfFn+HSbBZe70lhcK6BJ+Q31CZmu7KCmMCYE2GnHyBFUUHV
         lcUA==
X-Gm-Message-State: AOJu0Yy+SUbyJoNcl9fpYoXHlL1NyGEU1/8VgItjFYkKv/gbJ+PGHzxZ
	bkIysvtn999Nd0sYrV7OudufCJyEMcGev1xz5yHLEEmoqe0M2HDUuiz/
X-Gm-Gg: ASbGncvmIzup/1l+eqcC5JmBnjKve0yOHhWCapRlRRu7byhSCxic3H+zM2Fbcsru/sQ
	Et2r5wDLxYo2cX+RHkdf5h0pBq1Of0AwJ1ISrj1XDViEa11cMg0ujpxH/9PkSDYtZuf4sjw8WsW
	L8bAR4A9tc/+XyDWuykxE558gB4iAJbB8SqrlxX39zwsYUYDJR+caJ4hORbJSjWBw5yY6Aujr35
	Mybc6ESkGkPjwfQIRCCdeCwnR0UicJYFbO7CLoWBgf7j2Z31ipyw4arm/Dfrx3L+sB4c5S+VfF6
	DqSWpRhNKO9v4aCpUK2zGw4Yaqbhu3Yy5NJc0LFVYTC8QAtmyCIsr95+0q/Jmp2xmUS0vIWh/Fx
	4th+8JaQd2TQ=
X-Google-Smtp-Source: AGHT+IGoVGmy+0cBQSC3INJh3nwC+DMd3BPjaS1S/WZ+Jo80+/MgZyl3Q2iBu4iR7criuZ+EScQZJQ==
X-Received: by 2002:a05:600c:8b8b:b0:450:d3b9:4b96 with SMTP id 5b1f17b1804b1-4533cae9345mr155234975e9.13.1750167914854;
        Tue, 17 Jun 2025 06:45:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 7/7] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
Date: Tue, 17 Jun 2025 14:45:04 +0100
Message-ID: <20250617134504.126313-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_064516_688047_093FF77C 
X-CRM114-Status: UNSURE (   9.42  )
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

From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 96e21d458867..937ec08cb859 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -495,6 +495,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RSCI=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
-- 
2.49.0


