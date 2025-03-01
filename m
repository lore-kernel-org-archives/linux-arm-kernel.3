Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D2EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kICij+zGJ4SJUAMRx6vOY4fWK/HFQvlnrffeNoOoYzw=; b=m6upCeBNflvf1DHGTxOQ/LTRE5
	QJ1oA7HGeF8SogdFksZM3w/IcAsB+I+fmcGSTUMyBm3FzG4PzOKQ02oeCs8cHtO71rHSS9Hondjap
	iG1RW2crsAl5QZ/rdZXVA/P7p86ce3DFpRTEIatFvTeHh7cDf9wfa95FTg52CWkAxkqLdkJU8MkYD
	asm0UgZK59AIMmCwTnpw9HfCboevMJzgFQtk9d5Nd96uaPLb8Nz0H2hwYiT6Y2CL4OKTvWonNYnpt
	OtQLvjDaRLTHeDeXgNyS0uAAMNym1zmL4a3TXP2AtTiEs3nFz9gIeTVPtrMC9F4DTlrcXefPig+Vz
	dO8pO46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNdu-0000000EQoA-0MaO;
	Sat, 01 Mar 2025 14:16:38 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNap-0000000EQJW-38QE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 14:13:28 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso499283a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 06:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838406; x=1741443206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kICij+zGJ4SJUAMRx6vOY4fWK/HFQvlnrffeNoOoYzw=;
        b=R6c+Kb908l/CWZciCF4ELkgs36vJzE/+L7ACsV+rcHS7kSVSyo91cWISDxLO/utDFW
         LJQetyC4J/awQGUriqrrPInu/bKAytAsJs0uaHjZwT3h5oL8gpTh+t3jGqOG3hBy0k8B
         d4+eE+1qmeIHtZc+8sM64CDmEynMERib2711G1VsEtxXBa7jMSrA3SUtO8JPiCkfxMao
         NPRurB0CWvrvy3qbKK443Y+LGawaXdkXAEvsgX9EwqONJbGNKDAuEKrg1NoI+Dbkg797
         7qauzopmFP4pXZPjHJ/ZimgAyaV1VEKeOWkQT60bkH6NN4OzZd2Z8OHq+nsRt844Ey7L
         ZCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838406; x=1741443206;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kICij+zGJ4SJUAMRx6vOY4fWK/HFQvlnrffeNoOoYzw=;
        b=qA4kZAfEVwMeMj/D0nlujgXDqJwznSiHl+pqY6qWOATcTSW1HDlTi/8TSQVhMbl1EW
         iT5NvlihMQSDwUag9Jw7ZLXpLiPdMsV/TuR8bwr+v2LzuC5n5mPNqAWusJMRPzUlEqnH
         QNeJ7Atkza3PTL9adlS60/D1a4FSl92sd8kCd1R3axfgFi2kvkwOJRoOpibr0RadYnXi
         ynqfjz5rg1q6U9OpUYQEA93MMHj7S3kaCUYZ8wpg1Q6FJD5dN8OkUZ1qjsaKS1wHZrIM
         fAGTBnDZoNl0TE6/2OonXlafDLRrfx3g5jdlzGxY8LOP+dJDVe6LmVA+y2wNzgwscQUm
         qjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU40ErM42G11TRKnDPkv86c72wNCmHTFSk9nEPL33rY8h2vaPgD0+e2UNaIj4OrxmPrVJBVZRiFsRKgDqO4wbBh@lists.infradead.org
X-Gm-Message-State: AOJu0YzaiTD/7hP6PJF1Ekr2KHXLBnJOf2ysDrkm2RhLnmCxkAaXVUlT
	PfUmTvVAMhaUfgid1+lhbMbYWWUFYy48oUtYPFdvbfwpVOKaYkvLu3jNIE+v/P4=
X-Gm-Gg: ASbGncuR4fFrWu7PWOqEcsjg8wuHdjBGqitUoi54Qg7g0XWUynlcwOqascGxzfnh1Oc
	aKCYhFCTL9kjYeXiTusvKVBik5TBERBX3w0B7HK4mBqe2GspDquT4lprrjaXFp7D3iE9hJ85g40
	IBj4IKQ49bqGVB/1vrYMg2sf+Mp1NZMWK5qOhUlOowl4ku/X1edyZtuar5kc0auAtCEUktz+Idd
	lDxzPul/6AEjsHrDB5JITw9bWqUEb1oghD23FAbaWyHpQTQtb4rsB0f1F8JVL1/Jra46pZjGPgE
	To7k+snCt4SVp+yOEkN4vplE1RAg6fdIc2o3CabdeJxMW+HPvP5nn6GV/exg
X-Google-Smtp-Source: AGHT+IH4LDzdUoKTGOGgBFHqmwTZj1CstR0ayqx7aTgOFcUj9dhcl28Y1Pq7/cB2aRE6iWaW2lq9kw==
X-Received: by 2002:a17:906:da82:b0:abb:ebfe:d5e9 with SMTP id a640c23a62f3a-abf275cbf12mr350485366b.9.1740838406199;
        Sat, 01 Mar 2025 06:13:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250301-exynos7870-pmu-clocks-v5-1-715b646d5206@disroot.org>
References: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org>
 <20250301-exynos7870-pmu-clocks-v5-1-715b646d5206@disroot.org>
Subject: Re: (subset) [PATCH v5 1/2] dt-bindings: clock: add clock
 definitions and documentation for exynos7870 CMU
Message-Id: <174083840306.17657.2523115679702297451.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_061327_788843_01983C89 
X-CRM114-Status: UNSURE (   8.43  )
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


On Sat, 01 Mar 2025 09:27:12 +0530, Kaustabh Chakraborty wrote:
> Add unique identifiers for exynos7870 clocks for every bank. It adds all
> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> CMU_PERI. Document the devicetree bindings as well.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: add clock definitions and documentation for exynos7870 CMU
      https://git.kernel.org/krzk/linux/c/35b2b3328c2e02b544f49d010170fe981f20ff11

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


