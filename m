Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2712DCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL4ZYF94aOfs6GrfgQH7uz/6YUTAgWONeedgmFFItcs=; b=l+KOOvJ+anLnNo259xoou05x5y
	iypLLJXn33BVXH8Ah7bD0NPGkKk0tkD14lBhRaGkvQWhTIxcisC/oBIBeZBoRFLFhSOSaGSaCaSbb
	XAOhGFzq0Ps9u3NrVITlK2j1++H2HdjQsx6SJ7WoATZWXXROX7KPyFG3YJk5HwfZ4Z7281AtL2XT0
	hQccdF4I5P3pXg5Wy/Jj1WBh8fQpuwclGps/0keXv49OoZmN7W1jMphhZ3lYNyFHeFCyRAtN4ntW7
	fFewuZFZSVDYowp1qGDXNZNyHisxmMiA1UTJDrVX/p8qkcmG/+P2WgFcrb2DWsLP6pQm8WvfS6teJ
	KK+gW/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjyM-0000000C8Xd-1WbF;
	Mon, 20 Oct 2025 07:06:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjyK-0000000C8XE-0tQF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:06:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-427087fce27so357155f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943982; x=1761548782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL4ZYF94aOfs6GrfgQH7uz/6YUTAgWONeedgmFFItcs=;
        b=iPIIrzNdLFIFT1nVnIfN81EBHG/hTGnMB+GFcMmnVhPP1gC0PhAR2xZAjpylWjpueX
         NN3Tsr0eVZjwxWXe4IJLBHcc+1HeaPrLmlZhYQTc7pEgYjuWJzfFQvuHjgBmO0lGxzZ1
         9MBn8JumrJAsDdkgMFnVcKTUnPli6oBd/uehooEx9cRIH2R23ds5qWN3sIhfSR05UHbb
         BhBUJjAKQ1RyXBE6VTGpmYrWaEDw9/mfdwox0QMGcl5HcpKIGcB28WAEX3+IH78drfJw
         JSuuHCjJHcSCLH91KJt8BIh1KXrdcCuUXpsd23WjPEWaGrHcIR9XG/OSEvmQR/PFclj9
         oO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943982; x=1761548782;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BL4ZYF94aOfs6GrfgQH7uz/6YUTAgWONeedgmFFItcs=;
        b=DeB5YZxi5b/IjQ8HxSRXWgqsIrK7OrxHR71XuGodw3IMHbO3cqHgPGl0HDUfGzm1SP
         18AkJ0zz1Eq8eIRp0gl3y9zjsPNGz57ky89eKk1WMNzpu48O4X2+7rz/GroM8WDk2jBf
         QjOke81Jiz2l954S/oLLw8B1O14mmeHX3qDsLvxlXppDzSVZhFoyEcnBycgxr9TVEGHZ
         akec2UgHYv2j5RE+Kc/zaSp0/dt5SzIy/bhh/cYGruBbQm1Se4W2YbuzeU/4xymIbH+8
         56Bdr/Ow7Ntm+nXhAWmcRPko6bFEvJOH55W4zMfwOmZajZ6cEPA8M1yNR4ry30kDkslW
         jsHA==
X-Gm-Message-State: AOJu0YxApCE/YlZQkMPjWTnqChA5D74l1sI0TbJFwgc2QShaRRpy7XHg
	Gq3T3LrZwvE2ojUlmDnj13MbyiNvp3OMZ3AuMcGLzwtyhSB7z2DajKTqjctRDd2gdAA=
X-Gm-Gg: ASbGncu8jLCZhX7mdSIEDoNKlYZdsv7E712X72eYn0ss6xkZz074QHJGwxJ+PWwj7r4
	KAqAkDEZIc8L6P0qk1JvnwJ+DE+nXMony0usyWfM6TBoiIc6KFO76eT8wovYng+kYkbKbsPrCdL
	yifB3inzlQLWLpxqtbG8xFHJ31PPjOY0/VW8lUA1n/kPkqjbdEuzosX8rrs7UOBrIFEef88RpkL
	EJWpWaoR58EXSIazwD9DZHQjlgTiVTjRxjTBkkjBEK702bOMa90Mt9lvPXc4qLIkyIsBd2f+o/L
	CVXXYQrBX98RSRgtnSkwblnOTzsQp6c54fZfanxVCXn8dBPV0m8MZ1a9ZphnMG2tLbOLBFCX4z+
	A0HfCHY4p3A7gHzb7kDcMYT1AGxBBWqs7lr41GqEYph2ficzVe89kWWXS5kMsojIuRie4ruQ5Bb
	k/dcWhLQvQ0AvemlgQ
X-Google-Smtp-Source: AGHT+IGxcE1H5Tv0iSV8CsOY/ouiQBwzdpqvV8wjkhYvo0l+T5f2NGZtvR5ODn0Yr9X/Rd9I1QZNeg==
X-Received: by 2002:a05:6000:1884:b0:3fc:854:8b84 with SMTP id ffacd0b85a97d-42704d55175mr4636053f8f.3.1760943982413;
        Mon, 20 Oct 2025 00:06:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710f28a920sm102535935e9.7.2025.10.20.00.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:06:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org>
References: <20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org>
Subject: Re: [PATCH v4 0/3] arm64: dts: exynos: gs101: add cpufreq support
Message-Id: <176094398077.21021.10319434896360598218.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 09:06:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_000624_283436_B4977BAC 
X-CRM114-Status: UNSURE (   9.69  )
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


On Wed, 24 Sep 2025 15:14:40 +0000, Tudor Ambarus wrote:
> Define the CPU clocks and OPPs.
> 
> Patch #2 has a dependency on the ACPM clock bindings sent at:
> https://lore.kernel.org/linux-samsung-soc/20250924-acpm-clk-v5-1-4cca1fadd00d@linaro.org/T/#u
> 
> Thanks,
> ta
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: exynos: gs101: add #clock-cells to the ACPM protocol node
      https://git.kernel.org/krzk/linux/c/2e96df32009c2d7e4e210afdcce40bab17d0076e
[2/3] arm64: dts: exynos: gs101: add CPU clocks
      https://git.kernel.org/krzk/linux/c/025707fa269b0cf65fc2e10bcdf23359fd0e978b
[3/3] arm64: dts: exynos: gs101: add OPPs
      https://git.kernel.org/krzk/linux/c/bb103f6c7317bbc9cf4ee3a2482e74483876e412

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


