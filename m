Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D321CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ie1f/VjDyAptInpGdNWMqZ31v2yZSYdvuR+Tc8cHCdE=; b=TJOdjn7O5AMETH
	/uSG0gMhor3xQDMMeeAwjPDGMTpzWPmU7tP6W8MOxZfBBNi9BfjQIAN4TlVmJ4NPWNEQIMsOd8SPA
	QaOgEay0cNYLHfl+hMa93kmCC/ITmBY+3IT4QyurDCzQZVdgVECfeDJhSC65EG4KghUH3hIqe4mBq
	cNzEhJyVgyeEvqAYVRbGjpjH+HIl3+JOIfwQlfI5+H48FNDhQ2uCnd47wvrkjMowlZebwiATx7tgy
	HSkdDW9Vncmau+A6L6W+ZReqx/JbVIH2OcXAN7nQ8XUYsQH8P7HryyPl6kQT/12bvfSAxwUAHTX51
	iiBpyFypjHiMD0Vi9wsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNaV-0000000An5m-1uW6;
	Tue, 19 Aug 2025 14:45:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLAd-0000000AO6K-2W5w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:10:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45a1b00797dso35026025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605430; x=1756210230; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ie1f/VjDyAptInpGdNWMqZ31v2yZSYdvuR+Tc8cHCdE=;
        b=jbms7JCnEa2yUdH6n9AfdPLBlFi2n4gpvf4JdjLpCLOq5prO2zMPyuHmZ+6m5oZcFo
         yFipRjbDhgVxRQFub6iU8PdVHjto5s65YRmWgREn7WOQ2jrvvoYvYAViwvRWGqdJ/oFY
         OjGr+AG3x+fUSi/EPePOogMBdgVsZ+PWCD0NvcN0uXlLR7QT5f97MnWDx6q6wzcWaJB3
         sdz8hqkXAzTbIPFvikJj7Eyty8uPYaeHlLvN8CwCULAhPjs8Kw6OsUFeZk3bhTj+BWcb
         tmFh1TL6nz3nWvbdazfPM7RAfn/bFnlV0ZIrMFeRoD9Ra672X3oBo2HzMXlFv6McvycZ
         p1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605430; x=1756210230;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ie1f/VjDyAptInpGdNWMqZ31v2yZSYdvuR+Tc8cHCdE=;
        b=ueqdi2idubwlg8Jtop9hjXCdGFZjoD8cpkjAngFVuZb4v5KwrlA6V147YouhmEljTy
         WSLVt25ApiSh9hk5wDH5g+Bzv62ZZgwW5BA9rYzxFck4eNksxAz9eB6L0k43NqqyvlrA
         pcfIlfaJxXAyVn+mpmyAHkEnRCzPCkDORxuNHV7U8cyS9cezZYao2OhG8ZEJB13kW7sf
         JHkTXgf/nFYvb+4HNMsfMWLQol6ZSQklGt+IJ0J6CWvghFHB9Wyf41PydEIY5gpwAxxd
         RjIYX6mIo8p9TNvY55YmXEof4WBZhIzz52pnvlXxox1KpnHR21rIIzOBrHnHRoJq553X
         WiCg==
X-Gm-Message-State: AOJu0YxN6kq4deeVG9VSYgd2GXFka3anzKAjjdiUV9N9OMtI78BzFCPG
	gmW9wRPiHsMbesVP02ZLomcZaUTXvEVK5EQmLNEkVooC8ABrybFxt4K/C6t/KAkM61Si3vTpjFJ
	mzxJBY+wzpQ==
X-Gm-Gg: ASbGncsSr3UWx3QqfSZK6HFSD2E864P2leTe87uWANtaHNwpGID0Ad9zF1BF+OTqx6R
	h/rJOaxJiFoUbSTNCctUPlY+xj1/uCmtzGGIC12+K8elnf7KyWZHI00ZwhnjEgQyjwvONpl58GT
	mefAMxpIp2h7nHIewwuWgcut8d4r5XhqsC7giBopKzqdAU2Snl+iKovIPwZ8n9U47/zlBljoKYM
	iwcAdrKV8ETiqX+2FoDtA0mQ0cjJA+NARfCv864uUoH0USHheXf93VE6oW3GB2BSPGMrQj2s+it
	/eyD2rP7Y/blFmVVT29/UikBmFV5/gnWn9cNLScNJLSAVrOijRE/LKoAiz67No9Ec068gU/1NF1
	eEY2UIFIweb6w+isyGKHnmgI+GezNA3oimyEd/ipYSDDMKkN4+5ieUuUlJskSHreyFDo8ScccYP
	X9zg==
X-Google-Smtp-Source: AGHT+IEVnyLLYdJUBKqyV5B9bTgqz4JCO+O/FbUJTrqGc9mAPKgNQg4D8O4z/x0vvOilgoLsTrLApw==
X-Received: by 2002:a5d:5d0e:0:b0:3a6:ec1d:1cba with SMTP id ffacd0b85a97d-3c0e2c89fc7mr1886575f8f.20.1755605429978;
        Tue, 19 Aug 2025 05:10:29 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43b9asm3464410f8f.24.2025.08.19.05.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:10:29 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/3] arm64: dts: exynos: gs101: add cpufreq support
Date: Tue, 19 Aug 2025 12:10:19 +0000
Message-Id: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKtppGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0NL3cTkglzdlLK0Yt2UEl0Ds6Rkc0uTpJTk5BQloJaCotS0zAqwcdG
 xtbUAScUs814AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755605429; l=778;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=uK6l/5FClBpWiFuJ8AGtZeaEMw1qu6cY3Abo5OK8elQ=;
 b=6Z9LFvnLbBkK3WvrNq62MnQ4QYomccVeTTKMdmveFlaz6Z0gqh9MC+muKCNiP24IiW6woESJE
 2Y6uvX3VHa1BaGvjVy48GB6d4+QUUj8xsa45frnjcwmmEw2CRKInIse
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_051031_650006_A3D5EA8E 
X-CRM114-Status: UNSURE (   7.61  )
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

Bindings for the "google,gs101-acpm-dvfs-clocks" compatible are sent at:
https://lore.kernel.org/linux-samsung-soc/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org/T/#me3cbe2a97485d19eaf505ad23202f20a21305dd8

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      arm64: dts: exynos: gs101: add google,gs101-acpm-dvfs-clocks
      arm64: dts: exynos: gs101: add CPU clocks
      arm64: dts: exynos: gs101: add OPPs

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 288 +++++++++++++++++++++++++++
 1 file changed, 288 insertions(+)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-dvfs-dt-06bc794bdccd

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


