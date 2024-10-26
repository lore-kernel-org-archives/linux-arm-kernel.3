Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9447CD10BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 12:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivIAohcESshAYpEPq++t9hJfCpjXuscXbD6Im/FDokQ=; b=zBTld7qDfV/oRmFkhgA4AFrAsV
	Ktvq9blI46HrmSMy2R2pnlhd0bd8YAhlxOOwnYAOibMFCvVzXykZt+0qb0cSGMgOWDrRwxcojpMeb
	vw/FyPWXJ8cEgoCkO4V/zbpFLK9QjooC44aVxKJS9aCSzmqHpywZXpZ3fOSjQokA6CLgS8QOYbCHr
	bpYv2PPd9N0OOL5cP9KielMwuqz9oRbuDQd+aMo4IQ76an077DHf78wW4O+fNKBF5KZNh5nMRJ/A2
	0jEECDNqxYEypuqe6bi93UmzWGJyO5XUs7Hdc1s0R8J4O+y/jdE8ryTSpM45M0N977FeDNwWQdDTB
	rrjUkpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fW2-00000006ZE3-32K7;
	Sat, 26 Oct 2024 12:03:34 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fUR-00000006Z2n-22LB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 12:01:57 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c9ff17eddbso505696a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729944113; x=1730548913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivIAohcESshAYpEPq++t9hJfCpjXuscXbD6Im/FDokQ=;
        b=Svd64WlABdn7oh7IRx2q0N9Lu2jOUDlF8uCgqzUzTsb95+CZYq6gxvY4ueab1g17Ap
         G35NcrkQ88etfxNGC0B1OBjPS0LFAs+/PFtaYExF4EjPDoOKjPaA+CKtiISIre+t87r0
         iGCntzGRvZ/j7GjhOr/DhS9CWaK3a8VGD+CWrA7HeVUMZFUH5S7hBNx76Vy21yQ3BcRP
         WtFvOC14lDcCBDLt1LAdoHTaribivtv2vjodiYVmEmcJyDUHRzQDmAD+Mp9ve5KO6pxZ
         Y/6oE5tW9bgbSU8ir+WQrsIe8ZXcGEXybwx45gRfLCn3NRlCNuHf1FfPHqESoK9Cz96m
         S1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729944113; x=1730548913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivIAohcESshAYpEPq++t9hJfCpjXuscXbD6Im/FDokQ=;
        b=dgqyuDaWKqSU/JkQDu4mvOJan1b52yXms+X3sr80CZFU75qdOZMjoGpxoCxCwPca50
         aIDACJQV+KvqmzQXf0RfiSAwfvkNgXa1p/6emCzFj5IMiAGoLY3N8COmKzR32YizoyAj
         Yumgb3w4E4P7h8HXWpPW8GM1zi0EFhhehcDQTs8f17gDjYkbg+XAptN7MeeLPgXVckUR
         jew5kFh2/nu2oszRFkHX6GDhYsIBMqyaaRf6GdieiRJbB9HN2a2KFKzweAaN7cTMzGeB
         hc532wnaI4JBFnQYvyNhJtCnQGi6oEwzhwXid4VxSsuISxJQ4OuR+D042KEsGYtvbW/A
         YSZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzHRLVdCi3nV9y19qCzYo0HFK27Htb+Q/RdBVbKmawj6yY1482daPZjzuPpAHUmFEF7SZeAzmUNzIEHlqPEEKV@lists.infradead.org
X-Gm-Message-State: AOJu0YwoXXJS+Jk2CyVO9AO1h1P7a+HFE6gkRtlx1gEizy1T59BD2C0n
	EW75ep1V/5KLFJDR58g+aoMghugzjTjamz/JKJQFS/6HMkx8YdJ63w716oR/Z5c=
X-Google-Smtp-Source: AGHT+IH1dsULDIYCbXnhWrr2hutsWuzTM/gAfeo0yzwyxxJYFFg4QA218/5byXKAvC9+SNM44aVSrA==
X-Received: by 2002:a05:6402:13d5:b0:5c9:7f8b:4fcf with SMTP id 4fb4d7f45d1cf-5cbbfa58bf5mr660881a12.6.1729944113136;
        Sat, 26 Oct 2024 05:01:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6319711sm1490421a12.66.2024.10.26.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 05:01:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] clk: samsung: Introduce Exynos8895 clock driver
Date: Sat, 26 Oct 2024 14:01:48 +0200
Message-ID: <172994382528.22240.15972019701074354702.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_050155_562483_714517D0 
X-CRM114-Status: GOOD (  11.15  )
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


On Wed, 23 Oct 2024 12:01:33 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds initial clock driver support for Exynos8895 SoC,
> which allows clocking peripherals like MCT, serial buses, MMC, UFS and
> PCIE. As platform support grows in the future, other blocks like APM
> will be added.
> 
> [...]

Applied, thanks!

[1/3] as well

[2/3] clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
      https://git.kernel.org/krzk/linux/c/49fefe602d8fa7323b51ffc4891acf4a91dac193
[3/3] clk: samsung: Introduce Exynos8895 clock driver
      https://git.kernel.org/krzk/linux/c/c6e45979204d092770c55c0b2d1fce6cff8dedd6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

